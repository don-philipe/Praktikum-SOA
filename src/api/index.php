<?php
require 'lib/Slim/Slim.php';
\Slim\Slim::registerAutoloader();

$app = new \Slim\Slim();
$app->contentType('application/json');

$app->get('/', function () {
	
});


$app->get('/bikes', function () use ($app) {
	//additional parameters
	$stationId = $app->request()->get('stationId');
	$modelId = $app->request()->get('modelId');
	$location = $app->request()->get('location'); 
	$radius = $app->request()->get('radius'); 
	if($radius == '') $radius = 2500;
	
	$coordinates = getCoordinates($location);
	$lat = $coordinates->lat;
	$lng = $coordinates->lng;
	$query = "SELECT id, model, price, longitude, latitude, station, ROUND(6371000 * 2 * ASIN ( SQRT (POWER(SIN((latitude - $lat)*pi()/180 / 2),2) + COS(latitude * pi()/180) * COS($lat *pi()/180) * POWER(SIN((longitude - $lng) *pi()/180 / 2), 2) ) ) , 0) AS distance FROM bikes";
	
	//if additional parameters are existing, add to query
	$where = array();
	if ($stationId != '') $where[] = "station = $stationId";
	if ($modelId != '') $where[] = "model = $modelId";
	if (count($where) > 0) $query .= ' WHERE '.implode(' AND ', $where);
	
	//limit bikes to selected distance
	$query .=  " HAVING distance < $radius ORDER BY distance";
    
    echo getJsonObjectsFromDb($query);  
});


$app->get('/bikes/:bikeId', function ($id) {
	$query = "SELECT id, model, price, longitude, latitude, station FROM bikes WHERE id = $id";
    
    echo getJsonObjectFromDb($query); 
});


$app->get('/models', function () use ($app) {
	//additional parameters
	$stationId = $app->request()->get('stationId');

	$query = "SELECT models.id, models.name, models.description, models.picture, COUNT(bikes.id) AS bikes FROM models LEFT JOIN bikes ON models.id = bikes.model";
	
	//if additional parameters are existing, add to query
	$where = array();
	if ($stationId != '') $where[] = "station = $stationId";
	if (count($where) > 0) $query .= ' WHERE '.implode(' AND ', $where);
	
	$query .= ' GROUP BY models.id';
    
    echo getJsonObjectsFromDb($query);  
});


$app->get('/models/:modelId', function ($id) {
	$query = "SELECT* FROM models WHERE id = $id";
    echo getJsonObjectFromDb($query);  
});


$app->get('/stations', function () use ($app) {
	//additional parameters
	$modelId = $app->request()->get('modelId');
	
	$query = "SELECT stations.id, stations.name, stations.description, stations.picture, COUNT(bikes.id) AS bikes FROM stations LEFT JOIN bikes ON stations.id = bikes.station";
	
	//if additional parameters are existing, add to query
	$where = array();
	if ($modelId != '') $where[] = "model = $modelId";
	if (count($where) > 0) $query .= ' WHERE '.implode(' AND ', $where);
	
	$query .= ' GROUP BY stations.id';

    echo getJsonObjectsFromDb($query);
});


$app->get('/stations/:stationId', function ($id) {
	$query = "SELECT * FROM stations WHERE id = $id";
    echo getJsonObjectFromDb($query);
});


$app->get('/account', function () {
	$query = "SELECT id, email FROM accounts";
    echo getJsonObjectFromDb($query);
});


$app->get('/bookings', function () {
	$query = "SELECT id, bike, date FROM bookings";
    echo getJsonObjectsFromDb($query);
});


$app->get('/bookings/:bookingId', function ($id) {
	$query = "SELECT id, bike, date FROM bookings WHERE id = $id";
    echo getJsonObjectFromDb($query);
});


$app->post('/bookings', function() use($app) {
	$bikeId = $app->request()->get('bikeId');
	$postQuery = "INSERT INTO bookings (bike, account) VALUES ($bikeId, 1)";
	
	$id = addAndGetIdFromDb($postQuery);
        
    $query = "SELECT id, bike, date FROM bookings WHERE id = $id";
    echo getJsonObjectFromDb($query);
});


$app->put('/bookings/:bookingId', function($id) use($app) {
	$bikeId = $app->request()->params('bikeId');
	
	$putQuery = "UPDATE bookings SET bike = $bikeId WHERE id = $id";
	updateDb($putQuery);
        
    $query = "SELECT id, bike, date FROM bookings WHERE id = $id";
    echo getJsonObjectFromDb($query);
});


$app->delete('/bookings/:bookingId', function($id) use($app) {
	$query = "DELETE FROM bookings WHERE id = $id";
	deleteRowInDb($query);
});

$app->run();


//Connects to db and returns a single result for the given query
function getJsonObjectFromDb($query){
	$dbcon = getConnection();
    $stmt = $dbcon->query($query);
    $object = $stmt->fetchObject();   
    $dbcon = null;
    return json_encode($object);    
}

//Connects to db and returns an array of results for the given query
function getJsonObjectsFromDb($query){
	$dbcon = getConnection();
    $stmt = $dbcon->query($query);
    $objects = $stmt->fetchAll(PDO::FETCH_ASSOC);   
    $dbcon = null;
    return json_encode($objects);    
}

//Connects to db, adds a row and returns the id
function addAndGetIdFromDb($query){
	$dbcon = getConnection();
    $stmt = $dbcon->query($query);
    $id = $dbcon->lastInsertId();
    $dbcon = null;  
    return $id;
}

//Connects to db and updates row
function updateDb($query){
	$dbcon = getConnection();
    $stmt = $dbcon->query($query);
    $dbcon = null;
}

//Connects to db and delets a row
function deleteRowInDb($query){
	$dbcon = getConnection();
    $stmt = $dbcon->query($query);
    $dbcon = null;  
}

// Return a connection to the database using PHP PDO
function getConnection() {
	require 'config.php';
    $dbh = new PDO("mysql:host=$dbhost;dbname=$dbname", $dbuser, $dbpass);
    $dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    return $dbh;
}

// Get coordinates for location from google maps
function getCoordinates($location){
	$mapsBaseUrl = 'http://maps.googleapis.com/maps/api/geocode/json?address=';
	
	$response = file_get_contents($mapsBaseUrl.$location.'&sensor=false');
	$json = json_decode($response);
	$location = $json->results[0]->geometry->location;
	
	return $location;
}
 

?>