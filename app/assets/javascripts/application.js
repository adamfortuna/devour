//= require lodash/dist/lodash.core

window.initMap = function initMap() {
  var bounds = new google.maps.LatLngBounds();

  // Create a map object and specify the DOM element for display.
  var map = new google.maps.Map(document.getElementById('map'));

  var lngs = _.map(maps.locations, function(location) {
    var myLatLng = {
      lat: location.address.lat,
      lng: location.address.lng
    };

    var point = new google.maps.LatLng({lat: location.address.lat, lng: location.address.lng});
    bounds.extend(point);

    var marker = new google.maps.Marker({
      map: map,
      position: myLatLng,
      title: location.name
    });

    return location.address.lng;
  });


  // Create one more point far to the left
  var minLng = _.min(lngs),
      maxLng = _.max(lngs);
  var extraLeftPoint = new google.maps.LatLng({
    lat: maps.locations[0].address.lat,
    lng: minLng - (maxLng-minLng)
  });
  bounds.extend(extraLeftPoint);

  map.fitBounds(bounds);
}
