<?php 

    use Illuminate\Database\Eloquent\SoftDeletingTrait;

    class AcademicAdministrativeUnit extends Eloquent {

        use SoftDeletingTrait;

        /*
         * The database table used by the model.
         */
        protected $table = 'academic_administrative_units';

        /*
         * Academic or Administrative Unit has many users
         */
        public function users() {
            return $this->hasMany('User');
        }

        /*
         * Academic or Administrative Unit has many requests
         */
        public function requests() {
            return $this->hasMany('Request');
        }

    }