<?php
include_once('head.php')
?>
<body onload="initMap();">
<?php
include_once('header.php')
?>

	<script type="text/javascript">
		showStations();
	</script>
			
	<section>
	
		<article id='stations'>
			<h2>Stationen</h2>
			<!--TODO: insert OSM map and get gps from db-->
		</article>
		
	</section>
	<center>
	<div id="basicMap"></div>
	</center>
		
<?php
include_once('footer.php')
?>
