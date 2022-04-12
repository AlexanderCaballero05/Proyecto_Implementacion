
<?php
 //VALIDACIONES DEL PROCESO DE CARGA ACADEMICA
 include_once 'conexion3.php';
  include_once 'conexion.php';
  include_once 'conexion2.php';
  include_once 'function_bitacora.php';

?>

<?php
//**CODIGO PARA INSERTAR DATOS EN LA TABLA CARGA ACADEMICA ,en mayucula para que se vea bien :v */

if(isset($_POST['tutor'])  ){
    if(isset($_POST['GUARDAR_CARGA'])){
        $hora = ($_POST['hora']);
        $hora_final = ($_POST['hora_final']);
        $fech_inicio = ($_POST['fecha_inicio']);
        $fecha_final = ($_POST['fecha_final']);
        $tutor = ($_POST['tutor']);
        $tutoria = ($_POST['tutoria']);
        $modalidad = ($_POST['modalidad']);
        $seccion = ($_POST['seccion']);//valor de numero
        $fecha = date('Y-m-d');
        $user=$_SESSION['vario'];
        $anio = date("Y");
       try{
             $query1 = $db->prepare ("SELECT CODIGO_TUTORIA, CODIGO_SECCION FROM tbl_carga_academica WHERE 
             CODIGO_SECCION = (?) AND CODIGO_TUTORIA = (?);'");
             $query1->execute(array($seccion,$tutoria));
             $fila = $query1->fetchColumn();
             if($fila > 0){
                 echo "<script> 
                 alert('Ya se encuentra registrada la asignatura y sección');
                 window.location = 'procesoCargaAcademica';
                 </script>";
                 exit;
             }else{
                 try{
                     //Si la carga tiene los mismos datos de una carga exsitente,
                     $sentencia = $db->prepare("SELECT CODIGO_PERSONA,CODIGO_TUTORIA,HORA,FECHA_INICIO FROM tbl_carga_academica
                     WHERE CODIGO_PERSONA =(?) AND CODIGO_TUTORIA = (?) and HORA = (?) and FECHA_INICIO = (?) and CODIGO_SECCION =(?) AND   CODIGO_MODALIDAD = (?) ");
                     $sentencia->execute(array($tutor,$tutoria,$hora,$fech_inicio,$seccion,$modalidad));
                     $row=$sentencia->fetchColumn();
                     if($row >0){ 
                        echo "<script> 
                        alert('No se puede asignar la carga,el tutor ya tiene asignada una clase a la misma hora');
                        window.location = 'procesoCargaAcademica';
                        </script>";
                        exit;
                    }else{
                        //si el tutor tiene una diferente clase de la que esta registandro ,pero si que esa clase este en el mismo horario que esta intentando agregar
                        $sentencia2 = $db->prepare("SELECT CODIGO_PERSONA,CODIGO_TUTORIA,HORA,FECHA_INICIO FROM tbl_carga_academica 
                        WHERE CODIGO_PERSONA = (?) AND CODIGO_TUTORIA <> (?)  and HORA = (?) and FECHA_INICIO = (?)");
                        $sentencia2->execute(array($tutor,$tutoria,$hora,$fech_inicio));
                        $row=$sentencia2->fetchColumn();
                        try{
                            if($row >0){
                                echo "<script> 
                                alert('No se puede asignar la carga,ya tine una clase a esta hora');
                                window.location = 'procesoCargaAcademica';
                                </script>";
                            exit;
                            }else{
                               try{
                                    $insert = " INSERT INTO `tbl_carga_academica`(`CODIGO_TUTORIA`, `CODIGO_PERSONA`, `CODIGO_MODALIDAD`, `CODIGO_SECCION`, 
                                    `HORA`,`FECHA_INICIO`, `FECHA_FINAL`, `CREADO_POR_USUARIO`, `FECHA_CREACION`,`HORA_FINAL`,`ANIO`) 
                                    VALUES ('$tutoria','$tutor','$modalidad','$seccion','$hora','$fech_inicio','$fecha_final', '$user','$fecha','$hora_final','$anio'); ";
                                    $resul=$conn->query($insert);
                                    if($resul >0){
                                        echo "<script> 
                                        window.location = 'crudCargaAcademica';
                                        </script>";
                                        exit;
                                        include_once 'function_bitacora.php';
                                        $codigoObjeto=20;
                                        $accion='Registro';
                                        $descripcion= 'Se asigno una carga academica ';
                                        bitacora($codigoObjeto, $accion,$descripcion);
                        
                                    }else{
                                        echo "<script> 
                                        alert('No se puede agregar por alguna extraña razon');
                                        window.location = 'procesoCargaAcademica';
                                        </script>";
                                        exit;
                                    }
                               }catch(PDOException $e){
                               echo $e->getMessage(); 
                               return false;
                               }
                            }
                        }catch(PDOException $e){
                        echo $e->getMessage(); 
                        return false;
                        }
                    }//fin else
                 }catch(PDOException $e){
                  echo $e->getMessage(); 
                  return false;
                }
            }//fin del else
       }catch(PDOException $e){
        echo $e->getMessage(); 
        return false;
        }
    } //if secundario
}//if principal
//****FIN DEL INSERT DE CARGA ACADEMICA****** */





//****CODIGO PARA EDITAR UNA CARGA ACADEMICA */
if(isset($_POST['IDCARGA'])){
    if(isset($_POST['EDITAR_CARGA'])){
        $hora_modi = ($_POST['hora1']);
        $hora_final_modi = ($_POST['hora_final1']);
        $fecha_inicio_modi = ($_POST['fecha_inicio1']);
        $fecha_final_modi = ($_POST['fecha_final1']);
        $tutor_modi = ($_POST['tutor1']);
        $tutoria_modi = ($_POST['tutoria1']);
        $modalidad_modi = ($_POST['modalidad1']);
        $seccion_modi = ($_POST['seccion1']);
        $fecha_modi = date('Y-m-d'); //fecha del sistema
        $usuario_modi = $_SESSION['vario'];
        $codigo_carga = ($_POST['IDCARGA']);
        try{
            $query = mysqli_query($conn," SELECT CODIGO_TUTORIA, CODIGO_SECCION FROM tbl_carga_academica 
            WHERE CODIGO_SECCION = '$seccion_modi' AND CODIGO_TUTORIA = '$tutoria_modi' and CODIGO_CARGA <> '$codigo_carga' ");
            $fila = mysqli_fetch_array($query);
            if($fila >0){ 
               
                echo "<script> 
                alert('La seccion y la clase ya esta creada ');
                window.location = 'crudCargaAcademica';
                </script>";
                exit;
            }else{
              $consulta = $db->prepare("SELECT CODIGO_PERSONA,CODIGO_TUTORIA,HORA,FECHA_INICIO FROM tbl_carga_academica 
              WHERE CODIGO_PERSONA <> (?) AND CODIGO_TUTORIA = (?)  and HORA = (?) and FECHA_INICIO = (?)");
              $consulta->execute(array($tutor_modi ,$tutoria_modi,$hora_modi, $fecha_inicio_modi));
              if($consulta >0){
                 echo "<script>
                 alert('Ya existe esta carga ');
                 window.location = 'crudCargaAcademica';
                 </script>";
                exit;
              }else{
                    try{
                        $corre = "UPDATE `tbl_carga_academica` SET 
                        CODIGO_TUTORIA = '$tutoria_modi',  
                        HORA = '$hora_modi' , 
                        FECHA_INICIO = '$fecha_inicio_modi',
                        FECHA_FINAL = '$fecha_final_modi' , 
                        CODIGO_MODALIDAD = '$modalidad_modi' ,
                        CODIGO_SECCION = '$seccion_modi'  ,
                        MODIFICADO_POR = '$usuario_modi' ,
                        FECHA_MODIFICACION = '$fecha_modi' ,
                        CODIGO_PERSONA = '$tutor_modi' ,
                        HORA_FINAL = '$hora_final_modi'
                        WHERE CODIGO_CARGA = '$codigo_carga';";   
                        
                        $row=$conn->query($corre);
                        if($row >0){
                            echo "<script>
                            
                            window.location = 'crudCargaAcademica';
                            </script>";
                            exit;
                        }else{
                            $msg="problema ".mysqli_error($conn);
                            var_dump($msg);
                            echo "<script>
                            alert('ERROR,NO SE PUEDE');
                            window.location = 'crudCargaAcademica';
                            </script>";
                            exit;
                            
                            
                            exit;
                        }
                        return true;
                    }catch(PDOException $e){
                    echo $e->getMessage(); 
                    return false;
                    }//fin try catch
                }//fin else

            }//fin else
        }catch(PDOException $e){
        echo $e->getMessage(); 
        return false;
        }
    } //if secundario
}//if principal
//******************FIN DEL CODIGO PARA EDITAR ,por fin termino,wii!!**************** */







//*******CODIGO PARA ELIMINAR  LA  CARGA ACADEMICA ya funciona! uwu******
if(isset($_POST['eliminar_carga'])){
    if(isset($_POST['ELIMINAR_CARGA'])){
      $codigo_eliminar = ($_POST['eliminar_carga']);
        try{
            $relacion_tablas =  $db->prepare("SELECT c.CODIGO_CARGA from  tbl_matricula_academica m ,
            tbl_carga_academica c where c.CODIGO_CARGA  = m.CODIGO_CARGA  and c.CODIGO_CARGA  = (?);");
            $relacion_tablas->execute(array($codigo_eliminar));
            $row = $relacion_tablas->fetchColumn();
            if($row >0){
                echo "<script>
                alert('¡No se puede eliminar este carga,esta relacionada!');
                window.location = 'crudCargaAcademica';
                </script>";
                exit;
            }else{//Si no existe relación,se puede ir al mas allá :v (Eliminar)
               try{
                    $link = mysqli_connect("localhost", "root", "", "db_proyecto_Prosecar");
                    mysqli_query($link, "DELETE FROM tbl_carga_academica WHERE  CODIGO_CARGA = '$codigo_eliminar' ");
                    if(mysqli_affected_rows($link)>0){
                        echo "<script>
                        window.location = 'crudCargaAcademica';
                        </script>";
                        include_once 'function_bitacora.php';
                        $codigoObjeto=20;
                        $accion='Eliminación';
                        $descripcion= 'Se elimino una carga academica ';
                        bitacora($codigoObjeto, $accion,$descripcion);
                        exit;
                    }else{
                        echo "<script>
                        alert('Surgio algun error al intentar eliminar la carga,comunicarse con el administrador');
                        window.location = 'crudCargaAcademica';
                        </script>";
                        exit;
                    }
                }catch(PDOException $e){
                  echo $e->getMessage(); 
                  return false;
                }
            }//fin else general
         }catch(PDOException $e){
          echo $e->getMessage(); 
          return false;
        }
    }
}//cierre del if principal
//*************CIERRE DEL CODIGO DE ELIMINAR****************
//Elaborado  por Diana Rut :/
?>


