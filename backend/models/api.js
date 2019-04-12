const { getDB } = require('../db/getDB.js');

const { DB_NAME } = process.env || 'tech_pirates';

function processImage(req, res, next) {
  res.data = {
    status: 200,
    message: 'image has been processed',
    image: `image name is ${req.file.filename}`,
  };
  next();
}

function getDrugByName(req, res, next) {
  const { name } = req.query || req.params || req.body;
  if (name === null || name === undefined || !name) {
    const err = new Error('Missing drug name');
    err.status = 422;
    next(err);
  }

  getDB().then((client) => {
    const db = client.db('DB_NAME');
    db.collection('drugs')
      .findOne({
        drug_name: name,
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
  getDrugByName,
};
