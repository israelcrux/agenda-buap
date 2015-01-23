<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the Closure to execute when that URI is requested.
|
*/

/* Global patterns */
Route::pattern('key', '[a-zA-Z0-9]*'); /* Pattern for a key generated automatically */
Route::pattern('year_month', '[0-9]{4}-[0-9]{2}'); /* Pattern for a year and month */
Route::pattern('id', '[0-9]+');

/* Route to home */
Route::get('/', function(){
    return View::make('home');
});

/* JSON for calendar */
Route::get('/calendar/{year_month?}', 'EventController@calendar');

/* Route to show the login form */
Route::get('/login', function(){
    if(Auth::check()){
        return Redirect::to('dashboard');
    }
    return View::make('login');
});

/* Route to do login */
Route::post('/login', 'UserController@login');

/* Show reminder form */
Route::get('/password', function(){
    if(Auth::check()){
        return Redirect::to('dashboard');
    }
    return View::make('password');
});

/* Send reminder mail */
Route::post('/password', 'UserController@password');

/* Back from reminder mail */
Route::get('/password_reset/{key}', 'UserController@passwordResetForm');

/* Route to back from reminder mail */
Route::post('/password_reset', 'UserController@passwordReset');

/* Route to show the register form */
Route::get('/signup', 'UserController@signup');

/* Route to register an user */
Route::post('/register', 'UserController@register');

/* Route to validate an user with a non institutional email */
Route::get('/activate/{key}', 'UserController@activate');

/* Group of routes that need authentication */
Route::group(array('before' => 'auth'), function(){

    /* Route to close session */
    Route::get('/logout', 'UserController@logout');

    /* Rote to view the dashboard */
    Route::get('/dashboard', function(){
        return View::make('dashboard', 
            array(
                'services' => Service::all(),
                'resources_sources' => ResourceSource::all(),
                'witnesses' => Witness::all(),
            )
        );
    });

    Route::group(array('prefix' => 'event'), function(){

        /* Route to store a new event */
        Route::post('/add', 'EventController@addEvent');

        /* Route to view an existing event */
        Route::get('/view/{id}', 'EventController@viewEvent');

        /* Route to edit an existing event */
        Route::post('/edit', 'EventController@editEvent');

        /* Route to delete (inactivate) an event */
        Route::post('/delete', 'EventController@deleteEvent');
        
    });

    Route::group(array('before' => 'boss'), function(){
        Route::group(array('prefix' => 'tasks'), function(){
            
            /* Route to get events to panel of heads */
            Route::get('/{id}', 'TaskController@tasksByRequest');

            /* Route to view elements required to build form to assign a task to an event */
            Route::get('/assign/', 'TaskController@toAssignTask');

            /* Route to assign a task to an user */
            Route::post('/assign/', 'TaskController@assignTask');

            /* Route to check a task like Completed */
            Route::get('/completed/{id}', 'TaskController@taskCompleted');

            /* Route to view all tasks (pending and completed tasks) by user */
            Route::get('/view/', 'TaskController@tasksByUser');
        });
    });

    /* Route to get events of certain user */
    Route::get('/events/user/{id}', 'EventController@eventsByUser');

    /* Route to get events to panel of heads */
    Route::get('/service-requirements/{id}', 'EventController@serviceRequirementsByArea');

});

/* Probando las vistas */
Route::get('/dashboard-boss/', function(){
    return View::make('dashboard-boss');
});