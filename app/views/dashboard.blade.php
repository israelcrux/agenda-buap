@extends('layout')

@section('content')
    Bienvenido {{ Session::get('name'); }}
@stop
