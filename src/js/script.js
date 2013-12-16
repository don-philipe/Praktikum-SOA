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
				});
						         
		        $('#stations').append(stationDiv);
	        }
	    },
	    url: '/BikeSharing/api/stations'
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
				});
		         
		        $('#models').append(stationDiv);
	        }
	    },
	    url: '/BikeSharing/api/models'
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