//jq...
$(document).ready(function(){
	var $body = $('body'),
    	$scrollable = $('.scrollable');
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
		var calendarDays =[];
		var calendarDummies =[];
		var date = new Date(year,month-1,1);
		var fd = date.getDay();

		for(var i = fd; i > 0; i--){
			calendarDummies.push({disabled: true});
		}

		for (var i = 0, dd = fd; i < days.length; i++, dd = (dd+1) % 7 ) {
			days[i].ttag = dayNames[dd];
			days[i].ntag = (i+1);

			for (var k = days[i].activities.length - 1; k >= 0; k--) {
				if(days[i].activities[k].description.length > 220){
					days[i].activities[k].long_description = true;
				}
				days[i].activities[k].croppedDescription = _.str.prune( days[i].activities[k].description, 220 );
				days[i].activities[k].time = nicetime(days[i].activities[k].time);
			};

			calendarDays.push( days[i] );
		};

		return { days: calendarDays, dummies: calendarDummies, name: monthNames[month], year: year, monthIndex : month-1};
	}

	function twoDigits(month){
		return  (month < 10)? '0' + month : month ;
	}

	function nicetime(t){
		var n = (t.charAt(0) == '0')? 1 : 0;
		return t.substring(n,t.length - 3) + ' hrs';
	}

	var app = angular.module('dci',['cfp.hotkeys'])
		.config(function(hotkeysProvider) {
			hotkeysProvider.includeCheatSheet = false;
		});

	app.factory('DataService',['$http',function($http){
		return {
			calendar : function(year,month){
				return $http.get(window['ROOT_PATH']+'/calendar/'+year+'-'+twoDigits(month))
					.then(function(response){					
						return calendarize(year,month,response.data);
					},
					function(){
						console.log('Could not load calendar!');
					})
			}
		};
	}]);

	app.controller('CalendarController',['$scope','$http','hotkeys','DataService',function($scope,$http,hotkeys,DataService){

		//UTILITIES --------------------------------------------------------
		function assignMonth(year,monthIndex){
			if($scope.allMonths[monthIndex+'-'+year]){
				$scope.currentMonth = $scope.allMonths[monthIndex+'-'+year];
			} else {
				$scope.currentMonth = DataService.calendar(year,monthIndex);
				$scope.currentMonth.then(function(data){
					$scope.currentMonth = data;
					$scope.allMonths[monthIndex+'-'+year] = data;
				});				
			}
		}

		//CONTROLLER --------------------------------------------------------		
		
		//static data
		$scope.costs = ['Entrada libre','Evento con Costo'];

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

			if($scope.currentMonthIndex == 0){
				$scope.currentYear -= 1;
				$scope.currentMonthIndex = 11;
			} else {
				$scope.currentMonthIndex -= 1;
			}

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