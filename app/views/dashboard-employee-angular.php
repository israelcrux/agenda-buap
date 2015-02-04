<div ng-controller="EDashboardController">

<div class="task-list">
	
	<div class="task ar-element" ng-repeat="task in tasks">
		<div class="ar-over-title">Descripción de la tarea</div>
		<p>{{task.description}}</p>
		<div class="ar-element-buttons ar-row">
			<div class="ar-button-info">Estado: <b>{{task.dci_status}}</b></div>
			<div class="ar-button-info">Tarea creada en: <b>{{task.created_at}}</b></div>
			<button class="btn" ng-click="openTaskPanel(task)">Marcar tarea como completada</button>			
		</div>
	</div>	

	<p>También puedes <a>revisar las tareas terminadas</a></p>

	<div ng-hide="taskpanel_hidden" class="ar-fullscreen-panel-container">
		<div class="ar-fullscreen-panel ar-notsofull">
			<div class="ar-modal-title">Tarea terminada {{current_sol.name}}</div>
			<div class="ar-modal-closebtn" ng-click="closeTaskPanel()"></div>
			<div class="ar-modal-content">
				<p>Por favor escriba un comentario, sobre la tarea que realizó</p>
				<p class="ar-citation">
					{{currenttask_comment}}
				</p>
				<div class="ar-form-container">
					<input class="form-control" type="text" ng-model="currenttask_comment" />
				</div>
				<button class="btn btn-primary" ng-click="completeTask()">Tarea completada</button>
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
	var app = angular.module('dashboard',[]);

	app.factory('DataService',[ '$http',function($http){
		return {
			tasks : function(){
				return $http.get('<?php echo URL::to('/'); ?>'+'/tasks/view')
					.then(
						function(response){
							return response.data;
						},
						function(response){
							console.log('No se pudieron cargar los datos');
							return {};
						});
			},
			endTask : function(task){
				return $http.post('<?php echo URL::to('/') ?>/tasks/completed/'+task.id,task)
					.then(function(response){
						return response.data;
					},
					function(){	
						alert('Ocurrió un error al conectar con el servidor');	
						return {status:'error'};
					});
			}
		};
	}]);

	app.controller('EDashboardController',['$scope','DataService',function($scope,DataService){

		$scope.currenttask = null;

		$scope.tasks = DataService.tasks();
		$scope.tasks.then(function(data){
			$scope.tasks = data.pending;
			console.log($scope.tasks);
		});


		$scope.taskpanel_hidden = true;
		$scope.closeTaskPanel = function(){
			$scope.taskpanel_hidden=true;
		};
		$scope.openTaskPanel = function(task){
			$scope.taskpanel_hidden=false;
			$scope.currenttask = task;
		};
		$scope.completeTask = function(){
			//hide while process
			console.log('starting up');
			$scope.modalLoaderActive = true;
			DataService.endTask({
					id: $scope.currenttask.id,
					comment: $scope.currenttask_comment
				})
				.then(function(resp){
					console.log('???????');
					var message = "";
					if(resp && resp.status == "success"){
						message = 'Tarea marcada como completa';
					} else {
						message = 'Ocurrió un problema, intente de nuevo';
					}
					$scope.alert = message;
					setTimeout(function(){
						$scope.$apply(function(){
							$scope.alert = null;
						});
					},3000);					
					$scope.currenttask = null;
					$scope.modalLoaderActive = false;					
				});

		};

	}]);
</script>