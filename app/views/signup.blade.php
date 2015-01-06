@extends('layout')

@section('content')
	@include('alert')
    <div class="ar-form-wrapper" >
		<div class="ar-form-container">
			<h1>Registro</h1>
		    {{ Form::open(array('url' => '/register', 'method' => 'post', 'role'=>'form', 'class' =>'form-horizontal' )); }}
				<input class="form-control" name="first_name" type="text" id="first_name" placeholder="Nombre(s)" autocomplete="off" value="{{ Input::old('first_name'); }}" required>
				<input class="form-control" name="last_name" type="text" id="last_name" placeholder="Apellidos" autocomplete="off" value="{{ Input::old('last_name'); }}" required>
				<input class="form-control" name="phone" type="text" id="phone" placeholder="Teléfono" autocomplete="off" value="{{ Input::old('phone'); }}" pattern="([0-9]+|-|\s)+" title="Ejemplos: 888888, 8-888-888, 8 888 888">
				<input class="form-control" name="extension_phone" type="text" id="extension_phone" placeholder="Teléfono/Extensión Buap" autocomplete="off" value="{{ Input::old('extension_phone'); }}">
				<select name="academic_administrative_unit_type" id="aaut" value="" required>
					<option value="0">Seleccionar Procedencia</option>
					<option value="1">Unidad Administrativa</option>
					<option value="2">Unidad Académica</option>
					<option value="3">Otro</option>
				</select>

				<select name="academic_administrative_unit" id="acadun" value="">
					<option value="">Ninguna</option>
				</select>


				<input class="form-control" name="email" type="email" id="username" placeholder="E-mail" autocomplete="off" value="{{ Input::old('email'); }}" required>
				<input class="form-control" name="password" type="password" value="" id="password" placeholder="Contraseña" required>
				<input class="form-control" type="submit" value="Registrarse">
		    {{ Form::close(); }}
		</div>
	</div>
	<script>
		$(document).ready(function(){ 
					
			var unidades_administrativas = 
				<?php 
				foreach($aaunits as $aaunit){
					if($aaunit['type'] == 'unidades_administrativas')
					echo '\'<option value="'.$aaunit["id"].'" '.(Input::old("academic_administrative_unit") == $aaunit["id"] ? "selected" : "").' > '.$aaunit["name"].'</option>\'+';
				}
				?> '';
			
			var unidades_academicas =
				<?php 
				foreach($aaunits as $aaunit){
					if($aaunit['type'] == 'unidades_academicas')
					echo '\'<option value="'.$aaunit["id"].'" '.(Input::old("academic_administrative_unit") == $aaunit["id"] ? "selected" : "").' > '.$aaunit["name"].'</option>\'+';
				}
				?> '';
			
				$('#aaut').change(function(e){
					
					switch(e.target.value){
						case '1':
							$('select#acadun').html(unidades_administrativas);
						break;
						case '2':
							$('select#acadun').html(unidades_academicas);
						break;
						case '3':
							$('select#acadun').html('<option value="">Ninguna</option>').val("");
						break;
					}
				});
			});
	</script>
@stop