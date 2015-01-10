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
         * Many tasks belongs to an user
         */
        public function users() {
            return $this->belongsTo('User');
        }

    }