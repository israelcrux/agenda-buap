@extends('layout')

@section('content')
    {{ Session::get('alert'); }}
	<div class="ar-form-wrapper ar-login-form">
		<div class="ar-form-container">
			<h1>Entrar</h1>
		    {{ Form::open(array('url' => '/login', 'method' => 'post', 'role'=>'form', 'class' =>'form-horizontal' )); }}
				<input class="form-control" name="username" type="text" id="username" placeholder="E-mail" autocomplete="off">
				<input class="form-control" name="password" type="password" value="" id="password" placeholder="Contraseña">
				<input class="form-control" type="submit" value="Entrar">
		    {{ Form::close(); }}		    
		</div>
	</div>
@stop