<div ng-controller="BDashboardController">

<?php 
	/*--------------------- Panel de "detalles" de solicitud---------------------------*/ 
?>
<div ng-hide="taskpanel_hidden" class="ar-fullscreen-panel-container">
	<div class="ar-fullscreen-panel">
		<div class="ar-modal-title">Tareas asignadas para solicitud de {{current_sol.name}}</div>
		<div class="ar-modal-closebtn" ng-click="closeTaskPanel()"></div>
		<div class="ar-modal-content">
			<div class="col-xs-12 col-md-8">
				<ol>
					<h4>Evento: {{current_event.name}}</h4>
				</ol>
				<?php /* Tasks and their statuses */ ?>
				<div class="ar-row">
				
					<div class="ar-empty-message" ng-show="!current_sol.tasks.length">Aún no hay tareas asignadas a esta solicitud, ¡Es importante asignar tareas!</div>

					<div class="ar-row breadcrumb" ng-repeat="task in current_sol.tasks">
						<div class="col-xs12">{{task.description}}</div>
						<div class="col-xs6"><b>{{task.status}}</b></div>
						<div class="ar-row">
							<div class="col-xs6">{{task.created_at}}</div>
							<div class="col-xs6">{{task.deleted_at}}</div>
						</div>
						<p>
							{{task.comment}}
						</p>
					</div>


				</div>
			</div>
			<div class="col-xs-12 col-md-4">
				
				<div class="ar-form-container">
					
					<h4>Nueva tarea</h4>
					<p>{{newtask_description}}</p>
					<p>Para:</p>

					<select ng-model="current_employee" class="form-control">
						<option ng-repeat="employee in employees" ng-value="employee.id"> {{employee.first_name}} {{employee.last_name}}</option>
					</select>

					<input class="form-control" type="text" ng-model="newtask_description" placeholder="Descripción de la tarea">

					<button class="btn form-control" ng-click="createTask()">Asignar tarea</button>

				</div>
				
			</div>
		</div>
	</div>
</div>

<?php 
/*--------------------- PANEL PRINCIPAL ---------------------------*/ 
?>
<div class="ar-vwrap well">

	<?php 
	/*--------------------- Switchers---------------------------*/ 
	/*
	?>	
	<div class="ar-vwrap">
		<div class="ar-row ar-contright">
			<div class="col-xs-12 col-sm-3 col-md-2">
				<div class="ar-switcher">
					<input type="checkbox" name="pending" ng-model="pending" id="pending" aria-label="...">
					<div class="icon" ng-class="{'active':pending}" ng-click="pending=!pending"></div>
					<label for="pending" >Pendientes</label>
				</div>
			</div>		
			<div class="col-xs-12 col-sm-3 col-md-2">
				<div class="ar-switcher">
					<input type="checkbox" name="process" ng-model="process" id="process" aria-label="...">
					<div class="icon" ng-class="{'active':process}" ng-click="process=!process"></div>
					<label for="process" >En proceso</label>
				</div>
			</div>
		</div>
	</div>
	<div class="ar-spacer"></div>
	<?php 
	*/
	?>
	

	<?php 
	/*--------------------- Service requests ---------------------------*/ 
	 ?>
	<!-- <div class="col-xs-12 col-sm-8"> -->
	
	<div class="ar-empty-message" ng-show="!event.length">Aún no hay solicitudes de los servicios de ésta área.</div>

	<div class="ar-list" ng-repeat="event in events">


		<div class="ar-vwrap">
			<h4 class="it">{{event.name}}</h4>
		</div>

		<div class="col-xs-12 col-sm-4">
			<div class="ar-row">
				<div class="col-xs-12 col-md-6">Inicia: {{event.start_day}}</div> 
				<div class="col-xs-12 col-md-6">Termina: {{event.end_day}}</div> 
			</div>
			<p class="col-xs-12">Lugar: {{event.place}}</p>
			<p class="col-xs-12">Hora de inicio: {{event.time}} hrs.</p>
			<p class="col-xs-12 col-md-6" ng-show="event.has_cost">Evento con costo</p>
			<p class="col-xs-12 col-md-6" ng-show="!event.has_cost">Evento gratuito</p>
			<p class="col-xs-12 col-md-6">Dirigido a: {{event.directed_to}}</p>
			<p class="col-xs-12" ng-show="event.link">{{event.link}}</p>
			<p  class="col-xs-12">{{event.description}}</p>

		</div>
			
		<div class="col-xs-12 col-sm-8">
			<div class="ar-element" ng-repeat="sol in event.services">
				<div class="ar-row">
					<div class="col-sm-12 col-md-8">
						<h4>{{sol.name}} <span class="dci_status {{pendingclasses[sol.pivot.dci_status]}}">[{{sol.pivot.dci_status}}]</span></h4>
					</div>
					<div class="col-sm-12 col-md-4">
						<h5>Soliciitado en: {{sol.pivot.start_service}}</h5>
					</div>
				</div>

				<div class="ar-element-buttons ar-row">
					<div class="ar-button-info ">
						<b>xxx</b> tareas asignadas
					</div>
					<div class="ar-button-info">
						<b>xxx</b> tareas pendientes
					</div>
					<button class="btn" ng-click="openTaskPanel(event,sol)">
						Asignar/Revisar Tareas
					</button>
				</div>
			</div>
		</div>

	</div>
		
