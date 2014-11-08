<?php    

    class UserController extends BaseController {

        /**
         * Verify and make or deny the login for the given credentials.
         */
        public function login() {
            /* Verifying that username and password was sended */
            if(Input::has('email') && Input::has('password')) {
                $email    = Input::get('email');
                $password = Input::get('password');
            }
            else {
                return Redirect::to('login')->with('alert', 'Escriba su usuario y contraseña')->withInput(Input::except('password'));
            }

            /* Verifying that email is an e-mail */
            if(!preg_match('/^[^0-9][a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[@][a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{2,4}$/', $email)){
                return Redirect::to('login')->with('alert', 'Proporcione un e-mail');
            }

            /* Verifying that the user exists and correct credentials */
            if(Auth::attempt(array('email' => $email, 'password' => $password))) {
                return Redirect::intended('dashboard');
            }
            else {
                return Redirect::to('login')->with('alert', 'Usuario y/o contraseña incorrectos')->withInput(Input::except('password'));
            }
        }

        /*
         * Finish the user login
        */
        public function logout() {
            Auth::logout();
            return View::make('home');
        }

        /*
         * Show the form to register an user
        */
        public function signup() {
            $units = AcademicAdministrativeUnit::all(array('id', 'name'))->toArray();
            return View::make('signup', array('aaunits' => $units));
        }

        /*
         * Verify user and register the user
        */
        public function register() {

            /* Verifying required data */
            if(!Input::has('first_name')) {
                return Redirect::to('signup')->with('alert', 'Escriba su nombre')->withInput(Input::except('password'));
            }
            if(!Input::has('last_name')) {
                return Redirect::to('signup')->with('alert', 'Escriba su apellido')->withInput(Input::except('password'));
            }
            if(!Input::has('academic_administrative_unit')) {
                return Redirect::to('signup')->with('alert', 'Seleccione su unidad acádemica o administrativa')->withInput(Input::except('password'));
            }
            if(!Input::has('email')) {
                return Redirect::to('signup')->with('alert', 'Escriba su email')->withInput(Input::except('password'));
            }
            if(!Input::has('password')) {
                return Redirect::to('signup')->with('alert', 'Escriba su contraseña')->withInput(Input::except('password'));
            }

            /* Verifying the email format and generating encrypted password */
            if(preg_match('/^[^0-9][a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[@][a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{2,4}$/', Input::get('email'))) {
                $crypt_password = Hash::make(Input::get('password'));
            }
            else {
                return Redirect::to('signup')->with('alert', 'El e-mail proporcionado no es válido')->withInput(Input::except('password'));
            }

            /* Getting data */
            $user_data = array(
                'last_name'                       => Input::get('last_name'),
                'first_name'                      => Input::get('first_name'),
                'phone'                           => Input::get('phone'),
                'extension_phone'                 => Input::get('extension_phone'),
                'academic_administrative_unit_id' => Input::get('academic_administrative_unit'),
                'email'                           => Input::get('email'),
                'password'                        => $crypt_password
            );

            /* Storing the new user */
            $user = User::create($user_data);

        }

    }