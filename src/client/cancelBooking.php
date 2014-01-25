<?php
include_once('head.php')
?>
<body  onload="initSmallMap()">
<?php
include_once('header.php')
?>

<?php

$bookingId = $_GET['bookingid'];

$params = array(
);
$url = $GLOBALS["api_url"]."bookings/".$bookingId;


?>
			
	<section>
		<h2>Buchung</h2>
		<article class="container" id='booking'>
			<?php
				echo doDeleteRequest($url, $_SESSION['$access_code'], $params);
			?>
		</article>
		
	</section>
			
			
		
		
<?php
include_once('footer.php')
?>
