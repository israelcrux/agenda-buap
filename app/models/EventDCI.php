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

        /*
         * Many events belongs to an user
        */
        public function user() {
            return $this->belongsTo('User');
        }

        /*
         * Many events have many services
        */
        public function services() {
            return $this->belongsToMany('Service');
        }

    }