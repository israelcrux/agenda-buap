@extends('layout')

@section('banner')
<div class="ar-slider-banner">
	
</div>
@stop

@section('content')
	<h1 class="ar-hidden">Dirección de Comunicación Institucional</h1>
	<h3 class="ar-hidden">Calendario de Eventos</h3>
	@include('calendar')
@stop