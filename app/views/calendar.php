<div class="ar-calendar {{calendarStatusClass}} ar-dayview" ng-controller="CalendarController as calendar">
	<div class="ar-day">
	
		<div class="ar-container">
			<div class="ar-closebtn" ng-click="mainView()"></div>
			<h4>{{currentDay.ttag}} {{currentDay.ntag}} de {{currentMonth.name}}</h4>
			<div class="ar-eventlist scrollable" id="day">
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consequuntur iusto reiciendis iste accusamus voluptas dolore qui, laboriosam sint quas dicta inventore atque libero vitae quidem deserunt, officiis ullam, numquam assumenda id odit! Repellat blanditiis consequatur dolor ullam neque, eius vero. Veritatis perferendis rerum soluta in repellat ullam, dolore repudiandae ad reprehenderit culpa architecto nobis provident enim ea voluptatum, autem accusamus nemo, nihil recusandae. Ea repudiandae, maxime dolorem. Ut sed omnis id commodi quia soluta, earum quae corrupti beatae ex iste aspernatur molestiae delectus enim quos laborum rem deleniti, officia aliquam consequatur. Excepturi, dicta quae eligendi eveniet aut vel voluptatem recusandae hic sunt dolorem inventore voluptate assumenda consequatur iste nostrum ab ex error aliquid consectetur quam aliquam et! Laborum dolor incidunt commodi, dignissimos libero rerum necessitatibus aut cupiditate, inventore voluptates nostrum fugiat tempore facilis ab quae qui consectetur praesentium reprehenderit. Iusto eligendi ut, vel provident voluptatum, quibusdam incidunt excepturi explicabo! Officiis ut vel laudantium voluptatum quis minima at natus inventore, consectetur dolore id dolor, commodi ea quos distinctio necessitatibus rem optio reiciendis fuga nobis repudiandae reprehenderit provident, aspernatur iusto iste. Hic temporibus quaerat iure, ex, similique a numquam illum recusandae aut, amet, modi omnis sunt veniam voluptate fugit in doloremque consequatur dolores sit. Sunt optio rerum velit, expedita hic magnam, officia fugit beatae quam. Qui nostrum officiis amet nihil, iure rem incidunt ut consectetur, est iusto perspiciatis dolore libero vitae voluptas officia necessitatibus eveniet accusamus beatae dolor nesciunt quo neque unde? Alias similique atque distinctio id tempore laboriosam doloribus facilis quod accusantium libero, minima, consequuntur incidunt corrupti maiores fugiat iure tempora itaque harum vero. Dignissimos quidem natus accusantium officia qui unde beatae illo mollitia, vero? Sint eligendi laborum quaerat veniam sit at atque iure nesciunt fuga accusamus. Nulla cupiditate commodi cumque, exercitationem explicabo voluptatum temporibus, itaque reiciendis tenetur numquam minima dolore repudiandae maiores quas. Omnis veniam saepe eveniet iure incidunt voluptate blanditiis harum, repellendus nostrum. Minima quos labore qui doloribus in ea non. Harum sunt nemo vitae ullam eum tempore esse, dolore voluptas a, dolorum, id nihil vero molestiae nam officia suscipit magnam. Unde soluta eveniet consequatur odio repudiandae molestias dicta repellat quaerat autem, dolores numquam iure tempore magni possimus provident exercitationem nulla quibusdam ipsum officia, esse qui! Deleniti facere illo nihil provident temporibus quae, veniam fugiat sequi suscipit deserunt magni sint hic voluptatum magnam officia repudiandae et, nostrum doloribus, praesentium nobis. Consequatur ut, mollitia, dolorem dolor adipisci reiciendis officia veritatis blanditiis sed aperiam saepe provident eius autem. Quisquam ad omnis, reprehenderit molestiae iste quis suscipit tempora eligendi dicta. Explicabo sunt, ex tempora doloremque quia omnis nesciunt quas commodi. Dolor voluptatum suscipit blanditiis a fuga, eaque, mollitia expedita maxime facere. Natus cum, esse, consequuntur nihil, perspiciatis ratione blanditiis maiores voluptate saepe inventore eius. Quasi amet nesciunt, sed cupiditate! Nobis eveniet earum minima tempora placeat illo suscipit consequatur minus. Rem dolor, placeat ratione, qui iusto expedita necessitatibus facere aut voluptatem eveniet inventore cupiditate ad quidem laborum a repellendus consequuntur voluptates nisi! Porro, voluptatem molestiae tempore iste unde accusamus dignissimos animi sed deserunt?</p>
				<div class="ar-event" ng-repeat="activity in currentDay.activities">
					<a class="ar-eventtitle" ng-href="#"> {{activity.name}} </a>
					<div class="ar-eventtime"> {{activity.begins}} </div>
				</div>
			</div>
		</div>

	</div>	
	<div class="ar-month" ng-show="mode=='month'" >
		<div class="ar-vwrap ar-right">
			<div class="ar-ri ar-uptitle">{{currentMonth.name}}</div>
			<div class="ar-ri buttongroup ar-arrows">
				<div class="btn btn-mainbtn"></div>
				<div class="btn btn-mainbtn"></div>
			</div>
		</div>
		<div class="ar-day-month" ng-class="{'selected':day.ntag&&currentDay.ntag==day.ntag}" ng-repeat="day in currentMonth.days" ng-click="dayView(day)" ng-show="mode=='month'" ng-class="{'ar-disabled-day':day.disabled}">
			<div class="ar-daytag">
				<span class="ar-text-tag">{{ day.ttag }}</span>
				<span class="ar-number-tag">{{ day.ntag }}</span>
			</div>
			<div class="ar-event" ng-repeat="activity in day.activities">
				<div class="ar-eventtitle"> {{activity.name}} </div>
				<div class="ar-eventtime"> {{activity.begins}} </div>
			</div>
		</div>
	</div>

