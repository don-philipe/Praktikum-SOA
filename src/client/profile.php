<?php
include_once('head.php');

?>
<body>
<?php
include_once('header.php');

$bookingUrl = $GLOBALS["api_url"]."bookings";
$bookingsJson = doRequest($bookingUrl, $_SESSION['$access_code'], "");
?>
	<section>
	
		<article id='profile'>
			<h2>Profil</h2>
			<button id="logout" onclick="location.href='logout.php'">Logout</button>
			
			<div class="container" id="personal">
				<h4>Persönliche Informationen:</h4>
				<?php
					$url = $GLOBALS["api_url"]."account";
					$request =  doRequest($url, $_SESSION['$access_code'], "");
					$account = json_decode($request);
				?>
				<p>Accountnr.: <?php echo($account->id); ?></p>
				<p>E-Mail.: <?php echo($account->email); ?></p>
				<p>Login.: <?php echo($account->login); ?></p>
			</div>
			
			<div class="container" id="payment">
				<h4>Zahlungsinformationen:</h4>
			</div>
			
			<div class="container" id="bookings">
				<h4>Buchungen:</h4>
				<ul>
					<li class="booking">
						<div class="id">Buchungsnr.</div>
						<div class="bikeId">Fahrradnr.</div>
						<div class="booked">Zeitpunkt der Buchung</div>
						<div class="released">Zeitpunkt der Rückgabe</div>
						<div class="price">Kosten</div>
					</li>
				
					<?php
					
					$bookings = json_decode($bookingsJson, true);
					for($count = 0; $count < count($bookings); $count++){
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
							<div class="delete" id="bookingid_" onclick="cancelBooking(<?php echo($booking[id]); ?>)">
								<?php
									if($booking[released] == ""){
								?>
										<img src="img/ic_delete.png"></div>
								<?php
									}
										
								/*
									$date1 = strtotime($booking[date]);
									$date2 = time();
									if(($date2 - $date1) < 1800){
										?>
										<img src="img/ic_delete.png"></div>
										<?php
										
									}
									*/
								?>
						</li>
						<?php
					}
				?>
				</ul>
			</div>
			
			
			
		</article>
		
	</section>
<?php
include_once('footer.php');
?>
