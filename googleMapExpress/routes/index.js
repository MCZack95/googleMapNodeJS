var express = require('express');
var router = express.Router();
var map = require('./map.js');
var db = require('./database.js');
var dbconfig = require('../dbconfig.json');
var request = require('request');

// var orm = require('orm');
// var pdfdoc = require('pdfkit');

var qp = require('flexqp');
qp.presetConnection(require('../dbconfig.json'));

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'index' });
});

router.get('/map/test/:address', (req, res) => {
  map.getAddressDetails(req.params.address, res);
});

router.get('/map', function(req, res, next) {
  //console.log(map.getAddressArray());
  res.render('googleMaps', {title: 'Google Map', noOfAddress: map.getNumOfIncidents(), addressArrayString: map.getAddressArrayString(), latArrayString: map.getLatArrayString(), lngArrayString: map.getLngArrayString(), typeArrayString: map.getTypeArrayString()});
});

router.get('/location', function() {
  // get locations
  db.getLocations();
});

router.post('/location', (req) => {
  // put a single location
  db.putLocations(req.body.id, req.body.loc, req.body.lat, req.body.lng);
});

router.get('/all', () => {
  // get whole table for ziwei
  db.getAll();
});

module.exports = router;
