const googleMapsClient = require('@google/maps').createClient({
    key: 'AIzaSyB4UWA6MysWfO-lOE0WBXp-o7rFvPiZlcI',
    Promise: Promise
  }
);

var getLatLng = (givenAddress) => { // get latlng using address
    googleMapsClient.geocode({ address : givenAddress })
    .asPromise()
    .then((response) => {
        console.log(response.json.results);
        ////////////// TODO //////////////
        // Update Database
        // Update Map
    })
    .catch((err) => {
        console.log(err);
    });
}

var updateMap = (latLng) => { // put marker on map
    // do something
}

module.exports.getLatLng = getLatLng;
module.exports.updateMap = updateMap;