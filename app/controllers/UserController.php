<?php

    class UserController extends BaseController {

        /**
         * Verify and make or deny the login for the given credentials.
         */
        public function login() {
            if(Input::has('username') && Input::has('password')) {
                $username = Input::get('username');
                $password = sha1(Input::get('password'));

                // echo $password;

                $user_json = User::whereRaw('username = ? AND password = ?', array($username, $password))->first(array('name'));
                $user = json_decode($user_json);

                if($user) {
                    return Redirect::to('dashboard')->with('name', $user->name);
                }
                else {
                    return Redirect::to('login');
                }
            }
            else {
                return Redirect::to('login');
            }
        }
        
    }