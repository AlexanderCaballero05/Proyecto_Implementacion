<?php
  include_once 'conexion3.php';
  include_once 'conexion.php';
  include_once 'conexion2.php';
  include_once 'function_bitacora.php';
?>
<?php
if(isset($_POST['GUARDARCITA_GENERAL'])){
  if(isset($_POST['CODPACIENTE'])){
         $paciente=($_POST['CODPACIENTE']);
         $fecha=($_POST['agregar_fecha_cita']);
         $hora=($_POST['agregar_hora']);
         $estado = "5";
         $area=($_POST['area_cita']);
         $encargado_medico=($_POST['encargado_medico']);
         $encargado_psicologo=($_POST['encargado_psicologo']);
         $encargado_catequesis=($_POST['encargado_catequesis']);
         $fechaactual = date('Y-m-d'); 
         $user = $_SESSION['vario'];
        
         $sentencia = $db->prepare("SELECT  HORARIO , FECHA_CITA , CODIGO_PERSONA
         from tbl_inscripcion_cita   where  CODIGO_PERSONA  = (?) and HORARIO = (?)  and FECHA_CITA = (?)");
         $sentencia->execute(array($paciente,$hora,$fecha));
          $row=$sentencia->fetchColumn();
          if($row >0){ 
            echo "<script> 
            alert('No se puede porque tiene otra cita en la misma fecha y misma hora');
            window.location = 'procesocita';
            </script>";
            exit;
          }else{
            $consulta2 = $db->prepare("SELECT  HORARIO , FECHA_CITA , CODIGO_ESPECIALISTA
            from tbl_inscripcion_cita   where  CODIGO_ESPECIALISTA  = (?) and HORARIO = (?)  and FECHA_CITA = (?)");
            $consulta2->execute(array($encargado_medico,$hora,$fecha));
            $row2=$consulta2->fetchColumn();
            if( $row2 > 0){
              echo "<script> 
              alert('El  medico  ya tiene asignada una cita en esa fecha y hora');
              window.location = 'procesocita';
              </script>";
              exit;
            }else{
              $consulta2 = $db->prepare("SELECT  HORARIO , FECHA_CITA , CODIGO_ESPECIALISTA
              from tbl_inscripcion_cita   where  CODIGO_ESPECIALISTA  = (?) and HORARIO = (?)  and FECHA_CITA = (?)");
              $consulta2->execute(array($encargado_psicologo, $hora,$fecha));
              $row2=$consulta2->fetchColumn();
              try{
                if($row2 > 0){
                  echo "<script> 
                  alert('El psicologo ya tiene asignada una cita en esa fecha y hora');
                  window.location = 'procesocita';
                  </script>";
                  exit;
                }else{
                  $consulta2 = $db->prepare("SELECT  HORARIO , FECHA_CITA , CODIGO_ESPECIALISTA
                  from tbl_inscripcion_cita   where  CODIGO_ESPECIALISTA  = (?) and HORARIO = (?)  and FECHA_CITA = (?)");
                  $consulta2->execute(array($encargado_catequesis,$hora,$fecha));
                  $row2=$consulta2->fetchColumn();
                  if($row2 > 0){
                    echo "<script> 
                    alert('El Catqeusis ya tiene asignada una cita en esa fecha y hora');
                    window.location = 'procesocita';
                    </script>";
                    exit;
                  }else{//else que hace los insert
                    try {
                      if($area == "2"){ //medica
                        $sql ="call sp_insert_inscripcion_cita('$paciente','$encargado_medico', '$estado','$area', '$fecha','$hora','$fechaactual','$user');";
                        $consulta=$conn->query($sql);
                        if($consulta >0){ 
                          echo "<script> 
                          window.location = 'crudinscripcioncita';
                          </script>";
                          $codigoObjeto=32;
                          $accion='Registro';
                          $descripcion='Se vizualiza citas registradas';
                          bitacora($codigoObjeto,$accion,$descripcion);
                          exit;
                        }else{
                          echo "<script> 
                          window.location = 'procesocita';
                          </script>";
                          exit;
                        }
          
                      }else if($area == "3"){ //psicologo
                        $sql ="call sp_insert_inscripcion_cita('$paciente','$encargado_psicologo', '$estado','$area', '$fecha','$hora','$fechaactual','$user');";
                        $consulta=$conn->query($sql);
                        if($consulta >0){ 
                          echo "<script> 

                  

                          window.location = 'crudinscripcioncita';
                          </script>";
                          $codigoObjeto=32;
                          $accion='Registro';
                          $descripcion='Se vizualiza citas registradas';
                          bitacora($codigoObjeto,$accion,$descripcion);
                          exit;
                        }else{
                          echo "<script> 
                          window.location = 'procesocita';
                          </script>";
                          exit;
                        }
                      }else if($area == "4"){//espiritual
                        $sql ="call sp_insert_inscripcion_cita('$paciente','$encargado_catequesis', '$estado','$area', '$fecha','$hora','$fechaactual','$user');";
                        $consulta=$conn->query($sql);
                        if($consulta >0){ 
                          echo "<script> 
                          window.location = 'crudinscripcioncita';
                          </script>";
                          $codigoObjeto=32;
                          $accion='Registro';
                          $descripcion='Se vizualiza citas registradas';
                          bitacora($codigoObjeto,$accion,$descripcion);
                          exit;
                        }else{
                          echo "<script> 
                          window.location = 'procesocita';
                          </script>";
                          exit;
                        }
                      }else{
                          echo "<script> 
                          window.location = 'procesocita';
                          </script>";
                          exit;
                      }//fin del elseif
                     }catch(PDOException $e){
                     echo $e->getMessage(); 
                     return false;
                     } 
                    
                  }//fin del else que contiene los insert
                }
              }catch(PDOException $e){
              echo $e->getMessage(); 
              return false;
              }
            }
          }//else macho,else general :v
  }// if hijo 
}// if padre


  //con lo de ditar no toque,porque ya les daba y no tengo el procediemiento :v ,ya eso ustedes lo terminan 
 ///BOTON DE EDITAR 
 if (isset($_POST['cod_edit_cita'])){
  if(isset($_POST['edit_cita'])){
    $fecha= $_POST['edit_fecha_cita'];
    $hora =$_POST['edit_hora'];
    $estado =$_POST['estado_edit'];
    $cod =$_POST['cod_edit_cita'];
     try {
      $sentencia = $db->prepare("SELECT tic.CODIGO_PERSONA , tic.CODIGO_ESPECIALISTA
        from tbl_inscripcion_cita tic  where tic.CODIGO_CITA = ?");
       $sentencia ->execute(array($cod));
       $ESPECIALISTAS = $sentencia->fetchALL();
        foreach ( $ESPECIALISTAS AS $RESULTADOS){
           $personas = $RESULTADOS['CODIGO_PERSONA'];
           $especialistas = $RESULTADOS['CODIGO_ESPECIALISTA'];
         $sentencia_paciente= $db->prepare("SELECT  HORARIO , FECHA_CITA , CODIGO_PERSONA
         from tbl_inscripcion_cita   where  CODIGO_PERSONA  = (?) and HORARIO = (?)  and FECHA_CITA = (?) and CODIGO_ESTADO = ?  ");
         $sentencia_paciente->execute(array($personas,$hora,$fecha,$estado));
          $row=$sentencia_paciente->fetchColumn();
          if($row >0){
            echo "<script>
                alert('El ya tiene una cita registrada  a esa fecha ');
               window.location = 'crudinscripcioncita';
                </script>";
                exit;
          }else {
            $sentencia_especialista = $db->prepare("SELECT  HORARIO , FECHA_CITA , CODIGO_PERSONA
          from tbl_inscripcion_cita   where  CODIGO_PERSONA  = (?) and HORARIO = (?)  and FECHA_CITA = (?) and CODIGO_ESTADO = ? ");
          $sentencia_especialista->execute(array($especialistas,$hora,$fecha,$estado));
           $row=$sentencia_especialista->fetchColumn();
           if($row >0){
             echo "<script>
                 alert('El ya tiene una cita registrada a esa fecha ');
                window.location = 'crudinscripcioncita';
                 </script>";
                 exit;
           } else {
            $sql ="UPDATE  tbl_inscripcion_cita SET  HORARIO ='$hora', FECHA_CITA='$fecha', CODIGO_ESTADO ='$estado' where CODIGO_CITA ='$cod' ;";
            $consulta=$conn->query($sql);
            if ($consulta > 0){
             echo "<script>
                window.location = 'crudinscripcioncita';
                 </script>";
               $codigoObjeto=32;
               $accion='Actualizacion';
               $descripcion='Se vizualiza citas registradas';
               bitacora($codigoObjeto,$accion,$descripcion);
               
               }
          }

          } // fin else 
      }///  fin foreach
     }catch(PDOException $e){
          echo $e->getMessage(); 
        return false;
          } 
  }
  }






  if (isset($_POST['cod_enviar_cita'])){
    if(isset($_POST['enviar_cita'])){
        $codigo_cita = ($_POST['cod_enviar_cita']);
        $estado_cita = ($_POST['estado_cita']);

        $enviar_cita = "UPDATE tbl_inscripcion_cita
                         SET CODIGO_ESTADO = '9'
                         WHERE CODIGO_CITA = '$codigo_cita'";

        $consulta_cita =$conn->query($enviar_cita);

    }
  }
  
  
  
  
  //boton de eliminar
  if (isset ($_POST['eliminar_nue_cita'])){
  
   if (isset($_POST['eliminar_cita'])){
  
       $cod = $_POST['eliminar_nue_cita'];
       try {
          $link = mysqli_connect("localhost", "root", "", "db_proyecto_Prosecar");
          mysqli_query($link, "DELETE from tbl_inscripcion_cita  where CODIGO_CITA = '$cod' ");
          if(mysqli_affected_rows($link)>0){
            echo "<script>
            alert('¡Cita eliminada!');
            window.location = 'crudinscripcioncita';
            </script>";
            $codigoObjeto=32;// cambiar 
            $accion='ELIMINACION';
            $descripcion= 'Se elimino una CITA ';
            bitacora($codigoObjeto, $accion,$descripcion);
            exit;
          }else{
              echo "<script>
              alert('¡Error al eliminar la cita tiene relacion con otras tablas !');
              window.location = 'crudinscripcioncita';
              </script>";
              exit;
            }
  
          }catch(PDOException $e){
          echo $e->getMessage(); 
        return false;
          }
        }
      }      
   
?>


<?php
//Codigo para la inscripcion cita por parte de un usuario medico
 if(isset ($_POST['codigo_persona'])){
    if(isset ($_POST['REGISTRAR_CITA_PACIENTE'])){
      $codigo_persona = $_POST['codigo_persona'];
      $codigo_medico = $_POST['codigo_medico'];
      $fecha_cita = $_POST['fecha_cita'];
      $hora_cita = $_POST['hora_cita'];
      $area_cita = "2";
      $estado = "5";
      $fechaactual = date('Y-m-d'); 
      $user = "Admin";

      $insertar ="call sp_insert_inscripcion_cita('$codigo_persona','$codigo_medico', '$estado','$area_cita', '$fecha_cita','$hora_cita','$fechaactual','$user');";
      $consulta=$conn->query($insertar);
      if($consulta >0){ 
          echo "<script> window.location = 'crudPacientesMedicos';</script>";
          $codigoObjeto=32;
          $accion='Registro';
          $descripcion='Se vizualiza citas registradas';
          bitacora($codigoObjeto,$accion,$descripcion);
           exit;
      }else{
        echo "<script> window.location = 'crudPacientesMedicos';</script>";
        exit;
      }

    }
 }

 //fin de incripcion cita por parte de un usuario medico
?>


<?php
//Codigo para la inscripcion cita por parte de un usuario psicologo
 if(isset ($_POST['codigo_paciente_psicologo'])){
    if(isset ($_POST['REGISTRAR_CITA_PACIENTE_PSICOLOGICO'])){
      $codigo_persona = $_POST['codigo_paciente_psicologo'];
      $codigo_medico = $_POST['codigo_psicologo'];
      $fecha_cita = $_POST['fecha_cita'];
      $hora_cita = $_POST['hora_cita'];
      $area_cita = "3";
      $estado = "5";
      $fechaactual = date('Y-m-d'); 
      $user = "Admin";

      $insertar ="call sp_insert_inscripcion_cita('$codigo_persona','$codigo_medico', '$estado','$area_cita', '$fecha_cita','$hora_cita','$fechaactual','$user');";
      $consulta=$conn->query($insertar);
      if($consulta >0){ 
          echo "<script> window.location = 'crudPacientesPsicologicos';</script>";
          $codigoObjeto=32;
          $accion='Registro';
          $descripcion='Se vizualiza citas registradas';
          bitacora($codigoObjeto,$accion,$descripcion);
           exit;
      }else{
        echo "<script> window.location = 'crudPacientesPsicologicos';</script>";
        exit;
      }

    }
 }
//fin de inscripcion cita por parte de un usuario psicologo
?>

<?php
//Codigo para la inscripcion cita por parte de un usuario catequista
 if(isset ($_POST['codigo_paciente_espiritual'])){
    if(isset ($_POST['REGISTRAR_CITA_PACIENTE_ESPIRITUAL'])){
      $codigo_persona = $_POST['codigo_paciente_espiritual'];
      $codigo_catequista = $_POST['codigo_catequista'];
      $fecha_cita = $_POST['fecha_cita'];
      $hora_cita = $_POST['hora_cita'];
      $area_cita = "4";
      $estado = "5";
      $fechaactual = date('Y-m-d'); 
      $user = "Admin";

      $insertar ="call sp_insert_inscripcion_cita('$codigo_persona','$codigo_catequista', '$estado','$area_cita', '$fecha_cita','$hora_cita','$fechaactual','$user');";
      $consulta=$conn->query($insertar);
      if($consulta >0){ 
          echo "<script>
           window.location = 'crudPacientesEspirituales';
          </script>";
          $codigoObjeto=32;
          $accion='Registro';
          $descripcion='Se vizualiza citas registradas';
          bitacora($codigoObjeto,$accion,$descripcion);
           exit;
      }else{
        echo "<script> 
        window.location = 'crudPacientesEspirituales';
        </script>";
        exit;
      }

    }
 }
//fin de inscripcion cita por parte de un usuario catequista
?>