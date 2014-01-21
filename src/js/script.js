//var baseURL = '/BikeSharing/src/';
var baseURL = '/';

window.onload = function() {    
}
function showStation(id) { $.ajax({
	    dataType: 'json',
	    success: function(data) {
	        var station = data;
	        
	        $('#sectionHeadline').text(station.name);
	        
	        //description
	        var description = $('<p>').attr("class", 'description').append(station.description);
	        $('#description').append(description);
	        
	        //picture
	        var picture = $('<img>').attr("src", station.picture);
	        $('#picture').append(picture);
	        
	        //map
	        addMarker(station.longitude, station.latitude, station.nam);
	        
	        //bikes
	        showBikesForStation(id);
	    },
	    url: baseURL + 'api/stations/' + id
	});
}

function showBikesForStation(id) {
  	$.ajax({
	    dataType: 'json',
	    success: function(data) {
	        //var bike = data[0];
	        
	        for(var i = 0; i < data.length; i++){
		        var bike = data[i];
		        var bikeDiv = $('<div>').attr("class", 'container bike');
		        
		         //bike id
		        var bikeId = $('<p>').attr("class", 'modelId').append(bike.id);
		         
		        //booking
		        var bookingDiv = $('<div>').attr("class", 'booking');
		        var bookingIcon = $('<img>').attr("src", 'img/ic_booking.png');
		        var bookingPrice = $('<p>').attr("class", 'price').append(bike.price/100 + ' € / h');
		        bookingDiv.append(bookingIcon).append(bookingPrice);
		         
		        bikeDiv.append(bookingDiv);
		        bikeDiv.append(bikeId);
		        $('#station').append(bikeDiv);
		    }
	        
	    },
	    url: baseURL + 'api/bikes?location=Dresden&radius=100000000&stationId=' + id
	});
}

function showStations() {
	$.ajax({
	    dataType: 'json',
	    success: function(data) {
	        for(var i in data){
		        var station = data[i];
		        
		        var stationDiv = $('<div>').attr("class", 'container station');
		        
		        var picture = $('<img>').attr("src", station.picture);
		        var content = $('<div>').attr("class", 'content');
		        
		        var name = $('<h4>').attr("class", 'name').append(station.name);
		        
		        var bikesImg = $('<img>').attr("src", 'img/ic_bike.jpg');
		        var bikesCount = $('<div>').attr("class", 'bikesCount').append(station.bikes).append(bikesImg);
		        
		        var description = $('<p>').attr("class", 'description').append(station.description);
		         
		        stationDiv.append(picture);
		        content.append(name);
		        content.append(bikesCount);
		        content.append(description);
		        stationDiv.append(content);
		        
		        stationDiv.bind('click', { id: station.id}, function(event) {
					var data = event.data;
					window.location.href = baseURL + "station.php?station=" + data.id;
				});
						         
		        $('#stations').append(stationDiv);
		        
			addMarker(station.longitude, station.latitude, station.name);
	        }
	    },
	    url: baseURL + 'api/stations'
	});
}

function showModels() {
	$.ajax({
	    dataType: 'json',
	    success: function(data) {
	        for(var i in data){
		        var model = data[i];
		        
		        var modelDiv = $('<div>').attr("class", 'container model');
		        
		        var picture = $('<img>').attr("src", model.picture);
		        var content = $('<div>').attr("class", 'content');
		        
		        var name = $('<h4>').attr("class", 'name').append(model.name);
		        
		        /*
		        var bikesImg = $('<img>').attr("src", 'img/ic_bike.jpg');
		        var bikesCount = $('<div>').attr("class", 'bikesCount').append(model.bikes).append(bikesImg);
		        */
		        var description = $('<p>').attr("class", 'description').append(model.description);
		         
		        modelDiv.append(picture);
		        content.append(name);
		        //content.append(bikesCount);
		        content.append(description);
		        modelDiv.append(content);
		        
		        modelDiv.bind('click', { id: model.id}, function(event) {
					var data = event.data;
					window.location.href = baseURL + "model.php?model=" + data.id;
				});
						         
		        $('#models').append(modelDiv);
	        }
	    },
	    url: baseURL + 'api/models'
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
	    url: baseURL + 'api/models/' + id
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
	    url: baseURL + 'api/bikes?location=' + location + '&radius=' + radius
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

function login(login, passwd) {
	passwdhash = md5(passwd);
	console.log(passwdhash);
	$.ajax({
	    dataType: 'json',
	    success: function(data) {
	        var stat = data;
	        var statDiv = $('<div>').attr("class", 'stat');
	        var bool = $('<p>').attr("class", 'bool').append(stat.stat);
	         
	        statDiv.append(bool);
	        $('#loginstatus').append(statDiv);
	    },
	    url: baseURL + 'api/login/' + login + '/' + passwdhash
	});
}

///////////////////////
// functions for map //
///////////////////////

var map;
var markers;

/**
 *
 */
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
	markers = new OpenLayers.Layer.Markers("Markers");
	map.addLayer(markers);
}

function initSmallMap()
{
	map = new OpenLayers.Map("smallMap");
	var mapnik = new OpenLayers.Layer.OSM();
	map.addLayer(mapnik);
	map.setCenter(new OpenLayers.LonLat(13.6869,51.0764) // Center of the map 
		.transform(
			new OpenLayers.Projection("EPSG:4326"), // transform from WGS 1984
			new OpenLayers.Projection("EPSG:900913") // to Spherical Mercator Projection
		), 11 // Zoom level
	);
	markers = new OpenLayers.Layer.Markers("Markers");
	map.addLayer(markers);
}

/**
 * lon: longitude of marker
 * lat: latitude of marker
 * text: text for popup
 */
function addMarker(lon, lat, text)
{
	var size = new OpenLayers.Size(21,25);
	var offset = new OpenLayers.Pixel(-(size.w/2), -size.h);
	var icon = new OpenLayers.Icon('http://www.openlayers.org/dev/img/marker.png',size,offset);
	var lonlat = new OpenLayers.LonLat(lon,lat).transform(
			new OpenLayers.Projection("EPSG:4326"),
			new OpenLayers.Projection("EPSG:900913"));
	var marker = new OpenLayers.Marker(lonlat, icon.clone());
	marker.events.register("mousedown", marker, function(evt) { 
		map.addPopup(popup);
		OpenLayers.Event.stop(evt); 
	});
	markers.addMarker(marker);

	// A popup with some information about our location
	var popup = new OpenLayers.Popup.FramedCloud("Popup", 
		lonlat, null, text, null,
	        true, // <-- true if we want a close (X) button, false otherwise
		function(evt){
			map.removePopup(this);
		}
	);
}
