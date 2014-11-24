<?php 

    class SupportMaterial extends Eloquent {

        /**
         * The database table used by the model.
         */
        protected $table = 'support_materials';

        /*
         * Unabled automatic updated_at, created_at
        */
        public $timestamps = false;

        /*
         * Table fields guarded, need admin privileges to modify.
        */
        protected $guarded = array('event_id');

        /*
         * Many support materials belongs to an event
        */
        public function events() {
            return $this->belongsTo('EventDCI');
        }

    }