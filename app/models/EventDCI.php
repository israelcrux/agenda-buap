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
            return $this->belongsToMany('Service', 'event_service', 'event_id', 'service_id')->withPivot('start_service', 'end_service', 'status');
        }

        /*
         * Many event have many witnesses
        */
        public function witnesses() {
            return $this->belongsToMany('Witness', 'event_witness', 'event_id', 'witness_id');
        }

        /*
         * Many event have many resources source
        */
        public function resources_sources() {
            return $this->belongsToMany('ResourceSource', 'event_resource_source', 'event_id', 'resource_source_id');
        }

        /*
         * Events has many support materials
        */
        public function support_materials() {
            return $this->hasMany('SupportMaterial', 'event_id', 'id');
        }

    }