<?php session_start() ?>
<div class="container-fluid">
	<div class="col-lg-12">
		<p>Esta transacción sólo se acepta contra reembolso. Por favor, espere a que el correo electrónico de verificación o llamada de la gestión después de la comprobación a cabo</p>
		<form id="manage-order">
			<div class="form-group">
				<label for="" class="control-label">Direccion de Delivery</label>
				<textarea name="address" id="" cols="30" rows="4" class="form-control" required=""><?php echo $_SESSION['login_address'] ?></textarea>
			</div>
		</form>
	</div>
</div>
<script>
	$('#manage-order').submit(function(e){
		e.preventDefault()
		start_load()
		$.ajax({
			url:'admin/ajax.php?action=save_order',
			method:'POST',
			data:$(this).serialize(),
			error:err=>{
				console.log(err)
			},
			success:function(resp){
				if(resp == 1){
					alert_toast('Order successfully submitted.',"success");
					setTimeout(function(){
						location.reload()
					},750)
				}
			}
		})
	})
</script>