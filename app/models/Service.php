<?php

    class Service extends Eloquent {

        /**
         * The database table used by the model.
         */
        protected $table = 'services';

        /*
         * Unabled automatic updated_at, created_at
        */
        public $timestamps = false;

        /*
         * Many services have many events
        */
        public function events() {
            return $this->belongsToMany('EventDCI', 'event_service', 'event_id', 'service_id')
                        ->withPivot('start_service', 'end_service', 'dci_status', 'user_status');
        }

    }