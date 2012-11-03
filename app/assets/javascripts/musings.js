//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
function setLocation() {
  if(initLocation()){
    var form = document.getElementById("new_musing");
    form.musing_latitude.value = locationObject.latitude;
    form.musing_longitude.value = locationObject.longitude;
    form.musing_city.value = locationObject.name;
  } else {
    alert("Unfortunately we were not able to get your location.")
  }
  return;
}