<?php
include_once('head.php')
?>
<body>
<?php
include_once('header.php')
?>
	<section>
		<article id='login'>
			<h2>Login</h2>
			<form class='container' id='loginform' action=''>
				<table>
					<tr>
						<th>Login:</th>
						<th>
							<input type='text' name='loginname' value='' placeholder='Loginname' />
						</th>
					</tr>
					<tr>
						<th>Passwort:</th>
						<th>
							<input type='password' name='passwd' value='' placeholder='Passwort' />
						</th>
					</tr>
					<tr>
						<th>
							<input type='submit' value='Login' />
						</th>
					</tr>
				</table>
			</form>
		</article>
	</section>
<?php
include_once('footer.php')
?>
