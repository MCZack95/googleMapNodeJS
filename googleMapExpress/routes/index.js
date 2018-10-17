var express = require('express');
var router = express.Router();
var map = require('./map.js');

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});

router.get('/login', function(req, res, next){
  res.render();
});

router.get('/map/:address', (req, res) => {
  map.getAddressDetails(req.params.address, res);
});

module.exports = router;
