<?php 

	include("conexion.php");
	if (isset($_POST['save'])) {
		$name = $_POST['names'];
		$email = $_POST['correo'];
		$pass = $_POST['contra'];

		$query = "INSERT INTO INVESTIGADOR(codigo, nombre, fecha_inicio, fecha_nacimiento, nivel_formacion, horas_dedicadas, edad, correo, contrasenia) VALUES ('$email','$pass','$name')";
		$result = mysqli_query($conn, $query);
		if (!$result) {
			die();
		}

		$_SESSION['message'] = "Nuevo Investigador Registrado";
		


		//redireccionar 
		header("location: .php");
	}

 ?>