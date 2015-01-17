<section  ng-controller="DashboardController">

	<div class="ar-modal-background" ng-show="eventToCancel"></div>
	<div class="ar-modal-wrapper" ng-show="eventToCancel">
		<div class="ar-modal-container">
			<div class="ar-modal-title">Cancelar Evento</div>
			<div class="ar-modal-closebtn" ng-click="eventToCancel=false;"></div>
			<div class="ar-modal-content">
				
				<div class="ar-vwrap ar-padder">

					<h3>{{eventToCancel.name}}</h3>
					<p>
						El evento aparecerá cancelado en Agenda Universitaria en caso de estar publicado, y todas las solicitudes de difusión
						se darán de baja, esta acción no se puede revertir, ¿Desea proceder a la cancelación del evento?
					</p>

					<div class="ar-btn-group" role="group" aria-label="...">
						<?php echo Form::open(array('url' => 'event/delete', 'method' => 'post', 'role' => 'form', 'class' => 'noform')); ?>
							<input type="hidden" ng-value="eventToCancel.id" name="id" id="id" style="display:none !important;">
							<input type="submit" class="ar-flatbtn ar-cancelbtn" value="Cancelar Evento">
						<?php echo Form::close(); ?>
						<button ng-click="eventToCancel=false;" class="btn btn-primary">No hacer nada</button>
					</div>

				</div>

			</div>
		</div>
	</div>

	<div class="ar-modal-background" ng-show="FORM_ENABLED||new_event"></div>
	<div class="ar-modal-wrapper" ng-show="FORM_ENABLED||new_event">
		<div class="ar-modal-container">
			<div class="ar-modal-title">Agendar Evento</div>
			<div class="ar-modal-closebtn" ng-click="new_event=false;FORM_ENABLED=false;"></div>
			<div class="ar-modal-content">

				<div class="ar-form-container ar-vwrap">
				<?php echo Form::open(array('url' => 'event/add', 'method' => 'post', 'role' => 'form', 'enctype'=> 'multipart/form-data', 'class' => 'form-horizontal')); ?>
					
					<div class="col-xs-12 col-sm-4">
						<input type="text" class="form-horizontal" name="name" id="name" placeholder="Nombre del evento" autocomplete="off" required value="<?php echo Input::old('name'); ?>">
						
						<?php /* type date */?>
						<input class="datepicker" type="text"  pattern="^[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]$" name="start_day" id="start_day" placeholder="Fecha de inicio" autocomplete="off" required value="<?php echo Input::old('start_day'); ?>">
						<?php /* type date */?>
						<input class="datepicker" type="text"  pattern="^[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]$" name="end_day" id="end_day" placeholder="Fecha de término" autocomplete="off" required value="<?php echo Input::old('end_day'); ?>">
						<?php /* type time */?>
						<input type="time" name="time" id="time" placeholder="Hora de inicio hh:mm" autocomplete="off" required value="17:00:00" value="<?php echo Input::old('time'); ?>">
						
						<input type="text" class="form-horizontal" name="place" id="place" placeholder="Lugar" required value="<?php echo Input::old('place'); ?>">
						<input type="url" class="form-horizontal" name="link" id="link" placeholder="URL del evento" value="<?php echo Input::old('link'); ?>">

						
						<p>Dirigido a</p>
						<select name="directed_to" id="directed_to">
							<option value="Público en general">Público en general</option>
							<option value="Comunidad BUAP">Comunidad BUAP</option>
							<option value="Profesores/Investigadores">Profesores/Investigadores</option>
							<option value="Estudiantes">Estudiantes</option>
						</select>
						
						<textarea name="description" id="description" placeholder="Descripción"><?php echo Input::old('description'); ?></textarea>
						
						<div class="checkbox">
							<label>
								<input 	name="has_cost"
										id="has_cost" 
										type="checkbox" 
										<?php 
											if(Input::old('has_cost')) {
												echo 'checked="checked"';
											}
										?>
										> El evento es gratuito
							</label>
						</div>
					</div>
					<div class="col-xs-12 col-sm-4">

						<div class="checkbox">
							<label>
								<input 	name="request_diffusion" 
										ng-model="diff" 
										type="checkbox" 
										<?php 
											if(Input::old('request_diffusion')) {
												echo 'checked="checked"';
											}
										?>
										> Solicitar difusión
							</label>
						</div>
						
						<div ng-show="diff" >
							
							<p>Servicios de difusión a solicitar:</p>	

							<ul class="ar-plist">
								<?php foreach($services as $service) {  ?>
	                                <li>
	                                    <div class="checkbox">
	                                        <label>
	                                            <input 
	                                                name="services[]" 
	                                                type="checkbox"
	                                                value="<?php echo $service['id']; ?>"
	                                                <?php 
	                                                	if(Input::old('services')){
		                                                	$old_services = Input::old('services');
		                                                	foreach ($old_services as $old_service) {
		                                                		if ($service['id'] == $old_service) {
		                                                			echo 'checked="checked"';
		                                                			break;
		                                                		}
		                                                	}
	                                                	}
	                                                ?>
	                                                > <?php echo $service['name']; ?>
	                                        </label>
	                                    </div>
	                                </li>
	                            <?php } ?>				
							</ul>
							
							<input type="file" id="files" name="files[]" ng-model="fileInput" multiple style="display:none;">
							<div id="filebtn" class="btn btn-sourcefiles">
								Adjuntar material de apoyo
							</div>

							<p></p>
							<p></p>
							<p class="ar-ptitle">
								Fuente de Recursos
							</p>
							<ul>
								<?php foreach ($resources_sources as $resource_source) { ?>
	                                <li class="col-xs-12 col-sm-6">
	                                    <div class="checkbox">
	                                        <label>
	                                            <input 
	                                            	name="resources_sources[]"
	                                                type="checkbox"
	                                                value="<?php echo $resource_source['id']; ?>"
	                                                <?php 
	                                                	if(Input::old('resources_sources')) {
	                                                		$old_resources_sources = Input::old('resources_sources');
	                                                		foreach ($old_resources_sources as $old_resource_source) {
	                                                			if($resource_source['id'] == $old_resource_source) {
	                                                				echo 'checked="checked"';
	                                                				break;
	                                                			}
	                                                		}
	                                                	}
	                                                ?>
	                                                > <?php echo $resource_source['name']; ?>
	                                        </label>
	                                    </div>
	                                </li>
	                            <?php } ?>
							</ul>

							<textarea name="justification" id="justfication" placeholder="Justificación"><?php echo Input::old('justification'); ?></textarea>
						</div>
					</div>
					<div class="col-xs-12 col-sm-4">
						<div ng-show="diff">
							
							<p class="ar-ptitle">
								Testigos que presentará
							</p>
							<ul class="ar-plist">
								<?php foreach ($witnesses as $witness) { ?>
	                            <li>
	                                <div class="checkbox">
	                                    <label>
	                                        <input 
	                                        	name="witnesses[]"
	                                            type="checkbox"
	                                            value="<?php echo $witness['id']; ?>"
	                                            <?php 
	                                            	if(Input::old('witnesses')) {
	                                            		$old_witnesses = Input::old('witnesses');
	                                            		foreach ($old_witnesses as $old_witness) {
	                                            			if($witness['id'] ==  $old_witness) {
	                                            				echo 'checked="checked"';
	                                            				break;
	                                            			}
	                                            		}
	                                            	}
	                                            ?>
	                                            > <?php echo $witness['name']; ?>
	                                    </label>
	                                </div>
	                            </li>
	                            <?php } ?>
							</ul>						

						</div>
						
						<input type="submit" value="Agendar Evento">
					</div>
				<?php echo Form::close(); ?>
				</div>

			</div>
		</div>
	</div>

	<!-- Edit event -->
	<div class="ar-modal-background" ng-show="FORM_ENABLED||currentEvent"></div>
	<div class="ar-modal-wrapper" ng-show="FORM_ENABLED||currentEvent">
		<div class="ar-modal-container">
			<div class="ar-modal-title">Editar Evento/Solicitud</div>
			<div class="ar-modal-closebtn" ng-click="currentEvent=null;FORM_ENABLED=false;"></div>
			<div class="ar-modal-content">

				<div class="ar-form-container ar-vwrap">
				<?php echo Form::open(array('url' => 'event/edit', 'method' => 'post', 'role' => 'form', 'enctype'=> 'multipart/form-data', 'class' => 'form-horizontal')); ?>
					
					<div class="col-xs-12 col-sm-4">
						<input type="hidden" class="form-horizontal" name="id" id="id" value="{{currentEvent.id}}">
						<input type="text" class="form-horizontal" name="name" id="name" placeholder="Nombre del evento" autocomplete="off" value="{{currentEvent.name}}">
						
						<?php /* type date */?>
						<input class="datepicker" type="text"  pattern="^[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]$" name="start_day" id="start_day" placeholder="Fecha de inicio" autocomplete="off" required value="{{currentEvent.start_day}}">
						<?php /* type date */?>
						<input class="datepicker" type="text"  pattern="^[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]$" name="end_day" id="end_day" placeholder="Fecha de término" autocomplete="off" required value="{{currentEvent.end_day}}">
						<?php /* type time */?>
						<input type="time" name="time" id="time" placeholder="Hora de inicio hh:mm" autocomplete="off" required value="17:00:00" value="{{currentEvent.time}}">
						
						<input type="text" class="form-horizontal" name="place" id="place" placeholder="Lugar" required value="{{currentEvent.place}}">
						<input type="url" class="form-horizontal" name="link" id="link" placeholder="URL del evento" value="{{currentEvent.link}}">

						
						<p>Dirigido a</p>
						<select name="directed_to" id="directed_to">
							<option value="Público en general" ng-selected="currentEvent.directed_to=='Público en general'">Público en general</option>
							<option value="Comunidad BUAP" ng-selected="currentEvent.directed_to=='Comunidad BUAP'">Comunidad BUAP</option>
							<option value="Profesores/Investigadores" ng-selected="currentEvent.directed_to=='Profesores/Investigadores'">Profesores/Investigadores</option>
							<option value="Estudiantes" ng-selected="currentEvent.directed_to=='Estudiantes'">Estudiantes</option>
						</select>
						
						<textarea name="description" id="description" placeholder="Descripción">{{currentEvent.description}}</textarea>
						<div class="checkbox">
							<label>
								<input 	name="has_cost"
										id="has_cost" 
										type="checkbox" 
										ng-checked="!currentEvent.has_cost"
										> El evento es gratuito
							</label>
						</div>
					</div>
					<div class="col-xs-12 col-sm-4">

						<div class="checkbox">
							<label>
								<input 	name="request_diffusion" 
										type="checkbox" 
										ng-checked="currentEvent.services.length"
										> Solicitar difusión
							</label>
						</div>
							
						<p>Servicios de difusión a solicitar:</p>	

						<ul class="ar-plist">
							<?php foreach($services as $service) {  ?>
                                <li>
                                    <div class="checkbox">
                                        <label>
                                            <input 
                                                name="services[]" 
                                                type="checkbox"
                                                value="<?php echo $service['id']; ?>"
                                                ng-checked="currentEvent.service_<?php echo $service['id']; ?>"
                                                > <?php echo $service['name']; ?>
                                        </label>
                                    </div>
                                </li>
                            <?php } ?>
						</ul>
						

						<div class="ar-vwrap">
							
							<div class="ar-row" ng-repeat="file in currentEvent.support_materials">
								<input type="hidden" name="{{file.file}}" value="{{file.file}}" id="{{file.file}}">
								<p class="filename">
									<a target="_blank" href="{{ROOT_PATH + file.file}}">{{file.original_name}}</a>
									<br>
									<p href="">Eliminar</p>
								</p>
								<div class="file-icon {{file.format}}"></div>
							</div>

						</div>


						<input type="file" id="files" name="files[]" ng-model="fileInput" multiple style="display:none;">
						<div id="filebtn" class="btn btn-sourcefiles">
							Adjuntar material
						</div>





						<p></p>
						<p></p>
						<p class="ar-ptitle">
							Fuente de Recursos
						</p>
						<ul>
							<?php foreach ($resources_sources as $resource_source) { ?>
                                <li class="col-xs-12 col-sm-6">
                                    <div class="checkbox">
                                        <label>
                                            <input 
                                            	name="resources_sources[]"
                                                type="checkbox"
                                                value="<?php echo $resource_source['id']; ?>"
                                                ng-checked="currentEvent.resource_source_<?php echo $resource_source['id']; ?>"
                                                > <?php echo $resource_source['name']; ?>
                                        </label>
                                    </div>
                                </li>
                            <?php } ?>
						</ul>

						<textarea name="justification" id="justfication" placeholder="Justificación"><?php echo Input::old('justification'); ?></textarea>
					</div>



					<div class="col-xs-12 col-sm-4">
							
							<p class="ar-ptitle">
								Testigos que presentará
							</p>
							<ul class="ar-plist">
								<?php foreach ($witnesses as $witness) { ?>
	                            <li>
	                                <div class="checkbox">
	                                    <label>
	                                        <input 
	                                        	name="witnesses[]"
	                                            type="checkbox"
	                                            value="<?php echo $witness['id']; ?>"
	                                            ng-checked="currentEvent.witness_<?php echo $witness['id']; ?>"
	                                            > <?php echo $witness['name']; ?>
	                                    </label>
	                                </div>
	                            </li>
	                            <?php } ?>
							</ul>
						
						<input type="submit" value="Guardar cambios">
					</div>
				<?php echo Form::close(); ?>
				</div>

			</div>
		</div>
	</div>	
	<!-- End Edit event -->

	<div class="ar-dashboard-wrapper">
		<h4>Eventos y Solicitudes</h4>
		<div class="ar-eventlist ar-vwrap">
			<div class="ar-event" ng-repeat="event in events">
				<div class="ar-vwrap ar-row" ng-class="{'expanded':event.expanded}">
				
					<div class="ar-vwrap ar-lnhh">
						<div class="col-xs-12 col-sm-9 ar-nopad">
							<div class="col-xs-12 col-sm-2 ar-eid">{{event.id_dci}}</div>
							<div class="col-xs-12 col-sm-10 ar-field ar-ellipsable ar-eventname ar-lnnormal">{{event.name}}</div>
						</div>
						<div class="col-xs-12 col-sm-3 ar-nopad">
							<div class="col-xs-12 col-sm-10 ar-field ar-datie">De <span >{{event.start_day}}</span> a <span >{{event.end_day}}</span> </div>
							<div class="col-xs-12 col-sm-2 ar-down ar-hideon768" ng-click="event.expanded=!event.expanded"></div>
						</div>
					</div>

					<div class="ar-expanded-wea ar-vwrap">
						<div class="ar-expanded-wea-container">

							<div class="ar-row ar-vwrap col-xs-12 col-sm-4 ar-nopad">
								<div class="ar-lnnormal ar-vwrap">
									<div class="ar-place">{{event.place}}</div>
									<div class="ar-row ar-vwrap">
										<div class="col-xs-6 col-sm-6 ar-date ar-colgroup">{{event.time}} hrs</div>
										<div class="col-xs-6 col-sm-6 ar-date ar-colgroup">{{costs[event.has_cost]}}</div>
									</div>								
								</div>
								<div class="ar-lnnormalst ar-desc" ng-class="{'expanded':event.descExpanded}" ng-click="event.descExpanded=!event.descExpanded">
									<p>
										{{event.description}}
									</p>
								</div>
							</div>

							<div class="ar-row col-xs-12 col-sm-6 ar-services">
								<p>Servicios de difusión</p>
								<div ng-hide="event.services.length" class="ar-emptylist ar-eventempty">
									Aún no hay servicios de difusión
								</div>
								<div ng-show="event.services.length">
									<div class="ar-row ar-hideon768 ar-title-row">
										<div class="col-xs-12 col-sm-6 ar-tfield ar-lnnormal">Servicio</div>
										<div class="col-xs-12 col-sm-6 ar-tfield ar-lnnormal ar-service-status">Estado</div>
									</div>	
									<div class="ar-row ar-service" ng-repeat="service in event.services">
										<div class="col-xs-12 col-sm-6 ar-tfield ar-lnnormal">{{service.name}}</div>
										<div class="col-xs-12 col-sm-6 ar-tfield ar-lnnormal ar-service-status">{{service.pivot.dci_status}}</div>
										<!-- <div class="col-xs-12 col-sm-6 ar-tfield ar-lnnormal ar-service-status">{{service.status}}</div> -->
									</div>
								</div>
							</div>
							<div class="ar-row col-xs-12 col-sm-2">
								<!-- <div class="ar-flatbtn" ng-hide="event.services.length">Solicitar Difusión</div> -->
								<div class="ar-flatbtn" ng-click="showEditForm(event)" >Editar</div>
								<button class="ar-flatbtn ar-cancelbtn" ng-click="showCancelForm(event)">Cancelar Evento</button>
							</div>

						</div>
					</div>

				</div>
			</div>
			
			<div class="ar-center">
				<p>
					Para informar a la DCI sobre un evento o solicitar difusión, es necesario: 
				</p>		
				<button class="btn btn-primary" ng-click="showCreateForm()">Agendar Evento</button>
			</div>

		</div>
	</div>
</section>