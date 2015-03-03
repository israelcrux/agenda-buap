<?php

    class DepartmentController extends BaseController {

        /*
         * Return all departments
         */
        public function view() {

            return Department::all();

        }

        /*
         * Create a new department
         */
        public function add() {

            /* Requesting validation */
            $validation = $this->validateDepartment('add');

            /* Checking if the validation was valid */
            if(!$validation['isValid']){
                return '{"status":"error","message":'.$validation['message'].'}';
            }

            /* Creating the data to save */
            $department_data = array(
                'name'          => Input::get('name'),
                'description'   => Input::get('description'),
            );

            /* Creating the new Service */
            $department = Department::create($department_data);

            /* Checking if the creation was correct */
            if(is_null($department)) {
                return '{"status":"error","message":"No se ha podido añadir el nuevo Departamento, recarge e intente de nuevo"}';
            }

            return '{"status":"success","message":"Nuevo Departamento"}';

        }

        /*
         * Edit a Department
         */
        public function edit() {

            /* Getting the Department */
            $department = Department::find(Input::get('id'));

            /* Cheking if the department exists */
            if(is_null($department)) {
                return '{"status":"error","message":"El Departamento no existe"}';
            }

            /* Checking if the user has the rights to update units */
            if(Auth::user()->user_type_id != 4) {
                return '{"status":"error","message":"Usted no tiene permisos para editar esta sección"}';
            }

            /* Validating data */
            $validation = $this->validateDepartment('edit');

            if(!$validation['isValid']) {
                return '{"status":"error","message":'.$validation['message'].'}';
            }

            /* Updating information */
            $department->name        = Input::get('name');
            $department->description = Input::get('description');
            $department->save();

            if(is_null($department)) {
                return '{"status":"error","message":"Ha ocurrido un error al actualizar el Departamento, recargue e intente nuevamente"}';
            }
            return '{"status":"success","message":"El Departamento ha sido actualizado"}';

        }

        /*
         * Soft Delete to a Department
         */
        public function delete() {

            /* Getting the Academic/Administrative Unit */
            $department = Department::find(Input::get('id'));

            /* Cheking if the unit exists */
            if(is_null($department)) {
                return '{"status":"error","message":"El Departamento no existe"}';
            }

            /* Checking if the user has the rights to update units */
            if(Auth::user()->user_type_id != 4) {
                return '{"status":"error","message":"Usted no tiene permisos para editar esta sección"}';
            }

            $department->delete();

            return '{"status":"success","message":"El Departamento ha sido eliminado"}';

        }

        /*
         * Validate the data to add or edit a service
         */
        private function validateDepartment($type) {

            /* Checking the type of validation to do */
            $except_id = '';
            if($type == 'edit') {
                $except_id = ','.Input::get('id');
            }

            /* Making the validator */
            $validator = Validator::make(
                Input::all(),
                array(
                    'name' => 'required|max:100|unique:departments,name'.$except_id,
                )
            );

            /* Check if the validation has errors */
            if($validator->fails()) {
                return array('isValid' => false, 'message' => $validator->messages());
            }

            return array('isValid' => true, 'message' => '');

        }

    }