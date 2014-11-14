<?php 

    class EventDCI extends Eloquent {

        /**
         * The database table used by the model.
         */
        protected $table = 'events';

        /*
         * Table fields guarded, need admin privileges to modify.
        */
        protected $guarded = array('status');

         /*
         * Unabled automatic updated_at, created_at
        */
        public $timestamps = false;

    }