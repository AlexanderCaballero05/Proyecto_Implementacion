<!-- 
-----------------------------------------------------------------------
        Universidad Nacional Autonoma de Honduras (UNAH)
	            	Facultad de Ciencias Economicas
          Departamento de Informatica administrativa
         Analisis, Programacion y Evaluacion de Sistemas
                   Segundo Periodo 2022

  Equipo:
  Arnold Alexander Caballero Garcia (aacaballero@unah.hn)
  Luz Maria Montoya Medina (luz.montoya@unah.hn)
  Diana Rut Garcia Amador (drgarciaa@unah.hn)
  Any Melissa Hernandez (anyhernandez@unah.hn)
  Gissela Yamileth Diaz (gdiaza@unah.hn)
  Cesar Fernando Rovelo (Cesar.rovelo@unah.hn)

  Catedratico:
  Lic. Claudia Nuñez (Analisis)
  Lic. Giancarlo Martini Scalici Aguilar (Implementación)
  Lic. Karla Melisa Garcia Pineda (Evaluación)
---------------------------------------------------------------------
Programa:          Modelo Autoregistro de usuarios (validaciones)
Fecha:             10-dic-2021
Programador:       Gissela Yamileth Diaz y Luz María Montoya Medina
Descripcion:       Permite que todo lo ingresado en la pantalla de autoregistro se inserte en la base
                   de datos, entre otras validaciones.
-----------------------------------------------------------------------
 Historial de Cambio
-----------------------------------------------------------------------
Programador            Fecha                Descripcion
Luz María Montoya   11-Ago-2022       Se arregló el error del porque no se registraba el correo electrónico
-->
<?php
include("conexion.php");
include("function_bitacora.php");
//DATOS PARA LA TABLA PERSONA
$primernombre = $_POST['nombre1'];
$segundonombre = $_POST['nombre2'];
$primerapellido = $_POST['apellido1'];
$segundoapellido = $_POST['apellido2'];
$dni = $_POST['dni'];
$fecha = $_POST['fechana'];
$lugar = $_POST['lugarna'];
$fechaActual = date('Y-m-d');
$sexo = $_POST['sexo'];
$direccion = $_POST['direccion'];
//DATOS PARA LA TABLA TELEFONO
$telefono = $_POST['telefono'];
//TABLA CORREO QUE ESTA RELACIONADO CON PERSONAS
$correo = $_POST['ingcorreo'];
//DATOS PARA LA TABLA DE USUARIOS
$usuario = $_POST['ingusuario'];
$contrasena = $_POST['clave_nueva'];
$pass = crypt($contrasena, '$2a$07$usesomesillystringforsalt$');
$fecha_vencimiento = date("Y-m-d", strtotime($fechaActual . "+ 60 days"));

