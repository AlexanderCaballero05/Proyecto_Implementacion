<?php
 //VALIDACIONES PARA CAMBIO DE CONTRASEÑAS DESPUES DE HABER HECHO LA VALIDADCION POR PREGUNTAS
 session_start();
 include "function_bitacora.php";
 include_once 'conexion.php';
 include_once "conexion3.php";
?>
<?php
    if(isset($_SESSION['vario'])){ //Verificar que haya datos en la variable de sesion
        $usuario= $_SESSION['vario']; //asigna la variable de sesion
        try{
            $sentencia = $db->prepare("SELECT CODIGO_USUARIO FROM tbl_usuario WHERE NOMBRE_USUARIO = (?);");
            $sentencia->execute(array($usuario));
            $row=$sentencia->fetchColumn();
           if($row>0){
                $usuari = $row;// Asigna el codigo al que pertenece el usuario de la tabla tbl_usario
                if(isset($_POST['cambiar_clave'])){
                    $clave= $_POST['clave_nueva'];
                    $confirmar_clave = $_POST['confirmar_clave'];
                    $expre = " /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]/ ";/*se le asigana expresion regular
                     que valida que la contraseña tenga minimo una letra mayuscula,minuscula,codigo especial y numeros  */
                    if($clave  <> $confirmar_clave){ //Si las contraseñas no son iguales 
                        echo "<script> alert('Las contraseñas no son iguales')
                        location.href = '../Vistas/modulos/cambio_contrasena_preguntas.php';
                        </script>";
                    }
                    else{ 
                        if(preg_match($expre,$clave)){
                            $pass=crypt($clave,'$2a$07$usesomesillystringforsalt$');
                            //se puede mandar a laas otras validaciones
                            try{
                                $sentencia ="SELECT * FROM tbl_usuario WHERE CONTRASENA = '$pass' AND CODIGO_USUARIO = '$usuari';";
                                $datos=$conn->query($sentencia);
                                $row=$datos->num_rows;
                                if($row>0){ //si la contraseña es la misma que tiene en el sistema
                                    echo "<script> alert('!Utilice una contraseña que no haya usado anteriormente')
                                    location.href = '../Vistas/modulos/cambio_contrasena_preguntas.php';
                                    </script>";
                                }
                                else{ //si la contraseña es diferente de la que tiene en el sistema
                                    try{
                                        $buscarclave = "SELECT * FROM tbl_ms_hist_contrasena WHERE  CODIGO_USUARIO = '$usuari'  AND CONTRASENA = '$pass';";
                                        $busqueda=$conn->query($buscarclave);
                                        $fila=$busqueda->num_rows;
                                        if($fila>0){
                                            echo "<script> alert('!Utilice una contraseña que no haya usado anteriormente')
                                            location.href = '../Vistas/modulos/cambio_contrasena_preguntas.php';
                                            </script>";
                                        }
                                        else{
                                            try{ //insert en la tabla de historial de contraseñas la nueva contraseña por el usario
                                                $insert = "INSERT INTO tbl_ms_hist_contrasena (CODIGO_USUARIO,CONTRASENA,CREADO_POR_USUARIO)
                                                VALUES ('$usuari','$pass','$usuari')";
                                                $resultado=$conn->query($insert);
                                                
                                                if($resultado>0){
                                                //actualiza la tabla de tbl_usuario el cmapo de la contraseña el campo de modificado por
                                                    $update = "UPDATE tbl_usuario SET CONTRASENA ='$pass',
                                                     MODIFICADO_POR ='$usuari'
                                                    WHERE NOMBRE_USUARIO = '$usuario' ";
                                                    $resul=$conn->query($update);
                                                    if($resul >0){//Si la contraseña se actualizco correctamente
                                                        echo "<script> 
                                                        alert('Contraseña fue actualizada exitosamente')
                                                        location.href = '../index.php';
                                                        </script>";
                                                        exit;
                                                    }
                                                }
                                                else{//error al ingresar los datos,saber que error sera :v (pero hay que mostrar mensaje de error xd )
                                                    echo "<script> 
                                                    alert('!Error al ingresar los datos¡');
                                                    location.href = '../Vistas/modulos/cambio_contrasena_preguntas.php';
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
                                    $_SESSION['vario'] =$usuario;
                                    //llamada de la fuction bitacora -->
                                    $codigoObjeto=1;
                                    $accion='Cambio de contraseña';
                                    $descripcion= 'Cambio la contraseña por metodo preguntas';
                                    bitacora($codigoObjeto, $accion,$descripcion);
                                }//final del else
                            }catch (PDOException $e){
                              echo $e->getMessage();  
                              return false;
                            }
                        }else{
                            echo "<script> alert('La contraseña no cumple con los requisitos')
                            location.href = '../Vistas/modulos/cambio_contrasena_preguntas.php';
                            </script>";
                        }
                        //Si las contraseñas son iguales
                    }
                }//fin del if de ver si esta lleno el boton de cambiar contraseña
                // no lleva else ni try cacth
            }else{
            echo "<script>
            alert('El usuario que ingreso no existe');
            location.href = '../Vistas/modulos/cambio_contrasena_preguntas.php';
            </script>";
            }
            //fin del if else de verificar si existe el usuario en el sistema.
           }catch (PDOException $e){
           echo $e->getMessage();  
           return false;
        }
    }//Cierre del if padre
?>
