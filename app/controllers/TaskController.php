<?php 
    
    class TaskController extends BaseController {

        /*
         * Return the tasks assigned to an service 
         */
        public function tasksByRequest($event_service_id) {
            return json_encode(
            		Task::where('event_service_event_id', '=', $event_service_id)
            	);
        }

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
         */
        public function assignTask() {

            /* Creating a task validator */
            $validator = Validator::make(
                Input::all(),
                array(
                    'description' => 'required',
                    'user_id'     => 'required',
                    'event_id'    => 'required',
                    'service_id'  => 'required',
                )
            );

            if($validator->fails()) {
                return Redirect::to('dashboard-boss')->with('alert', $validator->messages());
            }

            /* Getting all data to the new task */
            $task_data = array(
                'description'              => Input::get('description'),
                'comment'                  => Input::get('comment'),
                'event_service_event_id'   => Input::get('event_id'),
                'event_service_service_id' => Input::get('service_id'),
            );

            /* Creating and storing new task object */
            $task = new Task($task_data);
            $user = User::find(Input::get('user_id'));
            $task = $user->tasks()->save($task);

            /* Checking if the task was storing successful */
            if(!is_null($task)) {
                return Redirect::to('dashboard-boss')->with('alert', 'Tarea asignada correctamente');
            }

            return Redirect::to('dashboard-boss')->with('alert', 'Error al asignar la tarea, vuelva a intentarlo');
        }
    }