@extends('admin_layout')

@section('content')

    <div class="ar-vwrap">
    	<div class="col-xs-12 col-sm-10">
    		<h3>Hola {{ Auth::user()->first_name }}</h3>
    		<p>Estas son la stareas que tienes pendientes</p>
    	</div>
    </div>

	<!-- tareas	 -->
	@include('dashboard-employee-angular')

	
    @include('alert')

@stop