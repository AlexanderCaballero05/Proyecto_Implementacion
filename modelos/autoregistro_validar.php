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

$sexo = $_POST['sexo'];

//DATOS PARA LA TABLA TELEFONO
$telefono = $_POST['telefono'];

//TABLA CORREO QUE ESTA RELACIONADO CON PERSONAS
$correo = $_POST['ingcorreo'];

//DATOS PARA LA TABLA DE USUARIOS
$usuario = $_POST['ingusuario'];
$contrasena = $_POST['ingcontrasena'];




// VERIFICAR LOS DATOS NO EXISTAN EN LA BASE DE DATOS ANTES DE INSERTAR LOS DATOS
try{

  //nombre del usuario
  $queryusuario = mysqli_query($conn,"SELECT * FROM TBL_USUARIO WHERE NOMBRE_USUARIO = '$usuario'");
  $fila = mysqli_fetch_array($queryusuario);
  $buscaru = mysqli_fetch_array($queryusuario);

  //DNI o numero de identidad del usuario
  $querydni = mysqli_query($conn,"SELECT * FROM TBL_PERSONA WHERE DNI = '$dni'");
  $filadni = mysqli_fetch_array($querydni);
  $buscardni = mysqli_fetch_array($querydni);

  if(($fila > 0)||($usuario == $buscaru)){
    echo "<script>
    alert('El Nombre de usuario $usuario ya se encuentra registrado');
        window.location = '../Vistas/modulos/auto_registro.php';
        </script>";
  }elseif(($filadni > 0)||($dni == $buscardni)){
   echo "<script>
    alert('El numero de identidad $dni ya se encuentra registrado');
        window.location = '../Vistas/modulos/auto_registro.php';
        </script>";
  


  // SI LOS DATOS DE USUARIO E IDENTIDAD NO EXISTEN PUEDE INSERTAR LOS DATOS EN LA BASE DE DATOS
  }else{

    //INSERTS A LA BASE DE DATOS

if(isset($_POST['btnregistrar'])){
  try {

  //ENCRIPTAR LA CONTRASEÑA
  //$contrasena = password_hash($contrasena, PASSWORD_DEFAULT); //encripta la contraseña usando la misma variable de contraseña
  $queryregistrarp = "INSERT INTO TBL_PERSONA(PRIMER_NOMBRE,SEGUNDO_NOMBRE,PRIMER_APELLIDO,SEGUNDO_APELLIDO,DNI, FECHA_NACIMIENTO,LUGAR_NACIMIENTO, FECHA_INSCRIPCION, CODIGO_TIPO_PERSONA, CREADO_POR_USUARIO, FECHA_CREACION, FECHA_MODIFICACION, SEXO)
   VALUES('$primernombre','$segundonombre','$primerapellido','$segundoapellido','$dni','$fecha','$lugar', '$fechaActual','3','NO DEFINIDO', '$fechaActual','$fechaActual','$sexo')";
  $resultado=$conn->query( $queryregistrarp);
  
  //CODIGO PERSONA: para poder relacionar las otras tablas de correo y usuario con el código de persona
  $codigo = mysqli_insert_id($conn);

  $querytelefono = "INSERT INTO TBL_TELEFONO (CODIGO_TELEFONO, CODIGO_PERSONA) VALUES('$telefono','$codigo')";

  $querycorreo = "INSERT INTO TBL_CORREO_ELECTRONICO( CORREO_PERSONA, CODIGO_PERSONA) VALUES ('$correo','$codigo')";
   
  $resultado=$conn->query( $querytelefono);
  $resultado=$conn->query( $querycorreo);


  $queryregisusuario = "INSERT INTO TBL_USUARIO(CODIGO_PERSONA, NOMBRE_USUARIO, CODIGO_ESTADO,CONTRASENA) VALUES  ('$codigo','$usuario','3','$contrasena')";
  $resultado=$conn->query( $queryregisusuario);
  
  
  

  $conn->commit();
  echo "<script>
  alert('Registro Exitoso');
  window.location = '../index';
   </script>";
} catch (PDOException $e) {
// si ocurre un error hacemos rollback para anular todos los insert
$conn->rollback();
echo $e->getMessage();;
echo "<script>
                          alert('Error al crear registro');
                          window.location = 'login';
                           </script>";
}}
  }

} catch(PDOException $e){
  echo $e->getMessage();  
  return false;
}





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


     
   


?>


