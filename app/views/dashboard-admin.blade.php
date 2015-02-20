@extends('admin_layout')

@section('content')

    <div class="ar-vwrap">
    	<div class="col-xs-10 col-sm-8">
    		<h3>Hola {{ Auth::user()->first_name }}</h3>
    		<p>Panel de administración global - Dirección de Comunicación Institucional</p>
    	</div>
    	<div class="col-xs-2 col-sm-4">
    		<ul>
    			<li>{{ HTML::link('/aau','Unidades administrativas') }}</li>
    			<li>Servicios</li>
    			<li>Áreas DCI</li>
    		</ul>
    	</div>
    </div>

    @include('dashboard-admin-angular')
	
    @include('alert')

@stop