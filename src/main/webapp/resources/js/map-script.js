
/* --------------------------------------------
Google Map
-------------------------------------------- */	
//window.onload = MapLoadScript;
window.onload = initMap;

function initMap() {
    var map = new google.maps.Map(document.getElementById('map'), {
      zoom: 18,
      center: {lat: -34.397, lng: 150.644}
    });
    var geocoder = new google.maps.Geocoder();

    document.getElementById('submit').addEventListener('click', function() {
      geocodeAddress(geocoder, map);
    });
  }

  function geocodeAddress(geocoder, resultsMap) {
    var address = document.getElementById('address').value;
    geocoder.geocode({'address': address}, function(results, status) {
      if (status === 'OK') {
        resultsMap.setCenter(results[0].geometry.location);
        var marker = new google.maps.Marker({
          map: resultsMap,
          position: results[0].geometry.location
        });
      } else {
        alert("없는 주소입니다");
      }
    });
  }
//
//
//
//function GmapInit() {
//	  Gmap = $('.map-canvas');
//	  Gmap.each(function() {
//		var $this           = $(this),
//			lat             = '',
//			lng             = '',
//			zoom            = 12,
//			scrollwheel     = false,
//			zoomcontrol 	= true,
//			draggable       = true,
//			mapType         = google.maps.MapTypeId.ROADMAP,
//			title           = '',
//			contentString   = '',
//			theme_icon_path         = $this.data('icon-path'),
//			dataZoom        = $this.data('zoom'),
//			dataType        = $this.data('type'),
//			dataScrollwheel = $this.data('scrollwheel'),
//			dataZoomcontrol = $this.data('zoomcontrol'),
//			dataHue         = $this.data('hue'),
//			dataTitle       = $this.data('title'),
//			dataContent     = $this.data('content');
//			
//		if( dataZoom !== undefined && dataZoom !== false ) {
//			zoom = parseFloat(dataZoom);
//		}
//		if( dataLat !== undefined && dataLat !== false ) {
//			lat = parseFloat(dataLat);
//		}
//		if( dataLng !== undefined && dataLng !== false ) {
//			lng = parseFloat(dataLng);
//		}
//		if( dataScrollwheel !== undefined && dataScrollwheel !== null ) {
//			scrollwheel = dataScrollwheel;
//		}
//		if( dataZoomcontrol !== undefined && dataZoomcontrol !== null ) {
//			zoomcontrol = dataZoomcontrol;
//		}
//		if( dataType !== undefined && dataType !== false ) {
//			if( dataType == 'satellite' ) {
//				mapType = google.maps.MapTypeId.SATELLITE;
//			} else if( dataType == 'hybrid' ) {
//				mapType = google.maps.MapTypeId.HYBRID;
//			} else if( dataType == 'terrain' ) {
//				mapType = google.maps.MapTypeId.TERRAIN;
//			}		  	
//		}
//		if( dataTitle !== undefined && dataTitle !== false ) {
//			title = dataTitle;
//		}
//		if( navigator.userAgent.match(/iPad|iPhone|Android/i) ) {
//			draggable = false;
//		}
//		
//		
//		var mapOptions = {
//		  zoom        : zoom,
//		  scrollwheel : scrollwheel,
//		  zoomControl : zoomcontrol,
//		  draggable   : draggable,
//		  center      : new google.maps.LatLng(lat, lng),
//		  mapTypeId   : mapType
//		};		
//		var map = new google.maps.Map($this[0], mapOptions);
//		
//		//var image = 'images/icons/map-marker.png';
//		var image = theme_icon_path;
//		
//		if( dataContent !== undefined && dataContent !== false ) {
//			contentString = '<div class="map-data">' + '<h6>' + title + '</h6>' + '<div class="map-content">' + dataContent + '</div>' + '</div>';
//		}
//		var infowindow = new google.maps.InfoWindow({
//			content: contentString
//		});
//		
//		var geocoder = new google.maps.Geocoder();
//		geocodeAddress(geocoder, map);
//		var address = document.getElementById('address').value;
//		geocoder.geocode({'address': address}, function(results, status) {
//		if (status === 'OK') {
//		resultsMap.setCenter(results[0].geometry.location);
//		var marker = new google.maps.Marker({
//		  position : results[0].geometry.location,
//		  map      : resultsMap,
//		  icon     : image,
//		  title    : title
//		});
//		} else {
//            alert("없는 주소입니다.");
//          }
//	  });
//		if( dataContent !== undefined && dataContent !== false ) {
//			google.maps.event.addListener(marker, 'click', function() {
//				infowindow.open(map,marker);
//			});
//		}
//
//	 });
//}
//
//function MapLoadScript() {
//	var script = document.createElement('script');
//	script.type = 'text/javascript';
//	GmapInit();
//	document.body.appendChild(script);
//}

