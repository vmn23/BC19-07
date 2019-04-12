  library bc19_07.globals;
  
  import './druginfo.dart';

  int selectedDrug = -1;

  List<DrugSimple> allDrugs = [
  DrugSimple(
    index: 0,
  drugName: 'Aleve PM',
  imageUrl: 'assets/aleve.jpeg',
  rating: 1.78,
  tags: ["UTI", "infection", "urinary tract infection"],
  reviews: [
          "Great after long day of working outside and getting worn out. Night night!",
          "This product was easy to open and swallow pills. It was effective in promoting better sleep at night and more comfortably. I would recommend it to anyone that needs a sleep aid or has pain at night.",
          "I use Aleve pm at bedtime to help me get a good night’s rest. I works every time. I'm highly satisfied with this product. I don't use any other brand."
    ],
  desc: [
    "When your pain is keeping you from sleeping, Aleve PM can give you the rest and relief you need. It features an easy open cap designed to make getting the medicine you need as simple as possible. The special night time formula will cut down on your pain and help you get the sleep you need. Comes in an 80-count package."
  ]
),
DrugSimple(
  index: 1,
  drugName: 'Bayer Aspirin',
  imageUrl: 'assets/bayer.png',
  rating: 4.76,
  tags: ["pain", "fever", "headache"],
  reviews: [
        "Good count for my aspirin needs, take it for heart problems...",
        "Take one daily at age 74, have since age 50",
        "What can I say, they're asprin"
    ],
  desc: [
      "Genuine Bayer Aspirin can provide pain relief from headaches, backaches, muscle pain, toothaches, menstrual pain and minor arthritis pain —and has for over 120 years.",
      "It’s also recommended, under a doctor's direction, to help reduce the risk of a recurrent heart attack or clot-related (ischemic stroke).",
      "Aspirin is not appropriate for everyone, so be sure to talk to your doctor before you begin an aspirin regimen.",
      "Taking Genuine Bayer Aspirin for pain relief does not interfere with the benefits of taking it on a doctor-directed aspirin regimen. Each 325 mg coated aspirin tablet: provides safe, proven pain relief when taken as directed; is caffeine-free and sodium-free; is coated to make it easier to swallow."
    ]
),
DrugSimple(
  index: 2,
  drugName: 'Cystex Cranberry',
  imageUrl: 'assets/cystex.jpg',
  rating: 2.95,
  tags: ["UTI", "infection", "urinary tract infection"],
  reviews: [
          "Started working after taking a spoonful felt much better",
          "I thought I was getting a urinary tract infection while I was on vacation. The sole local drugstore didn't have Cystex tablets (which are great), but they had this liquid. Oh, well, better this than nothing. OMG. Taking it at 2 TBS per day really made a positive difference. I've kept up the 1 TBS per day since then because it seems to make SO much of a difference.",
          "This product really helps to protect my urinary tract against infection"
    ],
  desc: [
    "Increasing your urinary health is important, especially if you suffer from recurring urinary tract infections. With Cystex Liquid Cranberry Complex, the vitamin C, D-Mannose and inulin it contains, helps to promote a healthy bladder. By taking just one tablespoon of Cystex daily, you will feel the many benefits as your risk of urinary tract infections decreases and the health of your bladder increases."
  ]
),
DrugSimple(
  index: 3,
  drugName: 'Wallgreens Aspirin 81',
  imageUrl: 'assets/Aspirin81.jpg',
  rating: 3.70,
  tags: ["pain", "fever", "headache", 'inflammation'],
  reviews: [
        "We have always found Walgreen's generic versions of over-the-counter medicines and supplements to be every bit as effective as the costlier brands. "
        "Very fast delivery, reasonably priced, also safety in ordering. Not finished with current bottle.",
    ],
  desc: [
      "Low dosage aspirin",
      "Safety coated for aspirin regimen users",
      "Easy to swallow",
      "Relieves minor aches and pains"
    ]
),

DrugSimple(
  index: 4,
  drugName: 'Wallgreens Aspirin 325',
  imageUrl: 'assets/aspirin325.jpg',
  rating: 2.00,
  tags: ["pain", "cough", "cold", 'inflammation'],
  reviews: [
        "Had been taking rx pain meds part of the time and the rest of the time tri-buffered aspirin. this seems to work as good on the pain as the other aspirin with less irritation on the stomach.",
        "Very strong taste but extremely effective"
    ],
  desc: [
      "Safety coated for aspirin regimen users",
      "Easy to swallow",
      "Relieves minor aches and pains"
    ]
),

  ];