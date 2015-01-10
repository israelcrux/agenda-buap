<?php 
    
    use Illuminate\Database\Eloquent\SoftDeletingTrait;

    class ResourceSource extends Eloquent {

        use SoftDeletingTrait;

        /**
         * The database table used by the model.
         */
        protected $table = 'resources_sources';

        /*
         * Table field to execute a soft deleting action
        */
        protected $dates = ['deleted_at'];

        /*
         * Many resources source belongs to many events
        */
        public function events() {
            return $this->belongsToMany('EventDCI', 'event_resource_source', 'event_id', 'resource_source_id')
                        ->withPivot('deleted_at')
                        ->withTimestamps();
        }

    }