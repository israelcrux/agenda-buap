@extends('layout')

@section('content')
    {{ Session::get('alert'); }}
	<div class="ar-form-wrapper">
		<div class="ar-form-container">
			<h1>Registro</h1>
		    {{ Form::open(array('url' => '/signup', 'method' => 'post', 'role'=>'form', 'class' =>'form-horizontal' )); }}

				<input class="form-control" name="name" type="text" id="name" placeholder="Nombre" autocomplete="off">
				<input class="form-control" name="puesto" type="text" id="puesto" placeholder="Área" autocomplete="off">
				<input class="form-control" name="area" type="text" id="area" placeholder="Puesto" autocomplete="off">
				<input class="form-control" name="area" type="text" id="phone" placeholder="Teléfono" autocomplete="off">

				<select name="unidad_academica" id="">
					<option value="">Seleccione</option>
					@foreach($aaunits as $aaunit)
						<option value="">{{ $aaunit['name'] }}</option>
					@endforeach
				</select>
				<input class="form-control" name="username" type="text" id="username" placeholder="E-mail" autocomplete="off">
				<input class="form-control" name="password" type="password" value="" id="password" placeholder="password">
				<input class="form-control" type="submit" value="Registrarse">
		    {{ Form::close(); }}		    
		</div>
	</div>
@stop