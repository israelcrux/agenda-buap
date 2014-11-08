@extends('admin_layout')

@section('content')
    Bienvenido {{ Auth::user()->first_name }}

@stop

@section('solicitud')

@stop