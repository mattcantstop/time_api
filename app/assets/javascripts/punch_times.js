function successHandler(location) {
  document.getElementById('latitude').value = location.coords.latitude;
  document.getElementById('longitude').value = location.coords.longitude;
}

function errorHandler(error) {
  alert('Attempt to get location failed: ' + error.message);
}

function genarate(hiddenField){
  var field = document.getElementById(hiddenField);
  field.value = location.coords.longitude;
}
