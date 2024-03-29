<?php

    class UserController extends BaseController {

        /*
         * Show users
         */
        public function view(){
            return User::with('user_type')->with('department')->get();
        }


        /*
         * Deactivating an user setting status to 0
         */
        public function deactivate() {

            $user = User::find(Input::get('id'));

            if(is_null($user)) {
                return '{"status":"error","message":"El usuario no existe"}';
            }

            if(Auth::user()->user_type_id != 4) {
                return '{"status":"error","message":"Usted no tiene permisos para modificar este usuario"}';
            }

            $user->status = 0;
            $user->save();

            return '{"status":"success","message":"El usuario ha sido de baja exitosamente"}';

        }

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
                if(Auth::user()->status == '0') {
                    Auth::logout();
                    return Redirect::to('login')->with('alert', 'Usuario deshabilitado')->withInput(Input::except('password'));
                }
                else if(Auth::user()->status == '2' || Auth::user()->status == '4') {
                    Auth::logout();
                    return Redirect::to('login')->with('alert', 'Usuario requiere activación')->withInput(Input::except('password'));
                }
                else if(Auth::user()->status == '3') {
                    Auth::logout();
                    return Redirect::to('login')->with('alert', 'Usuario requiere autorización')->withInput(Input::except('password'));
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
         * Verify user and register the user
         */
        public function register() {

            /* Verifying that user has a correct and valid data */
            $validation = $this->validateUser('register');

            if(!$validation['isValid']) {
                if(Input::has('department_id') and Input::has('user_type_id')) {
                    return Redirect::to('signup-pro')->with('alert', $validation['message'])->withInput(Input::except('password'));
                }
                else {
                    return Redirect::to('signup')->with('alert', $validation['message'])->withInput(Input::except('password'));
                }
            }

            /* Generating encrypted password */
            $crypt_password = Hash::make(Input::get('password'));

            /* Getting data */
            $user_data = array(
                'last_name'       => Input::get('last_name'),
                'first_name'      => Input::get('first_name'),
                'phone'           => Input::get('phone'),
                'extension_phone' => Input::get('extension_phone'),
                'email'           => Input::get('email'),
                'password'        => $crypt_password
            );

            if(Input::get('academic_administrative_unit_type') != '3') {
                $user_data['academic_administrative_unit_id'] = Input::get('academic_administrative_unit');
            }

            /* If the request came from signup-pro, get the department of user */
            if(Input::has('department_id')) {
                $user_data['department_id'] = Input::get('department_id') == 0 ? NULL : Input::get('department_id');
            }

            /* Storing the new user */
            $user = User::create($user_data);

            /* If the request came from signup-pro, get the level of user */
            if(Input::has('user_type_id')) {
                $user->user_type_id = Input::get('user_type_id');
                $user->save();
            }

            /* Validatying if the user needs confirm email and sending email if it is necessary */
            $message = $this->mailToValidateMail($user, 'register');

            return Redirect::to('login')->with('alert', $message);

        }

        /*
         * Process that verify an user through e-mail validation
         */
        public function activate($token) {
            // Checking on database if the token exists
            $user_auth_activation = UserAuthOperation::whereRaw('token = ? and type = ? and used = 0', array($token, 1))->first();

            // Verifying that the token is valid
            if(!$user_auth_activation) {
                return Redirect::to('login')->with('alert', 'El enlace se activación no existe, o ya fué utilizado');
            }

            // ya no es necesario
            // Verifying that the token has not been used
            // if($user_auth_activation->used == 1) {
            //     return Redirect::to('login')->with('alert', 'El mécanismo de activación del e-mail ha sido utilizado');
            // }

            // Verifying that the token has not expired
            $expiration_date = new DateTime($user_auth_activation->expiration);
            $now = new DateTime();
            if($now > $expiration_date) {
                return Redirect::to('registerlinkform')->with('alert', 'El token de validación ha expirado');
            }

            // Updating the information for the token as used
            $user_auth_activation->used = 1;
            $user_auth_activation->save();

            // Updating the user information with status active
            $user = User::find($user_auth_activation->user_id);

            if($user->status == 2) {
                $user->status = $user->user_type_id > 1 ? 3 : 1;
            }
            else {
                $user->status = 1;
            }

            $user->save();

            $message = $user->status == 1 ? 'Su cuenta ha sido activada, ahora puede iniciar sesión' : 'Su cuenta ha sido activada, solicite autorización con jefe o administrador para iniciar sesión';
            return Redirect::to('login')->with('alert', $message);

        }

        /*
         * Verify and edit user
         */
        public function editUser() {
            $response = Input::get('response');
            $user     = User::find(Input::get('id'));

            if(is_null($user)) {
                if($response == 'JSON')
                    return '{"status":"error","message":"Usuario inválido","data":'.json_encode(Input::except('password')).'}';
                else
                    return Redirect::to('user/edit')->with('alert', 'Usuario inválido')->withInput(Input::except('password'));
            }

            if($user->id != Auth::user()->id and Auth::user()->user_type_id != 4) {
                if($response == 'JSON')
                    return '{"status":"error","message":"Usted no tiene permisos para modificar este usuario","data":'.json_encode(Input::except('password')).'}';
                else
                    return Redirect::to('user/edit')->with('alert', 'Usted no tiene permisos para modificar este usuario')->withInput(Input::except('password'));
            }

            /* Verifying that user has a correct and valid data */
            $validation = $this->validateUser('edit');

            if(!$validation['isValid']) {
                if($response == 'JSON')
                    return '{"status":"error","message":'.$validation['message'].',"data":'.json_encode(Input::except('password')).'}';
                else
                    return Redirect::to('user/edit')->with('alert', $validation['message'])->withInput(Input::except('password'));
            }

            /* Getting the old user email */
            $old_email = $user->email;

            /* Updating data */
            $user->last_name       = Input::get('last_name');
            $user->first_name      = Input::get('first_name');
            $user->phone           = Input::get('phone');
            $user->extension_phone = Input::get('extension_phone');
            $user->email           = Input::get('email');

            /* Generating and saving encrypted password */
            if(Input::get('password') != '') {
                $crypt_password = Hash::make(Input::get('password'));
                $user->password = $crypt_password;
            }

            /* If the request brings with a valid academic administrative unit, set it, if not, set to NULL */
            if(Input::get('academic_administrative_unit_type') == '3') {
                $user->academic_administrative_unit_id = NULL;
            }
            else {
                $user->academic_administrative_unit_id = Input::get('academic_administrative_unit');
            }

            /* If the request came from signup-pro, get the department of user */
            if(Input::has('department_id')) {
                $user->department_id = Input::get('department_id') == 0 ? NULL : Input::get('department_id');
            }

            /* If the request came from signup-pro, get the user_type_id of user */
            if(Input::has('user_type_id')) {
                $user->user_type_id = Input::get('user_type_id');
            }

            $user->save();

            /* Validatying if the user needs confirm email and sending email if it is necessary */
            if($old_email != $user->email) {
                $message = $this->mailToValidateMail($user, 'edit');
                if(Auth::user()->user_type_id != 4) {
                    Auth::logout();
                }
            }
            else {
                $message = 'Información de usuario actualizada';
            }


            if($response == 'JSON')                
                return '{"status":"success","message":"'.$message.'","user":'.$user.'}';
            else
                return Redirect::to('login')->with('alert', $message);

        }

        /*
         * User registered as employee get the boss/admin authorization
         */
        public function getEmployees() {

            switch (Auth::user()->user_type_id) {

                case '3':
                    $query = User::where('department_id', '=', Auth::user()->department_id)
                                ->where('user_type_id', '=', 2);
                    break;

                case '4':
                    $query = User::where('user_type_id', '!=', 1);
                    break;

                default:
                    return '{"status":"error","message":"Error inesperado. Al parecer no tiene permisos para autorizar usuarios"}';
                    break;
            }

            return array(
                'unauthorized' => $query->where('status', '=', 3)->get(),
                'authorized' => $query->where('status', '=', 1)->get()
            );

        }

        /*
         * User registered get authorization to login like employee/boss/administrator
         * JSON response
         */
        public function authorize() {

            $user = User::find(Input::get('id'));

            switch (Input::get('user_type_id')) {
                case 2:
                    if(Auth::user()->user_type_id <= 2) {
                        return '{"status":"error","message":"No tiene permisos suficientes para autorizar un empleado"}';
                    }
                    elseif (Auth::user()->department_id != $user->department_id && Auth::user()->user_type_id < 4) {
                        return '{"status":"error","message":"No tiene permisos para autorizar un empleado que no pertenece a su departamento"}';
                    }
                    $response_message = 'empleado';
                    break;

                case 3:
                    if(Auth::user()->user_type_id <= 3) {
                        return '{"status":"error","message":"No tiene permisos suficientes para autorizar un jefe"}';
                    }
                    $response_message = 'jefe de '.$user->department_id;
                    break;

                case 4:
                    if(Auth::user()->user_type_id < 4) {
                        return '{"status":"error","message":"No tiene permisos suficientes para autorizar un administrador"}';
                    }
                    $response_message = 'administrador';
                    break;

                default:
                    return '{"status":"error","message":"Error inesperado (user type id : '.Auth::user()->user_type_id.'), recargue y vuelva a intentar"}';
                    break;
            }

            $user->status = 1;
            $user->save();

            Mail::send('emails.auth.authorize', array(),
                function($message) use($user) {
                    $message->to($user->email)->subject('Usuario autorizado! DCI');
                }
            );

            return '{"status":"success","message":"El usuario '.$user->first_name.' '.$user->last_name.' ha sido autorizado como '.$response_message.'"}';

        }

        /*
         * Send email to validate the user AGAIN
         */
        public function resendlink(){
            
            $user = User::where('email', '=', Input::get('email'))->first();
            if(!$user){
                return Redirect::to('registerlinkform')->with('alert', 'El correo proporcionado no está registrado');
            } else if($user->status != 2){
                return Redirect::to('login')->with('alert', 'Esta cuenta ya es válida, puede iniciar sesión');
            } else {

                //invalidar al token anterior 
                $usertokens = UserAuthOperation::whereRaw('user_id = ? and type = ? and used = 0', array($user->id, 1))->get();
                if(count( $usertokens) > 0 ) {
                    foreach($usertokens as $token) { 
                        $token->used = 1;
                        $token->save();
                    }
                }

                $this->mailToValidateMail($user,'register');
    
                return Redirect::to('login')->with('alert', 'Todo listo, un nuevo enlace ha sido enviado a su correo');
            }
        }


        /*
         * Send an mail to validate the user mail
         */
        private function mailToValidateMail($user, $operation) {

            /* Saving a operation to activate the user */
            $now = new DateTime();
            $user_auth_activation             = new UserAuthOperation();
            $user_auth_activation->token      = str_random(40);
            $user_auth_activation->expiration = $now->add(new DateInterval('P1D'));
            $user_auth_activation->type       = 1;
            $user_auth_activation->used       = 0;
            $user_auth_activation->user_id    = $user->id;
            $user_auth_activation->save();

            /* Setting the status of the user */
            $user->status = $operation == 'register' ? 2 : 4;
            $user->save();

            Mail::send('emails.auth.activate',
                array(
                    'token' => $user_auth_activation->token
                ),
                function($message) use($user, $operation) {
                    $subject = $operation == 'register' ? 'Bienvenido a la DCI!' : 'Perfil DCI actualizado';
                    $message->to($user->email)->subject($subject);
                }
            );

            return $operation == 'register' ? 'Gracias por registrarse, en breve recibirá un correo de confirmación' : 'Gracias por actualizar su información, en breve recibirá un correo de activación';

        }

        /*
         * Validator for adding and editing an user
         */
        private function validateUser($type) {

            if($type == 'register') {
                /* Creating a register/edition user validator */
                $validator = Validator::make(
                    Input::all(),
                    array(
                        'first_name'                        => 'required',
                        'last_name'                         => 'required',
                        'phone'                             => array('regex:/([0-9]+|-|\s)+/', 'required_with:extension_phone,'),
                        'extension_phone'                   => array('regex:/([0-9]+|-|\s)+/'),
                        'email'                             => 'required|email|unique:users',
                        'password'                          => 'required|min:6',
                        'user_type_id'                      => 'min:1|integer',
                        'department_id'                     => 'required_if:user_type_id,2,user_type_id,3|min:0|integer',
                        'academic_administrative_unit_type' => 'min:1|integer',
                        'academic_administrative_unit'      => 'required_if:academic_administrative_unit_type,1,academic_administrative_unit_type,2|integer',
                    ),
                    array(
                        'academic_administrative_unit_type.min'     => 'Seleccione una procedencia de unidad acádemica o administrativa',
                        'academic_administrative_unit_type.integer' => 'Procedencia de unidad acádemica o administrativa inválida',
                        'user_type_id.min'                          => 'Seleccione un nivel de usuario',
                        'user_type_id.integer'                      => 'Nivel de usuario inválido',
                        'department_id.min'                         => 'Seleccione un departamento',
                        'department_id.integer'                     => 'Departamento inválido',
                    )
                );
            }
            else if($type == 'edit') {
                /* Checking if the user that edit is admin */
                $email_unique = Auth::user()->user_type_id != 4 ? Auth::user()->id : Input::get('id');

                /* Creating a register/edition user validator */
                $validator = Validator::make(
                    Input::all(),
                    array(
                        'first_name'                        => 'required',
                        'last_name'                         => 'required',
                        'phone'                             => array('regex:/([0-9]+|-|\s)+/'),
                        'extension_phone'                   => array('regex:/([0-9]+|-|\s)+/'),
                        'email'                             => 'required|email|unique:users,email,'.$email_unique,
                        'password'                          => 'min:6|confirmed',
                        'academic_administrative_unit_type' => 'min:1|integer',
                        'academic_administrative_unit'      => 'required_if:academic_administrative_unit_type,1,academic_administrative_unit_type,2|integer',
                    ),
                    array(
                        'academic_administrative_unit_type.min'     => 'Seleccione una procedencia de unidad acádemica o administrativa',
                        'academic_administrative_unit_type.integer' => 'Procedencia de unidad acádemica o administrativa inválida',
                    )
                );
            }

            /* Check if validation is correct */
            if($validator->fails()) {
                return array('isValid' => false, 'message' => $validator->messages());
            }

            return array('isValid' => true, 'message' => '');

        }

    }