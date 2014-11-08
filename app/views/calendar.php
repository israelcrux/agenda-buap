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
		<div class="ar-day-month" class="ar-disabled-day" ng-repeat="day in dummies" ng-show="mode=='month'">
		</div>
		<div class="ar-day-month" ng-class="{'selected':day.ntag&&currentDay.ntag==day.ntag}" ng-repeat="day in currentMonth.days" ng-click="dayView(day,$index)" ng-show="mode=='month'">
			<div class="ar-daytag">
				<span class="ar-text-tag">{{ day.ttag }}</span>
				<span class="ar-number-tag">{{ day.ntag }}</span>
			</div>
			<div class="ar-daymonth-container">
				<div class="ar-event" ng-show="day.activities[0]">
					<div class="ar-eventtitle"> {{day.activities[0].name}} </div>
					<div class="ar-eventtime"> {{day.activities[0].begins}} </div>
				</div>
				<div class="ar-moarrr" ng-show="day.activities[1]">
					<span></span>
					<span></span>
					<span></span>
				</div>
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
		var calendarDummies =[];
		var date = new Date(year,month-1,1);
		var fd = date.getDay();

		for(var i = fd; i > 0; i--){
			calendarDummies.push({disabled: true});
		}

		for (var i = 0, j = fd; i < days.length; i++, j = (j+1) % 7 ) {
			days[i].ttag = dayNames[j];
			days[i].ntag = (i+1);
			calendarDays.push( days[i] );
		};

		return { days: calendarDays, dummies: calendarDummies};
	}

	var app = angular.module('dgi',['cfp.hotkeys'])
		.config(function(hotkeysProvider) {
			hotkeysProvider.includeCheatSheet = false;
		})

	app.controller('CalendarController',['$scope','$http','hotkeys',function($scope,$http,hotkeys){

		$scope.mode = 'month';
		
		$scope.currentWeek = {
			name: 'Del 2 al 8 de Noviembre',
			days: [
				//7 days
			]
		};

		var dnd = calendarize(2014,11,[
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
				},
			]);

		$scope.dummies = dnd.dummies;

		$scope.currentMonth = {
			name : 'Noviembre',
			year : '2014',
			days : dnd.days
		};

		$scope.currentDay = {};

		//Today? ...doesn't really matter
		$scope.currentDayIndex = 0;
		$scope.calendarStatusClass = '';

		//UX -------------------
		$scope.mainView = function(){
			$scope.calendarStatusClass = '';
			$scope.currentDay = {};
		};
		$scope.dayView = function(day,index){
			if(!day.disabled){
				$scope.calendarStatusClass = 'ar-dayview';
				$scope.currentDay = day;
				$scope.currentDayIndex = index;
				$("#ar-collapsable-menu").removeClass( "in" ).removeClass("collapsing").addClass("collapse");
			}
		};
		//UX: keyboard shortcuts
		hotkeys.bindTo($scope)
			.add({
				combo: 'right',
				callback: function(event, hotkey) {
					var di = $scope.currentDayIndex;
					di = (di + 1) % $scope.currentMonth.days.length;
					$scope.currentDay = $scope.currentMonth.days[ di ];
					$scope.currentDayIndex = di;
					event.stopPropagation();
					event.preventDefault();
				}			
			})
			.add({
				combo: 'left',
				callback: function(event, hotkey) {
					var di = $scope.currentDayIndex;
					if(--di < 0)
						di = $scope.currentMonth.days.length - 1;
					$scope.currentDay = $scope.currentMonth.days[ di ];
					$scope.currentDayIndex = di;
					event.stopPropagation();
					event.preventDefault();
				}
			})
			.add({
				combo: 'down',
				callback: function(event, hotkey) {
					if($scope.currentDay.activities && $scope.calendarStatusClass == ''){
						var di = $scope.currentDayIndex + 7;
						if(di < $scope.currentMonth.days.length){
							$scope.currentDay = $scope.currentMonth.days[ di ];
							$scope.currentDayIndex = di;
						}
						event.stopPropagation();
						event.preventDefault();
					} else if ($scope.calendarStatusClass == 'ar-dayview'){

						event.stopPropagation();
						event.preventDefault();
					}
				}
			})
			.add({
				combo: 'up',
				callback: function(event, hotkey) {
					if($scope.currentDay.activities){
						var di = $scope.currentDayIndex - 7;
						if(di >= 0){
							$scope.currentDay = $scope.currentMonth.days[ di ];
							$scope.currentDayIndex = di;
						}
						event.stopPropagation();
						event.preventDefault();
					}
				}
			})
			.add({
				combo: 'enter',
				callback: function(event, hotkey) {
					console.log($scope.calendarStatusClass);
					if($scope.currentDayIndex && $scope.calendarStatusClass == ''){
						$scope.dayView( $scope.currentDay, $scope.currentDayIndex );
					}
				}
			})
			.add({
				combo: 'esc',
				callback: function(event, hotkey) {
					$scope.mainView();
				}
			});
	}]);
})();	
</script>