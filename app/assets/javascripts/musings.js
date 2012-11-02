//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
function setLocation() {
  if(google.loader.ClientLocation) {
    var form = document.getElementById("new_musing");
    form.musing_latitude.value = google.loader.ClientLocation.latitude;
    form.musing_longitude.value = google.loader.ClientLocation.longitude;
    form.musing_city.value = google.loader.ClientLocation.address.city;
  } else {
    alert("Unfortunately we were not able to get your location.")
  }
  return;
}