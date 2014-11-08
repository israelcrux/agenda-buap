@extends('layout')

@section('content')
	<?php 
		$alert = Session::get('alert');
		if($alert){ 
	?>
   	<div id="ar-alrt" class="ar-alert in"><?php echo $alert ?></div>
   	<script>
   		setTimeout(function(){
   			document.getElementById('ar-alrt').className="ar-alert out";
   		},3000);
   	</script>
	<?php 
		} 
	?>
    <div class="ar-alert">Testing</div>

	<div class="ar-form-wrapper ar-login-form">
		<div class="ar-form-container">
			<h1>Entrar</h1>
		    {{ Form::open(array('url' => '/login', 'method' => 'post', 'role'=>'form', 'class' =>'form-horizontal' )); }}
				<input class="form-control" name="email" type="text" id="username" placeholder="E-mail" autocomplete="off" required="true" value="{{ Input::old('email'); }}">
				<input class="form-control" name="password" type="password" value="" id="password" placeholder="Contraseña" required="true">
				<input class="form-control" type="submit" value="Entrar">
		    {{ Form::close(); }}		    
		</div>
	</div>
	<section class="ar-reg-msg">
		<h3>Para agendar eventos y solicitar difusión</h3>
		<p>
			La Dirección de Comunicación Institucional de la BUAP ofrece diversos servicios destinados
			a la difusión de eventos y noticias relacionadas con la vida universitaria.
			Si usted organiza o participa en la organización de algún evento, puede solicitar la difusión del
			mismo a través de éste portal; Para ello es necesario contar con un correo institucional 
			(con dominio terminado en .buap.mx) y crear una cuenta
		</p>
		<p>
			<button class="btn btn-primary" onclick="document.location='{{ URL::to('/signup') }}'">Registrarse</button>
		</p>
	</section>
@stop