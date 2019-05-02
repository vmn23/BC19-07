const router = require('express').Router();
const path   = require('path');
const multer = require('multer');
const model  = require('../models/api.js');

const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, path.join(__dirname, '../uploads/'));
  },
  filename: (req, file, cb) => {
    const ext = file.originalname.split('.').pop();
    cb(null, `${file.fieldname}-${Date.now()}.${ext}`);
  },
});

const upload = multer({ storage });

function sendAsJSON(req, res) {
  res.json(res.data);
}

function appHealth(req, res, next) {
  res.data = {
    status: 200,
  };
  next();
}

router.route('/identify')
  .post(upload.single('raw-image'), model.processImage, model.getDrugs, sendAsJSON);

router.route('/health')
  .get(appHealth, sendAsJSON);

router.route('/drugs')
  .get(model.getDrugByName, sendAsJSON);

module.exports = router;
