const dotenv    = require('dotenv');
const { getDB } = require('./getDB.js');
const seeds     = require('./seeds.json');

dotenv.config({ silent: true });
const { DB_NAME } = process.env || 'tech_pirates';

/* eslint-disable no-console */
console.log(`Found ${seeds.length} objects in ./seeds.json`);

getDB().then((client) => {
  const db = client.db(DB_NAME);
  console.log(`Attempting to empty the collection ${DB_NAME}.drugs...`);
  db.collection('drugs')
    .deleteMany({})
    .then(() => {
      console.log('Emptied successfully!\n');
      console.log(`Attempting to insert ${seeds.length} objects to ${DB_NAME}.drugs...`);
      db.collection('drugs')
        .insertMany(seeds)
        .then((resp) => {
          console.log('Inserts success! Response from database:');
          console.log(resp);
          client.close();
        })
        .catch(insertErr => console.error('Error inserting:\n', insertErr));
    })
    .catch(dropErr => console.error('Error dropping:\n', dropErr));
})
  .catch(dbErr => console.error('Error connecting to db:\n', dbErr));
/* eslint-enable no-console */
