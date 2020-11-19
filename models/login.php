<?php 
include_once("conexion.php");

	$correo = $_POST['correo'];
	$password = $_POST['contraseña'];
	$code = $_POST['codigo'];

	$query = "SELECT correo, contrasenia, codigo FROM INVESTIGADOR WHERE correo = '$correo' AND contrasenia = '$password' AND codigo = '$code';
	$resultado = mysqli_query($conn, $query);

	$fila = mysqli_num_rows($resultado);

	if ($fila > 0) {
		header("Location: internal_pages/datosGeneralesUbI.php");
	}else{
		$_SESSION['message1'] = "Revise sus credenciales nuevamente para ingresar";
		header("Location: internal_pages/inicioSesionUbI.php");
	}
	
?>