<?php 
	$alert = Session::get('alert');
	if($alert){ 
?>
	<div id="ar-alrt" class="ar-alert in">
        <?php 
            if(is_object($alert)){
                $messages = '';
                foreach ($alert->all() as $message) {
                    $messages .= $message . '<br>';
                }
                echo $messages;
            }
            else {
                echo $alert;
            }
        ?>
    </div>
	<script>
		setTimeout(function(){
			document.getElementById('ar-alrt').className="ar-alert out";
		},3000);
	</script>
<?php 
	}
?>