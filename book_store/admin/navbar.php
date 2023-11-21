
<style>
	.collapse a{
		text-indent:10px;
	}
	nav#sidebar{
		/*background: url(assets/uploads/<?php echo $_SESSION['system']['cover_img'] ?>) !important*/
	}
</style>

<nav id="sidebar" class='mx-lt-5 bg-dark' >
		
		<div class="sidebar-list">
				<a href="index.php?page=home" class="nav-item nav-home"><span class='icon-field'><i class="fa fa-tachometer-alt "></i></span> Cuadro de mandos</a>
				<a href="index.php?page=orders" class="nav-item nav-orders"><span class='icon-field'><i class="fa fa-clipboard-list"></i></span> Pedidos</a>
				<?php if($_SESSION['login_type'] == 1): ?>
				<div class="mx-2 text-white">Lista principal</div>
				<a href="index.php?page=categories" class="nav-item nav-categories"><span class='icon-field'><i class="fa fa-list-alt "></i></span> Categories</a>
				<a href="index.php?page=books" class="nav-item nav-books"><span class='icon-field'><i class="fa fa-book "></i></span> Libros</a>
				<?php endif; ?>
				<div class="mx-2 text-white">Informe</div>
				<a href="index.php?page=sales_report" class="nav-item nav-sales_report"><span class='icon-field'><i class="fa fa-th-list"></i></span> Informe de ventas</a>
				<?php if($_SESSION['login_type'] == 1): ?>
				<div class="mx-2 text-white">Sistemas</div>
				<a href="index.php?page=users" class="nav-item nav-users"><span class='icon-field'><i class="fa fa-users "></i></span> Usuarios</a>
				<a href="index.php?page=site_settings" class="nav-item nav-site_settings"><span class='icon-field'><i class="fa fa-cogs"></i></span> Configuración del sistema</a>
			<?php endif; ?>
		</div>

</nav>
<script>
	$('.nav_collapse').click(function(){
		console.log($(this).attr('href'))
		$($(this).attr('href')).collapse()
	})
	$('.nav-<?php echo isset($_GET['page']) ? $_GET['page'] : '' ?>').addClass('active')
</script>
