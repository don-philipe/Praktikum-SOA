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
	if($location == '') $app->halt(400, 'Parameter missing!');
	
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
    
    echo getJsonObjectsFromDb($query, $app);  
});


$app->get('/bikes/:bikeId', function ($id) use ($app) {
	$query = "SELECT id, model, price, longitude, latitude, station FROM bikes WHERE id = $id";
    
    echo getJsonObjectFromDb($query, $app); 
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
    
    echo getJsonObjectsFromDb($query, $app);  
});


$app->get('/models/:modelId', function ($id) use ($app) {
	$query = "SELECT * FROM models WHERE id = $id";
    echo getJsonObjectFromDb($query, $app);  
});


$app->get('/stations', function () use ($app) {
	//additional parameters
	$modelId = $app->request()->get('modelId');
	
	$query = "SELECT stations.id, stations.name, stations.longitude, stations.latitude,  stations.description, stations.picture, COUNT(bikes.id) AS bikes FROM stations LEFT JOIN bikes ON stations.id = bikes.station";
	
	//if additional parameters are existing, add to query
	$where = array();
	if ($modelId != '') $where[] = "model = $modelId";
	if (count($where) > 0) $query .= ' WHERE '.implode(' AND ', $where);
	
	$query .= ' GROUP BY stations.id';

    echo getJsonObjectsFromDb($query, $app);
});


$app->get('/stations/:stationId', function ($id) use ($app) {
	$query = "SELECT * FROM stations WHERE id = $id";
    echo getJsonObjectFromDb($query, $app);
});


$app->get('/account', function () use ($app) {
	$query = "SELECT id, email FROM accounts";
    echo getJsonObjectFromDb($query, $app);
});


$app->get('/bookings', function () use ($app) {
	$query = "SELECT id, bike, date FROM bookings";
    echo getJsonObjectsFromDb($query, $app);
});


$app->get('/bookings/:bookingId', function ($id) use ($app) {
	$query = "SELECT id, bike, date FROM bookings WHERE id = $id";
    echo getJsonObjectFromDb($query, $app);
});


$app->post('/bookings', function() use($app) {
	$bikeId = $app->request()->params('bikeId');
	if(!$bikeId) $app->halt(400, 'Parameter missing!');
	
	$postQuery = "INSERT INTO bookings (bike, account) VALUES ($bikeId, 1)";
	
	$id = addAndGetIdFromDb($postQuery, $app);
                
    $query = "SELECT id, bike, date FROM bookings WHERE id = $id";
    echo getJsonObjectFromDb($query, $app);
    $app->response()->status(201);
});


$app->put('/bookings/:bookingId', function($id) use($app) {
	$bikeId = $app->request()->params('bikeId');
	
	$putQuery = "UPDATE bookings SET bike = $bikeId WHERE id = $id";
	updateDb($putQuery, $app);
        
    $query = "SELECT id, bike, date FROM bookings WHERE id = $id";
    echo getJsonObjectFromDb($query, $app);
});


$app->delete('/bookings/:bookingId', function($id) use($app) {
	$query = "DELETE FROM bookings WHERE id = $id";
	deleteRowInDb($query, $app);
});

$app->post('/login', function($login, $password) use($app)
	{
		$query = "SELECT passwd FROM accounts WHERE login = $login";
		$passwd = getJsonObjectFromDb($query, $app);
		if($passwd == $password)
			echo "true";
		else
			echo "false";
	});

$app->run();


//Connects to db and returns a single result for the given query
function getJsonObjectFromDb($query, $app){
	$dbcon = getConnection();
    $stmt = $dbcon->query($query);
    $object = $stmt->fetchObject();   
    $dbcon = null;
    
    if(!$object) $app->halt(404);
    return json_encode($object);    
}

//Connects to db and returns an array of results for the given query
function getJsonObjectsFromDb($query, $app){
	$dbcon = getConnection();
    $stmt = $dbcon->query($query);
    $objects = $stmt->fetchAll(PDO::FETCH_ASSOC);   
    $dbcon = null;
    
    return json_encode($objects);    
}

//Connects to db, adds a row and returns the id
function addAndGetIdFromDb($query, $app){
	$dbcon = getConnection();
    $stmt = $dbcon->query($query);
    $id = $dbcon->lastInsertId();
    $dbcon = null;  
    
    if(!$id) $app->halt(400);
    
    return $id;
}

//Connects to db and updates row
function updateDb($query, $app){
	$dbcon = getConnection();
    $stmt = $dbcon->query($query);
    $dbcon = null;
}

//Connects to db and delets a row
function deleteRowInDb($query, $app){
	$dbcon = getConnection();
    $stmt = $dbcon->query($query);
    $dbcon = null;  
    
    //$app->halt(204);
    $app->response()->status(204);
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
