@extends('flat-layout')

@section('content')
	@include('alert')
    <div class="ar-alert">Testing</div>

	<div class="ar-form-wrapper ar-login-form">
		<div class="ar-form-container">
			<h1>Entrar</h1>
		    {{ Form::open(array('url' => '/login', 'method' => 'post', 'role'=>'form', 'class' =>'form-horizontal' )); }}
				<input class="form-control" name="email" type="text" id="username" placeholder="E-mail" required="true" value="{{ Input::old('email'); }}">
				<input class="form-control" name="password" type="password" value="" id="password" placeholder="Contraseña" required="true">
				<input class="form-control" type="submit" value="Entrar">
		    {{ Form::close(); }}
		</div>
		<div class="ar-padder">
			<div class="col-xs-6">{{ HTML::link('/password','Olvidé mi contraseña') }}</div>
			<div class="col-xs-6 ar-right">{{ HTML::link('/signup','Registro') }}</div>
		</div>
	</div>
@stop