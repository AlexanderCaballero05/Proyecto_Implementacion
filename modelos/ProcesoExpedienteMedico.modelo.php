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
  D'aniel Ferdinand Martinez Moradel (ferdinand.martinez@unah.hn)
  
  Catedratico:
  Lic. Claudia Nuñez (Analisis)
  Lic. Giancarlo Martini Scalici Aguilar (Implementación)
  Lic. Karla Melisa Garcia Pineda (Evaluación)
---------------------------------------------------------------------
    Programa:          Proceso Expediente Medico (código)
    Fecha:             
    Programador:      
    descripcion:       Permite insertar registros a la base de datos
-----------------------------------------------------------------------
  Historial de Cambio
-----------------------------------------------------------------------
    Programador               Fecha                      Descripcion
 D'aniel Martinez          11-07-2022                 Agregar bitacora de la creación del expediente a estudiante #
----------------------------------------------------------------------->

<?php
 include_once 'conexion3.php';
 include_once 'conexion.php';
 include_once 'conexion2.php';
 include_once  "conexionpdo.php";
 
?>

<?php
    if(isset($_POST['codigo_paciente_expediente'])){
        
        date_default_timezone_set("America/Guatemala");
        $Fechaactual=  date('Y-m-d'); 

            $codigo_expediente_paciente = ($_POST['codigo_paciente_expediente']);
            $tipo_sangre = ($_POST['tipo_sangre']);
            $tratamientos = ($_POST['tratamientos']);
            $enfermedades = ($_POST['enfermedades']);
         
              

            $insertar_expediente ="INSERT INTO tbl_expediente_medico (CODIGO_PERSONA, CODIGO_TIPO_SANGRE, CODIGO_ESTADO, TRATAMIENTOS, ENFERMEDADES, FECHA_CREACION) 
                                                                VALUES ('$codigo_expediente_paciente', '$tipo_sangre','2','$tratamientos', '$enfermedades', '$Fechaactual')";
            $consulta=$conn->query($insertar_expediente);
            $codigo= mysqli_insert_id($conn);

             //Para insertar alergias
                if (is_array($_POST['alergia'])) {
                    foreach ($_POST['alergia'] as $alergia){
                      $sentencia = $db->prepare("CALL Sp_insertar_alergias(?,?);");
                      // llamar al procedimiento almacenado
                      $sentencia->execute(array($codigo,$alergia));
                      $conn->commit();
                    }
                   
                        }//fin Para insertar alergias

                        //Para insertar transtornos
                        if(array($_POST['transtornos'])){
                            foreach($_POST['transtornos'] as $trastornos){
                                $query_transtornos = $db->prepare("CALL Sp_insertar_transtornos(?,?);");
                                $query_transtornos->execute(array($codigo,$trastornos));
                                $conn->commit();

                            }
                        } //Fin para insertar transtornos

                        //inicio de insertar apariencias
                                if(array($_POST['apariencia'])){
                                    foreach($_POST['apariencia'] as $apariencias){
                                        $query_apariencia = $db->prepare("CALL Sp_insertar_apariencias(?,?);");
                                        $query_apariencia->execute(array($codigo, $apariencias));
                                        $conn->commit();
                                    }  
                                    $codigoObjeto=30;
                                    $accion='REGISTAR EXPEDIENTE';
                                    $descripcion= 'SE REGISTRÓ EL EXPEDIENTE MEDICO DEL PACIENTE CON CÓDIGO '.$codigo_expediente_paciente;
                                    bitacora($codigoObjeto,$accion,$descripcion);   
                                     echo "<script> 
                                  window.location = 'procesoConsulta';
                                  </script>";
                                } // fin para apariencias
            
                               
     

        

            

    }



