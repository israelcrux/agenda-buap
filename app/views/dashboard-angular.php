<section ng-controller="DashboardController">
	

<div class="ar-modal-background" ng-show="FORM_ENABLED||new_event"></div>
<div class="ar-modal-wrapper" ng-show="FORM_ENABLED||new_event">
	<div class="ar-modal-container">
		<div class="ar-modal-title">Agendar Evento</div>
		<div class="ar-modal-closebtn" ng-click="new_event=false;FORM_ENABLED=false;"></div>
		<div class="ar-modal-content">

			<div class="ar-form-container ar-vwrap">
			<?php echo Form::open(array('url' => 'event/add', 'method' => 'post', 'role' => 'form', 'enctype'=> 'multipart/form-data', 'class' => 'form-horizontal')); ?>
				
				<div class="col-xs-12 col-sm-4">
					<input type="text" class="form-horizontal" name="name" id="name" placeholder="Nombre del evento" autocomplete="off" required>
					
					<?php /* type date */?>
					<input class="datepicker" type="text"  pattern="^[0-9][0-9]\/[0-9][0-9]\/[0-9][0-9][0-9][0-9]$" name="start_day" id="start_day" placeholder="Fecha de inicio" autocomplete="off" required>
					<?php /* type date */?>
					<input class="datepicker" type="text"  pattern="^[0-9][0-9]\/[0-9][0-9]\/[0-9][0-9][0-9][0-9]$" name="end_day" id="end_day" placeholder="Fecha de término" autocomplete="off" required>
					<?php /* type time */?>
					<input type="text" name="time" id="time" placeholder="Hora de inicio hh:mm" autocomplete="off" required>
					
					<input type="text" class="form-horizontal" name="place" id="place" placeholder="Lugar" autocomplete="off" required>
					<input type="url" class="form-horizontal" name="link" id="link" placeholder="URL del evento" autocomplete="off" required>

					
					<p>Dirigido a</p>
					<select name="directed_to" id="directed_to">
						<option value="0">Público en general</option>
						<option value="1">Comunidad Buap</option>
						<option value="2">Profesores</option>
						<option value="3">Estudiantes</option>
					</select>
					
					<textarea name="description" id="description" placeholder="Descripción"></textarea>
					
					<div class="checkbox">
						<label>
							<input name="hast_cost" id="has_cost" type="checkbox"> El evento es gratuito
						</label>
					</div>
				</div>
				<div class="col-xs-12 col-sm-4">

					<div class="checkbox">
						<label>
							<input ng-model="diff" type="checkbox"> Solicitar difusión
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
                                                name="<?php echo $service['standardized_name']; ?>" 
                                                type="checkbox"> 
                                                    <?php echo $service['name']; ?>
                                        </label>
                                    </div>
                                </li>
                            <?php } ?>				
						</ul>
						
						<input type="file" id="files" name="files" ng-model="fileInput" multiple style="display:none;">
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
                                                name="<?php echo $resource_source['standardized_name']; ?>" 
                                                type="checkbox"> 
                                                    <?php echo $resource_source['name']; ?>
                                        </label>
                                    </div>
                                </li>
                            <?php } ?>
						</ul>

						<textarea name="justfication" id="justfication" placeholder="Justificación"></textarea>
					</div>
					
					<!--
					<input type="text" class="form-horizontal" name="head_name" id="head_name" placeholder="Nombre del responsable" autocomplete="off" required>
					<input type="text" class="form-horizontal" name="head_email" id="head_email" placeholder="Email del responsable" autocomplete="off" required>
					<input type="text" class="form-horizontal" name="head_phone" id="head_phone" placeholder="Teléfono del responsable" autocomplete="off" required>
					-->
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
                                            name="<?php echo $witness['standardized_name']; ?>" 
                                            type="checkbox"> 
                                                <?php echo $witness['name']; ?>
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
										<div class="col-xs-12 col-sm-6 ar-tfield ar-lnnormal ar-service-status">{{service.status}}</div>
									</div>
								</div>
							</div>
							<div class="ar-row col-xs-12 col-sm-2">
								<div class="ar-flatbtn">Editar evento</div>
								<div class="ar-flatbtn" ng-hide="event.services.length">Solicitar Difusión</div>
								<div class="ar-flatbtn" ng-show="event.services.length">Editar solicitud</div>
							</div>

						</div>
					</div>

				</div>
			</div>
			
			<div class="ar-center">
				<p>
					Para informar a la DGI sobre un evento o solicitar difusión, es necesario: 
				</p>		
				<button class="btn btn-primary" ng-click="showCreateForm()">Agendar Evento</button>
				<?php /* echo HTML::link('/event','Agendar evento'); */ ?>
			</div>

		</div>
	</div>
</section>