const { MongoClient } = require('mongodb');

function getDB() {
  return MongoClient.connect(process.env.MONGODB_URI || 'mongodb://localhost:27017');
}

module.exports = {
  getDB,
};