// VERIFICAR LOS DATOS NO EXISTAN EN LA BASE DE DATOS ANTES DE INSERTAR LOS DATOS
try {
  //nombre del usuario
  $queryusuario = mysqli_query($conn, "SELECT * FROM TBL_USUARIO WHERE NOMBRE_USUARIO = '$usuario'");
  $fila = mysqli_fetch_array($queryusuario);
  $buscaru = mysqli_fetch_array($queryusuario);
  //DNI o numero de identidad del usuario
  $querydni = mysqli_query($conn, "SELECT * FROM TBL_PERSONA WHERE DNI = '$dni'");
  $filadni = mysqli_fetch_array($querydni);
  $buscardni = mysqli_fetch_array($querydni);
  //El correo electrónico
  $querycorreoel = mysqli_query($conn, "SELECT * FROM TBL_CORREO_ELECTRONICO WHERE CORREO_PERSONA = '$correo'");
  $filacor = mysqli_fetch_array($querycorreoel);
  $buscarco = mysqli_fetch_array($querycorreoel);

  if (($fila > 0) || ($usuario == $buscaru)) {
    echo "<script>
    alert('El Nombre de usuario $usuario ya se encuentra registrado');
        window.location = '../Vistas/modulos/auto_registro.php';
        </script>";
  } elseif (($filadni > 0) || ($dni == $buscardni)) {
    echo "<script>
    alert('El numero de identidad $dni ya se encuentra registrado');
        window.location = '../Vistas/modulos/auto_registro.php';
        </script>";
  } elseif (($filacor > 0) || ($correo == $buscarco)) {
    echo "<script>
    alert('El correo: $correo ya se encuentra registrado');
          window.location = '../Vistas/modulos/auto_registro.php';
         </script>";
    // SI LOS DATOS DE USUARIO , IDENTIDAD Y CORREO NO EXISTEN PUEDE INSERTAR LOS DATOS EN LA BASE DE DATOS
  } else {

    //INSERTS A LA BASE DE DATOS

    if (isset($_POST['btnregistrar'])) {
      try {

        //ENCRIPTAR LA CONTRASEÑA
        //$contrasena = password_hash($contrasena, PASSWORD_DEFAULT); //encripta la contraseña usando la misma variable de contraseña
        $registrar = "INSERT INTO tbl_persona (`PRIMER_NOMBRE`, `SEGUNDO_NOMBRE`, `PRIMER_APELLIDO`, `SEGUNDO_APELLIDO`, `DNI`, `SEXO`, `FECHA_NACIMIENTO`, `LUGAR_NACIMIENTO`, `DIRECCION`, `FECHA_INSCRIPCION`, `CODIGO_TIPO_PERSONA`, `FECHA_CREACION`) VALUES
                                          ('$primernombre','$segundonombre','$primerapellido','$segundoapellido','$dni','$sexo','$fecha','$lugar','$direccion','$fechaActual','3','$fechaActual')";
        $resultado = $conn->query($registrar);
        //CODIGO PERSONA: para poder relacionar las otras tablas de correo y usuario con el código de persona
        $codigo = mysqli_insert_id($conn);

        $querytelefono = "INSERT INTO TBL_TELEFONO (NUMERO_TELEFONO, CODIGO_PERSONA) VALUES('$telefono','$codigo')";
        $resultado = $conn->query($querytelefono);


        $querycorreo = "INSERT INTO TBL_CORREO_ELECTRONICO(CORREO_PERSONA, CODIGO_PERSONA) VALUES ('$correo','$codigo')";
        $resultado = $conn->query($querycorreo);


        $queryregisusuario = "INSERT INTO TBL_USUARIO(CODIGO_PERSONA, NOMBRE_USUARIO, CODIGO_ESTADO, CODIGO_TIPO_ROL,CONTRASENA, FECHA_VENCIMIENTO, FECHA_CREACION) VALUES  ('$codigo','$usuario','6','3','$pass','$fecha_vencimiento','$fechaActual')";
        $resultado = $conn->query($queryregisusuario);



        $conn->commit();
        echo "<script> alert('Registro creado');
  window.location = '../index';
   </script>";

        $_SESSION['vario'] = $usuario;

       
      } catch (PDOException $e) {
        // si ocurre un error hacemos rollback para anular todos los insert
        $conn->rollback();
        echo $e->getMessage();;
        echo "<script>
                alert('Error al crear registro');
                window.location = 'login';
               </script>";
      }
    } // fin if
  } // fine else

} catch (PDOException $e) {
  echo $e->getMessage();
  return false;
}





//VALIDACION DE CORREO CON VALORES REQUERIDO DOMINIO, @
include_once "conexion3.php";

if (isset($_POST['ingcorreo']) == true && empty($_POST['ingcorreo']) ==  false) {
  $email = $_POST["ingcorreo"];
  if (!filter_var($email, FILTER_VALIDATE_EMAIL) == true) {
    echo "<script> 
alert('direccion de correo no valida');

</script>";
  }
}






?>