<div class="ar-calendar {{calendarStatusClass}}" ng-controller="CalendarController as calendar">
	<div class="ar-day">
	
		<div class="ar-closebtn" ng-click="mainView()"></div>
		<h4>{{currentDay.ttag}} {{currentDay.ntag}} de {{currentMonth.name}}</h4>
		<div class="ar-container scrollable">
			<div class="ar-event" ng-repeat="activity in currentDay.activities">
				<a class="ar-eventtitle" ng-href="#"> {{activity.name}} </a>
				<div class="ar-eventtime"> {{activity.begins}} </div>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laborum necessitatibus officiis doloremque, odio dolorum eveniet, facilis distinctio qui tenetur cum omnis obcaecati, reprehenderit illo aliquid recusandae nulla. Deserunt, repellat vel.</p>
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
		<div class="ar-day-month" ng-class="{'selected':day.ntag&&currentDay.ntag==day.ntag, 'ar-disabled-day':day.disabled}" ng-repeat="day in currentMonth.days" ng-click="dayView(day)" ng-show="mode=='month'">
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
							name: 'Lorem ipsum.', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
						{ 
							name: 'Svenska devritm', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
						{ 
							name: 'Waka waka eh eh', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
					]
				},
				{
					activities : [
						{ 
							name: 'Lorem ipsum.', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
						{ 
							name: 'Svenska devritm', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
						{ 
							name: 'Waka waka eh eh', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
					]
				},				{
					activities : [
						{ 
							name: 'Lorem ipsum.', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
						{ 
							name: 'Svenska devritm', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
						{ 
							name: 'Waka waka eh eh', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
					]
				},				{
					activities : [
						{ 
							name: 'Lorem ipsum.', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
						{ 
							name: 'Svenska devritm', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
						{ 
							name: 'Waka waka eh eh', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
					]
				},				{
					activities : [
						{ 
							name: 'Lorem ipsum.', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
						{ 
							name: 'Svenska devritm', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
						{ 
							name: 'Waka waka eh eh', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
					]
				},				{
					activities : [
						{ 
							name: 'Lorem ipsum.', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
						{ 
							name: 'Svenska devritm', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
						{ 
							name: 'Waka waka eh eh', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
					]
				},				{
					activities : [
						{ 
							name: 'Lorem ipsum.', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
						{ 
							name: 'Svenska devritm', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
						{ 
							name: 'Waka waka eh eh', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
					]
				},				{
					activities : [
						{ 
							name: 'Lorem ipsum.', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
						{ 
							name: 'Svenska devritm', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
						{ 
							name: 'Waka waka eh eh', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
					]
				},				{
					activities : [
						{ 
							name: 'Lorem ipsum.', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
						{ 
							name: 'Svenska devritm', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
						{ 
							name: 'Waka waka eh eh', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
					]
				},				{
					activities : [
						{ 
							name: 'Lorem ipsum.', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
						{ 
							name: 'Svenska devritm', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
						{ 
							name: 'Waka waka eh eh', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
					]
				},				{
					activities : [
						{ 
							name: 'Lorem ipsum.', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
						{ 
							name: 'Svenska devritm', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
						{ 
							name: 'Waka waka eh eh', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
					]
				},				{
					activities : [
						{ 
							name: 'Lorem ipsum.', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
						{ 
							name: 'Svenska devritm', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
						{ 
							name: 'Waka waka eh eh', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
					]
				},				{
					activities : [
						{ 
							name: 'Lorem ipsum.', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
						{ 
							name: 'Svenska devritm', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
						{ 
							name: 'Waka waka eh eh', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
					]
				},				{
					activities : [
						{ 
							name: 'Lorem ipsum.', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
						{ 
							name: 'Svenska devritm', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
						{ 
							name: 'Waka waka eh eh', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
					]
				},				{
					activities : [
						{ 
							name: 'Lorem ipsum.', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
						{ 
							name: 'Svenska devritm', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
						{ 
							name: 'Waka waka eh eh', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
					]
				},				{
					activities : [
						{ 
							name: 'Lorem ipsum.', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
						{ 
							name: 'Svenska devritm', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
						{ 
							name: 'Waka waka eh eh', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
					]
				},				{
					activities : [
						{ 
							name: 'Lorem ipsum.', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
						{ 
							name: 'Svenska devritm', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
						{ 
							name: 'Waka waka eh eh', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
					]
				},				{
					activities : [
						{ 
							name: 'Lorem ipsum.', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
						{ 
							name: 'Svenska devritm', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
						{ 
							name: 'Waka waka eh eh', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
					]
				},				{
					activities : [
						{ 
							name: 'Lorem ipsum.', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
						{ 
							name: 'Svenska devritm', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
						{ 
							name: 'Waka waka eh eh', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
					]
				},				{
					activities : [
						{ 
							name: 'Lorem ipsum.', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
						{ 
							name: 'Svenska devritm', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
						{ 
							name: 'Waka waka eh eh', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
					]
				},				{
					activities : [
						{ 
							name: 'Lorem ipsum.', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
						{ 
							name: 'Svenska devritm', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
						{ 
							name: 'Waka waka eh eh', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
					]
				},				{
					activities : [
						{ 
							name: 'Lorem ipsum.', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
						{ 
							name: 'Svenska devritm', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
						{ 
							name: 'Waka waka eh eh', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
					]
				},				{
					activities : [
						{ 
							name: 'Lorem ipsum.', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
						{ 
							name: 'Svenska devritm', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
						{ 
							name: 'Waka waka eh eh', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
					]
				},				{
					activities : [
						{ 
							name: 'Lorem ipsum.', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
						{ 
							name: 'Svenska devritm', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
						{ 
							name: 'Waka waka eh eh', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
					]
				},				{
					activities : [
						{ 
							name: 'Lorem ipsum.', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
						{ 
							name: 'Svenska devritm', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
						{ 
							name: 'Waka waka eh eh', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
					]
				},				{
					activities : [
						{ 
							name: 'Lorem ipsum.', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
						{ 
							name: 'Svenska devritm', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
						{ 
							name: 'Waka waka eh eh', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
					]
				},				{
					activities : [
						{ 
							name: 'Lorem ipsum.', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
						{ 
							name: 'Svenska devritm', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
						{ 
							name: 'Waka waka eh eh', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
						{ 
							name: 'Lorem ipsum.', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
						{ 
							name: 'Svenska devritm', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
						{ 
							name: 'Waka waka eh eh', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},						
					]
				},				{
					activities : [
						{ 
							name: 'Lorem ipsum.', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
						{ 
							name: 'Svenska devritm', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
						{ 
							name: 'Waka waka eh eh', 
							place: 'Complejo Deportivo de Alto Rendimiento', 
							begins: '9:00am'
						},
					]
				},

			])
		};

		$scope.currentDay = {};

		//UX -------------------
		$scope.mainView = function(){
			$scope.calendarStatusClass = '';
			$scope.currentDay = {};
		};
		$scope.dayView = function(day){
			if(!day.disabled){
				$scope.calendarStatusClass = 'ar-dayview';
				$scope.currentDay = day;
				$(".navbar-toggle").trigger( "click" );
			}
		};
	}]);
})();	
</script>