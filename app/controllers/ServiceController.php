<?php

	class ServiceController extends BaseController {

		/*
		 * Return all services
		 */
		public function view() {
			return Service::with('department')->get();
		}

		/*
		 * Create a new service
		 */
		public function add() {

			/* Requesting validation */
            $validation = $this->validateService('add');

            /* Checking if the validation was valid */
            if(!$validation['isValid']){
                return '{"status":"error","message":'.$validation['message'].'}';
            }

            /* Creating the data to save */
            $service_data = array(
				'name'          => Input::get('name'),
				'description'   => Input::get('type'),
				'observations'  => Input::get('type'),
				'department_id' => Input::get('department_id'),
            );

            /* Creating the new Service */
            $service = Service::create($service_data);

            /* Checking if the creation was correct */
            if(is_null($service)) {
                return '{"status":"error","message":"No se ha podido añadir el nuevo Servicio, recarge e intente de nuevo"}';
            }

            return '{"status":"success","message":"Nuevo Servicio"}';

		}

		/*
		 * Edit an existing service
		 */
		public function edit() {

		}

		/*
		 * Delete a service
		 */
		public function delete() {

		}

		/*
		 * Validate the data to add or edit a service
		 */
		private function validateService($type) {

            /* Checking the type of validation to do */
			$except_id = '';
			if($type == 'edit') {
				$except_id = ','.Input::get('id');
			}

			/* Making the validator */
			$validator = Validator::make(
				Input::all(),
				array(
					'name'          => 'required|max:100|unique:services,name'.$except_id,
					'department_id' => 'required|integer',
				)
			);

			/* Check if the validation has errors */
            if($validator->fails()) {
                return array('isValid' => false, 'message' => $validator->messages());
            }

            return array('isValid' => true, 'message' => '');

		}

	}
