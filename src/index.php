<h1>Willkommen bei Fahrrad-Fritz</h1>

<p>Bei uns können Sie Fahrräder online mieten und offline fahren.</p>

<form action="searchresults.php" method="post">
	<p>Search: <input type="text" name="searchquery" />
	<input type="submit" value="OK"/></p>
</form>

<?php
echo "Heute ist der " . date("d.m.Y") . "</br>";
#$bike_id_input = "<input type='text' id='bike_id_input' name='bike_id' value='2'></input>";
#$show_bikes_button = "<input type='submit' id='show_bikes' value='show bikes'></input>";
#echo $bike_id_input;
#echo $show_bikes_button;
?>
