<?php 

    class EventController extends BaseController {

        public function showEvents($year_month) {

            $start_date = date('Y-m-d', strtotime($year_month.'-01'));
            $end_date = date('Y-m-t', strtotime($year_month.'-01'));

            $calendar = [];
            $activities = [];
            while($start_date <= $end_date) {
                $events = EventDCI::where('start_day', '=', $start_date)->orderBy('time')->get(array('name', 'place', 'time'));

                //if(count($events)) {
                $activities['activities'] = $events->toArray();
                array_push($calendar, $activities);
                $activities = [];
                //}

                $next_date = new DateTime($start_date);
                $next_date->add(new DateInterval('P1D'));
                $s_next_date = $next_date->format('Y-m-d');
                $start_date = explode(' ', $s_next_date)[0];
            }

            return json_encode($calendar);

        }

        public function addEvent() {

            if(!Input::has('name')) {
                return Redirect::to('event')->with('alert', 'Nombre del evento requerido')->withInput();
            }
            if(!Input::has('start_day')) {
                return Redirect::to('event')->with('alert', 'Fecha de inicio requerida')->withInput();
            }
            if(!Input::has('end_day')) {
                return Redirect::to('event')->with('alert', 'Fecha de término requerida')->withInput();
            }
            if(!Input::has('place')) {
                return Redirect::to('event')->with('alert', 'Lugar de evento requerido')->withInput();
            }
            if(!Input::has('time')) {
                return Redirect::to('event')->with('alert', 'Hora de evento requerido')->withInput();
            }
            if(!Input::has('head_name')) {
                return Redirect::to('event')->with('alert', 'Nombre de responsable requerido')->withInput();
            }
            if(!Input::has('head_email')) {
                return Redirect::to('event')->with('alert', 'E-mail de responsable requerido')->withInput();
            }
            if(!Input::has('head_phone')) {
                return Redirect::to('event')->with('alert', 'Teléfono de responsable requerido')->withInput();
            }

            $start_day = new DateTime(Input::get('start_day'));
            $end_day = new DateTime(Input::get('end_day'));
            $now = new DateTime();

            if($end_day < $now) {
                return Redirect::to('event')->with('alert', 'Fecha de término de evento anterior al día actual')->withInput();
            }

            if($start_day > $end_day) {
                return Redirect::to('event')->with('alert', 'Fecha de inicio de evento no puede ser posterior a fecha de término')->withInput();
            }

            $email = Input::get('head_email');
            if(!$this->validateEmail($email)) {
                return Redirect::to('event')->with('alert', 'E-mail de responsable inválido')->withInput();
            }

            $event_data = array(
                'id_dci' => strftime('%y%m%d'),
                'name' => Input::get('name'),
                'start_day' => Input::get('start_day'),
                'end_day' => Input::get('end_day'),
                'place' => Input::get('place'),
                'time' => Input::get('time'),
                'head_name' => Input::get('head_name'),
                'head_email' => Input::get('head_email'),
                'head_phone' => Input::get('head_phone'),
                'description' => Input::get('description'),
                'user_id' => Auth::user()->id
            );

            $event = EventDCI::create($event_data);

            // $event = new EventDCI;
            // $event->id_dci = strftime('%y%m%d');
            // $event->name = Input::get('name');
            // $event->start_day = Input::get('start_day');
            // $event->end_day = Input::get('end_day');
            // $event->place = Input::get('place');
            // $event->time = Input::get('time');
            // $event->head_name = Input::get('head_name');
            // $event->head_email = Input::get('head_email');
            // $event->head_phone = Input::get('head_phone');
            // $event->description = Input::get('description');
            // $event->user_id = Auth::user()->id;
            // $event->save();

            return Redirect::to('dashboard')->with('alert', 'Evento creado exitosamente '.$event->id_dci);
        }


        private function validateEmail($email) {
            if(preg_match('/^[^0-9][a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[@][a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{2,4}$/', $email)) {
                return true;
            }
            return false;
        }

    }