var express = require('express');
var router = express.Router();
var dbconfig = require('../dbconfig.json');

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});

router.get('/login', function(req, res, next){
  res.render();
});

module.exports = router;
