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
  console.log(scriptPath, recognitionPath, image)
  const recognitionModel = spawn('python', [scriptPath, recognitionPath, image]);
  recognitionModel.stdout.on('data', (data) => {
    console.log('have data', String(data))
    const drugNames = String(data);
    res.data = {
      status: 200,
      drugs: seeds,
      drug_names: drugNames,
    };
    next();
  });
  recognitionModel.stderr.on('data', (data) => {
    console.log('have error', String(data))
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

function getSampleJSON(req, res, next) {
  res.data = [
    {
      "index": 0,
      "drug_name": "Advil",
      "image": "assets/aleve.jpeg",
      "tags": ["fever", "pain", "headache", "stress", "cold", "cough"],
      "rating": {
        "average": 4.95,
        "5_star_count": 100,
        "4_star_count": 10,
        "3_star_count": 5,
        "2_star_count": 2,
        "1_star_count": 1
      },
      "reviews": [
        {
          "user_name": "John Doe",
          "rating": 4,
          "subject": "My Favorite",
          "text": "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Impedit fuga ab expedita, consequatur assumenda voluptate culpa commodi nobis maiores aliquam, explicabo earum at magnam ipsam non, sit excepturi. Maxime, soluta."
        }
      ],
      "description": [
        "This is paragraph 1. This is paragraph 1. This is paragraph 1. This is paragraph 1. This is paragraph 1. This is paragraph 1. This is paragraph 1.",
        "This is paragraph 2. This is paragraph 2. This is paragraph 2. This is paragraph 2. This is paragraph 2. This is paragraph 2. This is paragraph 2.",
        "This is paragraph 3. This is paragraph 3. This is paragraph 3. This is paragraph 3. This is paragraph 3. This is paragraph 3. This is paragraph 3."
      ]
    }
  ]
  next();
}

module.exports = {
  processImage,
  getDrugByName,
  getSampleJSON,
};
