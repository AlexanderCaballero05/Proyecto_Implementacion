<?php
 session_start();
include_once "conexion.php";
include_once "conexion3.php";
?>
<?php
if(isset($_SESSION['usua'])) {
    $nomUser=$_SESSION['usua'];
    $contraActual=($_POST['contraAnte']);

    try{   
          //$sentencia_sp =$db->prepare("CALL Sp_obtener_cod_usuario(?,?);"); //llamar al procedimiento almacenado con la fucion prepare de PHP
               
        $consultar_usuario = $db->prepare("SELECT * FROM tbl_usuario
                            WHERE NOMBRE_USUARIO= (?)
                            AND CONTRASENA ='$contraActual'"); 
        $consultar_usuario->execute(array($nomUser));
        $row=$consultar_usuario->fetchColumn();
                        // $sentencia_sp->execute(array($nomUser,$contraActual));//ejecutar el procedimiento almacenado
           // $filas=$sentencia_sp->fetchColumn();
              if($row>0){
                 $mostrarUser = $row;

                    if(isset($_POST['GUARDARCONTRA'])){
                        $contraNueva =($_POST['clave_nueva']);
                        $contraConfirm =($_POST['confirmar_clave']);
                        $expre = " /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]/ ";/*se le asigana expresion regular
                        que valida que la contraseña tenga minimo una letra mayuscula,minuscula,codigo especial y numeros  */
                            if($contraNueva<>$contraConfirm){
                                echo "<script>
                                alert('Las contraseña no son iguales');
                                location.href = '../Vistas/modulos/Login/cambio_contrasena_correo.php';
                                      </script>";
                             }

                            else{


                                if(preg_match($expre,$contraNueva)){
                                    //se puede mandar a laas otras validaciones
                                    try{
                                        $sentencia ="SELECT * FROM tbl_usuario WHERE CONTRASENA = '$contraNueva' AND CODIGO_USUARIO = '$mostrarUser';";
                                        $datos=$conn->query($sentencia);
                                        $row=$datos->num_rows;
                                        if($row>0){ //si la contraseña es la misma que tiene en el sistema
                                            echo "<script> alert('!Utilice una contraseña que no haya usado anteriormente')
                                            location.href = '../Vistas/modulos/Login/cambio_contrasena_correo.php';
                                            </script>";
                                        }
                                        else{ //si la contraseña es diferente de la que tiene en el sistema
                                            try{
                                                $buscarclave = "SELECT * FROM tbl_ms_hist_contraseña  WHERE  CODIGO_USUARIO = '$mostrarUser'  AND CONTRASEÑA = '$contraNueva';";
                                                $busqueda=$conn->query($buscarclave);
                                                $fila=$busqueda->num_rows;
                                                if($fila>0){
                                                    echo "<script> alert('!Utilice una contraseña que no haya usado anteriormente')
                                                    location.href = '../Vistas/modulos/Login/cambio_contrasena_correo.php';
                                                    </script>";
                                                }
                                                else{
                                                    try{ //insert en la tabla de historial de contraseñas la nueva contraseña por el usario
                                                        $insert = "INSERT INTO tbl_ms_hist_contraseña (CODIGO_USUARIO,CONTRASEÑA,CREADO_POR_USUARIO)
                                                        VALUES ('$mostrarUser','$contraNueva','$mostrarUser')";
                                                        $resultado=$conn->query($insert);
                                                        
                                                        if($resultado>0){
                                                        //actualiza la tabla de tbl_usuario el campo de la contraseña el campo de modificado por
                                                            $update = "UPDATE tbl_usuario u
                                                            SET u.CONTRASENA = '$contraNueva',
                                                            u.CODIGO_ESTADO = 2
                                                            WHERE u.NOMBRE_USUARIO ='$nomUser'";
                                                   
                                                            $resul=$conn->query($update);
                                                            if($resul >0){
                                                                echo "<script> 
                                                                alert('Contraseña cambiada correctamente');
                                                                location.href = '../Vistas/modulos/Login/login.php';
                                                                </script>";
                                                                exit;
                                                            }
                                                        }
                                                        else{//error al ingresar los datos,saber que error sera :v (pero hay que mostrar mensaje de error xd )
                                                            echo "<script> 
                                                            alert('!Error al ingresar los datos¡');
                                                            location.href = '../Vistas/modulos/Login/cambio_contrasena_correo.php';
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
                                            echo "<script> alert('!cambio de contraseña correcto')
                                            location.href = '../Vistas/modulos/Login/cambio_contrasena_correo.php';
                                            </script>";
                                        }//final del else
                                    }catch (PDOException $e){
                                    echo $e->getMessage();  
                                    return false;
                                    }
                                }else{
                                    echo "<script> alert('La contraseña no cumple con los requisitos')
                                    location.href = '../Vistas/modulos/Login/cambio_contrasena_correo.php';
                                    </script>";
                                }

                          }      
                 } //fin del if de ver si esta lleno el boton de cambiar contraseña
                 

              }else {
                echo "<script>
                alert('Error nombre de usuario y contraseña incorrectos');
                location.href = '../Vistas/modulos/Login/cambio_contrasena_correo.php';
                 </script>";


                  }



                return true;

    }         catch(PDOException $e){

                echo $e->getMessage();
                return false;
                                    }
      


}//Cierre del if padre



























?>