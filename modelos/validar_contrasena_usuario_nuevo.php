<?php
 session_start();
 include "function_bitacora.php";
 include_once "conexion3.php";
include_once "conexion.php";
?>
<?php
if(isset($_SESSION['vario'])) {
    $nomUser=$_SESSION['vario'];
    $contraActual=crypt($_POST['contraAnte'],'$2a$07$usesomesillystringforsalt$');
    try{    
          $consultar_usuario = $db->prepare("SELECT * FROM tbl_usuario
          WHERE NOMBRE_USUARIO= (?)
          AND CONTRASENA ='$contraActual'"); 
            $consultar_usuario->execute(array($nomUser));
            $row=$consultar_usuario->fetchColumn();

              if($row>0){
                 $mostrarUser = $row;
                    if(isset($_POST['GUARDARCONTRA'])){
                        $contraNueva =($_POST['clave_nueva']);
                        $contraConfirm =($_POST['confirmar_clave']);
                        $pass= crypt($contraNueva,'$2a$07$usesomesillystringforsalt$');
                        $expre = " /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]/ ";/*se le asigana expresion regular
                        que valida que la contraseña tenga minimo una letra mayuscula,minuscula,codigo especial y numeros  */
                            if($contraNueva<>$contraConfirm){
                                echo "<script>
                                alert('Las contraseña no son iguales');
                                location.href = '../Vistas/modulos/cambio_contrasena_usuario_nuevo.php'; </script>";
                             }
                            else{
                                if(preg_match($expre,$contraNueva)){
                                    //se puede mandar a laas otras validaciones
                                    try{
                                        $sentencia ="SELECT * FROM tbl_usuario WHERE CONTRASENA = '$pass' AND CODIGO_USUARIO = '$mostrarUser';";
                                        $datos=$conn->query($sentencia);
                                        $row=$datos->num_rows;
                                        if($row>0){ //si la contraseña es la misma que tiene en el sistema
                                            echo "<script> alert('!Utilice una contraseña que no haya usado anteriormente')
                                            location.href = '../Vistas/modulos/cambio_contrasena_usuario_nuevo.php';
                                            </script>";
                                        }
                                        else{ //si la contraseña es diferente de la que tiene en el sistema
                                            try{
                                                $buscarclave = "SELECT * FROM tbl_ms_hist_contrasena  WHERE  CODIGO_USUARIO = '$mostrarUser'  AND CONTRASENA = '$pass';";
                                                $busqueda=$conn->query($buscarclave);
                                                $fila=$busqueda->num_rows;
                                                if($fila>0){
                                                    echo "<script> alert('!Utilice una contraseña que no haya usado anteriormente')
                                                    location.href = '../Vistas/modulos/cambio_contrasena_usuario_nuevo.php'; </script>";
                                                }
                                                else{
                                                    try{ //insert en la tabla de historial de contraseñas la nueva contraseña por el usario
                                                        $insert = "INSERT INTO tbl_ms_hist_contrasena (CODIGO_USUARIO,CONTRASENA,CREADO_POR_USUARIO)
                                                        VALUES ('$mostrarUser','$pass','$mostrarUser')";
                                                        $resultado=$conn->query($insert);
                                                        if($resultado>0){
                                                         //actualiza la tabla de tbl_usuario el campo de la contraseña el campo de modificado por
                                                            $update = "UPDATE tbl_usuario u
                                                            SET u.CONTRASENA = '$pass',
                                                            u.CODIGO_ESTADO = 2
                                                            WHERE u.NOMBRE_USUARIO ='$nomUser'";
                                                            $resul=$conn->query($update);
                                                            if($resul >0){//En caso que la contraseña se actualice correctamente.
                                                                echo "<script> 
                                                                alert('Contraseña cambiada exitosamente');
                                                                 location.href = '../index.php'; </script>";
                                                            } 
                                                        }
                                                        else{//error al ingresar los datos,saber que error sera :v (pero hay que mostrar mensaje de error xd )
                                                            echo "<script> 
                                                            alert('!Error al ingresar los datos¡');
                                                            location.href = '../Vistas/modulos/cambio_contrasena_usuario_nuevo.php';
                                                            </script>";
                                                            exit;
                                                        }
                                                    }catch (PDOException $e){
                                                    echo $e->getMessage();  
                                                    return false;
                                                    }
                                                } //cierre del else
                                            }catch (PDOException $e){
                                                echo $e->getMessage();  
                                                return false;
                                            }
                                            echo "<script> alert('Contraseña cambiada exitosamente');
                                            location.href = '../index.php'; </script>";
                                            //llamada de la fuction bitacora -->
                                        
                                        }//final del else
                                    }catch (PDOException $e){
                                    echo $e->getMessage();  
                                    return false;
                                    }
                                }else{
                                    echo "<script> alert('La contraseña no cumple con los requisitos')
                                    location.href = '../Vistas/modulos/cambio_contrasena_usuario_nuevo.php';
                                    </script>";
                                }
                          }      
                 } //fin del if de ver si esta lleno el boton de cambiar contraseña
              }else {
               echo "<script> alert('Error nombre de usuario y contraseña incorrectos');
                location.href = '../Vistas/modulos/cambio_contrasena_usuario_nuevo.php'; </script>";
            }
            return true;
    }catch(PDOException $e){
     echo $e->getMessage();
     return false;
   }
}



























?>