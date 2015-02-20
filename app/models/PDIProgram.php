<?php

    use Illuminate\Database\Eloquent\SoftDeletingTrait;

    class PDIProgram extends Eloquent {

        use SoftDeletingTrait;

        /**
         * The database table used by the model.
         */
        protected $table = 'pdi_programs';

        /*
         * Table field to execute a soft deleting action
        */
        protected $dates = ['deleted_at'];

        /*
         * Many PDI Programs has many events
         */
        public function events() {
            return $this->belongsToMany('EventDCI', 'event_pdi_program', 'pdi_program_id', 'event_id')
                        ->withPivot('deleted_at')
                        ->withTimestamps();
        }

    }