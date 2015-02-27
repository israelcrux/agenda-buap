<?php

    use Illuminate\Database\Eloquent\SoftDeletingTrait;

    class Service extends Eloquent {

        use SoftDeletingTrait;

        /*
         * The database table used by the model.
         */
        protected $table = 'services';

        /*
         * Table field to execute a soft deleting action
         */
        public $dates = ['deleted_at'];

        /*
         * Many services belongs to a department
         */
        public function department() {
            return $this->belongsTo('Department');
        }

        /*
         * Many services have many events
         */
        public function events() {
            return $this->belongsToMany('EventDCI', 'event_service', 'service_id', 'event_id')
                        ->withPivot('id', 'start_service', 'end_service', 'dci_status', 'in_process_at', 'attended_at', 'deleted_at')
                        ->withTimestamps();
        }

        /*
         * Defining a custom pivot model for relationship many to many between EventDCI and Service
         */
        public function newPivot(Eloquent $parent, array $attributes, $table, $exists) {
            if($parent instanceof EventDCI) {
                return new EventDCIService($parent, $attributes, $table, $exists);
            }
            return parent::newPivot($parent, $attributes, $table, $exists);
        }

    }