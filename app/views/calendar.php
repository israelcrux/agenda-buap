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
			<div class="ar-ri ar-uptitle">{{currentMonth.name}} - {{currentMonth.year}}</div>
			<div class="ar-ri buttongroup ar-arrows">
				<div class="btn btn-mainbtn" ng-click="prevMonth()"></div>
				<div class="btn btn-mainbtn" ng-click="nextMonth()"></div>
			</div>
		</div>
		<div class="ar-day-month" class="ar-disabled-day" ng-repeat="day in currentMonth.dummies" ng-show="mode=='month'">
		</div>
		<div class="ar-day-month" ng-class="{'selected':day.ntag&&currentDay.ntag==day.ntag}" ng-repeat="day in currentMonth.days" ng-click="dayView(day,$index)" ng-show="mode=='month'">
			<div class="ar-daytag">
				<span class="ar-text-tag">{{ day.ttag }}</span>
				<span class="ar-number-tag">{{ day.ntag }}</span>
			</div>
			<div class="ar-daymonth-container">
				<div class="ar-event" ng-show="day.activities[0]">
					<div class="ar-eventtitle"> {{day.activities[0].name}} </div>
					<div class="ar-eventtime"> {{day.activities[0].time}} </div>
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
	var monthNames = ['','Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre']; 
	function calendarize(year, month, days){

		console.log('MONT: '+month);

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

		return { days: calendarDays, dummies: calendarDummies, name: monthNames[month], year: year, monthIndex : month-1};
	}

	function twoDigits(month){
		return  (month < 10)? '0' + month : month ;
	}

	var app = angular.module('dgi',['cfp.hotkeys'])
		.config(function(hotkeysProvider) {
			hotkeysProvider.includeCheatSheet = false;
		})

	app.factory('DataService',function($http){
		return {
			calendar : function(year,month){
				return $http.get('/comunicacion-buap/public/calendar/'+year+'-'+twoDigits(month))
					.then(function(response){					
						return calendarize(year,month,response.data);
					},
					function(){
						console.log('Could not load calendar!');
					})
			}
		};
	});

	app.controller('CalendarController',['$scope','$http','hotkeys','DataService',function($scope,$http,hotkeys,DataService){

		//UTILITIES --------------------------------------------------------
		function assignMonth(year,monthIndex){
			if($scope.allMonths[monthIndex+'-'+year]){
				$scope.currentMonth = $scope.allMonths[monthIndex+'-'+year];
			} else {
				$scope.currentMonth = DataService.calendar(year,monthIndex);
				$scope.currentMonth.then(function(data){
					$scope.currentMonth = data;
					$scope.allMonths[data.name+'-'+data.year] = data;
					console.log($scope.allMonths);
				});				
			}
		}

		//CONTROLLER --------------------------------------------------------		

		$scope.mode = 'month';
		
		$scope.currentWeek = {
			name: 'Del 2 al 8 de Noviembre',
			days: [
				//7 days
			]
		};

		var date = new Date(),
			day   = date.getDate(),
			month = date.getMonth()*1 + 1,
			year  = date.getFullYear();

		console.log('Displaying:'+year+'-'+month+' : '+day);

		$scope.currentYear = year;
		$scope.currentMonthIndex = month - 1;
		$scope.currentDayIndex = day - 1;

		$scope.allMonths = {};

		assignMonth(year,month);
		/*
		$scope.currentMonth = DataService.calendar(year,month);
		$scope.currentMonth.then(function(data){
			$scope.currentMonth = data;
			$scope.allMonths[data.monthIndex+'-'+data.year] = data;
			console.log($scope.allMonths);
		});
		*/

		$scope.currentDay = {};
	
		$scope.calendarStatusClass = '';


		//UX -------------------
		$scope.nextMonth = function(){
			
			if($scope.currentMonthIndex == 11){
				$scope.currentYear += 1;
				$scope.currentMonthIndex = 0;
			} else {
				$scope.currentMonthIndex += 1;
			}

			assignMonth($scope.currentYear,$scope.currentMonthIndex+1);
		};

		$scope.prevMonth = function(){

			console.log('$scope.currentMonthIndex:::');
			console.log($scope.currentMonthIndex);

			if($scope.currentMonthIndex == 0){
				$scope.currentYear -= 1;
				$scope.currentMonthIndex = 11;
			} else {
				$scope.currentMonthIndex -= 1;
			}

			console.log('currentMonthIndex:'+$scope.currentMonthIndex);

			assignMonth($scope.currentYear,$scope.currentMonthIndex+1);
		};

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