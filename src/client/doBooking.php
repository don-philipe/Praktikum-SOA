<?php
include_once('head.php')
?>
<body  onload="initSmallMap()">
<?php
include_once('header.php')
?>

<?php

$bikeId = $_GET['bikeid'];

$params = array(
	'bikeId'  => $bikeId,
);
$url = $GLOBALS["api_url"]."bookings";


?>
			
	<section>
		<h2>Buchung</h2>
		<article class="container" id='booking'>
			<?php
				$result = doPostRequest($url, $_SESSION['$access_code'], $params);
				if($result){
					$bike = json_decode($result, true);
					?>
					<p>Buchung des Fahrrads erfolgreich.</p>
					<p>Buchungsnummer: <?php echo $bike[id]; ?> </p>
					<?php
				}else{
					?>
					Du musst dich einloggen bevor du ein Fahrrad leihen kannst. <a href="<?php echo $GLOBALS["oauth_url"]; ?>">Zum Login</a>
					<?php
				}
			?>
		</article>
		
	</section>
			
			
		
		
<?php
include_once('footer.php')
?>
