@extends('admin_layout')

@section('content')
    <h3>Hola {{ Auth::user()->first_name }}</h3>
	
	@include('dashboard-angular')

@stop