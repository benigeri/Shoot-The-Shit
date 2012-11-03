// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

//DEFINITIONS
  var PASS_LOCATION_TO_CONTROLLER = 0;
  var SET_LOCATION_DEF = 1;
  var callbackSwitch;

  function toggleClass(elem) {
    $("a.pillbox").removeClass("selected");
    $(elem).addClass("selected");
  }
  function goBack(evt) {
    evt.preventDefault();
    window.history.back();
  }

  var locationObject = {
    name : "",
    longitude : "",
    latitude : ""
  };

  function initLocation() {
    if (navigator.geolocation && typeof (navigator.geolocation.getCurrentPosition) == "function") {
      navigator.geolocation.getCurrentPosition(geoCodeCallback);
    }
  }

  function geoCodeCallback(position) {
    locationObject.longitude = position.coords.longitude;
    locationObject.latitude = position.coords.latitude;
    var latLng = new google.maps.LatLng(locationObject.latitude, locationObject.longitude);
    var coder = new google.maps.Geocoder();
    coder.geocode({ 'latLng': latLng }, showLocaleCallback);
  }

  function showLocaleCallback(results, status) {
    if (status == google.maps.GeocoderStatus.OK) {
      var res = results[0];
      for (var i = 0; i < res.address_components.length; i++) {
        var type = res.address_components[i].types[0];
        if (type == "subpremise" || type == "premise" || type == "neighborhood" || type == "sublocality" || type == "locality") {
          locationObject.name = res.address_components[i].short_name;
          finalCallback(locationObject);
          return;
        }
      }
    }
  }

  function finalCallback(object){
    switch(callbackSwitch){
      case 0:
        passLocationToController(object);
        break;
      case 1:
        setLocation(object);
        break;
}
  }


  function setLocation(object) {
    var form = document.getElementById("new_musing");
    form.musing_latitude.value = object.latitude;
    form.musing_longitude.value = object.longitude;
    form.musing_city.value = object.name;
}