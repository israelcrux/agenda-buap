@extends('layout');

@section('content')
    {{ Form::open(array('url' => '/login', 'method' => 'post')); }}
        {{ Form::label('username', 'Usuario'); }}
        {{ Form::text('username'); }}

        {{ Form::label('password', 'Contraseña'); }}
        {{ Form::password('password'); }}

        {{ Form::submit('Iniciar sesión'); }}
    {{ Form::close(); }}
@stop