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

$contra =crypt($_POST["ingPassword"],'$2a$07$usesomesillystringforsalt$');//se desencripta la contraseña


if ($respuesta["NOMBRE_USUARIO"] == $_POST["ingUsuario"] && $respuesta["CONTRASENA"] == $contra && $respuesta["CODIGO_ESTADO"] == 2)
{

    $_SESSION["iniciarSesion"] = "ok";

    $va = $_POST["ingUsuario"];
    
               $u=($_POST["ingUsuario"]);
                $_SESSION['vario'] =$u;
                $_SESSION['userrr'] =$respuesta["CODIGO_TIPO_ROL"];

               

                    //llamado a la funcion

                    
                echo '<script>
                Swal.fire({
                    icon: "success",
                    type: "success",
                    title: "!Bienvenido al Sistema!",
                    showConfirmButton: "true",
                    confirmButtonText: "Entrar",
                    closeOnConfirm: "false",
                    background:"rgb(245, 245, 245)"
                    }).then((result)=>{
                        if (result.value){
                            window.location="inicioadmin"
                        }
                        });
                        </script>';

}else if ($respuesta["NOMBRE_USUARIO"] == $_POST["ingUsuario"] && $respuesta["CONTRASENA"] == $contra && $respuesta["CODIGO_ESTADO"] == 1){

    
    $_SESSION['vario'] =$_POST["ingUsuario"];
    echo '<script>

    Swal.fire({
        type: "success",
        icon: "info",
        title: "!Debe contestar unas preguntas!",
        showConfirmButton: "true",
        confirmButtonText: "Entrar",
        closeOnConfirm: "false",
        background:"rgb(245, 245, 245)"

        }).then((result)=>{

            if (result.value){

                window.location = "Vistas/modulos/preguntas_inicio.php";
            }
            });
            </script>';

                        


                        //Cuando se debe restablecer la contrasena porque se hizo la recuperacion por metodo correo
                    }else if ($respuesta["NOMBRE_USUARIO"] == $_POST["ingUsuario"] && $respuesta["CONTRASENA"] == $contra && $respuesta["CODIGO_ESTADO"] ==5){
                        $_SESSION['vario'] =$_POST["ingUsuario"];
                        echo '<script>
                            Swal.fire({
                            type: "success",
                            icon: "info",
                            text: "Contraseña provisional correcta, debe cambiar su contraseña por razones de seguridad",
                            showConfirmButton: "true",
                            confirmButtonText: "Ok",
                            closeOnConfirm: "false",
                            background:"rgb(245, 245, 245)"
                            }).then((result)=>{
                             if (result.value){
                                location.href = "Vistas/modulos/cambio_contrasena_correo.php";
                            }
                            });
                            </script>';
                        
}else if ($respuesta["NOMBRE_USUARIO"] == $_POST["ingUsuario"] && $respuesta["CONTRASENA"] == $contra && $respuesta["CODIGO_ESTADO"] ==3){
    //Usuario Inhabilitado, contacte al administrador
    echo '<script>

    Swal.fire({
        type: "success",
        title: "!Usuario Inhabilitado, contacte al administrador!",
        showConfirmButton: "true",
        confirmButtonText: "cerrar",
        closeOnConfirm: "false",
        background:"rgb(245, 245, 245)"

        }).then((result)=>{

            if (result.value){

                window.location = "login";
            }
            });
            </script>';


            $_SESSION['vario'] =$_POST["ingUsuario"];
            //llamada de la fuction bitacora -->

           
        
} 
else if ($respuesta["NOMBRE_USUARIO"] == $_POST["ingUsuario"] && $respuesta["CONTRASENA"] == $contra && $respuesta["CODIGO_ESTADO"] ==4){
    echo '<script>
    Swal.fire({
        type: "success",
        title: "!Usuario bloqueado, contacte al administrador!",
        showConfirmButton: "true",
        confirmButtonText: "cerrar",
        closeOnConfirm: "false",
        background:"rgb(245, 245, 245)"
    
        }).then((result)=>{
    
            if (result.value){
    
                window.location = "login";
            }
            });
            </script>';



        $_SESSION['vario'] =$_POST["ingUsuario"];
            //llamada de la fuction bitacora -->
            $_SESSION['vario'] = $valor;
            //llamada de la fuction bitacora -->
            

            

} else if ($respuesta["NOMBRE_USUARIO"] == $_POST["ingUsuario"] && $respuesta["CONTRASENA"] == $contra && $respuesta["CODIGO_ESTADO"] ==6){
         echo '<script>
        
         Swal.fire({
            type: "success",
            title: "!Su cuenta no está activada, contacte al administrador!",
             showConfirmButton: "true",
             confirmButtonText: "cerrar",
             closeOnConfirm: "false",
             background:"rgb(245, 245, 245)"
            
                }).then((result)=>{
            
                    if (result.value){
            
                        window.location = "login";
                    }
                    });
                    </script>';


                $_SESSION['vario'] =$_POST["ingUsuario"];
                    //llamada de la fuction bitacora -->
                 


} else if(($respuesta["Par_valor"]==$respu["VALOR"])and ($respuesta["CONTRASENA"] <> $_POST["ingPassword"])  ){
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
                CODIGO_ESTADO = 4
                WHERE Nombre_usuario='$valor'";


                echo '<script>

                Swal.fire({
                    type: "success",
                    title: "!Usuario bloqueado, contacte al administrador!",
                    showConfirmButton: "true",
                    confirmButtonText: "cerrar",
                    closeOnConfirm: "false",
                    background:"rgb(245, 245, 245)"

                    }).then((result)=>{

                        if (result.value){

                            window.location = "login";
                        }
                        });
                        </script>';
                $dato=$conn->query($query);

                                $_SESSION['vario'] = $valor;
                                //llamada de la fuction bitacora -->
                               

} elseif(($respuesta["NOMBRE_USUARIO"])!='ADMIN') {	
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
WHERE CODIGO_USUARIO=(SELECT codigo_usuario From tbl_usuario where NOMBRE_USUARIO = '$va') AND CODIGO_PARAMETRO = 1;";
$dato=$conn->query($query);
echo '<script>

Swal.fire({
    icon: "error",
    title: "Error",
    text: "Datos incorrectos.",
    showConfirmButton: "true",
    confirmButtonText: "Ok",
    closeOnConfirm: "false",
    background:"rgb(245, 245, 245)"

    }).then((result)=>{

        if (result.value){

            window.location = "index.php";
        }
        });
        </script>';


        $_SESSION['vario'] =$va;
        //llamada de la fuction bitacora -->
      
			
                    
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