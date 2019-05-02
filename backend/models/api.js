const path      = require('path');
const { spawn } = require('child_process');

const { getDB } = require('../db/getDB.js');

const { DB_NAME } = process.env || 'tech_pirates';

const scriptPath = path.join(__dirname, '../recognition/test_model.py');
const recognitionPath = path.join(__dirname, '../recognition/');

const seeds = require('../db/seeds.json');

function processImage(req, res, next) {
  const { file } = req;
  const { filename } = file;
  const image = path.join(__dirname, '../uploads/', filename);
  // console.log(scriptPath, recognitionPath, image)
  const recognitionModel = spawn('python', [scriptPath, recognitionPath, image]);
  recognitionModel.stdout.on('data', (data) => {
    console.log('have data', String(data).replace(/'/g, '\"'))
    const drugNames = JSON.parse(String(data).replace(/'/g, '\"'));
    res.data = {
      status: 200,
      drugs: seeds,
      drug_names: drugNames,
    };
    next();
  });
  recognitionModel.stderr.on('data', (data) => {
    console.log('have error', String(data));
    const err = new Error(String(data));
    next(err);
  });
  recognitionModel.on('error', (err) => {
    console.log('Failed to start subprocess.');
  });

}

function getDrugByName(req, res, next) {
  const { name } = req.query || req.params || req.body;
  if (name === null || name === undefined || !name) {
    const err = new Error('Missing drug name');
    err.status = 422;
    next(err);
  }

  getDB().then((client) => {
    const db = client.db(DB_NAME);
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

function getDrugs(req, res, next) {
  const { data } = res || {};
  const { drug_names: names, status } = data || {};
  const uniques = [...new Set(names)];
  const retDrugs = [];
  for (let i = 0; i < seeds.length; i++) {
    const seed = seeds[i];
    if (names.includes(seed.drug_name)) {
      retDrugs.push(seed);
    }
  }
  for (let i = 0; i < retDrugs.length; i++) {
    retDrugs[i].index = i;
  }
  res.data = {
    status,
    drugs: retDrugs,
    drug_names: uniques,
  };
  next();
}

module.exports = {
  processImage,
  getDrugByName,
  getDrugs,
};
