<?php
include_once('head.php');

?>
<body>
<?php
include_once('header.php');
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
				<?php
					$url = "http://localhost/BikeSharing/src/api/bookings";
					echo doRequest($url, $_SESSION['$access_code'], "");
				?>
			</div>
			
			<button onclick="location.href='logout.php'">Logout</button>
			
		</article>
		
	</section>
<?php
include_once('footer.php');
?>
