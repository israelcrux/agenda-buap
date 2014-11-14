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

/* Route to home */
Route::get('/', function()
{
	return View::make('home');
});

/* Route experimental to home */
//calendar mejor :P
Route::get('/calendar/{year_month}', 'EventController@calendar');

//tal vez necesite autenticación pero que hueva moverlo de línea :P
Route::get('/events/{user_id}', 'EventController@eventsByUser');

/* Route to show the login form */
Route::get('/login', function(){
	return View::make('login');
});

/* Route to make login */
Route::post('/login', 'UserController@login');

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
        return View::make('dashboard');
    });

    Route::get('/event/', function(){
        return View::make('event');
    });

    Route::post('/eventp/', 'EventController@addEventp');

    Route::post('/event/add', 'EventController@addEvent')
;});
