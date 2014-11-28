	<div class="ar-modal-background" ng-show="currentEvent"></div>
	<div class="ar-modal-wrapper" ng-show="currentEvent">
		<div class="ar-modal-container">
			<div class="ar-modal-title">Editar Evento/Solicitud</div>
			<div class="ar-modal-closebtn" ng-click="currentEvent=null;"></div>
			<div class="ar-modal-content">

				<div class="ar-form-container ar-vwrap">
				<?php echo Form::open(array('url' => 'event/edit', 'method' => 'post', 'role' => 'form', 'enctype'=> 'multipart/form-data', 'class' => 'form-horizontal')); ?>
					
					<div class="col-xs-12 col-sm-4">
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
							<option value="Comunidad BUAP" ng-selected="currentEvent.directed_to=='Comunidad Buap'">Comunidad Buap</option>
							<option value="Profesores/Investigadores" ng-selected="currentEvent.directed_to=='Profesores/Investigadores'">Profesores/Investigadores</option>
							<option value="Estudiantes" ng-selected="currentEvent.directed_to=='Estudiantes'">Estudiantes</option>
						</select>
						
						<textarea name="description" id="description" placeholder="Descripción">{{currentEvent.description}}</textarea>
						
						<div class="checkbox">
							<label>
								<input 	name="has_cost"
										id="has_cost" 
										type="checkbox" 
										ng-checked="currentEvent.has_cost"
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
										ng-checked="currentEvent.services.length"
										> Solicitar difusión
							</label>
						</div>
						
						<div ng-show="diff" >
							
							<p>Servicios de difusión a solicitar:</p>	

							<ul class="ar-plist">
                                <li ng-repeat="service in currentEvent.services">
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