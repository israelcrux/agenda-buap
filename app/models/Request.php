<?php

    use Illuminate\Database\Eloquent\SoftDeletingTrait;

    class Request extends Eloquent {

         use SoftDeletingTrait;

        /*
         * The database table used by the model.
         */
        protected $table = 'requests';

        /*
         * Table field to execute a soft deleting action
         */
        protected $dates = ['deleted_at'];

        /*
         * Many requests belongs to an academic administrative unit
         */
        public function academic_administrative_units() {
            return $this->belongsTo('AcademicAdministrativeUnit');
        }

        /*
         * One request has one event
         */
        public function event() {
            return $this->hasOne('EventDCI');
        }

    }