<?php 

    class EventController extends BaseController {

        public function eventsByUser($user_id) {
            $events = EventDCI::where('user_id', '=', $user_id)->orderBy('time')->get();
            return json_encode($events);
        }

        /*
         * Return a JSON that contains all events for a certain year and month
        */
        public function calendar($year_month) {

            /* Getting the data and creating the first and last day of a month */
            $start_date = date('Y-m-d', strtotime($year_month.'-01'));
            $end_date = date('Y-m-t', strtotime($year_month.'-01'));

            /* Querying the database to get the events for all days of certain month of the year */
            $calendar = [];
            $activities = [];
            while($start_date <= $end_date) {

                $events = EventDCI::where('end_day', '>=', $start_date)
                    ->where('start_day', '<=', $start_date)
                    ->orderBy('time')->get();

                $activities['activities'] = $events->toArray();
                array_push($calendar, $activities);
                $activities = [];

                $next_date = new DateTime($start_date);
                $next_date->add(new DateInterval('P1D'));
                $s_next_date = $next_date->format('Y-m-d');
                $start_date = explode(' ', $s_next_date)[0];
            }

            return json_encode($calendar);

        }

        /*
         * Adding an event to the database
        */
        public function addEvent() {

            /* Verifying that user write a name to the event */
            if(!Input::has('name')) {
                return Redirect::to('event')->with('alert', 'Nombre del evento requerido')->withInput();
            }

            /* Verifying that the user select a start day to the event */
            if(!Input::has('start_day')) {
                return Redirect::to('event')->with('alert', 'Fecha de inicio requerida')->withInput();
            }

            /* Verifying that the user select a end day to the event */
            if(!Input::has('end_day')) {
                return Redirect::to('event')->with('alert', 'Fecha de término requerida')->withInput();
            }

            /* Verifying that the user select a time to the event */
            if(!Input::has('time')) {
                return Redirect::to('event')->with('alert', 'Hora de evento requerido')->withInput();
            }

            /* Verifying that the user write a place to the event */
            if(!Input::has('place')) {
                return Redirect::to('event')->with('alert', 'Lugar de evento requerido')->withInput();
            }
            
            /* Creating a PHP date objects to manipulate dates */
            $start_day = new DateTime(Input::get('start_day'));
            $end_day = new DateTime(Input::get('end_day'));
            $now = new DateTime();

            /* Verifying that the event end day is after now */
            if($end_day < $now) {
                return Redirect::to('event')->with('alert', 'Fecha de término de evento anterior al día actual')->withInput();
            }

            /* Verifying that the event start day is before event end day */
            if($start_day > $end_day) {
                return Redirect::to('event')->with('alert', 'Fecha de inicio de evento no puede ser posterior a fecha de término')->withInput();
            }

            /* Collecting all event data to store */
            $event_data = array(
                'id_dci' => strftime('%y%m%d'),
                'name' => Input::get('name'),
                'start_day' => Input::get('start_day'),
                'end_day' => Input::get('end_day'),
                'time' => Input::get('time'),
                'place' => Input::get('place'),
                'description' => Input::get('description'),
                'user_id' => Auth::user()->id
            );

            /* Creating and storing the event */
            $event = EventDCI::create($event_data);

            return Redirect::to('dashboard')->with('alert', 'Evento creado exitosamente '.$event->id_dci);
        }

        /*
         * Verifying that an email has the standard construction
        */
        private function validateEmail($email) {
            if(preg_match('/^[^0-9][a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[@][a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{2,4}$/', $email)) {
                return true;
            }
            return false;
        }

    }