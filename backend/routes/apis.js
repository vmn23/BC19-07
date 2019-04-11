const router = require('express').Router();
const multer = require('multer');
const model  = require('../models/api.js');

const upload = multer({ dest: 'uploads/' });

function sendAsJSON(req, res) {
  res.json(res.data);
}

function healthCheck(req, res, next) {
  res.data = {
    status: 200,
  };
  next();
}

router.route('/identify')
  .post(upload.single('avatar'), model.processImage, sendAsJSON);

router.route('/health')
  .get(healthCheck, sendAsJSON);

module.exports = router;
