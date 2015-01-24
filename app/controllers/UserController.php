<?php    

    class UserController extends BaseController {

        /*
         * Reset password
         */
        public function passwordReset() {

            /* Creating a password reset validator */
            $validator = Validator::make(
                Input::all(),
                array(
                    'password' => 'required|min:6',
                    'token' => 'required|exists:users_auth_operations,token,type,2,used,0,deleted_at,NULL'
                ),
                array(
                    'token.exists' => 'El enlace proporcionado es corrupto, inválido o ha sido utilizado'
                )
            );

            if($validator->fails()) {
                return Redirect::to('signup')->with('alert', $validator->messages());
            }

            /* Getting the user auth operation reminder to change the password */
            $user_auth_reminder = UserAuthOperation::where('token', '=', Input::get('token'))->first();

            /*Getting the user that forgot its password*/
            $user = User::find($user_auth_reminder->user_id);

            /* Verifying that the user exists */
            if(!$user){
                return Redirect::to('login')->with('alert', 'Error inesperado');
            }
            
            /* Updating the new password */
            $user->password = Hash::make(Input::get('password'));
            $user->save();

            /* Invalidate link */
            $user_auth_reminder->used = 1;
            $user_auth_reminder->save();

            Auth::login($user);
            return Redirect::intended('dashboard')->with('alert','Su contraseña ha sido restablecida');
        }

        /*
         * Show the form to reset the password
         */
        public function passwordResetForm($token) {
            /* Getting information in database */
            $user_auth_reminder = UserAuthOperation::where('token', '=', $token)->first();

            /* Verifying if the user_auth_operation exists */
            if(!$user_auth_reminder){
                return Redirect::to('login')->with('alert', 'Acceso no autorizado');
            }

            /* Verifying if the user_auth_operation has been used */
            if($user_auth_reminder->used == 1){
                return Redirect::to('password')->with('alert', 'El enlace de recuperación de contraseña ha sido utilizado.');
            }

            return View::make('new-password', array('token' => $user_auth_reminder->token));
        }

        /*
         * Processing the request to change the forgotten password
         */
        public function password() {

            /* Creating a password recovery validator */
            $validator = Validator::make(
                Input::all(),
                array(
                    'email' => 'required|email|exists:users'
                )
            );

            if($validator->fails()) {
                return Redirect::to('password')->with('alert', $validator->messages());
            }

            /* Getting the user that forgot its password */
            $user = User::where('email', '=', Input::get('email'))->first();

            /* Creating a new user auth operation */
            $now = new DateTime();
            $user_auth_reminder = new UserAuthOperation(
                array(
                    'token'      => str_random(40),
                    'expiration' => $now->add(new DateInterval('P1D')),
                    'type'       => 2,
                    'used'       => 0,
                )
            );

            /* Saving the user auth operation of reminder */
            $user_auth_reminder = $user->user_auth_operations()->save($user_auth_reminder);

            /* Sending email to user to set a new password */
            Mail::send('emails.auth.reminder', array('token' => $user_auth_reminder->token), function($message) use($user) {
                $message->to($user->email)->subject('Recuperación de contraseña Agenda Universitaria');
            });

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

                /* Verifying if the user role */
                switch (Auth::user()->user_type_id) {
                    case 1:
                        return Redirect::to('dashboard');
                        break;
                    case 2:
                        return Redirect::to('dashboard-employee');
                        break;
                    case 3:
                        return Redirect::to('dashboard-boss');
                        break;
                    case 4:
                        return Redirect::to('dashboard-admin');
                        break;
                    default:
                        return Redirect::to('/');
                        break;
                }
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
                    'first_name' => 'required',
                    'last_name' => 'required',
                    'phone' => array('regex:/([0-9]+|-|\s)+/'),
                    'extension_phone' => array('regex:/([0-9]+|-|\s)+/'),
                    'email' => 'required|email|unique:users',
                    'password' => 'required|min:6',
                    'academic_administrative_unit_type' => 'min:1|integer',
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

                Mail::send('emails.auth.activate', array('token' => $user_auth_activation->token), 
                    function($message) use($user) {
                        $message->to($user->email)->subject('Bienvenido a la DCI!');
                    }
                );

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

    }