@extends('layout')

@section('content')
	
 <div class="ar-vwrap well ar-maxcent">
		
	

	<div class="ar-row">
		<div class="col-xs-12">
			<h1>{{$event->name}}</h1>
		</div>
		
		
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
			<p>{{$event->time}} hrs.</p>
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
			<?php if($event->has_cost): ?>
				<b>Sí, Evento gratuito</b>
			<?php else: ?>
				<b>No, El evento tiene costo</b>
			<?php endif; ?>
		</div>

		<div class="col-sm-4">
			<div class="ar-over-title">Dirigido a</div>
			<p>{{$event->directed_to}}</p>
		</div>
	

		<div class="col-xs-12">
			
			<?php if($event->link): ?>
				<div class="ar-over-title">Sitio web</div>
				<p>{{$event->link}}</p>
			<?php endif; ?>

			<div class="ar-over-title">Descripción</div>
			<p>{{$event->description}}</p>

		</div>
	</div>

	
	<?php if(isset($event->support_materials)): ?>
	<div>
		<p>Archivos aduntos: {{count($event->support_materials)}}</p>
			<?php foreach ($event->support_materials as $file): ?>
				<div class="ar-row ar-boldrow">
					<div class="col-xs-2 col-sm-2">
						<div class="ar-format-bullet">
							<?php
								if( preg_match('/\..{2,5}$/', $file->file, $ext) ){
									echo substr($ext[0], 1, strlen($ext[0]) -1 );
								}
							?>
						</div>
					</div>
					<div class="col-xs-10 col-sm-6"><a target="_blank" href="{{URL::to('/')}}/{{$file->file}}">{{$file->original_name}}</a></div>
					<div class="col-xs-10 col-sm-4">{{$file->created_at}}</div>
				</div>
			<?php endforeach; ?>
	</div>
	<?php endif; ?>


 </div>


@stop