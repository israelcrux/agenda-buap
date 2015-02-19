@extends('layout')

@section('content')
	
<div class="ar-vwrap well ar-maxcent ar-list">
	
	<?php foreach ($event->support_materials as $file): ?>
		<div class="ar-row ar-element">
			<div class="col-xs-12 col-sm-8"><a href="{{$file->file}}">{{$file->original_name}}</a></div>
			<div class="col-xs-12 col-sm-4">{{$file->created_at}}</div>
		</div>
	<?php endforeach; ?>
	
	<?php 
				/*
                $event['services']          = $event->services()->wherePivot('deleted_at', '=', NULL)->get();
                $event['resources_sources'] = $event->resources_sources()->wherePivot('deleted_at', '=', NULL)->get();
                $event['witnesses']         = $event->witnesses()->wherePivot('deleted_at', '=', NULL)->get();
                */
	 ?>
 </div>

 <div class="ar-vwrap well ar-maxcent">
		
	
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

 </div>


@stop