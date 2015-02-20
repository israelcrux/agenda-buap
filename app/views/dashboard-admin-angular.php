<div ng-controller="EventsController" class="col-xs-12 col-sm-6 col-md-8">
	<section class="ar-module">
		<div class="ar-section-title">Solicitudes de difusión</div>
		<div class="ar-section-subtitle">Pendientes</div>
		<div class="ar-section-content ar-list">
			<div class="ar-emptylist">
				Aún no hay nuevas solicitudes
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
		<div class="ar-fullscreen-panel">
			<div class="ar-modal-title">Nuevo usuario</div>
			<div class="ar-modal-closebtn" ng-click="showUserForm=false"></div>
			<div class="ar-modal-content">
				
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
	.factory('DataService',['$http',function($http){
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
	.controller('UsersController',['$scope','DataService',function($scope,DataService){

		$scope.showUserForm = false;
		$scope.userTypes = {
			'1' :  'Cliente',
			'2' :  'Empleado DCI',
			'3' :  'Jefe de Área DCI',
			'4' :  'Administrador'
		};

		$scope.pendingUsers = DataService.pendingUsers();
		$scope.pendingUsers.then(function(data){
			//error never expected
			$scope.pendingUsers = data.unauthorized;
		});

		//events
		$scope.acceptUser = function(user){
			$scope.modalLoaderActive = true;
			return DataService.acceptUser(user)
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


users_app.controller('EventsController',['$scope',function($scope){
	$scope.works = 'HOla!';
}]);

</script>