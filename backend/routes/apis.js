const router = require('express').Router();
const path   = require('path');
const multer = require('multer');
const model  = require('../models/api.js');

const upload = multer({ dest: path.join(__dirname, 'uploads/') });

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
  .post(upload.single('raw-image'), model.processImage, sendAsJSON);

router.route('/health')
  .get(appHealth, sendAsJSON);

module.exports = router;
