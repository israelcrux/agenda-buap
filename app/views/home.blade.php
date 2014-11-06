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
	<section>
		<h3>Para agendar eventos y solicitar difusión</h3>
		<p>
			La Dirección de Comunicación Institucional de la BUAP ofrece diversos servicios destinados
			a la difusión de eventos y noticias relacionadas con la vida universitaria.
			Si usted organiza o participa en la organización de algún evento, puede solicitar la difusión del
			mismo a través de éste portal; Para ello es necesario contar con un correo institucional 
			(con dominio terminado en .buap.mx) y crear una cuenta
		</p>
		<p>
			<button class="btn btn-primary">Solicitar Difusión</button>			
		</p>
	</section>
@stop