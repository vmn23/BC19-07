# Output list of all drugs in image
# Input image
import numpy as np
import cv2
from os import listdir
from os.path import isfile, join

# creating database inputs
orb = cv2.ORB_create() 

# getting path of code
script_path = sys.argv[1]

# getting info from database
dbpath = script_path + 'Database/'
labels = [f for f in listdir(dbpath) if isfile(join(dbpath, f))]

database = []
for label in labels:
    img = cv2.imread('.\images\Database\\' + label,1)
    img = cv2.resize(img, (300, 300))
    kp, des = orb.detectAndCompute(img,None)
    hist = cv2.calcHist([img], [0, 1, 2], None, [16, 16, 16], [0, 256, 0, 256, 0, 256])
    database.append([hist,des,img])

labels = [label[:-6] for label in labels]


# matching function for image to database with ORB and 3D color histogram
def matching(img, database):
    img = cv2.resize(img, (300, 300))
    kp, des = orb.detectAndCompute(img,None)
    hist = cv2.calcHist([img], [0, 1, 2], None, [16, 16, 16], [0, 256, 0, 256, 0, 256])
    score1 = []
    score2 = []
    score3 = []
    for data in database:
        hist_base = data[0]
        des_base = data[1]
        img_base = data[2]
        # Comparing SIFT features
        bf = cv2.BFMatcher(cv2.NORM_HAMMING, crossCheck=True)
        matches = bf.match(des, des_base)
        similar_regions = [i for i in matches if i.distance < 70]
        if len(matches) == 0:
            score1 = 0
        score1.append(len(similar_regions) / len(matches))
        
        # Comparing Color Histogram
        score2.append(cv2.compareHist(hist, hist_base, cv2.HISTCMP_INTERSECT))
        
    score2 = (np.array(score2)-np.mean(score2))/np.std(score2)
    score = list(np.array(score1) + score2)
    return labels[score.index(max(score))]


# function for OTC recognition
def OTC_rec(image_dir):
    # initialize the list of class labels MobileNet SSD was trained to
    # detect, then generate a set of bounding box colors for each class
    prototxt = "MobileNetSSD_deploy.prototxt.txt"
    model = "MobileNetSSD_deploy.caffemodel"
    test = image_dir
    threshold = 0.2
    output = []

    # load our serialized model from disk
    net = cv2.dnn.readNetFromCaffe(prototxt, model)

    # load the input image and construct an input blob for the image
    # by resizing to a fixed 300x300 pixels and then normalizing it
    # (note: normalization is done via the authors of the MobileNet SSD
    # implementation)
    image = cv2.imread(test)
    clone = image.copy()
    (h, w) = image.shape[:2]
    blob = cv2.dnn.blobFromImage(cv2.resize(image, (300, 300)), 0.007843, (300, 300), 127.5)

    # pass the blob through the network and obtain the detections and
    # predictions
    net.setInput(blob)
    detections = net.forward()

    # loop over the detections
    for i in np.arange(0, detections.shape[2]):
        # extract the confidence (i.e., probability) associated with the
        # prediction
        confidence = detections[0, 0, i, 2]

        # filter out weak detections by ensuring the `confidence` is
        # greater than the minimum confidence
        if confidence > threshold:
        # extract the index of the class label from the `detections`,
        # then compute the (x, y)-coordinates of the bounding box for
        # the object
            idx = int(detections[0, 0, i, 1])
            box = detections[0, 0, i, 3:7] * np.array([w, h, w, h])
            (startX, startY, endX, endY) = box.astype("int")

            if idx == 5:
                # identify query
                crop_img = clone[startY:endY, startX:endX]
                label = matching(crop_img, database)
                output.append(label)
    return output

# retrieving argument for image to test
image_to_test = sys.argv[2]
print(OTC_rec(image_to_test))
sys.stdout.flush()
