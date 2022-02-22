<?php
session_start();

include("conexion.php");
//DATOS PARA LA TABLA PERSONA
$primernombre = $_POST['nombre1'];
$segundonombre = $_POST['nombre2'];
$primerapellido = $_POST['apellido1'];
$segundoapellido = $_POST['apellido2'];
$dni = $_POST['dni'];
$fecha = $_POST['fechana'];
$lugar = $_POST['lugarna'];
$fechaActual = date('Y-m-d');

//TABLA SEXO (CAMPO SEPARADO DE LA TABLA PERSONA)
$sexo = $_POST['sexo'];

//TABLA CORREO QUE ESTA RELACIONADO CON PERSONAS
$correo = $_POST['ingcorreo'];

//DATOS PARA LA TABLA DE USUARIOS
$usuario = $_POST['ingusuario'];
$contrasena = $_POST['ingcontrasena'];


//INSERTS A LA BASE DE DATOS

if(isset($_POST['btnregistrar'])){
  try {

  $contrasena = password_hash($contrasena, PASSWORD_DEFAULT); //encripta la contraseña usando la misma variable de contraseña
  $queryregistrarp = "INSERT INTO TBL_PERSONA(PRIMER_NOMBRE,SEGUNDO_NOMBRE,PRIMER_APELLIDO,SEGUNDO_APELLIDO,DNI, FECHA_NACIMIENTO,LUGAR_NACIMIENTO, FECHA_INSCRIPCION, CODIGO_TIPO_PERSONA, CREADO_POR_USUARIO, FECHA_CREACION, FECHA_MODIFICACION)
   VALUES('$primernombre','$segundonombre','$primerapellido','$segundoapellido','$dni','$fecha','$lugar', '$fechaActual','3','NO DEFINIDO', '$fechaActual','$fechaActual')";
  $resultado=$conn->query( $queryregistrarp);


  $querycorreo = "INSERT INTO TBL_CORREO_ELECTRONICO( CORREO_PERSONA) VALUES ('$correo')";

  $resultado=$conn->query( $querycorreo);


  $queryregisusuario = "INSERT INTO TBL_USUARIO(NOMBRE_USUARIO, CODIGO_ESTADO,CONTRASENA) VALUES  ('$usuario','3','$contrasena')";
  $resultado=$conn->query( $queryregisusuario);
  
  $queryregisexo = "INSERT INTO tbl_sexo (sexo) VALUES  ('$sexo')";
  $resultado=$conn->query( $queryregisexo);
  

  $conn->commit();
echo 'Datos insertados';
} catch (PDOException $e) {
// si ocurre un error hacemos rollback para anular todos los insert
$conn->rollback();
echo $e->getMessage();;
}}


//VALIDACION DE CORREO CON VALORES REQUERIDO DOMINIO, @
include_once "conexion3.php";

if (isset($_POST['ingcorreo'])== true && empty($_POST['ingcorreo'])==  false) {  
  $email= $_POST["ingcorreo" ];
if(!filter_var($email, FILTER_VALIDATE_EMAIL)==true) {
echo "<script> 
alert('direccion de correo no valida');

</script>";
}
}

//VALIDACION QUE EL NOMBRE DE USUARIO NO SE REPITA
//  sleep(1);
//  if (isset($_POST)) {
//      $nombre_usuario = (string)$_POST['NOMBRE_USUARIO'];
 
//      $result = $connexion->query(
//          'SELECT * FROM tbl_usuario WHERE NOMBRE_USUARIO = "'.strtolower($nombre_usuario).'"'
//      );
 
//      if ($result->num_rows > 0) {
//         echo '<div class="alert alert-danger"><strong>Oh no!</strong> Nombre de usuario no disponible.</div>';
//    } else {
//          echo '<div class="alert alert-success"><strong>Enhorabuena!</strong> Usuario disponible.</div>';
//      }
//  }

?>


