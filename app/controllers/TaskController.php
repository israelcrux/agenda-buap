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
                        $message->to($user->email)->subject('Nueva tarea asignada - DCI - BUAP');
                    }
                );
                return '{"status":"success","newtask": '.Task::find($task->id).' }';
            }

            return '{"status":"error","message":"Error al asignar la tarea, vuelva a intentarlo"}';

        }

        /*
         * Edit a task assigned
         * JSON and normal response
         */
        public function editTask() {

            /* Getting response type */
            $response = Input::get('response');

            /* Searching the task */
            $task = Task::find(Input::get('id'));

            if(is_null($task)) {
                if($response == 'JSON')
                    return '{"status":"error","message":"No existe la tarea especificada"}';
                else 
                    return Redirect::to('dashboard-boss')->with('alert', 'No existe la tarea especificada');
            }

            /* TODO: Verifying that the task to edit belongs to the same department of the boss */

            /* Verifying that tasks has a correcte and valid data */
            $validation = $this->validateTask();

            if(!$validation['isValid']) {
                if($response == 'JSON')
                    return '{"status":"error","message":'.$validator->messages().'}';
                else
                    return Redirect::to('dashboard-boss')->with('alert', $validator->messages());
            }

            /* Updating the task information */
            $task->description = Input::get('description');
            $task->comment     = Input::get('comment');
            $task->user_id     = Input::get('user_id');
            $task->save();

            if($response == 'JSON')
                return '{"status":"success","message":"Tarea editada correctamente","task"'.$task.'}';
            else
                return Redirect::to('dashboard-boss')->with('alert', 'Tarea editada correctamente');

        }

        /*
         * Applying soft deleting to a task
         * JSON and normal response
         */
        public function deleteTask() {
            $resposne = Input::get('response');
            $task     = Task::find(Input::get('id'));

            /* TODO: Verifying the boss can delete that task */
            $task->delete();

            if($response == 'JSON')
                return '{"status":"success","message":"Tarea eliminada correctamente"}';
            else
                return Redirect::to('dashboard-boss')->with('alert', 'Tarea eliminada correctamente');

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