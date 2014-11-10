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