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
	
	@include('dashboard-angular')

	<script>
		$('.datepicker').datepicker();
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
					start_day: '15/Enero/2015',
					end_day: '17/Enero/2015',
					place: 'Complejo Cultural Universitario',
					description : 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Esse deserunt dolor excepturi reiciendis adipisci ullam optio animi, hic repellat eligendi tempore reprehenderit ipsa libero quibusdam impedit necessitatibus asperiores omnis nihil quaerat cupiditate! Alias ad ducimus, asperiores deleniti delectus sint veniam ab nihil fugiat aspernatur aut, tempore eaque. Cum odio vero, non voluptates necessitatibus sint, dolorem omnis, fuga, tempore perferendis alias. Officiis omnis illum quod autem, quaerat laboriosam aliquam praesentium! Doloribus molestiae soluta omnis voluptas ex fuga atque ipsum odio ut aspernatur unde neque reiciendis veritatis, cumque quia? Consectetur consequuntur possimus, mollitia laboriosam maiores quo sit asperiores unde minus aspernatur porro dolorem quod, quae voluptatibus eaque aperiam neque nostrum, dicta veritatis quibusdam dignissimos obcaecati fuga. In praesentium, expedita ducimus fugiat corporis iusto dolor aspernatur quo facilis.',
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
							name : 'La última!',
							status: 'Concluida'
						}						
					]
				}
			];
		}]);	
	</script>
@stop