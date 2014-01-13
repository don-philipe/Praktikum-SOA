window.onload = function() {    
}

function showStation(id) {
  	$.ajax({
	    dataType: 'json',
	    success: function(data) {
	        var station = data;
	        
	        var stationDiv = $('<div>').attr("class", 'station');
	        
	        var picture = $('<img>').attr("scr", station.picture);
	        var name = $('<p>').attr("class", 'name').append(station.name);
	        var description = $('<p>').attr("class", 'description').append(station.description);
	         
	        stationDiv.append(picture);
	        stationDiv.append(name);
	        stationDiv.append(description);
	        	         
	        $('#station').append(stationDiv);
	        
	    },
	    url: '/BikeSharing/api/stations/' + id
	    //url: '/api/stations/' + id
	});
}

function showStations() {
	$.ajax({
	    dataType: 'json',
	    success: function(data) {
	        for(var i in data){
		        var station = data[i];
		        
		        var stationDiv = $('<div>').attr("class", 'station');
		        
		        var picture = $('<img>').attr("scr", station.picture);
		        var name = $('<p>').attr("class", 'name').append(station.name);
		        var description = $('<p>').attr("class", 'description').append(station.description);
		         
		        stationDiv.append(picture);
		        stationDiv.append(name);
		        stationDiv.append(description);
		        
		        stationDiv.bind('click', { id: station.id}, function(event) {
					var data = event.data;
					window.location.href = "/BikeSharing/station.php?station=" + data.id;
					//window.location.href = "/station.php?station=" + data.id;
				});
						         
		        $('#stations').append(stationDiv);
	        }
	    },
	    url: '/BikeSharing/api/stations'
	    //url: '/api/stations'
	});
}

function showModels() {
	$.ajax({
	    dataType: 'json',
	    success: function(data) {
	        for(var i in data){
		        var station = data[i];
		        
		        var stationDiv = $('<div>').attr("class", 'station');
		        
		        var picture = $('<img>').attr("scr", station.picture);
		        var name = $('<p>').attr("class", 'name').append(station.bikes + ' x ' + station.name);
		        var description = $('<p>').attr("class", 'description').append(station.description);
		         
		        stationDiv.append(picture);
		        stationDiv.append(name);
		        stationDiv.append(description);
		        
		        stationDiv.bind('click', { id: station.id}, function(event) {
					var data = event.data;
					window.location.href = "/BikeSharing/model.php?model=" + data.id;
					//window.location.href = "/model.php?model=" + data.id;
				});
		         
		        $('#models').append(stationDiv);
	        }
	    },
	    url: '/BikeSharing/api/models'
	    //url: '/api/models'
	});
}

function showModel(id) {
	$.ajax({
	    dataType: 'json',
	    success: function(data) {
	        var station = data;
	        var stationDiv = $('<div>').attr("class", 'station');
	        
	        var picture = $('<img>').attr("scr", station.picture);
	        var name = $('<p>').attr("class", 'name').append(station.name);
	        var description = $('<p>').attr("class", 'description').append(station.description);
	         
	        stationDiv.append(picture);
	        stationDiv.append(name);
	        stationDiv.append(description);
	       
	        $('#model').append(stationDiv);
	    },
	    url: '/BikeSharing/api/models/' + id
	    //url: '/api/models/' + id
	});
}

function showResults(location, radius) {
	$.ajax({
	    dataType: 'json',
	    success: function(data) {
	        for(var i in data){
		        
		        var station = data[i];
		        //alert();
		        
		        var stationDiv = $('<div>').attr("class", 'bikes');
		        
		        var distance = $('<p>').attr("class", 'distance').append(station.distance + ' Meter');
		        var price = $('<p>').attr("class", 'price').append(station.price + ' Cent');
		         
		        stationDiv.append(distance);
		        stationDiv.append(price);
		        
		        stationDiv.bind('click', { id: station.id}, function(event) {
					var data = event.data;
					alert( data.id );
				});
		         
		        $('#results').append(stationDiv);
	        }
	    },
	    url: '/BikeSharing/api/bikes?location=' + location + '&radius=' + radius
	    //url: '/api/bikes?location=' + location + '&radius=' + radius
	});
}

function get_url_param( name ){
	name = name.replace(/[\[]/,"\\\[").replace(/[\]]/,"\\\]");

	var regexS = "[\\?&]"+name+"=([^&#]*)";
	var regex = new RegExp( regexS );
	var results = regex.exec( window.location.href );

	if ( results == null )
		return "";
	else
		return results[1];
}

///////////////////////
// functions for map //
///////////////////////

var map;
function initMap()
{
	map = new OpenLayers.Map("basicMap");
	var mapnik = new OpenLayers.Layer.OSM();
	map.addLayer(mapnik);
	map.setCenter(new OpenLayers.LonLat(13.6869,51.0764) // Center of the map 
		.transform(
			new OpenLayers.Projection("EPSG:4326"), // transform from WGS 1984
			new OpenLayers.Projection("EPSG:900913") // to Spherical Mercator Projection
		), 11 // Zoom level
	);
}

function addMarker(lon, lat, text)
{
	var markers = new OpenLayers.Layer.Markers( "Markers" );
	map.addLayer(markers);
	var size = new OpenLayers.Size(21,25);
	var offset = new OpenLayers.Pixel(-(size.w/2), -size.h);
	var icon = new OpenLayers.Icon('http://www.openlayers.org/dev/img/marker.png',size,offset);
	var lonlat = new OpenLayers.LonLat(lon,lat).transform(
			new OpenLayers.Projection("EPSG:4326"),
			new OpenLayers.Projection("EPSG:900913"));
	var marker = new OpenLayers.Marker(lonlat, icon.clone());
	marker.events.register("mousedown", marker, function(evt) { 
		OpenLayers.Event.stop(evt); 
	});
	markers.addMarker(marker);

	// The overlay layer for our marker, with a simple diamond as symbol
//	var overlay = new OpenLayers.Layer.Vector('Overlay', {
//		styleMap: new OpenLayers.StyleMap({
//			externalGraphic: 'img/map-marker.png',
//			graphicWidth: 20, graphicHeight: 24, graphicYOffset: -24,
//			title: '${tooltip}'
//		})
//	});
//
//	// The location of our marker and popup. We usually think in geographic
//	// coordinates ('EPSG:4326'), but the map is projected ('EPSG:3857').
//	var marker = new OpenLayers.Geometry.Point(lon, lat)
//		.transform('EPSG:4326', 'EPSG:900913'); //EPSG:3857');
//
//	// We add the marker with a tooltip text to the overlay
//	overlay.addFeatures([
//		new OpenLayers.Feature.Vector(marker, {tooltip: 'OpenLayers'})
//	]);

	// A popup with some information about our location
	var popup = new OpenLayers.Popup.FramedCloud("Popup", 
		marker.getBounds().getCenterLonLat(), null, text, null,
	        true // <-- true if we want a close (X) button, false otherwise
	);
	map.addPopup(popup);


}
