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

/* Route to home */
Route::get('/', function()
{
	return View::make('home');
});

/* Route to show the login form */
Route::get('/login', function(){
	return View::make('login');
});

/* Route to make login */
Route::post('/login', 'UserController@login');

/* Route to show the register form */
Route::get('/signup', 'UserController@signup');

/* Group of routes that need authentication */
Route::group(array('before' => 'auth'), function(){

    Route::get('/logout', 'UserController@logout');


    Route::get('/dashboard', function(){
        return View::make('dashboard');
    });

});