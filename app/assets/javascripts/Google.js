// Initialize and add the map
function initMap() {
  // The location of rocketElevators
  var rocketElevators = {lat: -25.344, lng: 131.036};
  // The map, centered at rocketElevators
  var map = new google.maps.Map(
      document.getElementById('map'), {zoom: 4, center: rocketElevators});
  // The marker, positioned at rocketElevators
  var marker = new google.maps.Marker({position: uluru, map: map});
}