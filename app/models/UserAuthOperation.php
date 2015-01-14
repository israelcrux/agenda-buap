<?php

    use Illuminate\Database\Eloquent\SoftDeletingTrait;

    class UserAuthOperation extends Eloquent {

        use SoftDeletingTrait;

        /*
         * The database table used by the model.
         */
        protected $table = 'users_auth_operations';

        /*
         * Table fields guarded, need admin privileges to modify.
         */
        protected $guarded = array('user_id');

        /*
         * Table field to execute a soft deleting action
         */
        protected $dates = ['deleted_at'];

        /*
         * Many users authentication operations belongs to an user
         */
        public function users() {
            return $this->belongsTo('User');
        }

    }