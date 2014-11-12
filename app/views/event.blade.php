@extends('layout')

@section('content')
    @include('alert')

    <div class="ar-form-wrapper">
        <div class="ar-form-container">
            <h1>Agregar un evento</h1>
            {{ Form::open(array('url' => 'event/add', 'method' => 'post', 'role' => 'form', 'class' => 'form-horizontal')); }}
                <input type="text" class="form-horizontal" name="name" id="name" placeholder="Nombre del evento" autocomplete="off" required>
                <input type="date" name="start_day" id="start_day" placeholder="Seleccione la fecha de inicio" autocomplete="off" required>
                <input type="date" name="end_day" id="end_day" placeholder="Seleccione la fecha de termino" autocomplete="off" required>
                <input type="text" class="form-horizontal" name="place" id="place" placeholder="Nombre del responsable" autocomplete="off" required>
                <input type="time" name="time" id="time" placeholder="Hora" autocomplete="off" required>
                <input type="text" class="form-horizontal" name="head_name" id="head_name" placeholder="Nombre del responsable" autocomplete="off" required>
                <input type="text" class="form-horizontal" name="head_email" id="head_email" placeholder="Email del responsable" autocomplete="off" required>
                <input type="text" class="form-horizontal" name="head_phone" id="head_phone" placeholder="Teléfono del responsable" autocomplete="off" required>
            {{ Form::close(); }}
        </div>
    </div>

@stop