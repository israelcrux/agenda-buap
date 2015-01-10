<?php 
    
    use Illuminate\Database\Eloquent\SoftDeletingTrait;

    class Witness extends Eloquent {

        use SoftDeletingTrait;

        /**
         * The database table used by the model.
         */
        protected $table = 'witnesses';

        /*
         * Table field to execute a soft deleting action
        */
        protected $dates = ['deleted_at'];

        /*
         * Many witness belongs to many events
        */
        public function events() {
            return $this->belongsToMany('EventDCI', 'event_witness', 'event_id', 'witness_id')
                        ->withPivot('file', 'dci_status', 'deleted_at')
                        ->withTimestamps();
        }

    }