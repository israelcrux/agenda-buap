<?php    

    class UserController extends BaseController {

        /*
         * Reset password
         */
        public function passwordReset() {
            if(!Input::has('password') || !Input::has('token')) {
                return Redirect::to('signup')->with('alert', 'Escriba su contraseña');
            }
            $token = PasswordRecoveryLink::where('hash', '=', Input::get('token'))->first();
            if( !$token ) {
                return Redirect::to('login')->with('alert', 'Enlace corrupto');
            } 
            if( !$token->valid ) {
                return Redirect::to('login')->with('alert', 'El enlace ha expirado');
            }
            $user = User::find($token->usr);
            if(!$user){
                return Redirect::to('login')->with('alert', 'Error desconocido');
            }
            
            //save user pass
            $user->password = Hash::make(Input::get('password'));
            $user->save();

            //invalidate link
            $token->valid = 0;
            $token->save();

            Auth::login($user);
            return Redirect::intended('dashboard')->with('alert','Su contraseña ha sido restablecida');
        }

        /*
         * Show the form to reset the password
         */
        public function passwordResetForm($hash){
            
            $link = PasswordRecoveryLink::where('hash', '=', $hash)->first();
            if(!$link){
                return Redirect::to('login')->with('alert', 'Acceso no autorizado');
            }

            if($link->valid == 0){
                return Redirect::to('password')->with('alert', 'El enlace de recuperación de contraseña ha sido utilizado.');
            }

            return View::make('new-password', array( 'token' => $link->hash ));
        }

        /*
         * Processing the request to change the forgotten password
         */
        public function password(){
            if(Input::has('email') ) {
                $email    = Input::get('email');
            }
            else {
                return Redirect::to('password')->with('alert', 'Necesitamos su correo electrónico')->withInput(Input::except('email'));
            }
            if(!$this->validateEmail($email)){
                return Redirect::to('password')->with('alert', 'Proporcione un e-mail válido');
            }            

            $existing_user = User::where('email', '=', $email)->first();

            if(!$existing_user) {
                return Redirect::to('password')->with('alert', 'El correo proporcionado no está registrado')->withInput(Input::except('email'));
            }

            //Crear hash para recuperación
            $hash = str_random(20);

            //almacenar hash
            Eloquent::unguard();
            PasswordRecoveryLink::create(
                array(
                    'usr'   => $existing_user->id,
                    'hash'  => $hash,
                    'valid' => '1'
                )
            )->save();

            //Enviar wea de recuperación
            Mail::send('emails.auth.reminder', array('token' => $hash), function($message) use($existing_user) {
                $message->to($existing_user->email)->subject('Recuperación de contraseña Agenda Universitaria');
            });

            //Avisar
            return Redirect::to('login')->with('alert', 'Un mensaje ha sido enviado a su correo electrónico, dentro están las instrucciones para restablecer su contraseña');
        }

        /*
         * Verify and make or deny the login for the given credentials.
         */
        public function login() {

            /* Creating a login validator */
            $validator = Validator::make(
                Input::all(), 
                array(
                    'email' => 'required|email',
                    'password' => 'required'
                )
            );

            if($validator->fails()) {
                return Redirect::to('login')->with('alert', $validator->messages())->withInput(Input::except('password'));
            }

            /* Verifying that the user exists and correct credentials */
            if(Auth::attempt(array('email' => Input::get('email'), 'password' => Input::get('password')))) {
                /* Verifying status user */
                if(Auth::user()->status == '2') {
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
            $units = AcademicAdministrativeUnit::all(array('id', 'name', 'type'))->toArray();
            return View::make('signup', array('aaunits' => $units));
        }

        /*
         * Verify user and register the user
         */
        public function register() {

            /* Creating a register validator */
            $validator = Validator::make(
                Input::all(),
                array(
                    'first_name' => 'required|alpha',
                    'last_name' => 'required|alpha',
                    'phone' => array('regex:/([0-9]+|-|\s)+/'),
                    'extension_phone' => array('regex:/([0-9]+|-|\s)+/'),
                    'email' => 'required|email|unique:users',
                    'password' => 'required',
                    'academic_administrative_unit_type' => 'between:1,3|integer',
                    'academic_administrative_unit' => 
                        'required_if:academic_administrative_unit_type,1,academic_administrative_unit_type,2|integer'
                ),
                array(
                    'academic_administrative_unit_type.between' => 'Seleccione una procedencia de unidad acádemica o administrativa'
                )
            );

            if($validator->fails()) {
                return Redirect::to('signup')->with('alert', $validator->messages())->withInput(Input::except('password'));
            }

            /* Generating encrypted password */
            $crypt_password = Hash::make(Input::get('password'));

            /* Getting data */
            $user_data = array(
                'last_name'                       => Input::get('last_name'),
                'first_name'                      => Input::get('first_name'),
                'phone'                           => Input::get('phone'),
                'extension_phone'                 => Input::get('extension_phone'),
                'email'                           => Input::get('email'),
                'password'                        => $crypt_password
            );
            
            if(Input::get('academic_administrative_unit_type') != '3') {
                $user_data['academic_administrative_unit_id'] = Input::get('academic_administrative_unit');
            }

            /* Storing the new user */
            $user = User::create($user_data);

            /* Verifying if user needs email validation */
            if(preg_match('/buap.mx/', Input::get('email'))) {
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

                Mail::send('emails.auth.activate', array('token' => $user_auth_activation->token), function($message) use($user) {
                    $message->to($user->email)->subject('Bienvenido a la DCI!');
                });

                $message = 'Gracias por registrarse, en breve recibirá un correo de confirmación';
            }

            return Redirect::to('login')->with('alert', $message);

        }

        /*
         * Process that verify an user through e-mail validation
         */
        public function activate($token) {
            // Checking on database if the token exists
            $user_auth_activation = UserAuthOperation::whereRaw('token = ? and type = ?', array($token, 1))->first();

            // Verifying that the token is valid
            if(!$user_auth_activation) {
                return Redirect::to('login')->with('alert', 'Activación invalida');
            }

            // Verifying that the token has not been used
            if($user_auth_activation->used == 1) {
                return Redirect::to('login')->with('alert', 'El mécanismo de activación del e-mail ha sido utilizado');
            }

            // Verifying that the token has not been expired
            $expiration_date = new DateTime($user_auth_activation->expiration);
            $now = new DateTime();
            if($now > $expiration_date) {
                return Redirect::to('login')->with('alert', 'El token de validación ha expirado');
            }

            // Updating the information for the token as used
            $user_auth_activation->used = 1;
            $user_auth_activation->save();

            // Updating the user information with status active
            $user = User::find($user_auth_activation->user_id);
            $user->status = 1;
            $user->save();

            return Redirect::to('login')->with('alert', 'Su cuenta ha sido activada, ahora puede iniciar sesión');

        }

        /*
         * Verifying that an email has the standard construction
         */
        private function validateEmail($email) {
            return preg_match('/^[^0-9][a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[@][a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{2,4}$/', $email);
        }

    }