<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700' rel='stylesheet' type='text/css'>
	{{ HTML::style('css/everything.css'); }}
	{{ HTML::script('js/everything.js'); }}
</head>
<body ng-app="dgi">
	<div class="nav navbar navbar-default" role="navigation">
		<div class="container-fluid ar-wrapper">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#ar-collapsable-menu">
					<span class="sr-only">Menu</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<div class="navbar-brand">

					<div class="ar-buap-logo">
						BUAP
					</div>
					<div class="ar-dep">
						<span class="ar-long">Dirección de Comunicación Institucional</span>						
						<span class="ar-short">DGI</span>
					</div>

				</div>
			</div>
			<div class="collapse navbar-collapse navbar-right" id="ar-collapsable-menu">
		      <ul class="nav navbar-nav">
		        <li><a href="#">Acerca de</a></li>
		        <li><a href="#">Ingresar</a></li>
		        <li>
		        <!--
				  <form class="navbar-form navbar-left" role="search">
			        <div class="form-group">
			          <input type="text" class="form-control" placeholder="Buscar">
			        </div>
			      </form>
			    -->
		        </li>
		      </ul>
		    </div>  
		</div>
	</div>
	<div class="ar-wrapper ar-thecontent">
		@section('content')
	</div>
	@show
</body>
</html>