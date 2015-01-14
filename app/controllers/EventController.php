<?php 

    class EventController extends BaseController {

        public function eventsByUser($user_id) {
            $events = EventDCI::where('user_id', '=', $user_id)
                                ->orderBy('time')->get();

            foreach ($events as $event) {
                $event['services']          = $event->services()->wherePivot('deleted_at', '=', NULL)->get();
                $event['resources_sources'] = $event->resources_sources()->wherePivot('deleted_at', '=', NULL)->get();
                $event['witnesses']         = $event->witnesses()->wherePivot('deleted_at', '=', NULL)->get();
                $event['support_materials'] = $event->support_materials()->get();
            }

            return json_encode($events);
        }

        /*
         * Return a JSON that contains all events for a certain year and month
         */
        public function calendar($year_month = null) {

            if(!isset($year_month)) {
                /* Setting the data and creating the first and last day of a month */
                $start_date = date('Y-m-01');
                $end_date   = date('Y-m-t');
            }
            else {
                /* Getting the data and creating the first and last day of a month */
                $start_date = date('Y-m-d', strtotime($year_month.'-01'));
                $end_date   = date('Y-m-t', strtotime($year_month.'-01'));
            }

            /* Querying the database to get the events for all days of certain month of the year */
            $calendar   = [];
            $activities = [];
            while($start_date <= $end_date) {

                //Temporalmente, pedido por Amparo, ¿Qué te dije?, igual y mañana se queja de que se ven los eventos sin aprobar :P
                /*
                    $events = EventDCI::whereRaw('end_day >= ? and start_day <= ? and (dci_status = ? or dci_status = ?) and user_status = ?', 
                        array($start_date, $start_date, 'En Proceso', 'Aprobado', 'Activo'))
                        ->orderBy('time')->get();
                */
                $events = EventDCI::whereRaw('end_day >= ? and start_day <= ?', 
                    array($start_date, $start_date))
                    ->orderBy('time')->get();

                $activities['activities'] = $events->toArray();
                
                //ola k ase
                $activities['date'] = $start_date;

                array_push($calendar, $activities);
                $activities = [];

                $next_date   = new DateTime($start_date);
                $next_date->add(new DateInterval('P1D'));
                $s_next_date = $next_date->format('Y-m-d');
                $start_date  = explode(' ', $s_next_date)[0];
            }

            return json_encode($calendar);

        }

        /*
         * Adding an event to the database
         */
        public function addEvent() {

            /* Verifying that event has a correct and valid data */
            $validation = $this->validateEvent();

            if(!$validation['isValid']) {
                return Redirect::to('dashboard')
                            ->with('alert', $validation['message'])
                            ->with('FORM_ENABLED','true')
                            ->with('action','add')
                            ->withInput();
            }

            /* Collecting all event data to store */
            $event_data = array(
                'id_dci'      => strftime('%y%m%d'),
                'name'        => Input::get('name'),
                'start_day'   => Input::get('start_day'),
                'end_day'     => Input::get('end_day'),
                'time'        => Input::get('time'),
                'place'       => Input::get('place'),
                'link'        => Input::get('link'),
                'directed_to' => Input::get('directed_to'),
                'has_cost'    => !Input::has('has_cost'),
                'description' => Input::get('description'),
            );

            /* Creating and storing the event */
            $user  = Auth::user();
            $event = new EventDCI($event_data);
            $event = $user->events()->save($event);

            /* Getting information about diffusion */
            if(Input::has('services')) {
                /* Storing services to the event */
                $services = Input::get('services');
                $data_services = array(
                    'start_service' => Input::get('start_day'),
                    'end_service' => Input::get('end_day'),
                );

                foreach ($services as $service) {
                    $event->services()->attach($service, $data_services);
                }

                /* Storing support material to the event */
                if(Input::hasFile('files')) {
                    $files = Input::file('files');

                    foreach ($files as $file) {
                        $new_name = str_random(20).'.'.$file->getClientOriginalExtension();
                        $file->move('./support_materials', $new_name);

                        $support_material_data = array(
                            'original_name' => $file->getClientOriginalName(),
                            'file' => 'support_materials/'.$new_name,
                        );

                        $support_material = new SupportMaterial($support_material_data);
                        $event->support_materials()->save($support_material);
                    }
                }

            }

            if(Input::has('resources_sources')) {
                /* Storing resources sources to the event */
                $resources_sources = Input::get('resources_sources');
                $event->resources_sources()->attach($resources_sources);
            }

            if(Input::has('witnesses')) {
                /* Storing witnesses to the event */
                $witnesses = Input::get('witnesses');
                $event->witnesses()->attach($witnesses);
            }

            return Redirect::to('dashboard')->with('alert', 'Evento creado exitosamente ' . $event->id_dci);
        }

        /*
         * Viewing an event information
         */
        /*public function viewEvent($id) {
            $event = EventDCI::find($id);
            if($event->user_id == Auth::user()->id) {
                $event['services']          = $event->services()->wherePivot('deleted_at', '=', NULL)->get();
                $event['resources_sources'] = $event->resources_sources()->wherePivot('deleted_at', '=', NULL)->get();
                $event['witnesses']         = $event->witnesses()->wherePivot('deleted_at', '=', NULL)->get();
                $event['support_materials'] = $event->support_materials()->get();
                return json_encode($event);
            }
            else {
                return Redirect::to('dashboard')->with('alert', 'Usted no tiene permisos para ver este evento');
            }
        }*/

        /*
         * Editing an event
         */
        public function editEvent() {

            /* Searching the event */
            $event = EventDCI::find(Input::get('id'));

            if(!isset($event)) {
                return Redirect::to('dashboard')
                            ->with('alert', 'No existe el evento especificado')
                            ->with('FORM_ENABLED','true')
                            ->with('action', 'edit')
                            ->withInput();
            }

            /* Validating that the event belongs to the user login user */
            if($event->user_id != Auth::user()->id) {
                return Redirect::to('dashboard')
                            ->with('alert', 'Usted no tiene permisos para modificar el evento especificado')
                            ->with('FORM_ENABLED','true')
                            ->with('action', 'edit')
                            ->withInput();
            }
            
            /* Verifying that event has a correct and valid data */
            $validation = $this->validateEvent();

            if(!$validation['isValid']) {
                return Redirect::to('dashboard')
                            ->with('alert', $validation['message'])
                            ->with('FORM_ENABLED','true')
                            ->with('action', 'edit')
                            ->withInput();
            }

            /* Updating the event */
            $event->name        = Input::get('name');
            $event->start_day   = Input::get('start_day');
            $event->end_day     = Input::get('end_day');
            $event->time        = Input::get('time');
            $event->place       = Input::get('place');
            $event->link        = Input::get('link');
            $event->directed_to = Input::get('directed_to');
            $event->has_cost    = !Input::has('has_cost');
            $event->description = Input::get('description');
            $event->save();

            $now = new DateTime();
            
            /* Getting old services, resources sources and witeness to the event */
            $old_services = $event->services()->get();
            $old_resources_sources = $event->resources_sources()->get();
            $old_witnesses = $event->witnesses()->get();
            
            /* Deactivating old services */
            foreach ($old_services as $old_service) {
                $event->services()->updateExistingPivot($old_service->id, array('deleted_at' => $now));
            }

            /* Deactivateing old resources sources */
            foreach ($old_resources_sources as $old_resource_source) {
                $event->resources_sources()->updateExistingPivot($old_resource_source->id, array('deleted_at' => $now));
            }

            /* Deactivateing old resources sources */
            foreach ($old_witnesses as $old_witness) {
                $event->witnesses()->updateExistingPivot($old_witness->id, array('deleted_at' => $now));
            }

            /* Getting information about diffusion */
            if(Input::has('services')) {
                
                /* Getting new services to the event */
                $new_services = Input::get('services');

                /* Updating old services and adding new services */
                foreach ($new_services as $new_service) {
                    $service_exist = false;
                    foreach ($old_services as $old_service) {
                        if($old_service['original']['pivot_service_id'] == $new_service) {
                            $service_exist = true;
                            $event->services()->updateExistingPivot($old_service->id, array('deleted_at' => NULL));
                            break;
                        }
                    }
                    if(!$service_exist) {
                        $data_services = array(
                            'start_service' => Input::get('start_day'),
                            'end_service' => Input::get('end_day'),
                        );

                        $event->services()->attach($new_service, $data_services);
                    }
                }

            //     /* Storing support material to the event */
            //     if(Input::hasFile('files')) {
            //         $files = Input::file('files');

            //         foreach ($files as $file) {
            //             $new_name = str_random(20).'.'.$file->getClientOriginalExtension();
            //             $file->move('./support_materials', $new_name);

            //             $support_material_data = array(
            //                 'file' => 'support_materials/'.$new_name,
            //             );

            //             $support_material = new SupportMaterial($support_material_data);
            //             $event->support_materials()->save($support_material);
            //         }
            //     }

            }

            if(Input::has('resources_sources')) {

                /* Getting new resources sources to the event */
                $new_resources_sources = Input::get('resources_sources');

                /* Updating old resources sources and adding new resources sources */
                foreach ($new_resources_sources as $new_resource_source) {
                    $resource_source_exist = false;
                    foreach ($old_resources_sources as $old_resource_source) {
                        if($old_resource_source['original']['pivot_resource_source_id'] == $new_resource_source) {
                            $resource_source_exist = true;
                            $event->resources_sources()->updateExistingPivot($old_resource_source->id, array('deleted_at' => NULL));
                            break;
                        }
                    }
                    if(!$resource_source_exist) {
                        $event->resources_sources()->attach($new_resource_source);
                    }
                }

            }

            if(Input::has('witnesses')) {

                /* Getting new resources sources to the event */
                $new_witnesses = Input::get('witnesses');

                /* Updating old resources sources and adding new resources sources */
                foreach ($new_witnesses as $new_witness) {
                    $witnesses_exist = false;
                    foreach ($old_witnesses as $old_witness) {
                        if($old_witness['original']['pivot_witness_id'] == $new_witness) {
                            $witnesses_exist = true;
                            $event->witnesses()->updateExistingPivot($old_witness->id, array('deleted_at' => NULL));
                            break;
                        }
                    }
                    if(!$witnesses_exist) {
                        $event->witnesses()->attach($new_witness);
                    }
                }

            }

            return Redirect::to('dashboard')->with('alert', 'Evento editado exitosamente ' . $event->id_dci);

        }

        /*
         * Applying soft deleting an event
         */
        public function deleteEvent() {
            $id = Input::get('id');
            $event = EventDCI::find($id);
            if($event->user_id == Auth::user()->id) {
                $event->delete();
                return Redirect::to('dashboard')->with('alert', 'Evento eliminado exitosamente ' . $event->id_dci);
            }
            else {
                return Redirect::to('dashboard')->with('alert', 'Usted no tiene permisos para eliminar este evento' . $event->id_dci);
            }
        }

        /*
         * Getting information about services requirements by area to panel of heads
         */
        public function serviceRequirementsByArea($area) {
            return EventDCI::with(
                array(
                    'services' => function($query) use ($area) {
                        $query  ->whereRaw('event_service.deleted_at IS NULL and services.department_id = ? and (dci_status = ? OR dci_status = ?)', 
                                    array($area, 'Pendiente', 'En Proceso')
                                )
                            ->orderBy('start_service');
                    }
                )
            )
            ->whereRaw('(dci_status = ? OR dci_status = ?)',
                array('Pendiente', 'En Proceso')
            )
            ->get();
        }

        /*
         * Verifying that an email has the standard construction
         */
        private function validateEmail($email) {
            return preg_match('/^[^0-9][a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[@][a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{2,4}$/', $email);
        }

        /*
         * Verifying that an url has a correct form
         */
        private function validateUrl($url) {
            return preg_match('|^http(s)?://[a-z0-9-]+(.[a-z0-9-]+)*(:[0-9]+)?(/.*)?$|i', $url);
        }

        /*
         *
         */
        public function validateEvent() {

            /* Verifying that user write a name to the event */
            if(!Input::has('name')) {
                return array('isValid' => false, 'message' => 'Nombre del evento requerido');
            }

            /* Verifying that the user select a start day to the event */
            if(!Input::has('start_day')) {
                return array('isValid' => false, 'message' => 'Fecha de inicio requerida');
            }

            /* Verifying that the user select a end day to the event */
            if(!Input::has('end_day')) {
                return array('isValid' => false, 'message' => 'Fecha de término requerida');
            }

            /* Verifying that the user select a time to the event */
            if(!Input::has('time')) {
                return array('isValid' => false, 'message' => 'Hora de evento requerido');
            }

            /* Verifying that the user write a place to the event */
            if(!Input::has('place')) {
                return array('isValid' => false, 'message' => 'Lugar de evento requerido');
            }

            /* Verifying that the link to the event has a correct form */
            if(Input::has('link')) {
                if(!$this->validateUrl(Input::get('link'))) {
                    return array('isValid' => false, 'message' => 'URL del evento no valido');
                }
            }

            /* Verifying that the event has audience target */
            if(!Input::has('directed_to')) {
                return array('isValid' => false, 'message' => 'Seleccione a quién va dirigido el evento');
            }

            /* Creating a PHP date objects to manipulate dates */
            $start_day = new DateTime(Input::get('start_day'));
            $end_day   = new DateTime(Input::get('end_day'));
            $now       = new DateTime();

            /* Verifying that the event end day is after now */
            if($end_day < $now) {
                return array('isValid' => false, 'message' => 'Fecha de término de evento anterior al día actual');
            }

            /* Verifying that the event start day is before event end day */
            if($start_day > $end_day) {
                return array('isValid' => false, 'message' => 'Fecha de inicio de evento posterior a fecha de término');
            }
            
            return array('isValid' => true, 'message' => '');
        
        }

    }