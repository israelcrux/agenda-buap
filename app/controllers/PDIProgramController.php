<?php

    class PDIProgramController extends BaseController {

        /*
         * Return all PDI Programs
         */
        public function view() {

            return PDIProgram::all();

        }

        /*
         * Create a new PDI Program
         */
        public function add() {

            /* Requesting validation */
            $validation = $this->validatePDIProgram('add');

            /* Checking if the validation was valid */
            if(!$validation['isValid']){
                return '{"status":"error","message":'.$validation['message'].'}';
            }

            /* Creating the data to save */
            $pdi_program_data = array(
                'name'        => Input::get('name'),
                'description' => Input::get('description'),
            );

            /* Creating the new Service */
            $pdi_program = PDIProgram::create($pdi_program_data);

            /* Checking if the creation was correct */
            if(is_null($pdi_program)) {
                return '{"status":"error","message":"No se ha podido añadir el nuevo Programa PDI, recarge e intente de nuevo"}';
            }

            return '{"status":"success","message":"Nuevo Programa PDI"}';

        }

        /*
         * Edit a Department
         */
        public function edit() {

            /* Getting the Department */
            $pdi_program = PDIProgram::find(Input::get('id'));

            /* Cheking if the department exists */
            if(is_null($pdi_program)) {
                return '{"status":"error","message":"El Departamento no existe"}';
            }

            /* Checking if the user has the rights to update units */
            if(Auth::user()->user_type_id != 4) {
                return '{"status":"error","message":"Usted no tiene permisos para editar esta sección"}';
            }

            /* Validating data */
            $validation = $this->validatePDIProgram('edit');

            if(!$validation['isValid']) {
                return '{"status":"error","message":'.$validation['message'].'}';
            }

            /* Updating information */
            $pdi_program->name        = Input::get('name');
            $pdi_program->description = Input::get('description');
            $pdi_program->save();

            if(is_null($pdi_program)) {
                return '{"status":"error","message":"Ha ocurrido un error al actualizar el Departamento, recargue e intente nuevamente"}';
            }
            return '{"status":"success","message":"El Departamento ha sido actualizado"}';

        }

        /*
         * Soft Delete to a PDI Program
         */
        public function delete() {

            /* Getting the Academic/Administrative Unit */
            $pdi_program = PDIProgram::find(Input::get('id'));

            /* Cheking if the unit exists */
            if(is_null($pdi_program)) {
                return '{"status":"error","message":"El Departamento no existe"}';
            }

            /* Checking if the user has the rights to update units */
            if(Auth::user()->user_type_id != 4) {
                return '{"status":"error","message":"Usted no tiene permisos para editar esta sección"}';
            }

            $pdi_program->delete();

            return '{"status":"success","message":"El Departamento ha sido eliminado"}';

        }

        /*
         * Validate the data to add or edit a service
         */
        private function validatePDIProgram($type) {

            /* Checking the type of validation to do */
            $except_id = '';
            if($type == 'edit') {
                $except_id = ','.Input::get('id');
            }

            /* Making the validator */
            $validator = Validator::make(
                Input::all(),
                array(
                    'name' => 'required|max:100|unique:pdi_programs,name'.$except_id,
                )
            );

            /* Check if the validation has errors */
            if($validator->fails()) {
                return array('isValid' => false, 'message' => $validator->messages());
            }

            return array('isValid' => true, 'message' => '');

        }

    }