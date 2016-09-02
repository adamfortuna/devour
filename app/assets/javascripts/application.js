//= require jquery
//= require tether/dist/js/tether.min
//= require bootstrap/dist/js/bootstrap.min
//= require lodash/dist/lodash.core
//= require jquery.scrollTo/jquery.scrollTo

function scrollToLocation(slug) {
  var id = 'location-map-' + slug,
      el = $('[data-id='+id+']')
  $('.cards').scrollTo(el, 800, {
    over: { top: -0.01 }
  });
}

var myWindow, markers = {};

function isScrolledIntoView(elem)
{
  var docViewTop = myWindow.scrollTop();
  var docViewBottom = docViewTop + myWindow.height();

  var elemTop = elem.offset().top;
  var elemBottom = elemTop + elem.height();

  return ((elemBottom <= docViewBottom) && (elemTop >= docViewTop));
}

window.initMap = function initMap() {
  var bounds = new google.maps.LatLngBounds();

  // Create a map object and specify the DOM element for display.
  var map = new google.maps.Map(document.getElementById('map'));

  var info;

  var lngs = _.map(maps.locations, function(location, index) {
    var point = new google.maps.LatLng({
      lat: location.address.lat,
      lng: location.address.lng
    });
    bounds.extend(point);

    if(location.show_order) {
      var label = (location.order + 1).toString();
    } else {
      var label = null;
    }

    markers[location.slug] = new google.maps.Marker({
      map: map,
      position: point,
      label: label
    });

    markers[location.slug].addListener('click', function() {
      scrollToLocation(location.slug);

      if (info) {
        info.close();
      }

      info = new google.maps.InfoWindow({
        position: point,
        maxWidth: 200,
        content: "<h3>"+location.name+"</h3>"
      });

      info.open(map, markers[location.slug]);
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


$(function() {
  myWindow = $(window);
  var maps = $('.location-map h2');
  var lastMap;

  $('.cards').on('scroll', function() {
    var currentMapH2 = _.find(maps, function(map) {
      return isScrolledIntoView($(map));
    });

    if(currentMapH2) {
      var currentMap = $(currentMapH2).closest('.location-map').attr('data-id');
    }

    if(currentMap) {
      if(lastMap && lastMap != currentMap) {
        new google.maps.event.trigger(markers[lastMap], 'click');
      }
      if(currentMap && lastMap != currentMap) {
        lastMap = currentMap;
        new google.maps.event.trigger(markers[currentMap], 'click');
        markers[currentMap].setAnimation(google.maps.Animation.BOUNCE);

        setTimeout(function() {
          markers[lastMap].setAnimation(null);
        }, 600);
      }
    }
  });


});
