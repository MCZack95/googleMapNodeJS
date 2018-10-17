const googleMapsClient = require('@google/maps').createClient({
    key: 'AIzaSyB4UWA6MysWfO-lOE0WBXp-o7rFvPiZlcI'
  }
);

module.exports.getAddressDetails = (givenAddress, res) => { // get latlng using address
    googleMapsClient.geocode(
        {address : givenAddress},
        function(err, response){
            if(!err){
                console.log(response.json.results);
                res.send(response.json.results);
                // Update Database
            }else{
                console.log(err);
            }
        }
    );
}

module.exports.updateMap = (latLng) => { // put marker on map
    // do something
}
