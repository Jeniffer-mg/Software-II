<?php
    if(isset($_POST['insert'])){
        $Nombre=$_POST["nombre"];
        $FechaNac=$_POST["fechaNac"];
        $Nacio=$_POST["nacionalidad"];
        $Facu=$_POST["facultad"];
        $Program=$_POST["programa"];
        $Correo=$_POST["correo"];
        $Codigo=$_POST["codigo"];
        $Contraseña=$_POST["contraseña"];
        include ("conexion.php");
    }
?>