var baseURL = '../';
//var baseURL = '/';

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
	        addMarker(station.longitude, station.latitude, station.name, true);
	        
	        //bikes
	        showBikesForStation(id, '#station');
	    },
	    url: baseURL + 'api/stations/' + id
	});
}

function showBikesForStation(id, div) {
  	$.ajax({
	    dataType: 'json',
	    success: function(data) {
	        //var bike = data[0];
	        
	        for(var i = 0; i < data.length; i++){
		        var bike = data[i];
		        
		        var bikeDiv = $('<div>').attr("class", 'container bike');
		        
		         //bike id
		        var bikeId = $('<p>').attr("class", 'modelId');//.append(bike.id);
		        
		        bikeId.bind('click', { id: bike.id}, function(event) {
					var data = event.data;
					window.location.href = "bike.php?bike=" + data.id;
				});
				
				//model name
				var xmlHttp = null;

			    xmlHttp = new XMLHttpRequest();
			    xmlHttp.open( "GET", baseURL + 'api/models/'+ bike.model, false );
			    xmlHttp.send( null );
			    
			    var json = JSON.parse(xmlHttp.responseText);
				bikeId.append(json.name);

										         
		        //booking
		        var bookingDiv = $('<div>').attr("class", 'booking');
		        var bookingIcon = $('<img>').attr("src", 'img/ic_booking.png');
		        var bookingPrice = $('<p>').attr("class", 'price').append(bike.price/100 + ' € / 15min');
		        bookingDiv.append(bookingIcon).append(bookingPrice);
		        
		        bookingDiv.bind('click', { id: bike.id}, function(event) {
					var data = event.data;
					window.location.href = baseURL + "client/doBooking.php?bikeid=" + data.id;
				});
		         
		        bikeDiv.append(bookingDiv);
		        bikeDiv.append(bikeId);
		        $(div).append(bikeDiv);
		        
		        
		    }
	        
	    },
	    url: baseURL + 'api/bikes?place=Dresden&radius=100000000&stationId=' + id
	});
}

function showBikesForModel(id, div) {
  	$.ajax({
	    dataType: 'json',
	    success: function(data) {
	        //var bike = data[0];
	        
	        for(var i = 0; i < data.length; i++){
		        var bike = data[i];
		        
		        var bikeDiv = $('<div>').attr("class", 'container bike');
		        
		         //bike id
		        var bikeId = $('<p>').attr("class", 'modelId').append(bike.id);
		        
		        bikeId.bind('click', { id: bike.id}, function(event) {
					var data = event.data;
					window.location.href = "bike.php?bike=" + data.id;
				});
		         
		        //booking
		        var bookingDiv = $('<div>').attr("class", 'booking');
		        var bookingIcon = $('<img>').attr("src", 'img/ic_booking.png');
		        var bookingPrice = $('<p>').attr("class", 'price').append(bike.price/100 + ' € / 15min');
		        bookingDiv.append(bookingIcon).append(bookingPrice);
		        
		        bookingDiv.bind('click', { id: bike.id}, function(event) {
					var data = event.data;
					window.location.href = baseURL + "client/doBooking.php?bikeid=" + data.id;
				});
		         
		        bikeDiv.append(bookingDiv);
		        bikeDiv.append(bikeId);
		        $(div).append(bikeDiv);
		    }
	        
	    },
	    url: baseURL + 'api/bikes?place=Dresden&radius=100000000&modelId=' + id
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
					window.location.href = baseURL + "client/station.php?station=" + data.id;
				});
						         
		        $('#stations').append(stationDiv);
		        
				addMarker(station.longitude, station.latitude, station.name, false);
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
					window.location.href = baseURL + "client/model.php?model=" + data.id;
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
	        var model = data;
	        
	        $('#sectionHeadline').text(model.name);
	        
	        var picture = $('<img>').attr("src", model.picture);
	        $('#description').append(model.description);
	        $('#bikepicture').append(picture);
	        
	         showBikesForModel(id, '#model');
	    },
	    url: baseURL + 'api/models/' + id
	});
}

