const { getDB } = require('../db/getDB.js');

function processImage(req, res, next) {
  res.data = {
    status: 200,
    message: 'image has been processed',
  };
  next();
}

function getDrugByNDCCode(req, res, next) {
  const { code } = req.query || req.params || req.body;
  if (code === null || code === undefined || !code) {
    const err = new Error('Missing drug code');
    err.status = 422;
    next(err);
  }

  getDB().then((client) => {
    const db = client.db('tech_pirates');
    db.collection('drugs')
      .findOne({
        ndc_code: parseInt(code, 10),
      }, {
        _id: 0,
      })
      .then((data) => {
        if (data) {
          res.data = data;
        } else {
          res.data = {};
        }
        next();
      })
      .catch(findErr => next(findErr));
  })
    .catch(dbErr => next(dbErr));
}

module.exports = {
  processImage,
  getDrugByNDCCode,
};
