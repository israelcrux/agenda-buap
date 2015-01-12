@extends('flat-layout')

@section('content')
	@include('alert')

	<div class="ar-form-wrapper ar-login-form">
		<div class="ar-form-container">
			<h1>Reestablecer contraseña</h1>
			<p>
				Escriba la nueva contraseña
			</p>
		    {{ Form::open(array('url' => '/password_reset', 'method' => 'post', 'role'=>'form', 'class' =>'form-horizontal' )); }}
		    	{{ Form::hidden('token', $token) }}
				<input class="form-control" name="password" type="text" id="password" placeholder="Nueva contraseña" required="true">
				<input class="form-control" type="submit" value="Restablecer contraseña">
		    {{ Form::close(); }}
		</div>
	</div>
@stop