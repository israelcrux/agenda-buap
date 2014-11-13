<section ng-controller="DashboardController">
	

<div class="ar-modal-background" ng-show="new_event"></div>
<div class="ar-modal-wrapper" ng-show="new_event">
	<div class="ar-modal-container">
		<div class="ar-modal-title">Agendar Evento</div>
		<div class="ar-modal-closebtn" ng-click="new_event=false"></div>
		<div class="ar-modal-content">

			<div class="ar-form-container ar-vwrap">
			<?php echo Form::open(array('url' => 'event/add', 'method' => 'post', 'role' => 'form', 'class' => 'form-horizontal')); ?>
				
				<div class="col-xs-12 col-sm-4">
					<input type="text" class="form-horizontal" name="name" id="name" placeholder="Nombre del evento" autocomplete="off" required>
					
					<?php /* type date */?>
					<input class="datepicker" type="text"  pattern="[0-9][0-9]\/[0-9][0-9]\/[0-9][0-9][0-9][0-9]" name="start_day" id="start_day" placeholder="Inicio dd/mm/aaaa" autocomplete="off" required>
					<?php /* type date */?>
					<input class="datepicker" type="text" name="end_day" id="end_day" placeholder="Término dd/mm/aaaa" autocomplete="off" required>
					<?php /* type time */?>
					<input type="text" name="time" id="time" placeholder="Hora de inicio hh:mm" autocomplete="off" required>
					
					<input type="text" class="form-horizontal" name="place" id="place" placeholder="Lugar" autocomplete="off" required>
					<div class="checkbox">
						<label>
							<input ng-model="diff" type="checkbox"> Solicitar difusión
						</label>
					</div>
				</div>
				<div class="col-xs-12 col-sm-4">
					
					<div ng-show="diff" >
						
						<p>Servicios de difusión a solicitar:</p>	

						<ul class="ar-media-list">
							
							<li>
								<div class="checkbox">
									<label>
										<input type="checkbox"> Radio
									</label>
								</div>
							</li>
							<li>
								<div class="checkbox">
									<label>
										<input type="checkbox"> TV
									</label>
								</div>
							</li>
							<li>
								<div class="checkbox">
									<label>
										<input type="checkbox"> Web
									</label>
								</div>
							</li>
							<li>
								<div class="checkbox">
									<label>
										<input type="checkbox"> Redes sociales
									</label>
								</div>
							</li>
							<li>
								<div class="checkbox">
									<label>
										<input type="checkbox"> Medios Impresos
									</label>
								</div>
							</li>							
						</ul>
						<p>
							Fuente de Recursos
						</p>
						<ul class="ar-testimonial-list">
							<li class="col-xs-12 col-sm-6">
								<div class="checkbox">
									<label>
										<input type="checkbox" checked="checked"> Tesorería
									</label>
								</div>
							</li>
							<li class="col-xs-12 col-sm-6">
								<div class="checkbox">
									<label>
										<input type="checkbox"> Fondo fijo
									</label>
								</div>
							</li>
							<li class="col-xs-12 col-sm-6">
								<div class="checkbox">
									<label>
										<input type="checkbox"> Apoyos especiales
									</label>
								</div>
							</li>
							<li class="col-xs-12 col-sm-6">
								<div class="checkbox">
									<label>
										<input type="checkbox"> Otros
									</label>
								</div>
							</li>							
						</ul>						
					</div>

					<!--
					<input type="text" class="form-horizontal" name="head_name" id="head_name" placeholder="Nombre del responsable" autocomplete="off" required>
					<input type="text" class="form-horizontal" name="head_email" id="head_email" placeholder="Email del responsable" autocomplete="off" required>
					<input type="text" class="form-horizontal" name="head_phone" id="head_phone" placeholder="Teléfono del responsable" autocomplete="off" required>
					-->
				</div>
				<div class="col-xs-12 col-sm-4">
					<div ng-show="diff">
						<textarea name="justfication" id="justfication" placeholder="Justificación"></textarea>
						<p>
							Testigos que presentará
						</p>
						<ul class="ar-testimonial-list">
							<li>
								<div class="checkbox">
									<label>
										<input type="checkbox" checked="checked"> Ejemplar de impresión
									</label>
								</div>
							</li>
							<li>
								<div class="checkbox">
									<label>
										<input type="checkbox"> Carátula de libros, revistas o folletos
									</label>
								</div>
							</li>
							<li>
								<div class="checkbox">
									<label>
										<input type="checkbox"> Fotografías de rótulos colocados
									</label>
								</div>
							</li>
							<li>
								<div class="checkbox">
									<label>
										<input type="checkbox"> Fotografías
									</label>
								</div>
							</li>							
						</ul>						
						<button class="btn btn-default">
							Adjuntar material de apoyo
						</button>
					</div>

					<button class="btn btn-primary">
						Agendar Evento
					</button>
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
							<div class="col-xs-12 col-sm-2 ar-eid">{{event.pid}}</div>
							<div class="col-xs-12 col-sm-10 ar-field ar-ellipsable ar-eventname ar-lnnormal">{{event.title}}</div>
						</div>
						<div class="col-xs-12 col-sm-3 ar-nopad">
							<div class="col-xs-12 col-sm-10 ar-field">{{event.start_day}}</div>
							<div class="col-xs-12 col-sm-2 ar-down ar-hideon768" ng-click="event.expanded=!event.expanded"></div>
						</div>
					</div>

					<div class="ar-expanded-wea ar-vwrap">
						<div class="ar-expanded-wea-container">

							<div class="ar-row ar-vwrap col-xs-12 col-sm-4 ar-nopad">
								<div class="ar-lnnormal ar-vwrap">
									<div class="ar-place">{{event.place}}</div>
									<div class="ar-row ar-vwrap">
										<div class="col-xs-6 col-sm-6 ar-date ar-colgroup">{{event.start_day}}</div>
										<div class="col-xs-6 col-sm-6 ar-date ar-colgroup">{{event.end_day}}</div>
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
								<div class="ar-row ar-hideon768 ar-title-row">
									<div class="col-xs-12 col-sm-6 ar-tfield ar-lnnormal">Servicio</div>
									<div class="col-xs-12 col-sm-6 ar-tfield ar-lnnormal ar-service-status">Estado</div>
								</div>	
								<div class="ar-row ar-service" ng-repeat="service in event.services">
									<div class="col-xs-12 col-sm-6 ar-tfield ar-lnnormal">{{service.name}}</div>
									<div class="col-xs-12 col-sm-6 ar-tfield ar-lnnormal ar-service-status">{{service.status}}</div>
								</div>
							</div>
							<div class="ar-row col-xs-12 col-sm-2">
								<div class="ar-flatbtn">Editar evento</div>
								<div class="ar-flatbtn">Editar solicitud</div>
							</div>

						</div>
					</div>

				</div>
			</div>
			
			<div class="ar-center">
				<p>
					Para informar a la DGI sobre un evento o solicitar difusión, es necesario: 
				</p>		
				<button class="btn btn-primary" ng-click="new_event=true">Agendar Evento</button>
			</div>

		</div>
	</div>
</section>