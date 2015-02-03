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

            /* Updating the task information */
            $task->description = Input::get('description');
            $task->comment     = Input::get('comment');
            $task->user_id     = Input::get('user_id');
            $task->save();

            /* Sending an email to employee */
            $user = User::find($task->user_id);
            Mail::send('emails.notification.edittask', 
                array(
                    'boss' => Auth::user()->first_name.' '.Auth::user()->last_name,
                    'task' => $task->description
                ), 
                function($message) use($user) {
                    $message->to($user->email)->subject('Tara asignada editada - DCI');
                }
            );

            return '{"status":"success","message":"Tarea editada correctamente","task"'.$task.'}';

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
                    $message->to($user->email)->subject('Tara asignada eliminada - DCI');
                }
            );

            $task->delete();

            return '{"status":"success","message":"Tarea eliminada correctamente"}';

        }

        /*
         * Return all task (pending and/or completed) of the user logged
         */
        public function tasksByUserLogged($task_type = 'pending') {
            $pending = $completed = null;

            if(is_numeric($task_type)) {
                return Task::where('user_id', '=', Auth::user()->id)
                        ->where('id', '=', $task_type)
                        ->get();
            }

            if($task_type == 'pending' or $task_type == 'all') {
                $pending = Task::where('user_id', '=', Auth::user()->id)
                            ->where('status', '=', 'Pendiente')
                            ->get();
            }
            
            if($task_type == 'completed' or $task_type == 'all') {
                $completed = Task::where('user_id', '=', Auth::user()->id)
                            ->where('status', '=', 'Completa')
                            ->get();
            }

            return array('pending' => $pending, 'completed' => $completed);

        }

        /*
         * Change the task status to completed and update the information required
         */
        public function taskCompleted($id) {

            $task = Task::find($id);

            if(is_null($task)) {
                return Redirect::to('dashboard-employee')->with('alert', 'Error al procesar la petición');
            }

            if($task->status == 'Completa') {
                return Redirect::to('dashboard-employee')->with('alert', 'Tarea marcada previamente como completa');
            }

            $task->status = 'Completa';
            $task->comment .= ' ¡Tarea finalizada! ';
            $task->completed_at = new DateTime();
            $task->save();

            return Redirect::to('dashboard-employee')->with('alert', 'La tarea ha sido marcada como completada. ¡Felicitaciones!');

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