<?php 

    use Illuminate\Database\Eloquent\SoftDeletingTrait;

    class Department extends Eloquent {

        use SoftDeletingTrait;

        /**
         * The database table used by the model.
         */
        protected $table = 'departments';

        /*
         * Table field to execute a soft deleting action
         */
        protected $dates = ['deleted_at'];

        /*
         * Department has many users
         */
        public function users() {
            return $this->hasMany('User');
        }

    }