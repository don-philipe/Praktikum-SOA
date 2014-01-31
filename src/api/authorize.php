<?php
// include our OAuth2 Server object
require_once 'server.php';
require_once 'config.php';
    

$request = OAuth2\Request::createFromGlobals();
$response = new OAuth2\Response();

// validate the authorize request
if (!$server->validateAuthorizeRequest($request, $response)) {
    $response->send();
    die;
}
// display an authorization form
if (empty($_POST)) {
  exit('
  	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	</head>
	<form method="post">
	  <label>Möchtest du der folgenden Anwendung Zugriff auf deine Daten gestatten: BikeSharing-WebClient</label><br />
	  <input type="text" name="username" value="">
	  <input type="password" name="password" value=""><br \>
	  <input type="submit" name="authorized" value="Zulassen">
	  <input type="submit" name="authorized" value="Ablehnen">
	</form>');
}

// print the authorization code if the user has authorized your client
$is_authorized = ($_POST['authorized'] === 'Zulassen');
$login = $_POST['username'];
$password = $_POST['password'];
$userid = "";	


	
if($is_authorized == true){
	$userid = checkUserPassword($login, $password);
	if($userid == null) $is_authorized = false;
}



//$userid = "1"; // A value on your server that identifies the user
$server->handleAuthorizeRequest($request, $response, $is_authorized, $userid);
if ($is_authorized) {
  // this is only here so that you get to see your code in the cURL request. Otherwise, we'd redirect back to the client
  $code = substr($response->getHttpHeader('Location'), strpos($response->getHttpHeader('Location'), 'code=')+5, 40);
  
  //print_r($response);
  //exit("SUCCESS! Authorization Code: $code");
}

$response->send();


// Return a connection to the database using PHP PDO
function getConnection() {
	require 'config.php';
    $dbh = new PDO("mysql:host=$dbhost;dbname=$dbname", $dbuser, $dbpass);
    $dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    return $dbh;
}

function checkUserPassword($login, $password){
	$query = "SELECT id FROM accounts WHERE login = '$login' AND passwd = '$password'";
	//$query = "SELECT id FROM accounts WHERE login = 'bike' AND passwd = '12345'";
	
	$dbcon = getConnection();
    $stmt = $dbcon->query($query);
    $object = $stmt->fetchObject();   
    $dbcon = null;
    
    if(!$object) return null;
    return $object->id;
}

?>