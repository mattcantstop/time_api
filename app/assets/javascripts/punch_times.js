// Get the current location
navigator.geolocation.getCurrentPosition(showMap);


function showMap(position) {
  Show a map centered at position
}

latitude = position.coords.latitude;
longitude = position.coords.longitude;
