<?php 

    use Illuminate\Database\Eloquent\SoftDeletingTrait;

    class SupportMaterial extends Eloquent {

        use SoftDeletingTrait;

        /**
         * The database table used by the model.
         */
        protected $table = 'support_materials';

        /*
         * Table field to execute a soft deleting action
        */
        protected $dates = ['deleted_at'];

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