function showBike(id) {
	$.ajax({
	    dataType: 'json',
	    success: function(data) {
	        var bike = data;
	        
	        $('#sectionHeadline').text('Fahrrad ' + bike.id);
	        
	        var bikeDiv = $('<div>').attr("class", 'container bike');
	        
	         //bike id
	        var bikeId = $('<p>').attr("class", 'modelId');//.append("Fahrradmodell " + bike.id);
	        
	        //model name
			var xmlHttp = null;

		    xmlHttp = new XMLHttpRequest();
		    xmlHttp.open( "GET", baseURL + 'api/models/'+ bike.model, false );
		    xmlHttp.send( null );
		    
		    var json = JSON.parse(xmlHttp.responseText);
			bikeId.append(json.name);
	         
	        //booking
	        var bookingDiv = $('<div>').attr("class", 'booking');
	        var bookingIcon = $('<img>').attr("src", 'img/ic_booking.png');
		var price = bike.price/100;
	        var bookingPrice = $('<p>').attr("class", 'price').append(price + ' € / 15min');
	        bookingDiv.append(bookingIcon).append(bookingPrice);
	        
	        bookingDiv.bind('click', { id: bike.id}, function(event) {
				var data = event.data;
				window.location.href = baseURL + "client/doBooking.php?bikeid=" + data.id;
			});
	         
	        bikeDiv.append(bookingDiv);

	        bikeDiv.append(bikeId);
	        $('#bikeInfo').append(bikeDiv);
	        
	        //map
	        addMarker(bike.longitude, bike.latitude, json.name + " für " + price + ' € / 15min', true);

	    },
	    url: baseURL + 'api/bikes/' + id
	});
}

function showResults(postcode, place, street, housenumber, radius, stationId) {
	$.ajax({
	    dataType: 'json',
	    success: function(data) {
	        for(var i in data){
	        	var bike = data[i];
		        
		        var bikeDiv = $('<div>').attr("class", 'container bike');
		        
		        //model name
				var xmlHttp = null;
	
			    xmlHttp = new XMLHttpRequest();
			    xmlHttp.open( "GET", baseURL + 'api/models/'+ bike.model, false );
			    xmlHttp.send( null );
			    
			    var json = JSON.parse(xmlHttp.responseText);
				//bikeId.append(json.name);
		        
		         //bike id
		        var bikeText = '';
		   if(stationId != '' && postcode == '' && place == '' && street == '' && housenumber == '')
				bikeText = json.name;
			else
				bikeText = json.name + ' - ' + bike.distance + ' Meter'; 
		        var bikeId = $('<p>').attr("class", 'modelId').append(bikeText);
		        
		        bikeId.bind('click', { id: bike.id}, function(event) {
					var data = event.data;
					window.location.href = "bike.php?bike=" + data.id;
				});
				
				
		         
		        //booking
		        var bookingDiv = $('<div>').attr("class", 'booking');
		        var bookingIcon = $('<img>').attr("src", 'img/ic_booking.png');
		        var bookingPrice = $('<p>').attr("class", 'price').append(bike.price/100 + ' € / 15min');
		        bookingDiv.append(bookingIcon).append(bookingPrice);
		        
		        bookingDiv.bind('click', { id: bike.id}, function(event) {
					var data = event.data;
					window.location.href = baseURL + "client/doBooking.php?bikeid=" + data.id;
				});
		         
		        bikeDiv.append(bookingDiv);
	
		        bikeDiv.append(bikeId);
		        $('#results').append(bikeDiv);

	        }
	    },
	    url: baseURL + 'api/bikes?postcode=' + postcode + '&place=' + place + '&street=' + street + '&housenumber=' + housenumber + '&radius=' + radius + '&stationId=' + stationId
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

function cancelBooking(bookingId){
	window.location.href = baseURL + "client/cancelBooking.php?bookingid=" + bookingId;
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
 * center: boolean - should the map be centered at this marker?
 */
function addMarker(lon, lat, text, center)
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

	if(center)
		map.setCenter(lonlat, 14);
}
