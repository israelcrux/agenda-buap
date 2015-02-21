<div class="ar-vwrap" ng-controller="MiscController">

	<div class="col-xs-10 col-sm-8">
		<h3>Hola <?php echo Auth::user()->first_name;  ?> </h3>
		<p>Panel de administración global - Dirección de Comunicación Institucional</p>
	</div>
	<div class="col-xs-2 col-sm-4">
		<ul>
			<li><a ng-click="showAAUPanel=true">Unidades administrativas</a></li>
			<li>Servicios</li>
			<li>Áreas DCI</li>
		</ul>
	</div>

	<div class="ar-fullscreen-panel-container" ng-class="{active:showAAUPanel}">
		<div class="ar-fullscreen-panel">
			<div class="ar-modal-title">Unidades académicas y administrativas</div>
			<div class="ar-modal-closebtn" ng-click="showAAUPanel=false"></div>
			<div class="ar-modal-content">
				
				<div class="col-xs-12 col-sm-8 ar-autoscroll">
					
					<br>
					<br>
					<div class="ar-list ar-autoscroll">
						<div class="ar-element ar-thick" ng-repeat="aau in aaus">
							<div class="col-xs-6">{{aau.name}}</div>
							<div class="col-xs-4">{{aau.type}}</div>
							<div class="col-xs-2"> 
								<ul class="inline">
									<li><a ng-click="setCurrentAAU(aau)">Editar</a></li>
									<?php /*  
									<li><a ng-click="deleteAAU">Eliminar</a></li>
									*/ ?>
								</ul>
							</div>
						</div>
					</div>
					<br>
					<br>

				</div>
				<div class="col-xs-12 col-sm-4" ng-show="currentAAU">
					<h4>Editar unidad</h4>
					<div class="ar-form-container">
						<form>
							<input type="text" ng-model="currentAAU.name" class="form-control" placeholder="Nombre">
							<select ng-model="currentAAU.type" class="form-control">
								<option value="unidades_academicas">Académica</option>
								<option value="unidades_administrativas">Administrativa</option>
								<option value="otro">Otro</option>
							</select>
							<button class="btn btn-primary form-control" ng-click="editAAU()">Guardar cambios</button>
						</form>
					</div>
				</div>

				<div class="col-xs-12 col-sm-4" ng-hide="currentAAU">
					<h4>Agregar unidad</h4>
					<div class="ar-form-container">
						<form>
							<input type="text" ng-model="newAAU.name" class="form-control" placeholder="Nombre">
							<select ng-model="newAAU.type" class="form-control">
								<option value="unidades_academicas">Académica</option>
								<option value="unidades_administrativas">Administrativa</option>
								<option value="otro">Otro</option>
							</select>
							<button class="btn btn-primary form-control" ng-click="addAAU()">Crear</button>
						</form>
					</div>
				</div>

			</div>
		</div>
	</div>



	<div class="ar-modal-loader" ng-class="{active:modalLoaderActive}">
		<div class="spinner">
		  <div class="bounce1"></div>
		  <div class="bounce2"></div>
		  <div class="bounce3"></div>
		</div>
	</div>

	<div class="ar-alert" ng-class="{in:alert}">{{alert}}</div>


</div>


<div ng-controller="EventsController" class="col-xs-12 col-sm-6 col-md-8">
	<section class="ar-module">
		<div class="ar-section-title">Eventos y solicitudes <b>({{events.length}} eventos)</b></div>
		<div class="ar-section-subtitle ar-row">
			<div class="col-xs-0 col-sm-4">Eventos </div>
			<div class="col-xs-0 col-sm-8">Solicitudes</div>
			<?php 
			/*
			huehue
			*/
			 ?>
		</div>
		<div class="ar-section-content ar-list">
			<div class="ar-emptylist" ng-show="events.length==0">
				Aún no hay nuevas solicitudes
			</div>
			<?php /* wuea de event service en boss panel  */ ?>





			<div class="ar-list ar-mbottom" ng-repeat="event in events">
				

				<div class="ar-vwrap">
					<h4 class="it">{{event.name}}</h4>
				</div>

				<div class="col-xs-12 col-sm-4">
					<div class="ar-row">
						<div class="col-xs-12 col-md-6">
							<p class="ar-over-title">Inicia</p>
							<p>{{event.start_day}}</p>
						</div> 
						<div class="col-xs-12 col-md-6">
							<p class="ar-over-title">Termina</p>					
							<p>{{event.end_day}}</p>
						</div>
					</div>
					<a target="_blank" ng-href="event/{{event.id}}">Ver detalles del evento</a>

				</div>
					
				<div class="col-xs-12 col-sm-8">
					<div class="ar-element" ng-repeat="sol in event.services">
						<div class="status-tag"></div>
						<div class="ar-row">
							<div class="col-sm-12 col-md-8">
								<h4 class="sm">{{sol.name}}</h4>
							</div>
							<div class="col-sm-12 col-md-4">
								<h5 class="ar-right">{{sol.pivot.dci_status}}</h5>
							</div>
						</div>

						<div class="ar-element-buttons ar-row">
							<div class="ar-button-info" ng-class="{green:sol._completed_tasks==sol.tasks.length}">
								<b>{{sol.tasks.length}}</b> tareas asignadas
							</div>
							<div class="ar-button-info">
								<b>{{sol.tasks.length - sol._completed_tasks}}</b> tareas pendientes
							</div>
							<button class="btn" ng-click="openTaskPanel(event,sol)" ng-hide="true">
								+
							</button>
						</div>
					</div>
				</div>

			</div>








		</div>
		<div class="ar-section-bottombtns">
			{{works}}
		</div>
	</section>
