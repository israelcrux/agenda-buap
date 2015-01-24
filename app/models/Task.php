<?php 

    use Illuminate\Database\Eloquent\SoftDeletingTrait;

    class Task extends Eloquent {

        use SoftDeletingTrait;

        /*
         * The database table used by the model.
         */
        protected $table = 'tasks';

        /*
         * Table field to execute a soft deleting action
         */
        protected $dates = ['deleted_at'];

        /*
         * Table fields guarded, attributes do not mass-assignable
         */
        protected $guarded = array('user_id');

        /*
         * Many tasks belongs to an user
         */
        public function users() {
            return $this->belongsTo('User');
        }

        /*
         * Many tasks belongs to an EventDCIService
         */
        public function eventdciservice() {
            return $this->belongsTo('EventDCIService');
        }

    }