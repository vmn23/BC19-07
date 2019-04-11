const router = require('express').Router();
const multer = require('multer');
const model  = require('../models/api.js');

const upload = multer({ dest: 'uploads/' });

function sendAsJSON(req, res) {
  res.json(res.data);
}

router.route('/identify')
  .post('/profile', upload.single('avatar'), model.processImage, sendAsJSON);
