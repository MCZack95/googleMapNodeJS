var express = require('express');
var router = express.Router();
const googleMapsClient = require('@google/maps').createClient({
  key: 'AIzaSyB4UWA6MysWfO-lOE0WBXp-o7rFvPiZlcI'
});

let addressArray = [];

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});

router.get('/api/googlemap', (req,res) => {
  res.status(400).send("Include proper address, e.g. ./api/googlemap/{address}");
});

router.get('/api/googlemap/:address', (req,res) => { // route to google map page.
  googleMapsClient.geocode(
    {address: req.params.address},
    function(err, response) {
      if (!err) {
        console.log("Formal Address: " + response.json.results[0].formatted_address);
        console.log("Latitude: " + response.json.results[0].geometry.location.lat);
        console.log("Longitude: " + response.json.results[0].geometry.location.lng);
      
        for(i = 0; i < response.json.results.length; i++){
          addressArray.push(response.json.results[i].formatted_address);
        }

        res.send(addressArray);
      }
    });

  addressArray = [];
});

module.exports = router;
