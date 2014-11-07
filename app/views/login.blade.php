@extends('layout')

@section('content')
	<?php 
		$alert = Session::get('alert');
		if($alert){ 
	?>
   	<div id="ar-alrt" class="ar-alert in"><?php echo $alert ?></div>
   	<script>
   		setTimeout(function(){
   			document.getElementById('ar-alrt').className="ar-alert out";
   		},3000);
   	</script>
	<?php 
		} 
	?>
    <div class="ar-alert">Testing</div>

	<div class="ar-form-wrapper ar-login-form">
		<div class="ar-form-container">
			<h1>Entrar</h1>
		    {{ Form::open(array('url' => '/login', 'method' => 'post', 'role'=>'form', 'class' =>'form-horizontal' )); }}
				<input class="form-control" name="username" type="text" id="username" placeholder="e-mail" autocomplete="off" required="true">
				<input class="form-control" name="password" type="password" value="" id="password" placeholder="password" required="true">
				<input class="form-control" type="submit" value="Entrar">
		    {{ Form::close(); }}		    
		</div>
	</div>
@stop