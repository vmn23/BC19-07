const dotenv     = require('dotenv');
const express    = require('express');
const logger     = require('morgan');
const bodyParser = require('body-parser');
const routes     = require('./routes/apis.js');

dotenv.config({ silent: true });
const app          = express();
const PORT         = process.argv[2] || process.env.PORT || 3000;

app.use(logger('dev'));
app.use(bodyParser.json());

// disable headers related to the server for security purposes
app.disable('x-powered-by');
app.disable('Server');

app.use('/', routes);

// allow CORS on the entire site
app.use((req, res, next) => {
  res.header('Access-Control-Allow-Origin', '*');
  res.header('Access-Control-Allow-Methods', 'GET, POST, PUT');
  res.header('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept');
  next();
});

/* eslint-disable no-console */
app.listen(PORT, () => console.warn(`Server here! Listening on port ${PORT}!`));
/* eslint-enable no-console */
