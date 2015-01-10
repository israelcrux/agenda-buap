<!DOCTYPE html>
<html lang="en-US">
	<head>
		<meta charset="utf-8">
	</head>
	<body>
		<h2>Restablecer contraseña</h2>

		<div>
			Para restablecer su cotraseña, debe proporcionar una nueva en: {{ URL::to('password_reset', array($token)) }}.<br/>
			Este enlace va a expirar en un dia.
		</div>
	</body>
</html>
