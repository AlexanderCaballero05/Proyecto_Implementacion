<?php

cLass ControladorUsuarios
{

/*=============================================
=            INGRESO DE USUARIO              =
=============================================*/

static public function ctrIngresoUsuario(){

if(isset($_POST["ingUsuario"])){

include "conexion3.php";

$valor = $_POST["ingUsuario"];
$fechaactual=strtotime(date("d-m-Y H:i:00",time()));

$tabla = "tbl_usuario";

$item = "NOMBRE_USUARIO";
$valor = $_POST["ingUsuario"];
$usuario = $_POST["ingUsuario"];

$ta= "tbl_parametros";
$ite = "CODIGO_PARAMETRO";
$val =1;
$respuesta = ModeloUsuarios::MdlMostrarUsuarios($tabla, $item, $valor);
$respu = ModeloUsuarios::MdlMostrarparametros($ta, $ite, $val);
$contra =$_POST["ingPassword"];

if ($respuesta["NOMBRE_USUARIO"] == $_POST["ingUsuario"] && $respuesta["CONTRASENA"] == $contra && $respuesta["CODIGO_ESTADO"] == 2)
{

    $_SESSION["iniciarSesion"] = "ok";

    $va = $_POST["ingUsuario"];
    
    $u=($_POST["ingUsuario"]);

                $_SESSION['vario'] =$u;
                $_SESSION['userrr'] =$respuesta["CODIGO_TIPO_ROL"];
                echo "<script>
                  alert('Bienvenido al sistema');
                  location.href = 'inicioadmin';
                        </script>";
}else if ($respuesta["NOMBRE_USUARIO"] == $_POST["ingUsuario"] && $respuesta["CONTRASENA"] == $contra && $respuesta["CODIGO_ESTADO"] == 1){
    $_SESSION['vario'] =$_POST["ingUsuario"];
    echo "<script>
                  alert('Debe contestar las preguntas de seguridad y cambiar su contraseña provisional');
                  location.href = 'inicioadmin';
                        </script>";
                    }else if ($respuesta["NOMBRE_USUARIO"] == $_POST["ingUsuario"] && $respuesta["CONTRASENA"] == $contra && $respuesta["CODIGO_ESTADO"] ==5){
                        $_SESSION['usuar'] =$_POST["ingUsuario"];
                        echo "<script>
                              alert('Contraseña provisional correcta, debe cambiar su contraseña por razones de seguridad');
                              location.href = 'Vistas/modulos/cambio_contrasena_correo.php';
                                    </script>";
}else if ($respuesta["NOMBRE_USUARIO"] == $_POST["ingUsuario"] && $respuesta["CONTRASENA"] == $contra && $respuesta["CODIGO_USUARIO"] ==3){
    echo "<script>
    alert('Usuario Inhabilitado, contacte al administrador');
    location.href = 'login';
          </script>";
} 
else if ($respuesta["NOMBRE_USUARIO"] == $_POST["ingUsuario"] && $respuesta["CONTRASENA"] == $contra && $respuesta["CODIGO_USUARIO"] ==4){
    echo "<script>
    alert('Usuario bloqueado, contacte al administrador');
    location.href = 'login';
          </script>";
} else if(($respuesta["Par_valor"]==$respu["VALOR"])and ($respuesta["CONTRASENA"] <> $_POST["ingPassword"]) ){
$servername = "localhost";
        $username = "root";
        $password = "";
        $dbname = "db_proyecto_prosecar";

        $conn = new mysqli($servername, $username, $password, $dbname);
        if($conn->connect_error){
            die("Conexión fallida: ".$conn->connect_error);

        }
$valor = $_POST["ingUsuario"];
$query = "UPDATE tbl_usuario SET 
CODIGO_USUARIO= 4
WHERE Nombre_usuario='$valor'";
 echo "<script>
 alert('Usuario bloqueado, contacte al administrador');
 location.href = 'login';
       </script>";
$dato=$conn->query($query);
} else {	
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "db_proyecto_prosecar";

$conn = new mysqli($servername, $username, $password, $dbname);
if($conn->connect_error){
die("Conexión fallida: ".$conn->connect_error);

}
$va = $_POST["ingUsuario"];
$query = "UPDATE tbl_parametros_usuarios SET 
PAR_VALOR=(PAR_VALOR+1)
WHERE CODIGO_USUARIO=(SELECT codigo_usuario From tbl_usuario where NOMBRE_USUARIO = '$va') AND CODIGO_PARAMETRO = 3;";
$dato=$conn->query($query);
echo "<script>
alert('Usuario y contraseña incorrectos');
location.href = 'index.php';
</script>";				
                    
}
}
}

/*=============================================
=            REGISTRO DE USUARIO              =
=============================================*/



	/*--=====================================
  =            MOSTRAR USUARIO             =
  ======================================--*/

  static public function ctrMostrarUsuarios($item, $valor){

  	$tabla = "tbl_usuario";
  	$respuesta = ModeloUsuarios::MdlMostrarUsuarios($tabla, $item, $valor);

  	return $respuesta;
  }

}