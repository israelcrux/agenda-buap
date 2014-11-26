<?php 

    class EventController extends BaseController {

        public function eventsByUser($user_id) {
            $events = EventDCI::where('user_id', '=', $user_id)
                                ->where('user_status', '=', 'Activo')
                                ->orderBy('time')->get();
            return json_encode($events);
        }

        /*
         * Return a JSON that contains all events for a certain year and month
        */
        public function calendar($year_month) {

            /* Getting the data and creating the first and last day of a month */
            $start_date = date('Y-m-d', strtotime($year_month.'-01'));
            $end_date   = date('Y-m-t', strtotime($year_month.'-01'));

            /* Querying the database to get the events for all days of certain month of the year */
            $calendar   = [];
            $activities = [];
            while($start_date <= $end_date) {

                $events = EventDCI::whereRaw('end_day >= ? and start_day <= ? and (dci_status = ? or dci_status = ?) and user_status = ?', 
                    array($start_date, $start_date, 'En Proceso', 'Aprobado', 'Activo'))
                    ->orderBy('time')->get();

                $activities['activities'] = $events->toArray();
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

            /* Verifying that user write a name to the event */
            if(!Input::has('name')) {
                return Redirect::back()->with('alert', 'Nombre del evento requerido')->with('FORM_ENABLED','true')->withInput();
            }

            /* Verifying that the user select a start day to the event */
            if(!Input::has('start_day')) {
                return Redirect::back()->with('alert', 'Fecha de inicio requerida')->with('FORM_ENABLED','true')->withInput();
            }

            /* Verifying that the user select a end day to the event */
            if(!Input::has('end_day')) {
                return Redirect::back()->with('alert', 'Fecha de término requerida')->with('FORM_ENABLED','true')->withInput();
            }

            /* Verifying that the user select a time to the event */
            if(!Input::has('time')) {
                return Redirect::back()->with('alert', 'Hora de evento requerido')->with('FORM_ENABLED','true')->withInput();
            }

            /* Verifying that the user write a place to the event */
            if(!Input::has('place')) {
                return Redirect::back()->with('alert', 'Lugar de evento requerido')->with('FORM_ENABLED','true')->withInput();
            }

            /* Verifying that the link to the event has a correct form */
            if(Input::has('link')) {
                if(!$this->validateUrl(Input::get('link'))) {
                    return Redirect::back()->with('alert', 'URL del evento no valido')->with('FORM_ENABLED','true')->withInput();
                }
            }

            /* Verifying that the event has audience target */
            if(!Input::has('directed_to')) {
                return Redirect::back()->with('alert', 'Seleccione a quién va dirigido el evento')->with('FORM_ENABLED','true')->withInput();
            }

            /* Creating a PHP date objects to manipulate dates */
            $start_day = new DateTime(Input::get('start_day'));
            $end_day   = new DateTime(Input::get('end_day'));
            $now       = new DateTime();

            /* Verifying that the event end day is after now */
            if($end_day < $now) {
                return Redirect::back()->with('alert', 'Fecha de término de evento anterior al día actual')->with('FORM_ENABLED','true')->withInput();
            }

            /* Verifying that the event start day is before event end day */
            if($start_day > $end_day) {
                return Redirect::back()->with('alert', 'Fecha de inicio de evento posterior a fecha de término')->with('FORM_ENABLED','true')->withInput();
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
                $event->resource_source()->attach($resources_sources);
            }

            if(Input::has('witnesses')) {
                /* Storing witnesses to the event */
                $witnesses = Input::get('witnesses');
                $event->witnesses()->attach($witnesses);
            }

            return Redirect::to('dashboard')->with('alert', 'Evento creado exitosamente ' . $event->id_dci);
        }

        /*
         * Editing an event
        */
        public function editEvent() {
            
        }

        /*
         * Deleting an event, in database user_status inactive
        */
        public function deleteEvent() {
            $id = Input::get('id');
            $event = EventDCI::find($id);
            if($event->user_id == Auth::user()->id) {
                $event->user_status = 'Inactivo';
                $event->save();
                return Redirect::to('dashboard')->with('alert', 'Evento eliminado exitosamente' . $event->id_dci);
            }
            else {
                return Redirect::to('dashboard')->with('alert', 'Usted no tiene permisos para eliminar este evento' . $event->id_dci);
            }
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

    }