//FUNCIONES DEL CRUD ,AGREGAR UN TIPO DE SANGRE 
    if(isset($_POST['tiposangre'])){
       try{
          if(isset($_POST['agregar_tiposangre'])){
               $tiposangre = ($_POST['tiposangre']);
               $fechaActual = date('Y-m-d');  
               $usuario=$_SESSION['vario'];
              try{ 
                  $consulta_tipo = $db->prepare("SELECT COUNT(*) FROM tbl_tipo_sangre WHERE tipo = (?);");
                  $consulta_tipo->execute(array($tiposangre));
                  $row=$consulta_tipo->fetchColumn();
                  if($row>0){
                    echo "<script>
                    alert('El tipo de sangre $tiposangre ya se encuentra registrado');
                    window.location = 'procesoExpedienteMedico';
                    </script>";
                  exit;
                  }else{
                    try{
                      $query_tiposangre = " INSERT INTO `tbl_tipo_sangre`( `TIPO`, `CREADO_POR`, `FECHA_CREACION`, `CODIGO_ESTADO`) VALUES ('$tiposangre',' $usuario','$fechaActual',2); ";
                      $resul=$conn->query($query_tiposangre);
                      if($resul >0){
                        echo "<script> 
                        window.location = 'procesoExpedienteMedico';
                        </script>";
                        include_once 'function_bitacora.php';
                        exit;
                      }else{
                        echo "<script> 
                        alert('Error auxilio!');
                        window.location = 'procesoExpedienteMedico';
                        </script>";
                        exit;
                      }
                    }catch(PDOException $e){
                    echo $e->getMessage(); 
                    return false;
                    }
                  }//fin del else de si no existe 
              }catch(PDOException $e){
              echo $e->getMessage(); 
              return false;
              }
            }//fin del if de verificar si hay datos

       }catch(PDOException $e){
        echo $e->getMessage(); 
        return false;
       }
    }//FIN AGREGAR TIPO SANGRE
