//= require jquery
//= require tether/dist/js/tether.min
//= require bootstrap/dist/js/bootstrap.min
//= require lodash/dist/lodash.core
//= require jquery.scrollTo/jquery.scrollTo

var myWindow, markers = {}, disableSync = false;

function scrollToLocation(slug) {
  var id = slug,
      el = $('[data-id='+id+']')

  disableSync = true;
  $('.cards').scrollTo(el, 400, {
    over: { top: -0.01 },
    onAfter: function() {
      disableSync = false;
    }
  });

}


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
      position: point
    });

    markers[location.slug].addListener('click', function(open) {
      if(open == 'closing') { return; }

      if(!disableSync && open != 'opening') {
        scrollToLocation(location.slug);
      }

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
    if(disableSync) { return true; }

    var currentMapH2 = _.find(maps, function(map) {
      return isScrolledIntoView($(map));
    });

    if(currentMapH2) {
      var currentMap = $(currentMapH2).closest('.location-map').attr('data-id');
    }

    if(currentMap) {
      if(lastMap && lastMap != currentMap) {
        new google.maps.event.trigger(markers[lastMap], 'click', 'closing');

        // markers[lastMap].setIcon('http://maps.google.com/mapfiles/ms/icons/red-dot.png')
      }
      if(currentMap && lastMap != currentMap) {
        lastMap = currentMap;
        new google.maps.event.trigger(markers[currentMap], 'click', 'opening');
        markers[currentMap].setAnimation(google.maps.Animation.BOUNCE);
        // markers[currentMap].setIcon('http://maps.google.com/mapfiles/ms/icons/blue-dot.png')

        setTimeout(function(map) {
          markers[map].setAnimation(null);
        }.bind(this, lastMap), 600);
      }
    }
  });


});
