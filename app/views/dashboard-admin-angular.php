<div ng-controller="PendingUsersController" class="col-xs-12 col-sm-6 col-md-4">
	<section class="ar-module">
		<div class="ar-section-title">Usuarios <div class="btn">Agregar usuario</div></div>
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


	<div class="ar-modal-loader" ng-class="{active:modalLoaderActive}">
		<div class="spinner">
		  <div class="bounce1"></div>
		  <div class="bounce2"></div>
		  <div class="bounce3"></div>
		</div>
	</div>

	<div class="ar-alert" ng-class="{in:alert}">{{alert}}</div>


</div>

<div ng-controller="MiscController" class="col-xs-12 col-sm-6 col-md-8">
	<section class="ar-module">
		<div class="ar-section-title">Solicitudes de difusión</div>
		<div class="ar-section-subtitle">Pendientes</div>
		<div class="ar-section-content ar-list">
			<div class="ar-emptylist">
				Aún no hay nuevas solicitudes
			</div>
		</div>
		<div class="ar-section-bottombtns">
			owo
		</div>
	</section>
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
	.controller('PendingUsersController',['$scope','DataService',function($scope,DataService){

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

</script>