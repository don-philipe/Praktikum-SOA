<?php
include_once('head.php')
?>
<body  onload="initMap(); 
showBike(get_url_param('bike'));">
<?php
include_once('header.php')
?>

	<section>
	
		<article id='bike'>
			<h2 id="sectionHeadline">Fahrrad</h2>
			<!--
			<div class="container" id="description"></div>
			-->
			<div id="bikeInfo"></div>
			<div class="container">
				<div id="basicMap"></div>
			</div>
		</article>
		
	</section>
			
			
		
		
<?php
include_once('footer.php')
?>
