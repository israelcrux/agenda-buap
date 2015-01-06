<?php

return array(

	/*
	|--------------------------------------------------------------------------
	| Database Connections
	|--------------------------------------------------------------------------
	|
	| Here are each of the database connections setup for your application.
	| Of course, examples of configuring each database platform that is
	| supported by Laravel is shown below to make development simple.
	|
	|
	| All database work in Laravel is done through the PHP PDO facilities
	| so make sure you have the driver for your particular database of
	| choice installed on your machine before you begin development.
	|

	mysql --host=148.228.24.80 --user=buapcomunication --password="buapcomunication" buap-comunication

	*/

	'connections' => array(

		'mysql' => array(
			'driver'    => 'mysql',
			// 'host'      => '148.228.24.75', Se madreó el server n_n
			'host'      => 'localhost',
			'database'  => 'buap-comunication',
			'username'  => 'buapcomunication',
			'password'  => 'buapcomunication',
			'charset'   => 'utf8',
			'collation' => 'utf8_unicode_ci',
			'prefix'    => '',
		),

	),

);
