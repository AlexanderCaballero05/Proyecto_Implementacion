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

  Catedratico:
  Lic. Claudia Nuñez (Analisis)
  Lic. Giancarlo Martini Scalici Aguilar (Implementación)
  Lic. Karla Melisa Garcia Pineda (Evaluación)
---------------------------------------------------------------------
    Programa:         Parte logica para la creacion de las citas 
    Fecha:           
    Programador:      
    descripcion:      El codigo regista,actualiza y elimina la cita
-----------------------------------------------------------------------
  Historial de Cambio
-----------------------------------------------------------------------
    Programador           Fecha                  Descripcion
    Diana Rut            23/07/2022          Se agregaron las validaciones para registrar una cita por parte de los usuarios
                                              medicos psicologos y catequistas,ya que no consultaba si habia choque de citas e insertaba directamente la cita
    Diana Rut            12/08/2022         Se modifico la parte de editar una cita
    Arnold Caballero            12/08/2022         Se modifico la parte logica de editar una cita 
----------------------------------------------------------------------->


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
         from tbl_inscripcion_cita   where  CODIGO_PERSONA  = (?) and HORARIO = (?)  and FECHA_CITA = (?) and CODIGO_ESTADO =(?)");
         $sentencia->execute(array($paciente,$hora,$fecha,$estado));
          $row=$sentencia->fetchColumn();
          if($row >0){ 
            echo "<script> 
            alert('El Paciente tiene otra cita en la misma fecha y misma hora');
            window.location = 'ediusuariosestudiantes';
            </script>";
            exit;
          }else{
            $consulta2 = $db->prepare("SELECT  HORARIO , FECHA_CITA , CODIGO_ESPECIALISTA
            from tbl_inscripcion_cita   where  CODIGO_ESPECIALISTA  = (?) and HORARIO = (?)  and FECHA_CITA = (?)");
            $consulta2->execute(array($encargado_medico,$hora,$fecha));
            $row2=$consulta2->fetchColumn();
            if( $row2 > 0){
              echo "<script> 
              alert('El  Medico  ya tiene asignada una cita en esa fecha y hora');
              window.location = 'ediusuariosestudiantes';
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
                  alert('El Psicológo ya tiene asignada una cita en esa fecha y hora');
                  window.location = 'ediusuariosestudiantes';
                  </script>";
                  exit;
                }else{
                  $consulta2 = $db->prepare("SELECT  HORARIO , FECHA_CITA , CODIGO_ESPECIALISTA
                  from tbl_inscripcion_cita   where  CODIGO_ESPECIALISTA  = (?) and HORARIO = (?)  and FECHA_CITA = (?)");
                  $consulta2->execute(array($encargado_catequesis,$hora,$fecha));
                  $row2=$consulta2->fetchColumn();
                  if($row2 > 0){
                    echo "<script> 
                    alert('El Catequista ya tiene asignada una cita en esa fecha y hora');
                    window.location = 'ediusuariosestudiantes';
                    </script>";
                    exit;
                  }else{//else que hace los insert
                    try {
                      if($area == "2"){ //medica
                        $sql ="call sp_insert_inscripcion_cita('$paciente','$encargado_medico', '$estado','$area', '$fecha','$hora','$fechaactual','$user');";
                        $consulta=$conn->query($sql);
                        if($consulta >0){ 
                          echo "<script> 
                          alert('Cita agregada correctamente');
                          window.location = 'crudinscripcioncita';
                          </script>";
                          exit;
                        }else{
                          echo "<script> 
                          window.location = 'ediusuariosestudiantes';
                          </script>";
                          exit;
                        }
          
                      }else if($area == "3"){ //psicologo
                        $sql ="call sp_insert_inscripcion_cita('$paciente','$encargado_psicologo', '$estado','$area', '$fecha','$hora','$fechaactual','$user');";
                        $consulta=$conn->query($sql);
                        if($consulta >0){ 
                          echo "<script> 
                          alert('Cita agregada correctamente');
                          window.location = 'crudinscripcioncita';
                          </script>";
                          exit;
                        }else{
                          echo "<script> 
                          window.location = 'ediusuariosestudiantes';
                          </script>";
                          exit;
                        }
                      }else if($area == "4"){//espiritual
                        $sql ="call sp_insert_inscripcion_cita('$paciente','$encargado_catequesis', '$estado','$area', '$fecha','$hora','$fechaactual','$user');";
                        $consulta=$conn->query($sql);
                        if($consulta >0){ 
                          echo "<script> 
                          alert('Cita Agregada Correctamente');
                          window.location = 'crudinscripcioncita';
                          </script>";
                          exit;
                        }else{
                          echo "<script> 
                          window.location = 'ediusuariosestudiantes';
                          </script>";
                          exit;
                        }
                      }else{
                          echo "<script> 
                          window.location = 'ediusuariosestudiantes';
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




 //BOTON DE EDITAR citas genereles

 if (isset($_POST['cod_edit_cita'])){
  if(isset($_POST['edit_cita'])){
    $fecha= $_POST['edit_fecha_cita'];
    $hora =$_POST['edit_hora'];
    $estado =$_POST['estado_edit'];
    $cod =$_POST['cod_edit_cita'];
    $ENCARGADO= $_POST['encargadocitados'];
    $paciente1= $_POST['paciente_editar'];
    $VALOR_ANTERIOR = $_POST['VALORANTERIOR'];
    try{
       $sentencia_especialista = $db->prepare("SELECT  HORARIO , FECHA_CITA , CODIGO_PERSONA
       from tbl_inscripcion_cita   where CODIGO_PERSONA  = (?) AND HORARIO = (?)  and FECHA_CITA = (?) and CODIGO_ESTADO = (?)
       and CODIGO_CITA <> (?) ");//El <> es el que hace la magia :v
       $sentencia_especialista->execute(array($paciente1,$hora,$fecha,$estado,$cod));
       $row=$sentencia_especialista->fetchColumn();
      if($row >0){
        // verifica que si el especialista nuevo que seleccionó no tiene algun compromiso en la misma fecha
        echo "<script>
        alert('No se puede porque tiene otra cita en la misma fecha y misma hora');
        window.location = 'crudinscripcioncita';
        </script>";
        exit;
      }else{
       $sentencia_paciente= $db->prepare("SELECT  HORARIO , FECHA_CITA , CODIGO_ESPECIALISTA , CODIGO_ESTADO, CODIGO_CITA
       from tbl_inscripcion_cita   where CODIGO_ESPECIALISTA  = (?) and HORARIO = (?)  and FECHA_CITA = (?) and CODIGO_ESTADO = (?) 
        AND CODIGO_CITA <> (?) ");
       $sentencia_paciente->execute(array($ENCARGADO,$hora,$fecha,$estado,$cod));
       $row=$sentencia_paciente->fetchColumn();
       if($row > 0){
        echo "<script> 
        alert('El  Especialista  ya tiene asignada una cita en esa fecha y hora');
        window.location = 'crudinscripcioncita';
        </script>";
         exit;
       }else{

        // consulta para mandar a llamar el nombre sin modificar
        $sentencia1 = $db->prepare("  SELECT concat_ws(' ',tp.PRIMER_NOMBRE,tp.PRIMER_APELLIDO )  
        as ESPECIALISTA 
        from tbl_persona tp 
        where  tp.CODIGO_PERSONA =$VALOR_ANTERIOR");
        // llamar al procedimiento almacenado
        $sentencia1->execute();
        $nombre_anterior=$sentencia1->fetchColumn(); 

         // consulta para mandar a llamr el nombre modificado 
        $sentencia2 = $db->prepare("SELECT concat_ws(' ',tp.PRIMER_NOMBRE,tp.PRIMER_APELLIDO )  
        as ESPECIALISTA 
        from tbl_persona tp 
        where  tp.CODIGO_PERSONA=$cod");
        // llamar al procedimiento almacenado
        $sentencia2->execute();
        $nombre_actual=$sentencia2->fetchColumn(); 

        //comienza la consulta del update
        $sql ="UPDATE  tbl_inscripcion_cita SET  HORARIO ='$hora', FECHA_CITA='$fecha', CODIGO_ESTADO ='$estado', CODIGO_ESPECIALISTA ='$ENCARGADO' where CODIGO_CITA ='$cod' ;";
        $consulta=$conn->query($sql);
        if($consulta > 0){
          echo "<script>
          alert('Cita Actualizada');
          window.location = 'crudinscripcioncita';
          </script>";
          $codigoObjeto=32;
          $accion='MODIFICACIÓN';
          $CAMPO = "ENCARGADO";
          $VAL_ACTUAL= $nombre_actual;
          $ID_REGISTRO = $cod;
          $VAL_ANTERIOR = $nombre_anterior;
          bitacora($codigoObjeto,$accion,$VAL_ANTERIOR,$VAL_ACTUAL,$ID_REGISTRO,$CAMPO);
          
        }else{
          echo "<script>
          alert('Ocurrio un error');
          window.location = 'crudinscripcioncita';
          </script>";
        }//Fin validaciones 
       }
      }//Fin primer else
    }catch(PDOException $e){
    echo $e->getMessage(); 
    return false;
   }
  }
}

//BOTON DE EDITAR citas Medicas
if (isset($_POST['cod_edit_cita'])){
  if(isset($_POST['edit_cita_Medica'])){
    $fecha= $_POST['edit_fecha_cita'];
    $hora =$_POST['edit_hora'];
    $estado =$_POST['estado_edit'];
    $cod =$_POST['cod_edit_cita'];
    $ENCARGADO= $_POST['encargadocitados'];
    $paciente1= $_POST['paciente_editar'];
    try{
       $sentencia_especialista = $db->prepare("SELECT  HORARIO , FECHA_CITA , CODIGO_PERSONA
       from tbl_inscripcion_cita   where CODIGO_PERSONA  = (?) AND HORARIO = (?)  and FECHA_CITA = (?) and CODIGO_ESTADO = (?)
       and CODIGO_CITA <> (?) ");//El <> es el que hace la magia :v
       $sentencia_especialista->execute(array($paciente1,$hora,$fecha,$estado,$cod));
       $row=$sentencia_especialista->fetchColumn();
      if($row >0){
        // verifica que si el especialista nuevo que seleccionó no tiene algun compromiso en la misma fecha
        echo "<script>
        alert('El paciente tiene otra cita en la misma fecha y misma hora');
        window.location = 'crudcitasMedicasPendientes';
        </script>";
        exit;
      }else{
       $sentencia_paciente= $db->prepare("SELECT  HORARIO , FECHA_CITA , CODIGO_ESPECIALISTA , CODIGO_ESTADO, CODIGO_CITA
       from tbl_inscripcion_cita   where CODIGO_ESPECIALISTA  = (?) and HORARIO = (?)  and FECHA_CITA = (?) and CODIGO_ESTADO = (?) 
        AND CODIGO_CITA <> (?) ");
       $sentencia_paciente->execute(array($ENCARGADO,$hora,$fecha,$estado,$cod));
       $row=$sentencia_paciente->fetchColumn();
       if($row > 0){
        echo "<script> 
        alert('El  Encargado  tiene otra cita en la misma fecha y misma hora');
        window.location = 'crudcitasMedicasPendientes';
        </script>";
         exit; 
       }else{
        $sql ="UPDATE  tbl_inscripcion_cita SET  HORARIO ='$hora', FECHA_CITA='$fecha', CODIGO_ESTADO ='$estado', CODIGO_ESPECIALISTA ='$ENCARGADO' where CODIGO_CITA ='$cod' ;";
        $consulta=$conn->query($sql);
        if($consulta > 0){
          echo "<script>
          alert('Cita Actualizada');
          window.location = 'crudcitasMedicasPendientes';
          </script>";
        }else{
          echo "<script>
          alert('Ocurrio un error');
          window.location = 'crudcitasMedicasPendientes';
          </script>";
        }//Fin validaciones 
       }
      }//Fin primer else
    }catch(PDOException $e){
    echo $e->getMessage(); 
    return false;
   }
  }
}
//FIN DE BOTON DE EDITAR citas Medicas

//BOTON DE EDITAR citas Psicologicas
if (isset($_POST['cod_edit_cita'])){
  if(isset($_POST['edit_cita_psicologica'])){
    $fecha= $_POST['edit_fecha_cita'];
    $hora =$_POST['edit_hora'];
    $estado =$_POST['estado_edit'];
    $cod =$_POST['cod_edit_cita'];
    $ENCARGADO= $_POST['encargadocitados'];
    $paciente1= $_POST['paciente_editar'];
    try{
       $sentencia_especialista = $db->prepare("SELECT  HORARIO , FECHA_CITA , CODIGO_PERSONA
       from tbl_inscripcion_cita   where CODIGO_PERSONA  = (?) AND HORARIO = (?)  and FECHA_CITA = (?) and CODIGO_ESTADO = (?)
       and CODIGO_CITA <> (?) ");//El <> es el que hace la magia :v
       $sentencia_especialista->execute(array($paciente1,$hora,$fecha,$estado,$cod));
       $row=$sentencia_especialista->fetchColumn();
      if($row >0){
        // verifica que si el especialista nuevo que seleccionó no tiene algun compromiso en la misma fecha
        echo "<script>
        alert('El paciente tiene otra cita en la misma fecha y misma hora');
        window.location = 'crudcitasPsicologicasPendientes';
        </script>";
        exit;
      }else{
       $sentencia_paciente= $db->prepare("SELECT  HORARIO , FECHA_CITA , CODIGO_ESPECIALISTA , CODIGO_ESTADO, CODIGO_CITA
       from tbl_inscripcion_cita   where CODIGO_ESPECIALISTA  = (?) and HORARIO = (?)  and FECHA_CITA = (?) and CODIGO_ESTADO = (?) 
        AND CODIGO_CITA <> (?) ");
       $sentencia_paciente->execute(array($ENCARGADO,$hora,$fecha,$estado,$cod));
       $row=$sentencia_paciente->fetchColumn();
       if($row > 0){
        echo "<script> 
        alert('El  Encargado  tiene otra cita en la misma fecha y misma hora');
        window.location = 'crudcitasPsicologicasPendientes';
        </script>";
         exit; 
       }else{
        $sql ="UPDATE  tbl_inscripcion_cita SET  HORARIO ='$hora', FECHA_CITA='$fecha', CODIGO_ESTADO ='$estado', CODIGO_ESPECIALISTA ='$ENCARGADO' where CODIGO_CITA ='$cod' ;";
        $consulta=$conn->query($sql);
        if($consulta > 0){
          echo "<script>
          alert('Cita Actualizada');
          window.location = 'crudcitasPsicologicasPendientes';
          </script>";
        }else{
          echo "<script>
          alert('Ocurrio un error');
          window.location = 'crudcitasPsicologicasPendientes';
          </script>";
        }//Fin validaciones 
       }
      }//Fin primer else
    }catch(PDOException $e){
    echo $e->getMessage(); 
    return false;
   }
  }
}
//FIN DE BOTON DE EDITAR citas psicologicas


//BOTON DE EDITAR citas espirituales
if (isset($_POST['cod_edit_cita'])){
  if(isset($_POST['edit_cita_espiritual'])){
    $fecha= $_POST['edit_fecha_cita'];
    $hora =$_POST['edit_hora'];
    $estado =$_POST['estado_edit'];
    $cod =$_POST['cod_edit_cita'];
    $ENCARGADO= $_POST['encargadocitados'];
    $paciente1= $_POST['paciente_editar'];
    try{
       $sentencia_especialista = $db->prepare("SELECT  HORARIO , FECHA_CITA , CODIGO_PERSONA
       from tbl_inscripcion_cita   where CODIGO_PERSONA  = (?) AND HORARIO = (?)  and FECHA_CITA = (?) and CODIGO_ESTADO = (?)
       and CODIGO_CITA <> (?) ");//El <> es el que hace la magia :v
       $sentencia_especialista->execute(array($paciente1,$hora,$fecha,$estado,$cod));
       $row=$sentencia_especialista->fetchColumn();
      if($row >0){
        // verifica que si el especialista nuevo que seleccionó no tiene algun compromiso en la misma fecha
        echo "<script>
        alert('El Joven tiene otra cita en la misma fecha y misma hora');
        window.location = 'crudcitasEspiritualesPendientes';
        </script>";
        exit;
      }else{
       $sentencia_paciente= $db->prepare("SELECT  HORARIO , FECHA_CITA , CODIGO_ESPECIALISTA , CODIGO_ESTADO, CODIGO_CITA
       from tbl_inscripcion_cita   where CODIGO_ESPECIALISTA  = (?) and HORARIO = (?)  and FECHA_CITA = (?) and CODIGO_ESTADO = (?) 
        AND CODIGO_CITA <> (?) ");
       $sentencia_paciente->execute(array($ENCARGADO,$hora,$fecha,$estado,$cod));
       $row=$sentencia_paciente->fetchColumn();
       if($row > 0){
        echo "<script> 
        alert('El  Encargado  tiene otra cita en la misma fecha y misma hora');
        window.location = 'crudcitasEspiritualesPendientes';
        </script>";
         exit; 
       }else{
        $sql ="UPDATE  tbl_inscripcion_cita SET  HORARIO ='$hora', FECHA_CITA='$fecha', CODIGO_ESTADO ='$estado', CODIGO_ESPECIALISTA ='$ENCARGADO' where CODIGO_CITA ='$cod' ;";
        $consulta=$conn->query($sql);
        if($consulta > 0){
          echo "<script>
          alert('Cita Actualizada');
          window.location = 'crudcitasEspiritualesPendientes';
          </script>";
        }else{
          echo "<script>
          alert('Ocurrio un error');
          window.location = 'crudcitasEspiritualesPendientes';
          </script>";
        }//Fin validaciones 
       }
      }//Fin primer else
    }catch(PDOException $e){
    echo $e->getMessage(); 
    return false;
   }
  }
  }
//FIN DE BOTON DE EDITAR citas espirituales


//enviar la cita desde administracion
  if (isset($_POST['cod_enviar_cita'])){
    if(isset($_POST['enviar_cita'])){
        $codigo_cita = ($_POST['cod_enviar_cita']);
        $estado_cita = ($_POST['estado_cita']);
        $enviar_cita = "UPDATE tbl_inscripcion_cita SET CODIGO_ESTADO = '9' WHERE CODIGO_CITA = '$codigo_cita'";
        $consulta_cita =$conn->query($enviar_cita);
     
    }
  }

  //enviar la cita medica
  if (isset($_POST['cod_enviar_cita'])){
    if(isset($_POST['enviar_cita_medica'])){
        $codigo_cita = ($_POST['cod_enviar_cita']);
        $estado_cita = ($_POST['estado_cita']);
        $enviar_cita = "UPDATE tbl_inscripcion_cita SET CODIGO_ESTADO = '9' WHERE CODIGO_CITA = '$codigo_cita'";
        $consulta_cita =$conn->query($enviar_cita);
        echo "<script>
        window.location = 'procesoCitaspPreclinica';
       </script>";
       exit;
    }
  }

  //enviar la cita medica
  if (isset($_POST['cod_enviar_cita'])){
    if(isset($_POST['enviar_cita_psicologica'])){
        $codigo_cita = ($_POST['cod_enviar_cita']);
        $estado_cita = ($_POST['estado_cita']);
        $enviar_cita = "UPDATE tbl_inscripcion_cita SET CODIGO_ESTADO = '9' WHERE CODIGO_CITA = '$codigo_cita'";
        $consulta_cita =$conn->query($enviar_cita);
        echo "<script>
        window.location = 'ProcesoCitasPsicologicas';
       </script>";
       exit;
    }
  }
  

  //enviar la cita espiritual
  if (isset($_POST['cod_enviar_cita'])){
    if(isset($_POST['enviar_cita_espiritual'])){
        $codigo_cita = ($_POST['cod_enviar_cita']);
        $estado_cita = ($_POST['estado_cita']);
        $enviar_cita = "UPDATE tbl_inscripcion_cita SET CODIGO_ESTADO = '9' WHERE CODIGO_CITA = '$codigo_cita'";
        $consulta_cita =$conn->query($enviar_cita);
        echo "<script>
        window.location = 'procesoCitasEspirituales';
       </script>";
       exit;
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
      $user = $_SESSION['vario'];

      //SE DECLARAR LA SENTENCIA PARA HACER LAS CONSULTAS PARA QUE LA CITA NO SE REPITA EN ESTUDIANTE ,NI FECHA
      $sentencia = $db->prepare("SELECT  HORARIO , FECHA_CITA , CODIGO_PERSONA
      from tbl_inscripcion_cita   where  CODIGO_PERSONA  = (?) and HORARIO = (?)  and FECHA_CITA = (?)");
      $sentencia->execute(array($codigo_persona,$hora_cita,$fecha_cita));
      $row=$sentencia->fetchColumn();
      if($row >0){ 
        echo "<script> 
        alert('El paciente tiene otra cita en la misma fecha y misma hora');
        window.location = 'crudPacientesMedicos';
        </script>";
        exit;
      }else{
        $consulta2 = $db->prepare("SELECT  HORARIO , FECHA_CITA , CODIGO_ESPECIALISTA
        from tbl_inscripcion_cita   where  CODIGO_ESPECIALISTA  = (?) and HORARIO = (?)  and FECHA_CITA = (?)");
        $consulta2->execute(array($codigo_medico,$hora_cita,$fecha_cita));
        $row2=$consulta2->fetchColumn();
        if( $row2 > 0){
          echo "<script> 
          alert('El  Medico  ya tiene asignada una cita en esa fecha y hora');
          window.location = 'crudPacientesMedicos';
          </script>";
          exit;
        }else{
          $insertar ="call sp_insert_inscripcion_cita('$codigo_persona','$codigo_medico', '$estado','$area_cita', '$fecha_cita','$hora_cita','$fechaactual','$user');";
          $consulta=$conn->query($insertar);
          if($consulta >0){ 
            echo "<script>
             alert('Cita Registrada Exitosamente');
             window.location = 'crudPacientesMedicos';</script>";
              exit;
          }else{
            echo "<script> window.location = 'crudPacientesMedicos';</script>";
            exit;
          }//fin de la consulta
        }
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
      $user = $_SESSION['vario'];

      //Consulta para que no se repitan las citas piscologicas,fecha o medico 
      $sentencia = $db->prepare("SELECT  HORARIO , FECHA_CITA , CODIGO_PERSONA
      from tbl_inscripcion_cita   where  CODIGO_PERSONA  = (?) and HORARIO = (?)  and FECHA_CITA = (?)");
      $sentencia->execute(array($codigo_persona,$hora_cita,$fecha_cita));
      $row=$sentencia->fetchColumn();
      if($row >0){ 
        echo "<script> 
        alert('El paciente tiene otra cita en la misma fecha y misma hora');
        window.location = 'crudPacientesPsicologicos';
        </script>";
        exit;
      }else{
        $consulta2 = $db->prepare("SELECT  HORARIO , FECHA_CITA , CODIGO_ESPECIALISTA
        from tbl_inscripcion_cita   where  CODIGO_ESPECIALISTA  = (?) and HORARIO = (?)  and FECHA_CITA = (?)");
        $consulta2->execute(array($codigo_medico, $hora_cita,$fecha_cita));
        $row2=$consulta2->fetchColumn();
        try{
          if($row2 > 0){
            echo "<script> 
            alert('El Psicológo ya tiene asignada una cita en esa fecha y hora');
            window.location = 'crudPacientesPsicologicos';
            </script>";
            exit;
          }else{//si no tiene choque de fechas o pacientes etc,entonces si se puede registrar la cita
            $insertar ="call sp_insert_inscripcion_cita('$codigo_persona','$codigo_medico', '$estado','$area_cita', '$fecha_cita','$hora_cita','$fechaactual','$user');";
            $consulta=$conn->query($insertar);
            if($consulta >0){ 
              echo "<script> 
              alert('Cita Registrada Exitosamente');
              window.location = 'crudPacientesPsicologicos';</script>";
              exit;
            }else{
              echo "<script> 
              alert('Ocurrio algun problema');
              window.location = 'crudPacientesPsicologicos';</script>";
              exit;
            }
          }// Fin else interno
        }catch(PDOException $e){
          echo $e->getMessage(); 
          return false;
        }
      }//else
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
      $user = $_SESSION['vario'];

      //Consultas para que no se repita la cita
      $sentencia = $db->prepare("SELECT  HORARIO , FECHA_CITA , CODIGO_PERSONA
      from tbl_inscripcion_cita   where  CODIGO_PERSONA  = (?) and HORARIO = (?)  and FECHA_CITA = (?)");
      $sentencia->execute(array($codigo_persona,$hora_cita,$fecha_cita));
      $row=$sentencia->fetchColumn();
      if($row >0){ 
        echo "<script> 
        alert('El Joven tiene otra cita en la misma fecha y misma hora');
        window.location = 'crudPacientesEspirituales';
        </script>";
        exit;
      }else{
        $consulta2 = $db->prepare("SELECT  HORARIO , FECHA_CITA , CODIGO_ESPECIALISTA
        from tbl_inscripcion_cita   where  CODIGO_ESPECIALISTA  = (?) and HORARIO = (?)  and FECHA_CITA = (?)");
        $consulta2->execute(array($codigo_catequista,$hora_cita,$fecha_cita));
        $row2=$consulta2->fetchColumn();
        if($row2 > 0){
          echo "<script> 
          alert('El Catequista ya tiene asignada una cita en esa fecha y hora');
          window.location = 'crudPacientesEspirituales';
          </script>";
          exit;
        }else{// Si no tiene choque de citas,entonces si se puede registrar la cita :D
          $insertar ="call sp_insert_inscripcion_cita('$codigo_persona','$codigo_catequista', '$estado','$area_cita', '$fecha_cita','$hora_cita','$fechaactual','$user');";
          $consulta=$conn->query($insertar);
          if($consulta >0){ 
            echo "<script>
            alert('Cita Registrada Exitosamente');
            window.location = 'crudPacientesEspirituales';
            </script>";
            exit;
          }else{
            echo "<script> 
            window.location = 'crudPacientesEspirituales';
            </script>";
            exit;
          }
        }//Fin else interno
      }//Fin else
    }
 }
//fin de inscripcion cita por parte de un usuario catequista
?>