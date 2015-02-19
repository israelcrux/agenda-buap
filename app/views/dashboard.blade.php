@extends('admin_layout')

@section('content')

    <div class="well ar-vwrap">
    	<div class="col-xs-12 col-sm-10">
    		<h3>Hola {{ Auth::user()->first_name }}</h3>
    	</div>
    	<div class="col-xs-12 col-sm-2">
			<!-- 
			<button type="button" class="btn btn-default" aria-label="Left Align">
				<span class="glyphicon glyphicon-align-left" aria-hidden="true"></span> 1 Mensaje
			</button>    		
			 -->
    	</div>

    </div>
	
    @include('alert')
	@include('dashboard-angular')

	<script>

		ROOT_PATH = "<?php echo URL::to('/'); ?>";
		FORM_ENABLED = false;
		ACTION = null;


		//JQ
		
		$(document).ready(function(){
			$('.datepicker').datepicker({autoclose: true,format: 'yyyy-mm-dd'}).on('changeDate', function(){
				$('.datepicker.dropdown-menu').hide();
			});
		});


		var fileButton = $(".filebtn");
		fileButton.click(function(){
			$(this).parent().find('.files').click(); 
		});
		$('.files').change(function(e){
			var n = e.target.files.length,
				text = (n==1)? 'archivo seleccionado' : 'archivos seleccionados';

			console.log( e.target.files );

			for (var i = n - 1; i >= 0; i--) {
				text += '<p>'+e.target.files[i].name+'</p>';
			};

			if(n == 0) fileButton.removeClass('loaded').text('Adjuntar material de apoyo');
			else fileButton.addClass('loaded').html(n+' '+text);

		});

		function yymmddToddmmyy(str){
			var yymmdd = str.split('-');
			return yymmdd[2] +'/'+ yymmdd[1] +'/'+ yymmdd[0];
		}

		function niceDates(data){
			for (var i = data.length - 1; i >= 0; i--) {
				
				data[i].end_day = yymmddToddmmyy(data[i].end_day);
				data[i].start_day = yymmddToddmmyy(data[i].start_day);

				// data[i].end_day = data[i].end_day.replace(/-/g,"/");
				// data[i].start_day = data[i].start_day.replace(/-/g,"/");


				// var ed = new Date(data[i].end_day.replace(/-/g,"/"));
				// console.log( ed );
				// console.log( ed.getDate() );
			};
			return data;
		}


		function serewi(events){
			console.log(events);
			for (var i = events.length - 1; i >= 0; i--) {
				for (var j = events[i].services.length - 1; j >= 0; j--) {
					events[i]['service_'+events[i].services[j].id] = true;
				}
				for (var j = events[i].resources_sources.length - 1; j >= 0; j--) {
					events[i]['resource_source_'+events[i].resources_sources[j].id] = true;					
				}
				for (var j = events[i].witnesses.length - 1; j >= 0; j--) {
					events[i]['witness_'+events[i].witnesses[j].id] = true;
				}
				for (var j = events[i].support_materials.length - 1; j >= 0; j--) {
					var ext = events[i].support_materials[j].file.match(/\.[a-zA-Z]+$/);
					events[i].support_materials[j].format = (ext != null && typeof ext[0] != 'null')? ext[0].substr(1,ext[0].length-1) : 'unknown';
				};
			};
			return events;
		}

		angular.module('dashboard',[])
		.factory('DataService',function($http){
			return {
				events : function(year,month){
					return $http.get(ROOT_PATH+'/events/user/<?php echo Auth::user()->id ?>')
						.then(function(response){
							return serewi(response.data);
						},
						function(){
							console.log('Could not load events!');
						})
				}
			};
		})
		.controller('DashboardController',[ '$scope', 'DataService' ,function($scope,DataService){

			$scope.FORM_ENABLED = false;
			$scope.ACTION = null;
			<?php 
				$FORM_ENABLED = Session::get('FORM_ENABLED');
				if( isset($FORM_ENABLED) ): 
			?>
				$scope.FORM_ENABLED = true;
				$scope.ACTION = "<?php echo Session::get('action');  ?>";

			<?php endif; ?>

			if( $scope.ACTION && $scope.ACTION == 'edit' ){
				$scope.currentEvent = {
					name : "<?php echo Input::old('name'); ?>",
	                start_day  : "<?php echo Input::old('start_day'); ?>",
	                end_day    : "<?php echo Input::old('end_day'); ?>",
	                time       : "<?php echo Input::old('time'); ?>",
	                place      : "<?php echo Input::old('place'); ?>",
	                link       : "<?php echo Input::old('link'); ?>",
	                directed_to: "<?php echo Input::old('directed_to'); ?>",
                	has_cost   : "<?php echo Input::has('has_cost'); ?>",
                	description: "<?php echo Input::get('description') ?>"
				};
			}

			$scope.costs = ['Entrada libre','Evento con Costo'];

			$scope.events = DataService.events();
			$scope.events.then(function(data){
				$scope.events = data;
			});

			$scope.showCreateForm = function(){
				$scope.new_event = true; 
				$('html, body').animate({ scrollTop: 0 }, 'slow');
			};

			$scope.showEditForm = function(event){
				$scope.currentEvent = event;
				$('#deleted-files').html('');
			};

			$scope.showCancelForm = function(event){
				$scope.eventToCancel = event;
			};			

			$scope.deleteFile = function(file){
				$scope.currentEvent.support_materials.splice(  $scope.currentEvent.support_materials.indexOf(file) ,1 );
				$('#deleted-files').append('<input type="hidden" name="deleted_files['+file.id+']" value="true">');
			};

		}]);
	</script>
@stop