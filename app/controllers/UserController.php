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
            if(!$this->validateEmail($email)){
                return Redirect::to('login')->with('alert', 'Proporcione un e-mail');
            }

            /* Verifying that the user exists and correct credentials */
            if(Auth::attempt(array('email' => $email, 'password' => $password))) {
                /* Verifying status user */
                if(Auth::user()->status == '2'){
                    return Redirect::to('login')->with('alert', 'Usuario requiere activación')->withInput(Input::except('password'));
                }
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
            return Redirect::to('/');
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
            $email = Input::get('email');
            if($this->validateEmail($email)) {
                $crypt_password = Hash::make(Input::get('password'));
            }
            else {
                return Redirect::to('signup')->with('alert', 'El e-mail proporcionado no es válido')->withInput(Input::except('password'));
            }

            /* Verifying if the user exists through email */
            $existing_user = User::where('email', '=', $email)->first();
            if($existing_user) {
                return Redirect::to('signup')->with('alert', 'El email que proporcionó ya se encuentra registrado')->withInput(Input::except('password'));
            }

            /* Getting data */
            $user_data = array(
                'last_name'                       => Input::get('last_name'),
                'first_name'                      => Input::get('first_name'),
                'phone'                           => Input::get('phone'),
                'extension_phone'                 => Input::get('extension_phone'),
                'academic_administrative_unit_id' => Input::get('academic_administrative_unit'),
                'email'                           => $email,
                'password'                        => $crypt_password
            );

            /* Storing the new user */
            $user = User::create($user_data);

            /* Verifying if user needs email validation */
            if(preg_match('/buap.mx/', $email)) {
                $user->status = 1;
                $user->save();
                $message = 'Ahora puede hacer uso de su cuenta, inicie sesión';
            }
            else {
                $now = new DateTime();
                $user_auth_activation             = new UserAuthOperation();
                $user_auth_activation->token      = str_random(40);
                $user_auth_activation->expiration = $now->add(new DateInterval('P1D'));
                $user_auth_activation->type       = 1;
                $user_auth_activation->used       = 0;
                $user_auth_activation->user_id    = $user->id;
                $user_auth_activation->save();

                Mail::send('emails.auth.activate', array('token' => $user_auth_activation->token), function($message) use($user){
                    $message->to($user->email)->subject('Bienvenido a la DCI!');
                });

                $message = 'Validación requerida, en breve recibirá un correo de confirmación';
            }

            return Redirect::to('login')->with('alert', $message);

        }


        public function activate($token) {
            $user_auth_activation = UserAuthOperation::whereRaw('token = ? and type = ?', array($token, 1))->first();

            if(!$user_auth_activation) {
                return Redirect::to('login')->with('alert', 'Activación invalida');
            }

            if($user_auth_activation->used == 1) {
                return Redirect::to('login')->with('alert', 'El mécanismo de activación del e-mail ha sido utilizado');
            }

            $expiration_date = new DateTime($user_auth_activation->expiration);
            $now = new DateTime();
            if($now > $expiration_date) {
                return Redirect::to('login')->with('alert', 'El token de validación ha expirado');
            }

            $user_auth_activation->used = 1;
            $user_auth_activation->save();

            $user = User::find($user_auth_activation->user_id);
            $user->status = 1;
            $user->save();

            return Redirect::to('login')->with('alert', 'Su cuenta ha sido activada, ahora puede iniciar sesión');

        }


        private function validateEmail($email) {
            if(preg_match('/^[^0-9][a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[@][a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{2,4}$/', $email)) {
                return true;
            }
            return false;
        }

    }