</div>
<script>

//jq
$(document).ready(function(){
	var $body = $('body'),
    	$scrollable = $('.scrollable');	

    console.log($scrollable);

    $scrollable.on({
          'mouseenter': function () {
            // add hack class to prevent workspace scroll when scroll outside
            $body.addClass('noscroll');
          },
          'mouseleave': function () {
            // remove hack class to allow scroll
            $body.removeClass('noscroll');
          }
        });
});

(function(){

	var dayNames = ['Domingo','Lunes','Martes','Miércoles','Jueves','Viernes','Sábado'];

	function calendarize(year, month, days){
		var calendarDays =[];
		var date = new Date(year,month-1,1);

		var fd = date.getDay();

		for(var i = fd; i > 0; i--){
			calendarDays.push({disabled: true});
		}

		for (var i = 0, j = fd; i < days.length; i++, j = (j+1) % 7 ) {
			days[i].ttag = dayNames[j];
			days[i].ntag = (i+1);
			calendarDays.push( days[i] );
		};

		return calendarDays;
	}

	var app = angular.module('dgi',[]);
	app.controller('CalendarController',['$scope','$http',function($scope,$http){
		$scope.mode = 'month';
		
		$scope.currentWeek = {
			name: 'Del 2 al 8 de Noviembre',
			days: [
				//7 days
			]
		};

		$scope.currentMonth = {
			name : 'Noviembre',
			year : '2014',
			days : calendarize(2014,11,[
				{
					activities : [
						{ 
							name: 'Feria del alumno', 
							place: 'Complejo Cultural Universitario', 
							begins: '6:00pm'
						},
						{ 
							name: 'Reunión anual de directores',
							place: 'Edificio Carolino', 
							begins: '3:00pm'
						}						
					]
				},
				{
					activities : [
						{ 
							name: 'Universiada Nacional 2014', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						}
					]
				},
				{
					activities : [
						{ 
							name: 'Universiada Nacional 2014', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						}
					]
				},
				{
					activities : [
						{ 
							name: 'Universiada Nacional 2014', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						}
					]
				},
				{
					activities : [
						{ 
							name: 'Universiada Nacional 2014', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
						{ 
							name: 'Lorem ipsum dolor sit amet.', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
						{ 
							name: 'Lorem ipsum dolor sit amet, consectetur.', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
						{ 
							name: 'Lorem ipsum dolor sit amet, consectetur adipisicing.', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
						{ 
							name: 'Lorem ipsum dolor sit amet.', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
						{ 
							name: 'Lorem ipsum dolor sit amet, consectetur.', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
						{ 
							name: 'Lorem ipsum dolor sit amet, consectetur adipisicing.', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						}						
					]
				},
				{
					activities : [
						{ 
							name: 'Universiada Nacional 2014', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						}
					]
				},
				{
					activities : [
						{ 
							name: 'Universiada Nacional 2014', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						}
					]
				},
				{
					activities : [
						{ 
							name: 'Universiada Nacional 2014', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						}
					]
				},
				{
					activities : [
						{ 
							name: 'Universiada Nacional 2014', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						}
					]
				},
				{
					activities : [
						{ 
							name: 'Universiada Nacional 2014', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						}
					]
				},
				{
					activities : [
						{ 
							name: 'Universiada Nacional 2014', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						}
					]
				},
				{
					activities : [
						{ 
							name: 'Universiada Nacional 2014', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						}
					]
				},
				{
					activities : [
						{ 
							name: 'Universiada Nacional 2014', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						}
					]
				},
				{
					activities : [
						{ 
							name: 'Universiada Nacional 2014', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						}
					]
				},
				{
					activities : [
						{ 
							name: 'Universiada Nacional 2014', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						}
					]
				},
				{
					activities : [
						{ 
							name: 'Universiada Nacional 2014', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						}
					]
				},
				{
					activities : [
						{ 
							name: 'Universiada Nacional 2014', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						}
					]
				},
				{
					activities : [
						{ 
							name: 'Universiada Nacional 2014', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						}
					]
				},
				{
					activities : [
						{ 
							name: 'Universiada Nacional 2014', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						}
					]
				},
				{
					activities : [
						{ 
							name: 'Universiada Nacional 2014', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						}
					]
				},
				{
					activities : [
						{ 
							name: 'Universiada Nacional 2014', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						}
					]
				},
				{
					activities : [
						{ 
							name: 'Universiada Nacional 2014', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						}
					]
				},
				{
					activities : [
						{ 
							name: 'Universiada Nacional 2014', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						}
					]
				},
				{
					activities : [
						{ 
							name: 'Universiada Nacional 2014', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						}
					]
				},
				{
					activities : [
						{ 
							name: 'Universiada Nacional 2014', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						}
					]
				},
				{
					activities : [
						{ 
							name: 'Universiada Nacional 2014', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						}
					]
				},
				{
					activities : [
						{ 
							name: 'Universiada Nacional 2014', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						}
					]
				},
				{
					activities : [
						{ 
							name: 'Universiada Nacional 2014', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						}
					]
				},
				{
					activities : [
						{ 
							name: 'Universiada Nacional 2014', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						}
					]
				},
				{
					activities : [
						{ 
							name: 'Universiada Nacional 2014', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						}
					]
				},
			])
		};

		$scope.currentDay = {};

		//UX -------------------
		$scope.mainView = function(){
			$scope.calendarStatusClass = '';
		};
		$scope.dayView = function(day){
			if(!day.disabled){
				$scope.calendarStatusClass = 'ar-dayview';
				$scope.currentDay = day;
			}
		};
	}]);
})();	
</script>