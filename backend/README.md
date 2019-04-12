# PfindRX Backend

This directory holds all the code for the backend of the PfindRX project.

## Installation

In order to get up and running, ensure that mongodb is installed and running on the default port (27017). 

Then, run `npm install` while in this directory.

Add a file called `.env` with the desired port number in a variable `PORT`, and the database connection URI in a variable `DB_CONNECTION`. Defaults to port 3000 and localhost:27017.

Once this is done, the initialization script can be run to seed the database with data. Execute it by running `node db/initDB.js`. This connects to the database, drops the `drugs` collection, and then inserts all of the samples from `db/seeds.json` into the same collection.

## Deployment

In order to deploy to Heroku, changes must be merged to the master branch. Then, instead of pushing the entire branch, run the following command:

`git subtree push --prefix backend heroku master`

This will deploy only the backend directory, which is what we want.
