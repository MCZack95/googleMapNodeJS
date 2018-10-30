var db = require('./database');

const googleMapsClient = require('@google/maps').createClient({
    key: 'AIzaSyB4UWA6MysWfO-lOE0WBXp-o7rFvPiZlcI'
  }
);

// New & Improved
// Dynamic Array Adding
// Prepare all Incident Locations for map view
var addressStringArray = "";
var latStringArray = "";
var lngStringArray = "";
var typeStringArray = "";
var numOfIncidents = 0;
Promise.resolve(db.getLocations()).then(function(value){
    value.forEach(function(element){
        if(value.indexOf(element) == 0){
            addressStringArray += element[0];
            latStringArray += element[1];
            lngStringArray += element[2];
            typeStringArray += element[3];
        }else{
            addressStringArray += "-" + element[0];
            latStringArray += "-" + element[1];
            lngStringArray += "-" + element[2];
            typeStringArray += "-" + element[3];
        }
        numOfIncidents++;
    });
});

////////////////////////// Exported Methods //////////////////////////
var addressArrayList = [];
module.exports.getAddressDetails = (givenAddress, res) => { // get latlng using address
    googleMapsClient.geocode(
        {address : givenAddress},
        function(err, response){
            if(!err){
                //console.log(response.json.results);
                response.json.results.forEach(function(element){
                    var locationDetails = {};
                    if(element.geometry.location != null){
                        locationDetails.address = element.formatted_address;
                        locationDetails.lat = element.geometry.location.lat;
                        locationDetails.lng = element.geometry.location.lng;
                        locationDetails.type = "";
                        addressArrayList.push(locationDetails);
                        res.send(addressArrayList);
                        return;
                    }
                });
            }else{
                //console.log(err);
            }
        }
    );
}

module.exports.getAddressArray = () => {
    return addressArrayList;
}

module.exports.getAddressArrayString = () => {
    return addressStringArray;
}

module.exports.getLatArrayString = () => {
    return latStringArray;
}

module.exports.getLngArrayString = () => {
    return lngStringArray;
}

module.exports.getTypeArrayString = () => {
    return typeStringArray;
}

module.exports.getNumOfIncidents = () => {
    return numOfIncidents;
}

module.exports.updateMap = (latLng) => { // put marker on map
    // do something
}

/* TODO 

    //// This function checks if address in input field is valid,
    //// before putting it for inserting into database
    function geocode(e){
        e.preventDefault();
        var location = document.getElementById('location-input').value;
        axios.get('https://maps.googleapis.com/maps/api/geocode/json',{
            params:{
                address: location,
                key: 'AIzaSyDdPOsbD2Dg8qse475kMZjuhmEWz0wcp9c'
            }
        })
        .then(function(response){ // If Address is valid
            console.log(response);
            alert(`Location: ${response.data.results[0].formatted_address.replace(/,/g, '')}
            \nLatitude: ${response.data.results[0].geometry.location.lat}
            \nLongitude: ${response.data.results[0].geometry.location.lng}`);
        })
        .catch(function(err){ // If Address is not valid
            console.log(err);
            alert("Address doesn't exist!");
        });
    }

*/