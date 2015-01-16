<?php 
class TaskController extends BaseController {

    public function tasksByRequest($event_service_id) {
        return json_encode(
        		Task::where('event_service_event_id', '=', $event_service_id)
        	);
    }	
}