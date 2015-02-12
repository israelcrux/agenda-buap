<div ng-controller="PendingUsersController">
	<section class="ar-module">
		<div class="ar-section-title"></div>
		<div class="ar-section-content">
			
		</div>
	</section>

	<div class="ar-user" ng-repeat="user in pendingUsers">
		<h4>{{user.first_name}} {{user.last_name}}</h4>
		<p>{{user.email}}</p>
		<p>{{user.phone}}</p>
		<p>{{user.created_at}}</p>
		<button ng-click="acceptUser(user)">aceptar</button>
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
				return $http.get(window['ROOT_PATH']+'/user/authorize/employee')
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