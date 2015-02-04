<div class="task-list" ng-controller="EDashboardController">
	
	<div class="task ar-element" ng-repeat="task in tasks">
		<div class="ar-over-title">Descripción de la tarea</div>
		<p>{{task.description}}</p>
		<div class="ar-element-buttons ar-row">
			<div class="ar-button-info">Tarea creada en: <b>{{task.created_at}}</b></div>
			<button class="btn">Marcar tarea como completada</button>			
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
				<form>
					<input type="text" ng-init="Acabo de completar la tarea asignada..." ng-model="currenttask_comment" />
				</form>
				<button class="btn btn-primary">Tarea completada</button>
			</div>
		</div>
	</div>

</div>
<script>
	var app = angular.module('dashboard',[]);

	app.factory('DataService',[ '$http',function($http){
		return {
			tasks : function(){
				return $http.get('<?php echo URL::to('/'); ?>'+'/tasks/view').then(
					function(response){
						return response.data;
					},
					function(response){
						console.log('No se pudieron cargar los datos');
						return {};
					});
			},
		};
	}]);

	app.controller('EDashboardController',['$scope','DataService',function($scope,DataService){

		$scope.tasks = DataService.tasks();
		$scope.tasks.then(function(data){
			$scope.tasks = data.pending;
			console.log($scope.tasks);
		});

	}]);
</script>