
<div class="ar-vwrap well" ng-controller="BDashboardController">
	
	<div class="ar-vwrap">
		<div class="ar-row ar-contright">
			<div class="col-xs-12 col-sm-3 col-md-2">
				<div class="ar-switcher">
					<input type="checkbox" name="pending" ng-model="pending" id="pending" aria-label="...">
					<div class="icon" ng-class="{'active':pending}" ng-click="pending=!pending"></div>
					<label for="pending" >En proceso</label>
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

	<div class="col-xs-12 col-sm-8">
		
		<div class="ar-list">
			<div class="ar-element" ng-repeat="sol in solicitudes">
				<div class="ar-row">
					<div class="col-sm-12 col-md-9">
						<h4 class="strong">{{sol.name}} <span class="pending">[Pendiente]</span></h4>
					</div>
					<div class="col-sm-12 col-md-3">
						<h5>{{sol.start_service}}</h5>
					</div>
				</div>

				<div class="ar-row">
					<div class="col-xs-12">
						<h4>{{sol.event.name}}</h4>
						<h5>({{sol.event.start_day}})</h5>
					</div>
				</div>
				<div class="ar-element-buttons ar-row">
					<div class="ar-button-info ">
						<b>7</b> tareas asignadas
					</div>
					<div class="ar-button-info">
						<b>3</b> tareas pendientes
					</div>
					<button class="btn">
						Revisar Detalles
					</button>
				</div>
			</div>
		</div>
		
	</div>
</div>

<a href="">Ver solicitudes atendidas</a>

<script>
	ROOT_PATH = "<?php echo URL::to('/'); ?>";
	FORM_ENABLED = false;
</script>
<script>
	var app = angular.module('dashboard',[]);
	// app.factory('DataService',['$http',function($http){
	// 	return {
	// 		calendar : function(year,month){
	// 			return $http.get(window['ROOT_PATH']+'/service_requirements/'+year+'-'+twoDigits(month))
	// 				.then(function(response){					
	// 					return calendarize(year,month,response.data);
	// 				},
	// 				function(){
	// 					console.log('Could not load calendar!');
	// 				})
	// 		}
	// 	};
	// }]);
	// app.controller('BDashboardController', [ '$scope', 'DataService' ,function($scope,DataService){ 
	app.controller('BDashboardController', [ '$scope', function($scope){ 

		//http://www.thaigoodview.com/library/contest2553/type2/foreign04/03/images/white-check-mark-box-ok-all-right-correct-women_design.png

		$scope.pending = true;
		$scope.in_process = true;

		$scope.solicitudes = [
				{ 
					name : 'Spot de radio', //Nombre del servicio relacionado a esta colicitud
					start_service: '2015-01-01',

					//Datos del evento relacionado
					event : {
				        "id_dci": "150107",
				        "name": "Kylie Coffey Ipsum dolor sit amet, consectetur adipisicing elit. Odio, tenetur!",
				        "start_day": "2015-01-16",
				        "end_day": "2015-01-27",
				        "place": "Magna qui doloribus eum voluptatem Eveniet porro e",
				        "time": "06:00:00",
				        "has_cost": 0,
				        "directed_to": "Comunidad BUAP",
				        "link": "http://www.kuvu.biz",
				        "description": "Similique tenetur consectetur, maiores quis sapiente ad quia aut non.",
				        "dci_status": "Pendiente",
				        "created_at": "2015-01-07 23:28:20",
				        "updated_at": "2015-01-07 23:28:20",
				        "deleted_at": null,
					}
				}
			];
	}]);
</script>