var express = require('express');

var bodyParser = require('body-parser');

var qp = require('flexqp');
var con = require('../dbconfig.json');
qp.presetConnection(con);

module.exports.getAll = async function () {
  console.log('get whole table');
  var result = await qp.executeAndFetchPromise("select * from `cms`.`inreport`");
  console.log(result);
}

module.exports.getLocations = async function () {
    console.log('get all the locations'); 
  
    var result = await qp.executeAndFetchPromise("select `location`, `lat`, `lng`, `type` from `cms`.`inreport`");
    //console.log(result);
    arr = [];
    for (var i in result) {
      arr.push([result[i].location, result[i].lat, result[i].lng, result[i].type])
      //console.log([result[i].location, result[i].lat, result[i].lng])
    }
    //console.log(arr);
    return arr;
  }

module.exports.putLocation = async function (reportid, loc, lat, lng) {

  console.log('put a single location');
  var result = await qp.executeUpdatePromise("update `cms`.`inreport` set `location` = ?, `lat` = ?, `lng` = ? where `report_id` = ?", [loc, lat, lng, reportid]);
  console.log(result);
    
}