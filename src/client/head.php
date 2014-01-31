<?php
session_start();

$api_url = 'https://tobias90.circinus.uberspace.de/api/';	
$oauth_url = 'https://tobias90.circinus.uberspace.de/api/authorize.php?response_type=code&client_id=testclient&state=xyz';
	
	
$access_code = "";
$auth_code =  $_GET['code'];
if($auth_code != ""){
	$access_code = json_decode(getAccessCode($auth_code))->access_token;
	$_SESSION['$access_code'] = $access_code;
}

if(testAccessCode($_SESSION['$access_code']) == 'invalid_token'){
	$_SESSION['$access_code'] = "";
}

function testAccessCode($code){
	$url = $GLOBALS["api_url"].'resource.php';

	$fields = array(
            'access_token'  => $code,
	);
	
	$url .= '?' . http_build_query($fields);
	
	//open connection
	$ch = curl_init();
	
	//set the url, number of POST vars, POST data
	curl_setopt($ch,CURLOPT_URL, $url);
	curl_setopt($ch,CURLOPT_RETURNTRANSFER, true);  
	
	//execute post
	$result = curl_exec($ch);
	
	//close connection
	curl_close($ch);
	
	return json_decode($result)->error;
	//print_r($result);
}

function getAccessCode($code){
	$url = $GLOBALS["api_url"]."token.php";

	$fields = array(
			'grant_type'    => 'authorization_code',
            'code'          => $code,
            'client_id'     => "testclient",
            'client_secret' => "testpass",
            'redirect_uri'  => "http://tobias90.circinus.uberspace.de/client/",
	);
	
	foreach($fields as $key=>$value) { $fields_string .= $key.'='.$value.'&'; }
	rtrim($fields_string, '&');
		
	//open connection
	$ch = curl_init();
	
	//set the url, number of POST vars, POST data
	curl_setopt($ch,CURLOPT_URL, $url);
	curl_setopt($ch,CURLOPT_POST, count($fields));
	curl_setopt($ch,CURLOPT_POSTFIELDS, $fields_string);
	curl_setopt($ch,CURLOPT_RETURNTRANSFER, true);  
	
	//execute post
	$result = curl_exec($ch);
	
	//close connection
	curl_close($ch);
	
	
	return $result;
	//return json_decode($result);
}

function doRequest($url, $token, $params){
	//$url = "http://localhost/BikeSharing/src/api/bookings";
	
	$fields = array(
            'access_token'  => $token,
	);
	
	$url .= '?' . http_build_query($fields);
	
	//open connection
	$ch = curl_init();
	
	//set the url
	curl_setopt($ch,CURLOPT_URL, $url);
	curl_setopt($ch,CURLOPT_RETURNTRANSFER, true);  
	
	//execute post
	$result = curl_exec($ch);
	
	//close connection
	curl_close($ch);
	
	
	return $result;
}

function doPostRequest($url, $token, $params){
	$params['access_token'] = $token;
	
	foreach($params as $key=>$value) { $params_string .= $key.'='.$value.'&'; }
	rtrim($params_string, '&');

	//open connection
	$ch = curl_init();
	
	//set the url, number of POST vars, POST data
	curl_setopt($ch,CURLOPT_URL, $url);
	curl_setopt($ch,CURLOPT_POST, count($params));
	curl_setopt($ch,CURLOPT_POSTFIELDS, $params_string);
	curl_setopt($ch,CURLOPT_RETURNTRANSFER, true);  
	
	//execute post
	$result = curl_exec($ch);
	
	$http_status = curl_getinfo($ch, CURLINFO_HTTP_CODE);
	//close connection
	curl_close($ch);
	
	if($http_status == 404){
		return NULL;
	}
	return $result;
}

function doDeleteRequest($url, $token, $params){
	//open connection
	$ch = curl_init();
	
	//set the url, number of POST vars, POST data
	curl_setopt($ch,CURLOPT_URL, $url);
	curl_setopt($ch,CURLOPT_CUSTOMREQUEST, "DELETE");
	curl_setopt($ch,CURLOPT_HTTPHEADER, array(
	    "Content-type: application/x-www-form-urlencoded",
	    "Authorization: Bearer $token"
	));
	curl_setopt($ch,CURLOPT_RETURNTRANSFER, true);  
	
	//execute post
	$result = curl_exec($ch);
	
	//close connection
	curl_close($ch);

	return $result;

}

?>

<!DOCTYPE HTML>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<link href="css/style.css" type="text/css" rel="stylesheet">
		<script language="javascript" type="text/javascript" src="js/lib/jquery-2.0.3.min.js"></script>
		<!--<script language="javascript" type="text/javascript" src="js/lib/jquery-2.0.3.min.js"></script>-->
		<script language="javascript" type="text/javascript" src="js/script.js"></script>
		<!--<script language="javascript" type="text/javascript" src="js/lib/OpenLayers.mobile.js"></script>-->
		<script language="javascript" type="text/javascript" src="js/lib/OpenLayers-2.13.1/OpenLayers.js"></script>
		
		<title>BikeSharing</title>
	</head>