</div>

<div ng-controller="UsersController" class="col-xs-12 col-sm-6 col-md-4 static">
	<section class="ar-module">
		<div class="ar-section-title">Usuarios <div class="mbtn btn" ng-click="showUserForm=true">Agregar usuario</div></div>
		<div class="ar-section-subtitle">Pendientes</div>
		<div class="ar-section-content ar-list">

			<div class="ar-emptylist" ng-show="pendingUsers.length==0">
				Aún no hay nuevos usuarios
			</div>			
		
			<div class="ar-element" ng-repeat="user in pendingUsers">
				<div class="ar-row">
					<h4 class="col-xs-12">{{user.first_name}} {{user.last_name}}</h4>
				</div>
				<div class="ar-row">
					<div class="col-sm-6"><a ng-href="mailto:{{user.email}}">{{user.email}}</a></div>
					<div class="col-sm-6">{{user.phone}} {{user.extension_phone}}</div>
				</div>
				<div class="ar-row">
					<div class="col-sm-12">Solicitud para el rol: <b>{{userTypes[user.user_type_id]}}</b> </div>
				</div>
				<div class="ar-element-buttons ar-row">
					<div class="ar-button-info">{{user.created_at}}</div>
					<button class="btn" ng-click="deleteUser(user)">Ignorar</button>
					<button class="btn" ng-click="acceptUser(user)">Aceptar</button>
				</div>
			</div>	
			
		</div>
		<div class="ar-section-bottombtns">
			<div class="mbtn">ver usuarios registrados</div> <div class="mbtn">ver usuarios ignorados</div>
		</div>
	</section>

	<?php 
	/*
	<div class="ar-modal-loader" ng-class="{active:showUserForm}" ng-click="showUserForm=false">
		
	</div>
	*/ ?>

	<div class="ar-fullscreen-panel-container" ng-class="{active:showUserForm}">
		<div class="ar-fullscreen-panel ar-fitpanel ar500">
			<div class="ar-modal-title">Nuevo usuario</div>
			<div class="ar-modal-closebtn" ng-click="showUserForm=false"></div>
			<div class="ar-modal-content">
			    <div class="ar-form-wrapper" >
					<div class="ar-form-container">
				
						<?php echo Form::open(array('url' => '/register', 'method' => 'post', 'role'=>'form', 'class' =>'form-horizontal' )); ?>
							<input class="form-control" name="first_name" type="text" id="first_name" placeholder="Nombre(s)" autocomplete="off" required>
							<input class="form-control" name="last_name" type="text" id="last_name" placeholder="Apellidos" autocomplete="off" required>
							<input class="form-control" name="phone" type="text" id="phone" placeholder="Teléfono" autocomplete="off" pattern="([0-9]+|-|\s)+" title="Ejemplos: 888888, 8-888-888, 8 888 888">
							<input class="form-control" name="extension_phone" type="text" id="extension_phone" placeholder="Teléfono/Extensión Buap" autocomplete="off" >
							<select name="academic_administrative_unit_type" id="aaut" value="" required>
								<option value="0">
									Seleccionar Procedencia
								</option>
								<option value="1">
									Unidad Administrativa
								</option>
								<option value="2">
									Unidad Académica
								</option>
								<option value="3">
									Otro
								</option>
							</select>

							<select name="academic_administrative_unit" id="acadun" value="">
								<option value="">Ninguna</option>
								<?php foreach($aaunits as $aaunit): ?>
									<option value="<?php echo $aaunit['id'] ?>"><?php echo $aaunit['name'] ?></option>
								<?php endforeach; ?>
							</select>

							<select name="user_type_id" id="utunits" value="" required>
								<option value="0">Seleccionar Nivel de Usuario</option>
								<?php foreach($utunits as $utunit): ?>
									<option value="<?php echo $utunit['id'] ?>"><?php echo $utunit['name'] ?></option>
								<?php endforeach; ?>
							</select>

							<select name="department_id" id="dunits" value="" required>
								<option value="0">Seleccionar Departamento</option>
								<?php foreach($dunits as $dunit): ?>
									<option value="<?php echo $dunit['id'] ?>"><?php echo $dunit['name'] ?></option>
								<?php endforeach; ?>
							</select>
							
							<input class="form-control" name="email" type="email" id="username" placeholder="E-mail" autocomplete="off" required>
							<input class="form-control" name="password" type="password" value="" id="password" placeholder="Contraseña" required>
							<input class="form-control" type="submit" value="Registrarse">
						<?php echo Form::close(); ?>


					</div>
				</div>
			</div>
		</div>
	</div>



	<div class="ar-modal-loader" ng-class="{active:modalLoaderActive}">
		<div class="spinner">
		  <div class="bounce1"></div>
		  <div class="bounce2"></div>
		  <div class="bounce3"></div>
		</div>
	</div>

	<div class="ar-alert" ng-class="{in:alert}">{{alert}}</div>


