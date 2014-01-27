<?php
include_once('head.php')
?>
<body>
<?php
include_once('header.php')
?>

	<script type="text/javascript">
		showResults(get_url_param('plz'), get_url_param('Ort'), get_url_param('street'), get_url_param('number'), get_url_param('radius'), get_url_param('stationId'));
	</script>
			
	<section>
	
		<article id='results'>
			<h2>Suchergebnisse</h2>
		</article>
		
	</section>
			
			
		
		
<?php
include_once('footer.php')
?>
