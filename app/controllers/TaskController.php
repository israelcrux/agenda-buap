<?php 
    
    class TaskController extends BaseController {

        /*
         *
         */
        public function tasksByRequest($event_service_id) {
            return json_encode(
            		Task::where('event_service_event_id', '=', $event_service_id)
            	);
        }

        /*
         *
         */
        public function toAssignTask() {

            /* Getting the employees of certain department to assign a task */
            return User::whereRaw('status = ? and user_type_id = ? and department_id = ?', 
                array(1, 2, Auth::user()->department_id)
            )->get();
        
        }

        /*
         * Assign a task to an user
         */
        public function assignTask() {
            
        }
    }