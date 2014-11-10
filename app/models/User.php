<?php
	
	use Illuminate\Auth\UserInterface;
    use Illuminate\Auth\Reminders\RemindableInterface;

	class User extends Eloquent implements UserInterface, RemindableInterface {

		/**
		 * The database table used by the model.
		 */
		protected $table = 'users';

		/**
		 * The table fields with sensitive information.
		 */
		protected $hidden = array('password', 'remember_token');

        /*
         * Table fields guarded, need admin privileges to modify.
        */
        protected $guarded = array('user_type_id');

        /*
         * Unabled automatic updated_at, created_at
        */
        public $timestamps = false;

		/**
         * Get the unique identifier for the user.
         */
        public function getAuthIdentifier() {
            return $this->getKey();
        }

        /**
         * Get the password for the user.
         */
        public function getAuthPassword() {
            return $this->password;
        }

        /**
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
