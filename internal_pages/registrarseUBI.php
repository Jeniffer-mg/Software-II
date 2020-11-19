<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport"
        content="width=device-width, user-scalable=no, initial-scale=1, maxium-scale=1.0, minium-scale=1.0, shrink-to-fit=no">
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <title>REGISTRO</title>
    <link rel="icon" href="../img/iconoub.jpg">
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300&family=Ranchers&display=swap"
        rel="stylesheet">
    <link rel="stylesheet" href="../css/fontello.css">
    <link rel="stylesheet" href="../css/estilos.css">
</head>

<body>
    <div class="text-center">
        <h1 class="display-3" >UbI</h1>
        <img id="logoI" src="../img/img2.jpeg" alt="Logo UB" class="rounded-circle" style="width: 90px; height: 80px;"><hr>
    </div>
    
    
    <form id="formUBI" action="insert.php" method="POST">

        <p>Nombre: <input type="text" class="field float-right" name="nombre"><br/></p>

        <p>Fecha de Inicio: <input type="date" style="width: 5.35cm" class="field float-right" name="fechaIn"><br/></p>

        <p>Fecha de Nacimiento: <input type="date" style="width: 5.35cm" class="field float-right" name="fechaNac"><br/></p>
        
        <p>Nacionalidad: <input type="text" class="field float-right" name="nacionalidad"><br/></p>

        <p>Nivel de Formacion: <input type="text" class="field float-right" name="nivelF"><br/></p>

        <p>Horas Dedicadas: <input type="text" class="field float-right" name="hora"><br/></p>
        
        <p>Facultad: <input type="text" class="field float-right" name="facultad"><br/></p>
        
        <p>Programa: <input type="text" class="field float-right" name="programa"><br/></p>

        <p>Correo: <input type="text" class="field float-right" name="correo"><br/></p>
        
        <p>Código: <input type="text" class="field float-right" name="codigo"><br/></p>
        
        <p>Contraseña:  <input type="password" class="field float-right" name="contraseña"><br/></p>

        <small>Su contraseña debe contener entre 8 a 16 caracteres, contener letras, números y mayúsculas.</small>

        <p class="center-content"><input id="boton" type="submit" class="btn btn-outline-danger" value="Registrar"></p>

    </form>
    
    <script src="../js/jquery-3.5.1.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
</body>

</html>