<?php 

    class EventServiceController extends BaseController {

        /* 
         * Mark an event service as completed 
         */
        public function eventServiceCompleted() {

            /* Getting the event_service to update */
            $event_service = DB::table('event_service')
                                ->where('id', Input::get('event_service_id'))
                                ->whereNull('deleted_at')
                                ->first();

            /* If the event_service does not exists return an error */
            if(is_null($event_service)){
                return '{"status":"error","message":"El servicio - evento no existe"}';
            }

            /* Checking if the user has the enought access rights to update the event - service */
            $service = Service::find($event_service->service_id);
            if($service->department_id == Auth::user()->department_id || Auth::user()->user_type_id == 4) {

                /* Updating the event_service */
                DB::table('event_service')
                    ->where('id', Input::get('event_service_id'))
                    ->whereNull('deleted_at')
                    ->update(
                        array(
                            'dci_status'  => 'Atendido',
                            'attended_at' => new DateTime()
                        )
                    );

                return '{"status":"success"}';
            }

            return '{"status":"error","message":"Usted no tiene permisos para marcar este servicio como completo"}';
        
        }

    }