//INICIO DEL IF DE REGISTAR UNA ALERGIA
    
    if(isset($_POST['nombre_alergia'])){
       try{
          if(isset($_POST['AGREGAR_ALERGIAS'])){
               $nombre_alergia = ($_POST['nombre_alergia']);
               $descripcion = ($_POST['descripcion_alergia']);
               $fechaActual = date('Y-m-d');
               $usuario =$_SESSION['vario'];  
              try{ 
                  $consulta_rol = $db->prepare("SELECT COUNT(*) FROM tbl_alergias WHERE NOMBRE = (?);");
                  $consulta_rol->execute(array($nombre_alergia));
                  $row=$consulta_rol->fetchColumn();
                  if($row>0){
                    echo "<script>
                    alert('El nombre de la alergia $nombre_alergia ya se encuentra registrado');
                    window.location = 'procesoExpedienteMedico';
                    </script>";
                  exit;
                  }else{
                    try{
                      $query_rol = " INSERT INTO tbl_alergias( NOMBRE, DESCRIPCION,CODIGO_ESTADO,FECHA_CREACION,CREADO_POR) VALUES ('$nombre_alergia','$descripcion',2,'$fechaActual','$usuario'); ";
                      $resul=$conn->query($query_rol);
                      if($resul >0){
                        echo "<script> 
                        window.location = 'procesoExpedienteMedico';
                        </script>";
                        exit;
                        include_once 'procesoExpedienteMedico';
                      }else{
                        echo "<script> 
                        alert('Error auxilio!');
                        window.location = 'procesoExpedienteMedico';
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
            }

       }catch(PDOException $e){
        echo $e->getMessage(); 
        return false;
       }
    }//FIN DEL IF DE REGISTAR UNA ALERGIA
//FUNCIONES DEL CRUD ,AGREGAR TRASTORNO
if(isset($_POST['agregar_tipo'])){
  
  try{
     if(isset($_POST['agregar_patologia'])){
          $agregar_tipo = ($_POST['agregar_tipo']);
             
         try{ 
             $consulta_estado = $db->prepare("SELECT COUNT(*) FROM tbl_transtornos_corporales WHERE TIPO = (?);");
             $consulta_estado->execute(array($agregar_tipo));
             $row=$consulta_estado->fetchColumn();
             if($row>0){
               echo "<script>
               alert('El nombre del trastorno $agregar_tipo ya se encuentra registrado');
               window.location = 'procesoExpedienteMedico';
               </script>";
             exit;
             }else{
               try{
                 $query_estado = " INSERT INTO `tbl_transtornos_corporales`(TIPO, CODIGO_ESTADO) VALUES ('$agregar_tipo',2); ";
                 $resul=$conn->query($query_estado);
                 if($resul >0){
                   echo "<script> 
                   alert('Se registro correctamente'); 
                   window.location = 'procesoExpedienteMedico';
                   </script>";
                   exit;
                 }else{
                   echo "<script> 
                   alert('Ocurrio algun error');
                   window.location = 'procesoExpedienteMedico';
                   </script>";
                   exit;
                 }
               }catch(PDOException $e){
               echo $e->getMessage(); 
               return false;
               }
             }//fin del else de si no existe el nombre del estado
         }catch(PDOException $e){
         echo $e->getMessage(); 
         return false;
         }
       }//fin del if de verificar si hay datos

  }catch(PDOException $e){
   echo $e->getMessage(); 
   return false;
  }
}//FIN DEL IF DE REGISTAR UN TRANSTORNO
//FUNCIONES DEL CRUD ,AGREGAR APARIENCIA FISICA
if(isset($_POST['apariencia'])){
  try{
     if(isset($_POST['nuevo'])){
          $nombre_apariencia= ($_POST['apariencia']);
          $fechaActual = date('Y-m-d');
          $usuario =$_SESSION['vario'];  
              try{ 
                  $consulta_modalidad = $db->prepare("SELECT COUNT(*) FROM tbl_apariencia_fisica WHERE TIPO = (?);");
                  $consulta_modalidad->execute(array($nombre_apariencia));
                  $row=$consulta_modalidad->fetchColumn();
                  if($row>0){
                    echo "<script>
                    alert('El nombre $nombre_apariencia ya se encuentra registrado');
                    window.location = 'procesoExpedienteMedico';
                    </script>";
                  exit;
                  }else{
                    try{
                      $query_modalidad = " INSERT INTO tbl_apariencia_fisica (TIPO,CODIGO_ESTADO) VALUES ('$nombre_apariencia',2 ); ";
                      $resul=$conn->query($query_modalidad);
                      if($resul >0){
                        echo "<script> 
                        window.location = 'procesoExpedienteMedico';
                        </script>";
                        exit;
                        include_once 'function_bitacora.php';
                        $codigoObjeto=40;
                        $accion='INSERCIÓN';
                        $descripcion= 'SE REGISTRÓ UNA APARIENCIA FISICA ';
                         bitacora($codigoObjeto, $accion,$descripcion);
                      }else{
                        echo "<script> 
                        alert('Error !');
                        window.location = 'procesoExpedienteMedico';
                        </script>";
                        exit;
                      }
                    }catch(PDOException $e){
                    echo $e->getMessage(); 
                    return false;
                    }
                  }//fin del else de si no existe el nombre del rol
              }catch(PDOException $e){
              echo $e->getMessage(); 
              return false;
              }
            }//fin del if de verificar si hay datos

       }catch(PDOException $e){
        echo $e->getMessage(); 
        return false;
       }
    }//FIN DEL IF DE REGISTAR APARIENCIA FISICA
//CODIGO PARA ACTUALIZAR EL ESTADO DE INCRIPCION CITA A FINALIZADO  :)
if(isset($_POST['EXPEDIENTE_CITA'])){
    if(isset($_POST['FINALIZAR_EXPEDIENTE'])){
        $codigo = ($_POST['EXPEDIENTE_CITA']);
        $estado = "13";
        $update = "UPDATE tbl_inscripcion_cita set CODIGO_ESTADO = '$estado'  where CODIGO_CITA = '$codigo'";
        $consulTITA=$conn->query($update);
        if ($consulTITA >0 ){
            echo "<script> 
            window.location = 'crudPacientesMedicos';
            </script>";  
            exit;
        }else{
            echo "<script> 
            alert('Ocurrio algun error,comuniquese con el admin :)');
            window.location = 'crudPacientesMedicos';
            </script>";  
            exit;
        }
    }
}
?>