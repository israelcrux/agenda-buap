<?php 

    class Witness extends Eloquent {

        /**
         * The database table used by the model.
         */
        protected $table = 'witnesses';

        /*
         * Unabled automatic updated_at, created_at
        */
        public $timestamps = false;

        /*
         * Many witness belongs to many events
        */
        public function events() {
            return $this->belongsToMany('EventDCI');
        }

    }