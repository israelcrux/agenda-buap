<?php

    use Illuminate\Database\Eloquent\SoftDeletingTrait;

    class EventDCI extends Eloquent {

        use SoftDeletingTrait;

        /**
         * The database table used by the model.
         */
        protected $table = 'events';

        /*
         * Table fields guarded, need admin privileges to modify.
        */
        protected $guarded = array('status');

        /*
         * Table field to execute a soft deleting action
        */
        protected $dates = ['deleted_at'];

        /*
         * One event belongs to one request
         */
        public function request(){
            return $this->belongsTo('Request');
        }

        /*
         * Many events belongs to an user
        */
        public function user() {
            return $this->belongsTo('User');
        }

        /*
         * Many events have many PDI Programs
         */
        public function pdi_programs() {
            return $this->belongsToMany('PDIProgram', 'event_pdi_program', 'event_id', 'pdi_program_id')
                        ->withPivot('deleted_at')
                        ->withTimestamps();
        }

        /*
         * Many events have many services
        */
        public function services() {
            return $this->belongsToMany('Service', 'event_service', 'event_id', 'service_id')
                        ->withPivot('id', 'start_service', 'end_service', 'dci_status', 'in_process_at', 'attended_at', 'deleted_at')
                        ->withTimestamps();
        }

        /*
         * Many event have many witnesses
        */
        public function witnesses() {
            return $this->belongsToMany('Witness', 'event_witness', 'event_id', 'witness_id')
                        ->withPivot('file', 'dci_status', 'deleted_at')
                        ->withTimestamps();
        }

        /*
         * Many event have many resources source
        */
        public function resources_sources() {
            return $this->belongsToMany('ResourceSource', 'event_resource_source', 'event_id', 'resource_source_id')
                        ->withPivot('deleted_at')
                        ->withTimestamps();
        }

        /*
         * Events has many support materials
        */
        public function support_materials() {
            return $this->hasMany('SupportMaterial', 'event_id', 'id');
        }

        /*
         * Defining a custom pivot model for relationship many to many between EventDCI and Service
         */
        public function newPivot(Eloquent $parent, array $attributes, $table, $exists) {
            if($parent instanceof Service) {
                return new EventDCIService($parent, $attributes, $table, $exists);
            }
            return parent::newPivot($parent, $attributes, $table, $exists);
        }

    }