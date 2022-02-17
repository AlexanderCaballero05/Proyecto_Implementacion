<?php

cLass ControladorUsuarios
{

/*=============================================
=            INGRESO DE USUARIO              =
=============================================*/

static public function ctrIngresoUsuario(){


    if(isset($_POST['ingUsuario'])){

include "conexion3.php";

$valor = $_POST["ingUsuario"];
$fechaactual=strtotime(date("d-m-Y H:i:00",time()));

//parametros del la funcion MdlMostrarUsuarios
$tabla = "tbl_usuario";	//parametro de tabla usuario
$item = "NOMBRE_USUARIO"; //parametro del nombre del usuario traido de la tabla usuario
$valor = $_POST["ingUsuario"];// parametro del usuario ingresado por formulario

$usuario = $_POST["ingUsuario"];

$ta= "tbl_parametros";
$ite= "CODIGO_PARAMETRO";
$val =1;

$respuesta = ModeloUsuarios::mdlMostrarUsuarios($tabla, $item, $valor);
$respu = ModeloUsuarios::mdlMostrarparametros($ta, $ite, $val);

$contra =$_POST['ingPassword'];

if ($respuesta["NOMBRE_USUARIO"] == $_POST["ingUsuario"]   && $respuesta["CONTRASENA"] == $contra && $respuesta["CODIGO_ESTADO"] == 2)

{

   // $_SESSION["iniciarSesion"] = "ok";

    $va = $_POST["ingUsuario"];
    
    $u=($_POST["ingUsuario"]);


   // $_SESSION['vario'] =$u;
    $_SESSION['userrr'] =$respuesta["Cod_tipo_rol"];

    echo '<script>
    Swal.fire({
        type: "success",
        title: "!Bienvenido al Sistema!",
        showConfirmButton: "true",
        confirmButtonText: "Entrar",
        closeOnConfirm: "false",
        background:"rgb(0,0,0,0.95)"

        }).then((result)=>{

            if (result.value){

                window.location = "inicio";
            }
            });
            </script>';



            } else {

                $servername = "localhost";
                $username = "root";
                $password = "";
                $dbname = "db_Proyecto_Prosecar";

                $conn = new mysqli($servername, $username, $password, $dbname);
                if($conn->connect_error){
                    die("Conexión fallida: ".$conn->connect_error);

                }
                   $va = $_POST["ingUsuario"];
$query = "UPDATE tbl_parametros_usuarios SET 
Par_Valor=Par_valor+1
WHERE Codigo_usuario = (SELECT Codigo_usuario From tbl_usuarios where Nombre_usuario = '$va') AND CODIGO_PARAMETRO = 1;";
$dato=$conn->query($query);
echo '<script>
Swal.fire({
type: "error",
title: "!Usuario y Contraseña Incorrectos !",
showConfirmButton: "true",
confirmButtonText: "Intentar de nuevo",
closeOnConfirm: "false",
background:"rgb(0,0,0,0.95)"

}).then((result)=>{

if (result.value){

    window.location = "login";
}
});
</script>';		





            }












       }


   }


   	/*--=====================================
  =            MOSTRAR USUARIO             =
  ======================================--*/

  static public function ctrMostrarUsuarios($item, $valor){

    $tabla = "tbl_usuarios";
    $respuesta = ModeloUsuarios::MdlMostrarUsuarios($tabla, $item, $valor);

    return $respuesta;
}














}








?>