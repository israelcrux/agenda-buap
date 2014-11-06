<?php

	class User extends Eloquent {

		/**
		 * The database table used by the model.
		 */
		protected $table = 'users';

		/**
		 * The table fields with sensitive information.
		 */
		protected $hidden = array('password');
	}
