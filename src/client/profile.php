<?php
include_once('head.php');

?>
<body>
<?php
include_once('header.php');

$bookingUrl = "http://localhost/BikeSharing/src/api/bookings";
$bookingsJson = doRequest($bookingUrl, $_SESSION['$access_code'], "");
?>
	<section>
	
		<article id='profile'>
			<h2>Profil</h2>
			
			<div class="container" id="personal">
				<h4>Persönliche Informationen:</h4>
				<?php
					$url = "http://localhost/BikeSharing/src/api/account";
					echo doRequest($url, $_SESSION['$access_code'], "");
				?>
			</div>
			
			<div class="container" id="payment">
				<h4>Zahlungsinformationen:</h4>
			</div>
			
			<div class="container" id="bookings">
				<h4>Buchungen:</h4>
				<ul>
				<?php
					
					$bookings = json_decode($bookingsJson, true);
					//print_r($book);
					for($count = 1; $count < count($bookings); $count++){
						$booking = $bookings[$count];
						
						$costs = $booking[costs];
						if($costs) $costs = ($costs / 100).'€';
						
						?>
						<li class="booking">
							<div class="id"><?php echo($booking[id]); ?></div>
							<div class="bikeId"><?php echo($booking[bike]); ?></div>
							<div class="booked"><?php echo($booking[date]); ?></div>
							<div class="released"><?php echo($booking[released]); ?></div>
							<div class="price"><?php echo($costs); ?></div>
						</li>
						<?php
						//echo($booking[id]);
					}
					
					/*
					foreach ($book-> as $booking )
					{
					    echo "{$booking->id}\n";
					}
					*/
					
				?>
				</ul>
			</div>
			
			<button onclick="location.href='logout.php'">Logout</button>
			
		</article>
		
	</section>
<?php
include_once('footer.php');
?>
