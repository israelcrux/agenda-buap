<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	{{ HTML::style('css/everything.css'); }}
</head>
<body>
	<div class="ar-wrapper">
		<div class="nav navbar navbar-default" role="navigation">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#ar-collapsable-menu">
						<span class="sr-only">Menu</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#">Dirección de Comunicación Institucional</a>
				</div>
				<div class="collapse navbar-collapse navbar-right" id="ar-collapsable-menu">
			      <ul class="nav navbar-nav">
			        <li class="active"><a href="#">Ingresar</a></li>
			      </ul>
			    </div>  
			</div>
		</div>
	</div>
	@section('content')
	@show
	{{ HTML::script('js/jquery.min.js'); }}
	{{ HTML::script('js/bootstrap.min.js'); }}
</body>
</html>