</div>

<a href="">Ver solicitudes atendidas</a>

</div>
<script>
	ROOT_PATH = "<?php echo URL::to('/'); ?>";
	FORM_ENABLED = false;
</script>
<script>
	var app = angular.module('dashboard',[]);
	
	app.factory('DataService',['$http',function($http){
		return {
			//GET
			events : function(area_id){
				return $http.get(window['ROOT_PATH']+'/service-requirements/'+area_id)
					.then(function(response){
						return response.data;
					},
					function(){
						console.log('Could not load service requirements!');
					})
			},
			employees : function(){
				return $http.get(window['ROOT_PATH']+'/tasks/assign')
					.then(function(response){
						return response.data;
					},
					function(){
						console.log('Could not load employees');
					});
			},

			//POST
			createTask : function(data){
				console.log('creating task: '+data);
				console.log(data);
				return $http.post(window['ROOT_PATH']+'/tasks/assign',data)
					.then(function(response){
						return response.data;
					},
					function(response){
						console.log('Could not create task');
						return false;
					});	
			}
		};
	}]);
	
	app.controller('BDashboardController', [ '$scope', 'DataService' ,function($scope,DataService){ 

		//static shit
		$scope.pendingclasses = {
			'Pendiente' : 'pen',
			'En Proceso': 'pro',
			'Atendido' : 'ate',
			'Aprobado' : 'apr'
		};


		//----------- Services --------------

		$scope.events = DataService.events(<?php echo $area; ?>);
		$scope.events.then(function(data){
			$scope.events = data;
		});
		$scope.employees = DataService.employees();
		$scope.employees.then(function(data){
			$scope.employees = data;
		});

		//----------- Event listeners -------

		//Actions
		$scope.createTask = function(){
			var res = DataService.createTask({
                description : $scope.newtask_description,
				user_id     : $scope.current_employee,
				event_service_id  : $scope.current_sol.pivot.id
			});
			res.then(function(resp){
				console.log(resp);
				if(resp && resp.status == 'success'){
					//append shit!					
					$scope.current_sol.tasks.push(resp.newtask);
				} else {
					alert('Ocurrió un problema al intentar crear la tarea, por favor intente de nuevo');
				}
			});
		};

		//UI
		$scope.taskpanel_hidden = true;
		$scope.closeTaskPanel = function(){
			$scope.taskpanel_hidden = true;
			$scope.current_sol = null;
			$scope.current_event = null;			
		};
		$scope.openTaskPanel = function(evt,sol){
			$scope.taskpanel_hidden = false;
			$scope.current_sol = sol;
			$scope.current_event = evt;
		};


	}]);
</script>