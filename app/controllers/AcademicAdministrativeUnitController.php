<?php

    class AcademicAdministrativeUnitController extends BaseController {

        public function view() {
            return AcademicAdministrativeUnit::all();
        }

        /*
         * Create a new Academic or Administrative Unit
         */
        public function add() {

            /* Requesting validation */
            $validation = $this->validateUnit('add');

            /* Checking if the validation was valid */
            if(!$validation['isValid']){
                return '{"status":"error","message":'.$validation['message'].'}';
            }

            /* Creating the data to save */
            $unit_data = array(
                'name' => Input::get('name'),
                'type' => Input::get('type')
            );

            /* Creating the new Academic/Administrative Unit */
            $unit = AcademicAdministrativeUnit::create($unit_data);

            /* Checking if the creation was correct */
            if(is_null($unit)) {
                return '{"status":"error","message":"No se ha podido añadir la nueva Unidad Académica/Administrativa, recarge e intente de nuevo"}';
            }

            return '{"status":"success","message":"Nueva Unidad Académica/Administrativa"}';

        }

        /*
         * Edit an Academic or Administrative Unit
         */
        public function edit() {

            /* Getting the Academic/Administrative Unit */
            $unit = AcademicAdministrativeUnit::find(Input::get('id'));

            /* Cheking if the unit exists */
            if(is_null($unit)) {
                return '{"status":"error","message":"La nueva Unidad Académica/Administrativa no existe"}';
            }

            /* Checking if the user has the rights to update units */
            if(Auth::user()->user_type_id != 4) {
                return '{"status":"error","message":"Usted no tiene permisos para editar esta sección"}';
            }

            /* Validating data */
            $validation = $this->validateUnit('edit');

            if(!$validation['isValid']) {
                return '{"status":"error","message":'.$validation['message'].'}';
            }

            /* Updating information */
            $unit->name = Input::get('name');
            $unit->type = Input::get('type');
            $unit->save();

            if(is_null($unit)) {
                return '{"status":"error","message":"Ha ocurrido un error al actualizar la Unidad Académica/Administrativa, recargue e intente nuevamente"}';
            }
            return '{"status":"success","message":"La Unidad Académica/Administrativa ha sido actualizada"}';

        }

        /*
         * Soft Delete to an Academic or Administrative Unit
         */
        public function delete() {

            /* Getting the Academic/Administrative Unit */
            $unit = AcademicAdministrativeUnit::find(Input::get('id'));

            /* Cheking if the unit exists */
            if(is_null($unit)) {
                return '{"status":"error","message":"La nueva Unidad Académica/Administrativa no existe"}';
            }

            /* Checking if the user has the rights to update units */
            if(Auth::user()->user_type_id != 4) {
                return '{"status":"error","message":"Usted no tiene permisos para editar esta sección"}';
            }

            $unit->delete();

            return '{"status":"success","message":"La Unidad Académica/Administrativa ha sido eliminada"}';
        }

        /*
         * Check if the information to add or edit an
         * Academic or Administrative Unit is valid
         */
        private function validateUnit($type) {

            /* Checking the type of validation to do */
            $except_id = '';
            if($type == 'edit') {
                $except_id = ','.Input::get('id');
            }

            /* Making the validator */
            $validator = Validator::make(
                Input::all(),
                array(
                    'name' => 'required|unique:academic_administrative_units,name'.$except_id,
                    'type' => 'required|alpha_dash|exists:academic_administrative_units,type'
                )
            );

            /* Check if the validation has errors */
            if($validator->fails()) {
                return array('isValid' => false, 'message' => $validator->messages());
            }

            return array('isValid' => true, 'message' => '');

        }

    }