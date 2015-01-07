<?php

    use Illuminate\Database\Eloquent\SoftDeletingTrait;

    class Service extends Eloquent {

        use SoftDeletingTrait;

        /**
         * The database table used by the model.
         */
        protected $table = 'services';

        /*
         * Table field to execute a soft deleting action
        */
        public $dates = ['deleted_at'];

        /*
         * Many services have many events
        */
        public function events() {
            return $this->belongsToMany('EventDCI', 'event_service', 'event_id', 'service_id')
                        ->withPivot('start_service', 'end_service', 'dci_status', 'deleted_at')
                        ->withTimestamps();
        }

    }