</div>





<script>
ROOT_PATH = "<?php echo URL::to('/'); ?>";
var users_app = angular.module('dashboard',[])	
	.factory('UsersDataService',['$http',function($http){
		return {
			pendingUsers : function(){
				return $http.get(window['ROOT_PATH']+'/user/authorize')
					.then(function(response){
						console.log(response.data);
						return response.data;
					},function(){
						alert('Ocurrió un error al intentar obtener datos del servidor');
					});
			},
			acceptUser : function(user){
				return $http.post(window['ROOT_PATH']+'/user/authorize',user)
					.then(function(response){
						console.log(response.data);
						return response.data;
					},function(){
						alert('Ocurrió un error al intentar obtener datos del servidor');
					});
			}
		};
	}])
	.controller('UsersController',['$scope','UsersDataService',function($scope,UsersDataService){

		$scope.showUserForm = false;
		$scope.userTypes = {
			'1' :  'Cliente',
			'2' :  'Empleado DCI',
			'3' :  'Jefe de Área DCI',
			'4' :  'Administrador'
		};

		$scope.pendingUsers = UsersDataService.pendingUsers();
		$scope.pendingUsers.then(function(data){
			//error never expected
			$scope.pendingUsers = data.unauthorized;
		});

		//events
		$scope.acceptUser = function(user){
			$scope.modalLoaderActive = true;
			return UsersDataService.acceptUser(user)
				.then(function(resp){
					var message = 'Ocurrió un problema al intentar aceptar a la persona';
					if(resp && resp.status == 'success'){
						//clean shit
						$scope.pendingUsers.splice($scope.pendingUsers.indexOf(user),1);

						//tell shit was done
						message = 'Usuario aceptado';
					}
					//show shit
					$scope.modalLoaderActive = false;
					$scope.alert = message;
					setTimeout(function(){
						$scope.$apply(function(){
							$scope.alert = null;
						});
					},3000);
				});
		};

		

	}]);

users_app.factory('EventsDataService',['$http',function($http){
		return {
			events : function(){
				return $http.get(window['ROOT_PATH']+'/event/adminview')
					.then(function(response){
						console.log(response.data);
						return response.data;
					},function(){
						alert('Ocurrió un error al intentar obtener datos del servidor');
					});
			}
		};
	}])
	.controller('EventsController',['$scope','EventsDataService',function($scope,EventsDataService){
		$scope.events = EventsDataService.events();
		$scope.events.then(function(data){
			$scope.events = data;
		}); 
	}]);

users_app.factory('MiscDataService',['$http',function($http){
		return {
			aau : function(){
				return $http.get(window['ROOT_PATH']+'/aau')
					.then(function(response){
						console.log(response);
						return response.data;
					},function(){
						alert('Ocurrió un error al intentar obtener datos del servidor');
					}) 
			},
			addAAU : function(newAAU){
				return $http.post(window['ROOT_PATH']+'/aau/add',newAAU)
					.then(function(response){
						console.log(response);
						return response.data;
					},function(){
						alert('Ocurrió un error al intentar subir datos al servidor');
					})
			}
		};
	}])
	.controller('MiscController',['$scope','MiscDataService',function($scope,MiscDataService){
		$scope.aaus = MiscDataService.aau();
		$scope.aaus.then(function(data){
			$scope.aaus = data;
		});

		$scope.currentAAU = false;

		//events
		$scope.addAAU = function(){
			return MiscDataService.addAAU($scope.newAAU)
				.then(function(resp){

					console.log('afta');
					console.log(resp);

					var message = 'Ocurrió un problema al intentar crear los datos';
					if(resp && resp.status == 'success'){
						//add shit
						$scope.aaus.push($scope.newAAU);

						//clean shit
						$scope.newAAU = {};

						//tell shit was done
						message = 'Unidad creada';
					}
					//show shit
					$scope.modalLoaderActive = false;
					$scope.alert = message;
					setTimeout(function(){
						$scope.$apply(function(){
							$scope.alert = null;
						});
					},3000);
				});
		};

		$scope.setCurrentAAU = function(caau){
			$scope.currentAAU = caau;
		};

	}]);

</script>