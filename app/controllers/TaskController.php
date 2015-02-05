<?php 
    
    class TaskController extends BaseController {

        /*
         * Return the users of certain department based on loged user with level of head
         */
        public function toAssignTask() {

            /* Getting the employees of certain department to assign a task */
            return User::whereRaw('status = ? and user_type_id = ? and department_id = ?', 
                array(1, 2, Auth::user()->department_id)
            )->get();
        
        }

        /*
         * Assign a service task of event to an user of certain department
         * Ajax JSON response
         */
        public function assignTask() {

            /* Verifying that tasks has a correcte and valid data */
            $validation = $this->validateTask();

            if(!$validation['isValid']) {
                return '{"status":"error","message":'.$validator->messages().'}';
            }

            /* Getting all data to the new task */
            $task_data = array(
                'description'      => Input::get('description'),
                'comment'          => Input::get('comment'),
                'event_service_id' => Input::get('event_service_id'),
            );

            /* Creating and storing new task object */
            $task = new Task($task_data);
            $user = User::find(Input::get('user_id'));
            $task = $user->tasks()->save($task);

            /* Checking if the task was storing successful */
            if(!is_null($task)) {
                /* If the task has been succesful saved, send an email to the user with a new task */
                Mail::send('emails.notification.newtask', array(), 
                    function($message) use($user) {
                        $message->to($user->email)->subject('Nueva tarea asignada - DCI');
                    }
                );
                return '{"status":"success","newtask": '.Task::find($task->id).' }';
            }

            return '{"status":"error","message":"Error al asignar la tarea, vuelva a intentarlo"}';

        }

        /*
         * Edit a task assigned
         * JSON response
         */
        public function editTask() {

            /* Searching the task */
            $task = Task::find(Input::get('id'));

            if(is_null($task)) {
                return '{"status":"error","message":"No existe la tarea especificada"}';
            }

            /* Verifying that the task to edit belongs to the same department of the boss */
            if(Auth::user()->department()->first()->id != $task->user->department()->first()->id) {
                return '{"status":"error","message":"Usted no tiene permisos para editar esta tarea"}';
            }

            /* Verifying that tasks has a correcte and valid data */
            $validation = $this->validateTask();

            if(!$validation['isValid']) {
                return '{"status":"error","message":'.$validator->messages().'}';
            }

            /* Cheking if the employee of task change to notifiy both employees */
            $old_employee = null;
            if($task->user_id != Input::get('user_id')) {
                $old_employee = User::find($task->user_id);
            }

            /* Updating the task information */
            $task->description = Input::get('description');
            $task->comment     = Input::get('comment');
            $task->user_id     = Input::get('user_id');
            $task->save();

            /* Find the employee */
            $employee = User::find($task->user_id);

            if(is_null($old_employee)) {
                /* Sending email if the employee of the task is the same */
                Mail::send('emails.notification.edittask', 
                    array(
                        'boss' => Auth::user()->first_name.' '.Auth::user()->last_name,
                        'task' => $task->description
                    ), 
                    function($message) use($employee) {
                        $message->to($employee->email)->subject('Tarea asignada editada - DCI');
                    }
                );
            }
            else {
                /* Sending emails if the employee of the task is a new one */
                Mail::send('emails.notification.newtask', 
                    array(
                        'boss' => Auth::user()->first_name.' '.Auth::user()->last_name,
                        'task' => $task->description
                    ), 
                    function($message) use($employee) {
                        $message->to($employee->email)->subject('Nueva tarea asignada - DCI');
                    }
                );

                Mail::send('emails.notification.deletetask', 
                    array(
                        'boss' => Auth::user()->first_name.' '.Auth::user()->last_name,
                        'task' => $task->description
                    ), 
                    function($message) use($old_employee) {
                        $message->to($old_employee->email)->subject('Tarea asignada eliminada - DCI');
                    }
                );
            }

            return '{"status":"success","message":"Tarea editada correctamente","task":'.$task.'}';

        }

        /*
         * Applying soft deleting to a task
         * JSON response
         */
        public function deleteTask() {

            $task = Task::find(Input::get('id'));

            /* Verifying the boss can delete that task */
            if(Auth::user()->department()->first()->id != $task->user->department()->first()->id) {
                return '{"status":"error","message":"Usted no tiene permisos para eliminar esta tarea"}';
            }

            /* Sending an email to employee */
            $user = User::find($task->user_id);
            Mail::send('emails.notification.deletetask',
                array(
                    'task' => $task->description
                ), 
                function($message) use($user) {
                    $message->to($user->email)->subject('Tarea asignada eliminada - DCI');
                }
            );

            $task->delete();

            return '{"status":"success","message":"Tarea eliminada correctamente"}';

        }

        /*
         * Return all task (pending and/or completed) of the user logged
         */
        public function tasksByUserLogged($task_type = 'pending') {
            $pending = $completed = array();

            if(is_numeric($task_type)) {
                return EventDCI::with(
                    array(
                        'services' => 
                            function($query) {
                                $query  ->whereNull('event_service.deleted_at')
                                        ->where('services.department_id', '=', Auth::user()->department_id)
                                        ->orderBy('start_service');
                            }
                    )
                )
                ->whereHas('services', 
                    function($query) {
                        $query  ->whereNull('event_service.deleted_at')
                                ->where('services.department_id', '=', Auth::user()->department_id)
                                ->whereRaw('(`dci_status` = ? OR `dci_status` = ?)', 
                                    array('Pendiente', 'En Proceso')
                                );
                    }
                )
                ->whereRaw('(`events`.`dci_status` = ? OR `events`.`dci_status` = ?)',
                    array('Pendiente', 'En Proceso')
                )
                ->get();

                foreach ($events as $event) {
                    $custom_event = $custom_service = array();
                    $custom_event["id"]          = $event["id"];
                    $custom_event["id_dci"]      = $event["id_dci"];
                    $custom_event["name"]        = $event["name"];
                    $custom_event["start_day"]   = $event["start_day"];
                    $custom_event["end_day"]     = $event["end_day"];
                    $custom_event["place"]       = $event["place"];
                    $custom_event["time"]        = $event["time"];
                    $custom_event["has_cost"]    = $event["has_cost"];
                    $custom_event["directed_to"] = $event["directed_to"];
                    $custom_event["link"]        = $event["link"];
                    $custom_event["description"] = $event["description"];
                    $custom_event["dci_status"]  = $event["dci_status"];
                    $custom_event["created_at"]  = is_null($event["created_at"]) ? null : $event["created_at"]->toDateTimeString();
                    $custom_event["updated_at"]  = is_null($event["updated_at"]) ? null : $event["updated_at"]->toDateTimeString();
                    $custom_event["deleted_at"]  = is_null($event["deleted_at"]) ? null : $event["deleted_at"]->toDateTimeString();
                    $custom_event["user_id"]     = $event["user_id"];
                    $custom_event["services"]    = array();
                    $toPush = false;
                    foreach ($event['services'] as $service) {
                        $service['tasks'] = 
                            $service
                            ->pivot
                            ->tasks()
                            ->where('user_id', '=', Auth::user()->id)
                            ->where('id', '=', $task_type)
                            ->get();

                        if(!$tasks->isEmpty()) {
                            $service['tasks'] = $tasks;
                            array_push($custom_service, $service);
                            $toPush = true;
                        }
                    }
                    if($toPush) {
                        array_push($custom_event["services"], $custom_service);
                        array_push($pending, $custom_event);
                    }
                }
            }

            if($task_type == 'pending' or $task_type == 'all') {
                $events = EventDCI::with(
                    array(
                        'services' => 
                            function($query) {
                                $query  ->whereNull('event_service.deleted_at')
                                        ->where('services.department_id', '=', Auth::user()->department_id)
                                        ->orderBy('start_service');
                            }
                    )
                )
                ->whereHas('services', 
                    function($query) {
                        $query  ->whereNull('event_service.deleted_at')
                                ->where('services.department_id', '=', Auth::user()->department_id)
                                ->whereRaw('(`dci_status` = ? OR `dci_status` = ?)', 
                                    array('Pendiente', 'En Proceso')
                                );
                    }
                )
                ->whereRaw('(`events`.`dci_status` = ? OR `events`.`dci_status` = ?)',
                    array('Pendiente', 'En Proceso')
                )
                ->get();

                foreach ($events as $event) {
                    $custom_event = $custom_service = array();
                    $custom_event["id"]          = $event["id"];
                    $custom_event["id_dci"]      = $event["id_dci"];
                    $custom_event["name"]        = $event["name"];
                    $custom_event["start_day"]   = $event["start_day"];
                    $custom_event["end_day"]     = $event["end_day"];
                    $custom_event["place"]       = $event["place"];
                    $custom_event["time"]        = $event["time"];
                    $custom_event["has_cost"]    = $event["has_cost"];
                    $custom_event["directed_to"] = $event["directed_to"];
                    $custom_event["link"]        = $event["link"];
                    $custom_event["description"] = $event["description"];
                    $custom_event["dci_status"]  = $event["dci_status"];
                    $custom_event["created_at"]  = is_null($event["created_at"]) ? null : $event["created_at"]->toDateTimeString();
                    $custom_event["updated_at"]  = is_null($event["updated_at"]) ? null : $event["updated_at"]->toDateTimeString();
                    $custom_event["deleted_at"]  = is_null($event["deleted_at"]) ? null : $event["deleted_at"]->toDateTimeString();
                    $custom_event["user_id"]     = $event["user_id"];
                    $custom_event["services"]    = array();
                    $toPush = false;
                    foreach ($event['services'] as $service) {
                        $tasks =
                            $service
                            ->pivot
                            ->tasks()
                            ->where('user_id', '=', Auth::user()->id)
                            ->where('status', '=', 'Pendiente')
                            ->get();

                        if(!$tasks->isEmpty()) {
                            $service['tasks'] = $tasks;
                            array_push($custom_service, $service);
                            $toPush = true;
                        }
                    }
                    if($toPush) {
                        array_push($custom_event["services"], $custom_service);
                        array_push($pending, $custom_event);
                    }
                }
            }
            
            if($task_type == 'completed' or $task_type == 'all') {
                $completed = EventDCI::with(
                    array(
                        'services' => 
                            function($query) {
                                $query  ->whereNull('event_service.deleted_at')
                                        ->where('services.department_id', '=', Auth::user()->department_id)
                                        ->orderBy('start_service');
                            }
                    )
                )
                ->whereHas('services', 
                    function($query) {
                        $query  ->whereNull('event_service.deleted_at')
                                ->where('services.department_id', '=', Auth::user()->department_id)
                                ->whereRaw('(`dci_status` = ? OR `dci_status` = ?)', 
                                    array('Pendiente', 'En Proceso')
                                );
                    }
                )
                ->whereRaw('(`events`.`dci_status` = ? OR `events`.`dci_status` = ?)',
                    array('Pendiente', 'En Proceso')
                )
                ->get();

                foreach ($completed as $event) {
                    $custom_event = $custom_service = array();
                    $custom_event["id"]          = $event["id"];
                    $custom_event["id_dci"]      = $event["id_dci"];
                    $custom_event["name"]        = $event["name"];
                    $custom_event["start_day"]   = $event["start_day"];
                    $custom_event["end_day"]     = $event["end_day"];
                    $custom_event["place"]       = $event["place"];
                    $custom_event["time"]        = $event["time"];
                    $custom_event["has_cost"]    = $event["has_cost"];
                    $custom_event["directed_to"] = $event["directed_to"];
                    $custom_event["link"]        = $event["link"];
                    $custom_event["description"] = $event["description"];
                    $custom_event["dci_status"]  = $event["dci_status"];
                    $custom_event["created_at"]  = is_null($event["created_at"]) ? null : $event["created_at"]->toDateTimeString();
                    $custom_event["updated_at"]  = is_null($event["updated_at"]) ? null : $event["updated_at"]->toDateTimeString();
                    $custom_event["deleted_at"]  = is_null($event["deleted_at"]) ? null : $event["deleted_at"]->toDateTimeString();
                    $custom_event["user_id"]     = $event["user_id"];
                    $custom_event["services"]    = array();
                    $toPush = false;
                    foreach ($event['services'] as $service) {
                        $service['tasks'] = 
                            $service
                            ->pivot
                            ->tasks()
                            ->where('user_id', '=', Auth::user()->id)
                            ->where('status', '=', 'Completa')
                            ->get();

                        if(!$tasks->isEmpty()) {
                            $service['tasks'] = $tasks;
                            array_push($custom_service, $service);
                            $toPush = true;
                        }
                    }
                    if($toPush) {
                        array_push($custom_event["services"], $custom_service);
                        array_push($pending, $custom_event);
                    }
                }
            }

            return array('pending' => $pending, 'completed' => $completed);

        }

        /*
         * Change the task status to completed and update the information required
         */
        public function taskCompleted($id) {

            $task = Task::find($id);

            if(is_null($task)) {
                return '{"status":"error","message":"La tarea no existe"}';
            }

            if($task->status == 'Completa') {
                return '{"status":"error","message":"La ya estaba completa"}';
            }

            $task->status = 'Completa';
            $task->comment = Input::get('comment');
            $task->completed_at = new DateTime();
            $task->save();

            return '{"status":"success"}';

        }

        /*
         * Validator for adding and editing a task
         */
        private function validateTask() {

            /* Creating a task validator */
            $validator = Validator::make(
                Input::all(),
                array(
                    'description'      => 'required',
                    'user_id'          => 'required',
                    'event_service_id' => 'required',
                ),
                array(
                    'user_id'          => 'Error al procesar petición',
                    'event_service_id' => 'Error al procesar petición',
                )
            );

            if($validator->fails()) {
                return array('isValid' => false, 'message' => $validator->messages());
            }

            return array('isValid' => true, 'message' => '');

        }
    }