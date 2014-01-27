<?php
include_once('head.php')
?>
<body  onload="initSmallMap(); showStation(get_url_param('station'));">
<?php
include_once('header.php')
?>
			
	<section>
	
		<article id='station'>
			<h2 id="sectionHeadline">Station</h2>
			<div class="container" id="description"></div>
			<div class="container" id="picture"></div>
			<div class="container" id="map">
				<div id="smallMap"></div>
			</div>
		</article>
		
	</section>
			
			
		
		
<?php
include_once('footer.php')
?>
