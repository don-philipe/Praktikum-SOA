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
	
		<article>
			<h2>Suche</h2>
			<form class="container" id="search" action="results.php">
				<table>
					<tr>
						<th>Adresse:</th>
						<th>
							<input type="text" name="plz" value="" placeholder="Postleizahl" />
							<input type="text" name="Ort" value="" placeholder="Stadt" />
						</th>
					</tr>
					<tr>
						<th></th>
						<th>
							<input type="text" name="street" value="" placeholder="Straße" />
							<input type="text" name="number" value="" placeholder="Hausnummer" />
						</th>
					</tr>
					<tr>
						<th>Umkreis in Metern:</th>
						<th><input type="number" name="radius" value="" placeholder="Umkreis" /></th> 
					</tr>
					<tr>
						<th>Station:</th>
						<th>
							<select>
								<option>wähle eine Station</option>
								<option>Station1</option>
								<option>Station1</option>
								<option>Station1</option>
						     	<option>Station1</option>
							 	<option>Station1</option>
							</select>
						</th> 
					</tr>
					<tr>
						<th>
							Alle Angaben sind freiwillig.
						</th>
						<th>
						    <input type="submit" value="Suche Starten">
						</th>
					</tr>
				</table>
			</form>
		</article>
		
	</section>
			
			
		
		
<?php
include_once('footer.php')
?>
