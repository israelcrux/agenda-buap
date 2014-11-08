@extends('layout')

@section('content')
	{{ Session::get('alert'); }}
    <div class="ar-form-wrapper">
		<div class="ar-form-container">
			<h1>Registro</h1>
		    {{ Form::open(array('url' => '/register', 'method' => 'post', 'role'=>'form', 'class' =>'form-horizontal' )); }}
				<input class="form-control" name="first_name" type="text" id="first_name" placeholder="Nombre(s)" autocomplete="off" value="{{ Input::old('first_name'); }}" required>
				<input class="form-control" name="last_name" type="text" id="last_name" placeholder="Apellidos" autocomplete="off" value="{{ Input::old('last_name'); }}" required>
				<input class="form-control" name="phone" type="text" id="phone" placeholder="Teléfono" autocomplete="off" value="{{ Input::old('phone'); }}">
				<input class="form-control" name="extension_phone" type="text" id="extension_phone" placeholder="Extensión" autocomplete="off" value="{{ Input::old('extension_phone'); }}">
				<select name="academic_administrative_unit" id="" value="" required>
					<option value="">Unidad Acádemica/Administrativa</option>
					@foreach($aaunits as $aaunit)
						<option value="{{ $aaunit['id'] }}" {{ Input::old('academic_administrative_unit') == $aaunit['id'] ? 'selected' : '' }}>{{ $aaunit['name'] }}</option>
					@endforeach
				</select>
				<input class="form-control" name="email" type="text" id="username" placeholder="E-mail" autocomplete="off" value="{{ Input::old('email'); }}" required>
				<input class="form-control" name="password" type="password" value="" id="password" placeholder="Contraseña" required>
				<input class="form-control" type="submit" value="Registrarse">
		    {{ Form::close(); }}
		</div>
	</div>
@stop