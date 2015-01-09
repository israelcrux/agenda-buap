<?php 

    use Illuminate\Database\Eloquent\SoftDeletingTrait;

    class UserType extends Eloquent {

        use SoftDeletingTrait;

        /*
         * The database table used by the model.
         */
        protected $table = 'users_types';

        /*
         * Table field to execute a soft deleting action
         */
        public $dates = ['deleted_at'];

        /*
         * User type has many users
         */
        public function users() {
            return $this->hasMany('User');
        }

    }