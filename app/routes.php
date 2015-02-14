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
Route::pattern('id', '[0-9]+'); /* Pattern for an unique identificator */
Route::pattern('task_type', '(completed|pending|all|[0-9]+)'); /* Pattern for a type of task */

/* Route to home */
Route::get('/', function(){
    return View::make('home');
});

/* JSON for calendar */
Route::get('/calendar/{year_month?}', 'EventController@calendar');

/* Route to show the login form */
Route::get('/login', function(){
    if(Auth::check()) {
        switch (Auth::user()->user_type_id) {
            case 1:
                return Redirect::to('dashboard');
                break;
            case 2:
                return Redirect::to('dashboard-employee');
                break;
            case 3:
                return Redirect::to('dashboard-boss');
                break;
            case 4:
                return Redirect::to('dashboard-admin');
                break;
            default:
                return Redirect::to('/');
                break;
        }
    }
    return View::make('login');
});

/* Route to do login */
Route::post('/login', 'UserController@login');

/* Show reminder form */
Route::get('/password', function(){
    if(Auth::check()){
        switch (Auth::user()->user_type_id) {
            case 1:
                return Redirect::to('dashboard');
                break;
            case 2:
                return Redirect::to('dashboard-employee');
                break;
            case 3:
                return Redirect::to('dashboard-boss');
                break;
            case 4:
                return Redirect::to('dashboard-admin');
                break;
            default:
                return Redirect::to('/');
                break;
        }
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
Route::get('/signup', function(){
    return View::make('signup', array('aaunits' => AcademicAdministrativeUnit::all()));
});

/* Route to show the register form to employees */
Route::get('/signup-pro', function(){
    return View::make('signup-pro', 
        array(
            'aaunits' => AcademicAdministrativeUnit::all(),
            'dunits'  => Department::all(),
            'utunits' => UserType::all(),
        )
    );
});

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

    /* Route that have the prefix user */
    Route::group(array('prefix' => 'user'), function(){

        /* Route to show the form to edit the user information */
        Route::get('/edit', function(){
            return View::make('edituser', 
                array(
                    'aaunits' => AcademicAdministrativeUnit::all(),
                    'aautype' => is_null(Auth::user()->academic_administrative_unit()->first()) ? 'otro' : Auth::user()->academic_administrative_unit()->first()->type,
                )
            );
        });

        /* Route to update the user information */
        Route::post('/edit', 'UserController@editUser');

    });

    /* Route that have the prefix event/ */
    Route::group(array('prefix' => 'event'), function(){

        /* Route to store a new event */
        Route::post('/add', 'EventController@addEvent');

        /* Route to edit an existing event */
        Route::post('/edit', 'EventController@editEvent');

        /* Route to delete (inactivate) an event */
        Route::post('/delete', 'EventController@deleteEvent');
        
        /* Route to get a single event, response in html doc */
        Route::get('/{id}', 'EventController@view');
    });

    /* Route to get events of certain user */
    Route::get('/events/user/{id}', 'EventController@eventsByUser');

    /* Routes that need a minimum employee role authentication to access */
    Route::group(array('before' => 'employee'), function(){

        /* Route to view the dashboard to the boss */
        Route::get('/dashboard-employee/', function(){
            return View::make('dashboard-employee'); 
        });


        Route::group(array('prefix' => 'tasks'), function(){
            /* Route to check a task like Completed */
            Route::post('/completed/{id}', 'TaskController@taskCompleted');

            /* Route to view all tasks (pending and completed tasks) by user */
            Route::get('/view/{task_type?}', 'TaskController@tasksByUserLogged');
        });

    });

    /* Routes that need a minimum boss role authentication to access */
    Route::group(array('before' => 'boss'), function(){

        /* Route to view the dashboard to the boss */
        Route::get('/dashboard-boss/', function(){
            return View::make('dashboard-boss', array('area' => Auth::user()->department_id)); 
        });
        
        Route::get('/dashboard-admin/', function(){
            return View::make('dashboard-admin', array('user' => Auth::user())); 
        });

        /* Route to get events to panel of heads */
        Route::get('/service-requirements/{id}', 'EventController@serviceRequirementsByArea');

        /* Route to mark an event service as completed */
        Route::post('/eventservice/completed', 'EventServiceController@eventServiceCompleted');

        /* Route that have the prefix tasks/ */
        Route::group(array('prefix' => 'tasks'), function(){
            
            /* Route to view elements required to build form to assign a task to an event */
            Route::get('/assign/', 'TaskController@toAssignTask');

            /* Route to assign a task to an user */
            Route::post('/assign/', 'TaskController@assignTask');

            /* Route to edit a task assigned to an user */
            Route::post('/edit/', 'TaskController@editTask');

            /* Route to delete a task */
            Route::post('/delete/', 'TaskController@deleteTask');
            
        });

        /* Route that have the prefix user */
        Route::group(array('prefix' => 'user'), function(){

            /* Route to get the employees of the boss department logged */
            Route::get('authorize', 'UserController@getEmployees');

            /* Route that authorize an user to be an employee on the system */
            Route::post('authorize', 'UserController@authorize');

        });
        
    });

    /* Routes that need a minimum admin role authentication to access */
    Route::group(array('before' => 'admin'), function(){

        /* Route that have the prefix user */
        Route::group(array('prefix' => 'user'), function(){

        });

    });
    
});
