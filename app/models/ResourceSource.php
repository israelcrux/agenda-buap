<?php 
    
    class ResourceSource extends Eloquent {

        /**
         * The database table used by the model.
         */
        protected $table = 'resources_sources';

        /*
         * Unabled automatic updated_at, created_at
        */
        public $timestamps = false;

        /*
         * Many resources source belongs to many events
        */
        public function events() {
            return $this->belongsToMany('EventDCI', 'event_resource_source', 'event_id', 'resource_source_id')
                        ->withPivot('created_at', 'updated_at', 'deleted_at');
        }

    }