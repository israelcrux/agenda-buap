<?php
	
	use Illuminate\Auth\UserInterface;
    use Illuminate\Auth\Reminders\RemindableInterface;
    use Illuminate\Database\Eloquent\SoftDeletingTrait;

	class User extends Eloquent implements UserInterface, RemindableInterface {

        use SoftDeletingTrait;

		/*
		 * The database table used by the model.
		 */
		protected $table = 'users';

		/*
		 * The table fields with sensitive information.
		 */
		protected $hidden = array('password', 'remember_token');

        /*
         * Table fields guarded, attributes do not mass-assignable
         */
        protected $guarded = array('user_type_id');

        /*
         * Table field to execute a soft deleting action
         */
        protected $dates = ['deleted_at'];

        /*
         * User has many events
         */
        public function events() {
            return $this->hasMany('EventDCI');
        }

        /*
         * User has many user authentication operations
         */
        public function user_auth_operations() {
            return $this->hasMany('UserAuthOperation');
        }

        /*
         * User has many tasks
         */
        public function tasks() {
            return $this->hasMany('Task');
        }

        /*
         * Many users belongs to an user type
         */
        public function user_type() {
            return $this->belongsTo('UserType');
        }

        /*
         * Many users belongs to a department
         */
        public function department() {
            return $this->belongsTo('Department');
        }

        /*
         * Many users belongs to an academic or administrative unit
         */
        public function academic_administrative_unit() {
            return $this->belongsTo('AcademicAdministrativeUnit');
        }

		/*
         * Get the unique identifier for the user.
         */
        public function getAuthIdentifier() {
            return $this->getKey();
        }

        /*
         * Get the password for the user.
         */
        public function getAuthPassword() {
            return $this->password;
        }

        /*
         * Get the e-mail address where password reminders are sent.
         */
        public function getReminderEmail() {
            return $this->email;
        }

        public function getRememberToken() {

        }

        public function setRememberToken($value) {

        }
        
        public function getRememberTokenName() {

        }

	}