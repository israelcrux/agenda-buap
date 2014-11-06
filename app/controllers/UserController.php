<?php

    class UserController extends BaseController {

        /**
         * Verify and make or deny the login for the given credentials.
         */
        public function login() {
            if(Input::has('username') && Input::has('password')) {
                $username = Input::get('username');
                $password = Input::get('password');
                $crypt_password = sha1($password);

                $user = User::whereRaw('username = ? AND password = ?', array($username, $crypt_password))->first(array('name'));

                if($user) {
                    $user->toArray();
                    return View::make('dashboard', array('name' => $user['name']));
                }
                else {
                    return Redirect::to('login')->with('alert', 'Usuario y/o contraseña incorrectos');
                }
            }
            else {
                return Redirect::to('login')->with('alert', 'Escriba su usuario y contraseña');
            }
        }
        
    }