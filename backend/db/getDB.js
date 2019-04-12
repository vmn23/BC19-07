const { MongoClient } = require('mongodb');

function getDB() {
  return MongoClient.connect(process.env.MONGODB_URI);
}

module.exports = {
  getDB,
};
