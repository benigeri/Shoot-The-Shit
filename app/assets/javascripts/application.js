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


!function () {
  var getTarget = function (target) {
    var i, popovers = document.querySelectorAll('.segmented-controller li a');
    for (; target && target !== document; target = target.parentNode) {
      for (i = popovers.length; i--;) { if (popovers[i] === target) return target; }
    }
  };

  window.addEventListener("touchend", function (e) {
    var activeTab;
    var activeBody;
    var targetBody;
    var targetTab;
    var className     = 'active';
    var classSelector = '.' + className;
    var targetAnchor  = getTarget(e.target);

    if (!targetAnchor) return;

    targetTab = targetAnchor.parentNode;
    activeTab = targetTab.parentNode.querySelector(classSelector);

    if (activeTab) activeTab.classList.remove(className);

    targetTab.classList.add(className);

    if (!targetAnchor.hash) return;

    targetBody = document.querySelector(targetAnchor.hash);

    if (!targetBody) return;

    activeBody = targetBody.parentNode.querySelector(classSelector);

    if (activeBody) activeBody.classList.remove(className);

    targetBody.classList.add(className)
  });
  // Tried to get rid of this to be able to use in browser, doesn't seem like an issue atm
  //window.addEventListener('click', function (e) { if (getTarget(e.target)) e.preventDefault(); });
}();


// The script prevents links from opening in mobile safari. https://gist.github.com/1042026
(function(document,navigator,standalone) {
  // prevents links from apps from oppening in mobile safari
  // this javascript must be the first script in your <head>
  if ((standalone in navigator) && navigator[standalone]) {
    var curnode, location=document.location, stop=/^(a|html)$/i;
    document.addEventListener('click', function(e) {
      curnode=e.target;
      while (!(stop).test(curnode.nodeName)) {
        curnode=curnode.parentNode;
      }
      // Condidions to do this only on links to your own app
      // if you want all links, use if('href' in curnode) instead.
      if(
        'href' in curnode && // is a link
        (chref=curnode.href).replace(location.href,'').indexOf('#') && // is not an anchor
        ( !(/^[a-z\+\.\-]+:/i).test(chref) ||                       // either does not have a proper scheme (relative links)
          chref.indexOf(location.protocol+'//'+location.host)===0 ) // or is in the same protocol and domain
      ) {
        e.preventDefault();
        location.href = curnode.href;
      }
    },false);
  }
})(document,window.navigator,'standalone');

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
  var i = 0;
  if(callbackSwitch == 1) {
    setLocation();
  } else if (callbackSwitch == 0){
    passLocationToController(i);
  }

  // if (navigator.geolocation && typeof (navigator.geolocation.getCurrentPosition) == "function") {
  //   navigator.geolocation.getCurrentPosition(geoCodeCallback);
  // }
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
  // form.musing_latitude.value = object.latitude;
  // form.musing_longitude.value = object.longitude;
  // form.musing_city.value = object.name;
  // var locationButton = document.getElementById("locationButton");
  // locationButton.innerText = "Clear location";
  // locationButton.className = "button-negative button-block"
  // locationButton.onclick = clearLocation;
  form.musing_latitude.value = "37.41960923882351";
  form.musing_longitude.value = "-122.1668823388235";
  form.musing_city.value = "Stanford";
  var locationButton = document.getElementById("locationButton");
  locationButton.innerText = "Clear location";
  locationButton.className = "button-negative button-block"
  locationButton.onclick = clearLocation;
}

function clearLocation() {
  var form = document.getElementById("new_musing");
  form.musing_latitude.value = "";
  form.musing_longitude.value = "";
  form.musing_city.value = "";
  var locationButton = document.getElementById("locationButton");
  locationButton.innerText = "Add location";
  locationButton.className = "button-block"
  locationButton.onclick = initLocation;
}

function formEmptyCheck() {
  if(this.value.length > 0) {
    var el = this.parentElement.firstChild;
    $(el).addClass("notEmpty");
  } else {
    var el = this.parentElement.firstChild;
    $(el).removeClass("notEmpty");
  }
}

function toggleRemember() {
  var el = this.parentElement.firstChild;
  $(el).toggleClass("notEmpty");
}