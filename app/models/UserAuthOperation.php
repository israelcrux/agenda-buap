<?php

    class UserAuthOperation extends Eloquent {

        /**
         * The database table used by the model.
         */
        protected $table = 'users_auth_operations';

        /*
         * Unabled automatic timestamps generation from Eloquent
        */
        public $timestamps = false;

    }