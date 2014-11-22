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
         * Many events belongs to an user
        */
        public function user() {
            return $this->belongsTo('User');
        }

        /*
         * Many events have many services
        */
        public function services() {
            return $this->belongsToMany('Service', 'event_service');
        }

        /*
         * Many event have many witnesses
        */
        public function witnesses() {
            return $this->belongsToMany('Witness', 'event_witness');
        }

        /*
         * Many event have many resources source
        */
        public function resource_source() {
            return $this->belongsToMany('ResourceSource', 'event_resource_source');
        }

    }