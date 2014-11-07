@extends('layout')

@section('banner')
<div class="ar-slider-banner">
	
</div>
@stop

@section('content')
	<h1>Comunicación Institucional, Eventos y Actividades</h1>
	<p>
		Portal de gestión de difusión de la DCI
	</p>

	<p>Calendario de Eventos:</p>
	@include('calendar')
@stop