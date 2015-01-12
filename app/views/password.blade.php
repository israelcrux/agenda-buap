@extends('flat-layout')

@section('content')
	@include('alert')

	<div class="ar-form-wrapper ar-login-form">
		<div class="ar-form-container">
			<h1>Reestablecer contraseña</h1>
			<p>
				Escriba el correo electrónico con el que se registró para poder reestablecer su contraseña
			</p>
		    {{ Form::open(array('url' => '/password', 'method' => 'post', 'role'=>'form', 'class' =>'form-horizontal' )); }}
				<input class="form-control" name="email" type="text" id="username" placeholder="E-mail" required="true" value="{{ Input::old('email'); }}">
				<input class="form-control" type="submit" value="Enviar">
		    {{ Form::close(); }}
		</div>
	</div>
@stop