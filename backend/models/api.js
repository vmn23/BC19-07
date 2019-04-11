function processImage(req, res, next) {
  res.data = {
    status: 200,
    message: 'image has been processed',
  };
  next();
}

module.exports = {
  processImage,
};
