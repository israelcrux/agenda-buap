<?php    

    class UserController extends BaseController {

        /**
         * Verify and make or deny the login for the given credentials.
         */
        public function login() {
            /* Verifying that username and password was sended */
            if(Input::has('username') && Input::has('password')) {
                $username = Input::get('username');
                $password = Input::get('password');
            }
            else {
                return Redirect::to('login')->with('alert', 'Escriba su usuario y contraseña');
            }

            /* Verifying that username is an e-mail */
            if(!preg_match('/^[^0-9][a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[@][a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{2,4}$/', $username)){
                return Redirect::to('login')->with('alert', 'Proporcione un e-mail');
            }

            /* Verifying that e-mail is institutional */
            if(preg_match('/buap.mx/', $username)) {
                $crypt_password = sha1($password);
            }
            else {
                return Redirect::to('login')->with('alert', 'El e-mail debe ser institucional');
            }

            /* Verifying that the user exists */
            if($crypt_password){
                $user = User::whereRaw('email = ? AND password = ?', array($username, $crypt_password))->first();
            }

            /* Login the user and show dashboard */
            if($user) {
                Auth::login($user);
                return View::make('dashboard', array('name' => Auth::user()->name));
            }
            else {
                return Redirect::to('login')->with('alert', 'Usuario y/o contraseña incorrectos');
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
            $units = AcademicAdministrativeUnit::all(array('name'))->toArray();
            return View::make('signup', array('aaunits' => $units));
        }
        
    }