<div id="wrapper">
	<header>
		<div id="logo">
			<h1><a href="index.php">BikeSharing</a></h1>
			<img src="img/logo.png">
		</div>
	
		<nav>
			<ul>
				<li><a href="index.php">Startseite</a></li>
				<li><a href="search.php">Suche</a></li>
				<li><a href="stations.php">Standorte</a></li>
				<li><a href="models.php">Modelle</a></li>
				<li><a href="map.php">Karte</a></li>
				<!--<li><a href="login.php">Login</a></li>-->
				<?php if($_SESSION['$access_code']){ ?>
				<li><a href="profile.php">Profil</a></li>
				<?php } else { ?>
				<li><a href="http://localhost/BikeSharing/src/api/authorize.php?response_type=code&client_id=testclient&state=xyz">Login</a></li>
				<?php } ?>
			</ul>
		</nav>
	</header>
