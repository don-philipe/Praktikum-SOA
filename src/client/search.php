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
							<select name="stationId">
								<option value="">wähle eine Station</option>
								<?php
									$url = $GLOBALS["api_url"]."stations";
									$response = file_get_contents($url);
									$stations = json_decode($response);
									for($count = 0; $count < count($stations); $count++){
										$station = $stations[$count];
										?>
										<option value="<?php echo($station->id); ?>"><?php echo($station->name); ?></option>
										<?php
									}
								?>
								
							</select>
						</th> 
					</tr>
					<tr>
						<th>
							Alle Angaben sind optional.
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
