<div class="ar-dashboard-wrapper" ng-controller="DashboardController">
	<h4>Eventos y Solicitudes</h4>
	<div class="ar-eventlist ar-vwrap">
		<div class="ar-event" ng-repeat="event in events">
			<div class="ar-vwrap ar-row" ng-class="{'expanded':event.expanded}">
			
				<div class="ar-vwrap">
					<div class="col-xs-12 col-sm-9 ar-nopad">
						<div class="col-xs-12 col-sm-2 ar-eid">{{event.pid}}</div>
						<div class="col-xs-12 col-sm-10 ar-field ar-ellipsable ar-lnnormal">{{event.title}}</div>
					</div>
					<div class="col-xs-12 col-sm-3 ar-nopad">
						<div class="col-xs-10 ar-field">{{event.begins}}</div>
						<div class="col-xs-2 ar-down" ng-click="event.expanded=!event.expanded"></div>
					</div>
				</div>

				<div class="ar-expanded-wea ar-vwrap">
					<div class="ar-expanded-wea-container">

						<div class="ar-row ar-vwrap col-xs-12 col-sm-4 ar-nopad">
							<div class="ar-lnnormal ar-service-status ar-vwrap">
								<div class="ar-place">Complejo Cultural Universitario</div>
								<div class="ar-row ar-vwrap">
									<div class="col-xs-12 col-sm-6 ar-colgroup">45/78/12</div>
									<div class="col-xs-12 col-sm-6 ar-colgroup">45/78/12</div>
								</div>								
							</div>
							<div class="ar-lnnormalst ar-desc" ng-class="{'expanded':event.descExpanded}" ng-click="event.descExpanded=!event.descExpanded">
								<p>
									Lorem ipsum dolor sit amet, consectetur adipisicing elit. Esse deserunt dolor excepturi reiciendis adipisci ullam optio animi, hic repellat eligendi tempore reprehenderit ipsa libero quibusdam impedit necessitatibus asperiores omnis nihil quaerat cupiditate! Alias ad ducimus, asperiores deleniti delectus sint veniam ab nihil fugiat aspernatur aut, tempore eaque. Cum odio vero, non voluptates necessitatibus sint, dolorem omnis, fuga, tempore perferendis alias. Officiis omnis illum quod autem, quaerat laboriosam aliquam praesentium! Doloribus molestiae soluta omnis voluptas ex fuga atque ipsum odio ut aspernatur unde neque reiciendis veritatis, cumque quia? Consectetur consequuntur possimus, mollitia laboriosam maiores quo sit asperiores unde minus aspernatur porro dolorem quod, quae voluptatibus eaque aperiam neque nostrum, dicta veritatis quibusdam dignissimos obcaecati fuga. In praesentium, expedita ducimus fugiat corporis iusto dolor aspernatur quo facilis.
								</p>
							</div>
						</div>

						<div class="ar-row col-xs-12 col-sm-6 ar-services">
							<div class="ar-row ar-hideon768 ar-title-row">
								<div class="col-xs-12 col-sm-6 ar-tfield ar-lnnormal">Servicio</div>
								<div class="col-xs-12 col-sm-6 ar-tfield ar-lnnormal ar-service-status">Estado</div>
							</div>	
							<div class="ar-row" ng-repeat="service in event.services">
								<div class="col-xs-12 col-sm-6 ar-tfield ar-lnnormal">{{service.name}}</div>
								<div class="col-xs-12 col-sm-6 ar-tfield ar-lnnormal ar-service-status">{{service.status}}</div>
							</div>
						</div>
						<div class="ar-row ar-hideon768 col-xs-12 col-sm-2 ar-services">
							<div>Editar evento</div>
							<div>Editar solicitud</div>
						</div>

					</div>
				</div>

			</div>
		</div>
	</div>
</div>
<script>
	angular.module('dashboard',[])
		.controller('DashboardController',[ '$scope' ,function($scope){
			$scope.events = [
				{
					/*
						1: pendiente
						2: aprobada
						3: en proceso
						4: concluida
					*/
					pid: '20150110',
					title: 'Mexican International Conference on Artificial Intelligence',
					begins: '15/Enero/2015',
					services: [
						{ 
							name : 'Spot de Radio',
							status: 'Pendiente'
						},
						{ 
							name : 'Banner Web',
							status: 'Aprobada'
						},
						{ 
							name : 'Publicación en Periódico',
							status: 'Concluida'
						},
						{ 
							name : 'Publicación en Periódico',
							status: 'Concluida'
						}						
					]
				}
			];
		}]);
</script>