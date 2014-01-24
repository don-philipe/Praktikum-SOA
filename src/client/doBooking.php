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
$url = "http://localhost/BikeSharing/src/api/bookings";


?>
			
	<section>
		<h2>Buchung</h2>
		<article class="container" id='booking'>
			<?php
				echo doPostRequest($url, $_SESSION['$access_code'], $params);
			?>
		</article>
		
	</section>
			
			
		
		
<?php
include_once('footer.php')
?>
