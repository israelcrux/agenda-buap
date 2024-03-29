@extends('layout')

@section('content')
    @include('alert')

    <div class="ar-form-wrapper">
        <div class="ar-form-container">
            <h1>Agregar un evento</h1>
            {{ Form::open(array('url' => 'event/add', 'method' => 'post', 'role' => 'form', 'class' => 'form-horizontal')); }}
                <input type="text" class="form-horizontal" name="name" id="name" placeholder="Nombre del evento" autocomplete="off" value="{{ Input::old('name'); }}" required>
                <input type="date" name="start_day" id="start_day" placeholder="Seleccione la fecha de inicio" autocomplete="off" value="{{ Input::old('start_day'); }}" required>
                <input type="date" name="end_day" id="end_day" placeholder="Seleccione la fecha de termino" autocomplete="off" value="{{ Input::old('end_day'); }}" required>
                <input type="text" class="form-horizontal" name="place" id="place" placeholder="Lugar del evento" autocomplete="off" value="{{ Input::old('place'); }}" required>
                <input type="time" name="time" id="time" placeholder="Hora" autocomplete="off" value="{{ Input::old('time'); }}" required>
                <textarea name="description" id="description" cols="30" rows="10" value="{{ Input::old('description'); }}"></textarea>
                <input class="form-control" type="submit" value="Agregar evento">
            {{ Form::close(); }}
        </div>
    </div>

@stop