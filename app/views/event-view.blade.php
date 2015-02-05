@extends('layout')

@section('content')
	
	<h1>{{$event->name}}</h1>

	<div class="ar-row">
		
		<div class="col-sm-4">
			<div class="ar-over-title">Dia de inicio</div>
			<p>{{$event->start_day}}</p>
		</div>

		<div class="col-sm-4">
			<div class="ar-over-title">Termina</div>
			<p>{{$event->end_day}}</p>
		</div>

		<div class="col-sm-4">
			<div class="ar-over-title">Hora</div>
			<p>{{$event->time}}</p>
		</div>


	</div>


	<div class="ar-row">
		<div class="col-xs-12">
			<div class="ar-over-title">Lugar</div>
			<p>{{$event->place}}</p>
		</div>
	</div>


	<div class="ar-row">
		<div class="col-sm-4">
			<div class="ar-over-title">Evento gratuito?</div>
			<p>{{$event->has_cost}}</p>
		</div>

		<div class="col-sm-4">
			<div class="ar-over-title">Dirigido a</div>
			<p>{{$event->directed_to}}</p>
		</div>
	</div>
	

	<div class="col-xs-12">
		

		<div class="ar-over-title">Sitio web</div>
		<p>{{$event->link}}</p>

		<div class="ar-over-title">Descripción</div>
		<p>{{$event->description}}</p>

	</div>



@stop