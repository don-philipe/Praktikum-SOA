<?php
include_once('head.php')
?>
<body>
<?php
include_once('header.php')
?>

	<script type="text/javascript">
		
	</script>
			
	<section>
	
		<article id='search'>
			<h2>Suche</h2>
			<form action="results.php">
				<table>
					<tr>
					<th>Ort:</th>
					<th><input type="text" name="location" value="Dresden" /></th>
					</tr>
					<tr>
					<th>Radius:</th>
					<th><input type="number" name="radius" value="5000" /></th> 
					</tr>
					<tr>
					<th>
					    <input type="submit" value="Suche Starten">
					</th>
					<th>
					</th>
				</table>
			</form>
		</article>
		
	</section>
			
			
		
		
<?php
include_once('footer.php')
?>
