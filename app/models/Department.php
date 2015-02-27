<?php

    use Illuminate\Database\Eloquent\SoftDeletingTrait;

    class Department extends Eloquent {

        use SoftDeletingTrait;

        /**
         * The database table used by the model.
         */
        protected $table = 'departments';

        /*
         * Table fields guarded, attributes do not mass-assignable
         */
        protected $guarded = array('id');

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

        /*
         * Department has many services
         */
        public function services() {
            return $this->hasMany('ServiceDCI');
        }

    }