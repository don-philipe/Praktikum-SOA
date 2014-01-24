<?php
//if (!$app['session']->isStarted()) {
	session_start();
//}
	
$access_code = "";
$auth_code =  $_GET['code'];
if($auth_code != ""){
	$access_code = json_decode(getAccessCode($auth_code))->access_token;
	$_SESSION['$access_code'] = $access_code;
}

function getAccessCode($code){
	$url = "http://localhost/BikeSharing/src/api/token.php";
	$fields = array(
			'grant_type'    => 'authorization_code',
            'code'          => $code,
            'client_id'     => "testclient",
            'client_secret' => "testpass",
            'redirect_uri'  => "http://localhost/BikeSharing/src/client/",
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
	
	//set the url, number of POST vars, POST data
	curl_setopt($ch,CURLOPT_URL, $url);
	curl_setopt($ch,CURLOPT_RETURNTRANSFER, true);  
	
	//execute post
	$result = curl_exec($ch);
	
	//close connection
	curl_close($ch);
	
	
	return $result;
}

function doPostRequest($url, $token, $params){
/*
	$fields = array(
            'access_token'  => $token,
	);
	*/
	$params['access_token'] = $token;
	
	foreach($params as $key=>$value) { $params_string .= $key.'='.$value.'&'; }
	rtrim($params_string, '&');
	
	//$url .= '?' . http_build_query($fields);
	
	//open connection
	$ch = curl_init();
	
	//set the url, number of POST vars, POST data
	curl_setopt($ch,CURLOPT_URL, $url);
	curl_setopt($ch,CURLOPT_POST, count($params));
	curl_setopt($ch,CURLOPT_POSTFIELDS, $params_string);
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
		<script language="javascript" type="text/javascript" src="http://code.jquery.com/jquery-2.0.3.min.js"></script>
		<!--<script language="javascript" type="text/javascript" src="js/lib/jquery-2.0.3.min.js"></script>-->
		<script language="javascript" type="text/javascript" src="js/script.js"></script>
		<!--<script language="javascript" type="text/javascript" src="js/lib/OpenLayers.mobile.js"></script>-->
		<script language="javascript" type="text/javascript" src="http://www.openlayers.org/api/OpenLayers.js"></script>
		
		<title>BikeSharing</title>
	</head>
