<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport"
        content="width=device-width, user-scalable=no, initial-scale=1, maxium-scale=1.0, minium-scale=1.0, shrink-to-fit=no">
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <title>INICIO SESIÓN | GRUPOS INVESTIGACIÓN</title>
    <link rel="icon" href="../img/iconoub.jpg">
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300&family=Ranchers&display=swap"
        rel="stylesheet">
    <link rel="stylesheet" href="../css/fontello.css">
    <link rel="stylesheet" href="../css/estilos.css">
</head>

<body>
    <div class="text-center">
        <h1 class="display-3" >UbGI</h1>
        <img id="logoI" src="../img/img3.jpeg" alt="Logo UB" class="rounded-circle"><hr>
    </div>
    
    
    <form action="models/login.php" method="POST">
        <div>
			<?php if(isset($_SESSION['message1'])) { ?>
				<div class="alert alert-danger alert-dismissible fade show" role="alert">
					<?= $_SESSION['message1']; ?>
					<button type="button" class="close" data-dismiss="alert" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
			<?php session_unset();} ?>
		</div>
        <div class="form-group">
            <label>Correo:</label>
            <div class="input-group-prepend">
                <input type="text" class="field" name="correo">
                <spand class="input-group-text">@uniboyaca.edu.co</span> 
            </div>
        </div>

        <div class="form-group">
            <label>Código:</label>
            <input type="text" class="field" name="code"><br/>
        </div>

        <div class="form-group">
            <label>Contraseña:</label>
            <input type="password" class="field" name="password"><br/>
        </div>

        <a class="olvidar" href=""><u>¿Olvidaste tu contraseña?</u></a><br><br/>

        <input type="submit" class="btn btn-primary" name="ingresar" value="Ingresar">


    </form>
   
    <script src="../js/jquery-3.5.1.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
</body>

</html>