@extends('admin_layout')

@section('content')

    <div class="ar-vwrap">
    	<div class="col-xs-12 col-sm-10">
    		<h3>Hola {{ Auth::user()->first_name }}</h3>
    		<p>Panel de administración global - Dirección de Comunicación Institucional</p>
    	</div>
    </div>

    @include('dashboard-admin-angular')
	
    @include('alert')

@stop