<?php
 require 'conexion_db.php';
    $conexion = mysqli_connect ($db_host_name, $db_user_name, $db_password);

    /* verificar la conexiÃ³n */
    if(mysqli_connect_errno()){
        echo "Error! Fallo la conexion";
            exit();
        }

       //seleccionar la base de datos concreta
        mysqli_select_db($conexion, $db_name) or die ("no se encontro la DDBB");

        //establece conjunto de caracteres predeterminados
        mysqli_set_charset($conexion, "utf8");

        //captura los datos del formulario mediante el metodo POST
        $nombre1 = $_POST['nombre1'];
        $nombre2 = $_POST['nombre2'];
        $apellido1 = $_POST['apellido1'];
        $apellido2 = $_POST['apellido2'];
        $DNI = $_POST['DNI'];
        $sexo = $_POST['sexo'];
        $fecha_nacimiento = $_POST['fecha_nacimiento'];
        $lugar_nacimiento = $_POST['lugar_nacimiento'];
        $fecha_registro = $_POST['fecha_inscripcion'];
        $fecha_baja = $_POST['fecha_baja'];
        $codigo_estado = $_POST['codigo_estado'];
        $codigo_rol = $_POST['codigo_rol'];

           //Consulta para hacer el insert de los datos en la DATABASE

           
 $insert_persona = "INSERT INTO persona (PRIMER_NOMBRE, SEGUNDO_NOMBRE, PRIMER_APELLIDO, SEGUNDO_APELLIDO, DNI, SEXO, FECHA_NACIMIENTO , LUGAR_NACIMIENTO , FECHA_INSCRIPCION , FECHA_BAJA , CODIGO_ESTADO , CODIGO_TIPO_ROL)
 VALUES ('$nombre1', '$nombre2', '$apellido1', '$apellido2', '$DNI' , '$sexo', '$fecha_nacimiento', '$lugar_nacimiento', '$fecha_registro', '$fecha_baja', '$codigo_estado', '$codigo_rol')";

 $insert_correo = "INSERT INTO correo (CORREO_PERSONA,CODIGO_PERSONA) VALUES ('$CORREO', '$codigo_persona')";
 $insert_telefono = "INSERT INTO telefono ("
 
 $resultado = mysqli_query($conexion, $insert_persona);
 if(!$resultado){
   echo "<script> 
   alert('!Error al ingresar los datos');
   window.location= './index.ph'
   </script>";
   exit;
 }
 else{

   echo "<script> 
   alert('!Usuario registrado exitosamente¡');
   window.location= './index.php'
   </script>";
   exit;
 }

 
//cerrar conexion
    mysqli_close($conexion);

    
 ?>
