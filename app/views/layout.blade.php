<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<meta name="viewport", content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" >
	<link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700' rel='stylesheet' type='text/css'>
	{{ HTML::style('css/everything.css'); }}
	<script>
		//'/comunicacion-buap/public/calendar/'
		ROOT_PATH = "<?php echo URL::to('/'); ?>";
	</script>
	{{ HTML::script('js/everything.js'); }}
</head>
<body>
	<div class="ar-above">
		<div class="nav navbar navbar-default" role="navigation">
			<div class="container-fluid ar-wrapper ar-navfl">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#ar-collapsable-menu">
						<span class="sr-only">Menu</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<div class="navbar-brand">
						<a href="{{ URL::to('/') }}">
							<div class="ar-buap-logo">
								BUAP
							</div>
							<div class="ar-dep">
								<span class="ar-long">Dirección de Comunicación Institucional</span>
								<span class="ar-short">DCI</span>
							</div>
						</a>
					</div>
				</div>
				<div class="collapse navbar-collapse navbar-right" id="ar-collapsable-menu">
			      <ul class="nav navbar-nav">
			        <li>{{ HTML::link('/login','Ingresar') }}</li>
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
			<?php /*
			@section('banner')
			@show
			*/ ?>

			@section('content')
			@show
		</div>
	</div>
	<footer>
		<div class="ar-wrapper ar-vwrap">
			<div class="col-xs-6 col-md-4">
				<a class="ar-footer-logo" target="_blank" href="http://cmas.siu.buap.mx/portal_pprd/wb/BBUAP/inicio"></a>
			</div>
			<div class="col-xs-6 col-md-4">
				<p>
					<a target="_blank" href="http://cmas.siu.buap.mx/portal_pprd/wb/BBUAP/directorio_telefonico_2013">Directorio Telefónico</a>
					<a target="_blank" href="http://cmas.siu.buap.mx/portal_pprd/wb/rectoria/avisos">Aviso de Privacidad</a>
					<a target="_blank" href="http://cmas.siu.buap.mx/portal_pprd/wb/BBUAP/buzon_de_comentarios">Buzón de comentarios</a>
				</p>
			</div>
			<div class="col-xs-6 col-md-4">
				<p>
					Benemérita Universidad Autónoma de Puebla <br>
					4 sur 104 Centro Histórico C.P. 72000 <br>
					Teléfono +52(222) 2295500 ext. 5013 <br>
				</p>				
			</div>
		</div>
	</footer>
</body>
</html>