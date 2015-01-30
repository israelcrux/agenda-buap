<?php 

    use Illuminate\Support\MessageBag;

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

            if(is_null($event)) {
                return Redirect::to('dashboard')
                        ->with('alert', 'Error al crear evento, intente nuevamente')
                        ->with('FORM_ENABLED','true')
                        ->with('action','add')
                        ->withInput();
            }

            /* Getting information about diffusion */
            if(Input::has('services')) {
                /* Getting, validating and storing services to the event */
                $services = Input::get('services');
                $data_services = array(
                    'start_service' => Input::get('start_day'),
                    'end_service' => Input::get('end_day'),
                );

                foreach ($services as $service) {
                    if($this->validateArrayElement($service, 'string')) {
                        $event->services()->attach($service, $data_services);
                    }
                    else {
                        return Redirect::to('dashboard')
                            ->with('alert', 'Los servicios recibidos no son válidos')
                            ->with('FORM_ENABLED','true')
                            ->with('action','add')
                            ->withInput();
                    }
                }

                /* Getting, validating and storing support material to the event */
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
                        $support_material = $event->support_materials()->save($support_material);

                        if(is_null($support_material)) {
                            return Redirect::to('dashboard')
                            ->with('alert', 'Error al subir material de soporte, vuelva a intentarlo')
                            ->with('FORM_ENABLED','true')
                            ->with('action','add')
                            ->withInput();
                        }
                    }
                }

            }

            if(Input::has('resources_sources')) {
                /* Getting, validating and storing resources sources to the event */
                $resources_sources = Input::get('resources_sources');

                foreach ($resources_sources as $resource_source) {
                    if($this->validateArrayElement($resource_source, 'string')) {
                        $event->resources_sources()->attach($resource_source);
                    }
                    else {
                        return Redirect::to('dashboard')
                            ->with('alert', 'Las fuentes de recursos recibidas no son válidas')
                            ->with('FORM_ENABLED','true')
                            ->with('action','add')
                            ->withInput();
                    }
                }
            }

            if(Input::has('witnesses')) {
                /* Getting, validating and storing witnesses to the event */
                $witnesses = Input::get('witnesses');

                foreach ($witnesses as $witness) {
                    if($this->validateArrayElement($witness, 'string')) {
                        $event->witnesses()->attach($witness);
                    }
                    else {
                        return Redirect::to('dashboard')
                            ->with('alert', 'Los testigos recibidos no son válidos')
                            ->with('FORM_ENABLED','true')
                            ->with('action','add')
                            ->withInput();
                    }
                }
            }

            return Redirect::to('dashboard')->with('alert', 'Evento creado exitosamente ' . $event->id_dci);

        }

        /*
         * Editing an event
         */
        public function editEvent() {

            /* Searching the event */
            $event = EventDCI::find(Input::get('id'));

            if(is_null($event)) {
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
                    if($this->validateArrayElement($new_service, 'string')) {
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
                    else {
                        return Redirect::to('dashboard')
                            ->with('alert', 'Los servicios actualizados no son válidos')
                            ->with('FORM_ENABLED','true')
                            ->with('action','edit')
                            ->withInput();
                    }
                }

                /* Updating support material to the event */
                $new_support_materials = empty(Input::get('support_materials')) ? array() : Input::get('support_materials');
                $old_support_materials = $event->support_materials()->get();

                /* Soft deleting to files deleted by user */
                foreach ($old_support_materials as $old_support_material) {
                    if(!in_array($old_support_material->file, $new_support_materials)) {
                        $old_support_material->delete();
                    }
                }

                /* Inserting new files added by user */
                if(Input::hasFile('files')) {
                    $files = Input::file('files');

                    foreach ($files as $file) {
                        $new_name = str_random(20).'.'.$file->getClientOriginalExtension();
                        $file->move('./support_materials', $new_name);

                        $support_material_data = array(
                            'file' => 'support_materials/'.$new_name,
                        );

                        $support_material = new SupportMaterial($support_material_data);
                        $event->support_materials()->save($support_material);
                    }
                }

            }

            if(Input::has('resources_sources')) {

                /* Getting new resources sources to the event */
                $new_resources_sources = Input::get('resources_sources');

                /* Updating old resources sources and adding new resources sources */
                foreach ($new_resources_sources as $new_resource_source) {
                    if($this->validateArrayElement($new_resource_source, 'string')) {
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
                    else {
                        return Redirect::to('dashboard')
                            ->with('alert', 'Las fuentes de recursos actualizadas no son válidas')
                            ->with('FORM_ENABLED','true')
                            ->with('action','edit')
                            ->withInput();
                    }
                }

            }

            if(Input::has('witnesses')) {

                /* Getting new resources sources to the event */
                $new_witnesses = Input::get('witnesses');

                /* Updating old resources sources and adding new resources sources */
                foreach ($new_witnesses as $new_witness) {
                    if($this->validateArrayElement($new_witness, 'string')) {
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
                    else {
                        return Redirect::to('dashboard')
                            ->with('alert', 'Los testigos actualizados no son válidos')
                            ->with('FORM_ENABLED','true')
                            ->with('action','edit')
                            ->withInput();
                    }
                }

            }

            return Redirect::to('dashboard')->with('alert', 'Evento editado exitosamente ' . $event->id_dci);

        }

        /*
         * Applying soft deleting an event
         */
        public function deleteEvent() {
            $event = EventDCI::find(Input::get('id'));
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
            
            $events = EventDCI::with(
                array(
                    'services' => 
                        function($query) use ($area) {
                            $query->whereRaw('event_service.deleted_at IS NULL and services.department_id = ?', 
                                        array($area)
                                    )
                                ->orderBy('start_service');
                        }
                )
            )
            ->whereHas('services', 
                function($query) use ($area) {
                    $query  ->whereRaw('`event_service`.`deleted_at` IS NULL and `services`.`department_id` = ? and (`dci_status` = ? OR `dci_status` = ?)', 
                                array($area, 'Pendiente', 'En Proceso')
                            );
                }
            )
            ->whereRaw('(`events`.`dci_status` = ? OR `events`.`dci_status` = ?)',
                array('Pendiente', 'En Proceso')
            )
            ->get();

            foreach ($events as $event) {
                foreach ($event['services'] as $service) {
                    $service['tasks'] = $service->pivot->tasks()->get();
                }
            }

            return $events;

        }

        /*
         * Validator for adding and editing an event
         */
        private function validateEvent() {

            /* Getting the actual date to validation */
            $now = date('Y-m-d', strtotime("-1 days"));


            /* Creating a event validator */
            $validator = Validator::make(
                Input::all(),
                array(
                    'name'              => 'required',
                    'start_day'         => 'required|date|before:'.Input::get('end_day'),
                    'end_day'           => 'required|date|after:'.Input::get('start_day').'|after:'.$now,
                    'time'              => 'required',
                    'place'             => 'required',
                    'link'              => 'url',
                    'directed_to'       => 'required',
                    'services'          => 'array',
                    'resources_sources' => 'array',
                    'witnesses'         => 'array',
                    'files'             => 'array',
                )
            );

            /* Check if validation is correct */
            if($validator->fails()) {
                return array('isValid' => false, 'message' => $validator->messages());
            }

            /* Validating uploaded files */
            if(Input::hasFile('files')) {

                $error_files = new MessageBag();
                $error = false;

                foreach (Input::file('files') as $file) {

                    $validator_file = Validator::make(
                        array(
                            'file' => $file
                        ),
                        array(
                            'file' => 'mimes:jpg,jpeg,png,bmp,pdf,doc,docx,ppt,pptx,zip,rar|max:2024',
                        ),
                        array(
                            'file.mimes' => 'Archivo '.$file->getClientOriginalName().' con formato inválido',
                            'file.max'   => 'Archivo '.$file->getClientOriginalName().' con peso superior a :max kilobytes',
                        )
                    );

                    if($validator_file->fails()) {
                        $error = true;

                        foreach ($validator_file->messages()->all() as $message) {
                            $error_files->add(str_random(5), $message);
                        }
                    }
                
                }

                if($error) {
                    return array('isValid' => false, 'message' => $error_files);
                }

            }
                
            return array('isValid' => true, 'message' => '');
        
        }

        /*
         * Validator of array types
         */
        private function validateArrayElement($element, $type) {
        
            return gettype($element) == $type ? true : false;
        
        }


    }