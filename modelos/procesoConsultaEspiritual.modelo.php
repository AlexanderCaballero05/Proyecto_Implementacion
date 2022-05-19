<?php
  include_once 'conexion3.php';
  include_once 'conexion.php';
  include_once 'conexion2.php';
?>


<?php
//codigo para enviar la cita espiritual a consulta
    if(isset($_POST['codigo_cita_espiritual'])){
        if(isset($_POST['enviar_cita_espiritual'])){ 
        $codigo_cita_espritual = ($_POST['codigo_cita_espiritual']);
        //$estado_cita_medica = ($_POST['estado_cita_medica']);
        $codigo_persona = ($_POST['codigo_persona']);

            $consulta_expediente = $db->prepare("SELECT CODIGO_PERSONA FROM TBL_EXPEDIENTE_ESPIRITUAL WHERE CODIGO_PERSONA = (?);");
            $consulta_expediente->execute(array($codigo_persona));
            $row=$consulta_expediente->fetchColumn();

            if($row>0){ //si ya existe el expediente espiritual de la persona se redireccina a la pantalla de consulta
              $enviar_cita_espiritual = "UPDATE tbl_inscripcion_cita
                         SET CODIGO_ESTADO = '11'
                         WHERE CODIGO_CITA = '$codigo_cita_espritual'";

               $consulta_cita_espritual =$conn->query($enviar_cita_espiritual);

               echo "<script> 
            window.location = 'procesoConsultaEspiritual';
            </script>";
  
          }else{// si no existe el expediente espiritual se direcciona a la pantalla para crearlo.

            $enviar_cita_espiritual = "UPDATE tbl_inscripcion_cita
                         SET CODIGO_ESTADO = '11'
                         WHERE CODIGO_CITA = '$codigo_cita_espritual'";

               $consulta_cita_espritual =$conn->query($enviar_cita_espiritual);
               
            echo "<script>
                  window.location = 'procesoExpedienteEspiritual'
               </script>";

         }
        }
    }
?>

  <?php
  //codigo para registrar el expediente espiritual de la persona
  if(isset($_POST['registrar_expediente_espiritual'])){
    if(isset($_POST['codigo_paciente_expediente_espiritual'])){
      //declarion de variables php
      $codigo_paciente_espiritual = ($_POST['codigo_paciente_expediente_espiritual']);
      $codigo_estado_expediente = '2';
      $nombre_iglesia = ($_POST['nombre_iglesia']);
      $grupo_iglesia = ($_POST['grupo_iglesia']);
      $tiempo_iglesia = ($_POST['tiempo_iglesia']);
      $motivacion_iglesia = ($_POST['motivacion_iglesia']);
      
      date_default_timezone_set("America/Guatemala");
      $Fechaactual=  date('Y-m-d');

      $consulta_expediente_espiritual = "INSERT INTO TBL_EXPEDIENTE_ESPIRITUAL(CODIGO_PERSONA, CODIGO_ESTADO, NOMBRE_IGLESIA, GRUPO_IGLESIA, TIEMPO_ASISTIR_IGLESIA, MOTIVACION_IGLESIA, FECHA_CREACION)
                                                                        VALUES ('$codigo_paciente_espiritual','$codigo_estado_expediente', '$nombre_iglesia','$grupo_iglesia','$tiempo_iglesia','$motivacion_iglesia', '$Fechaactual')";

     $resultado_consulta =$conn->query($consulta_expediente_espiritual);

     if($resultado_consulta > 0){
      echo "<script>
      window.location = 'procesoConsultaEspiritual'
      </script>";
     }else{
      echo "<script>
      alert('Error al crear');
      window.location = 'procesoExpedienteEspiritual'
      </script>";
     }
    }
  }//fin del codigo para crear el expediente espiritual
  ?>

  <?php
  // CODIGO PARA INSERTAR UNA CONSULTA ESPIRITUAL
    if(isset($_POST['Consulta_espiritual'])){
      if(isset($_POST['codigo_cita_espiritual'])){
        //inicializacion de variables php
        $codigo_cita_espiritual = ($_POST['codigo_cita_espiritual']);
        $motivo_consulta = ($_POST['Motivo_consulta']);
        $observaciones_espiritual = ($_POST['observaciones_espiritual']);
        date_default_timezone_set("America/Guatemala");
        $Fechaactual_consulta=  date('Y-m-d');

        $insertar_consulta_espiritual = "INSERT INTO tbl_consulta_espiritual (CODIGO_CITA, MOTIVO_CONSULTA, OBSERVACIONES, FECHA_CREACION)
                                              VALUES('$codigo_cita_espiritual', '$motivo_consulta','$observaciones_espiritual', '$Fechaactual_consulta');";

        $resultado_insertar =$conn->query($insertar_consulta_espiritual);
        if($resultado_insertar > 0){
          echo "<script>
          window.location = 'expedienteEspiritual'
          </script>";
          
          $update = "UPDATE tbl_inscripcion_cita
          set CODIGO_ESTADO = '12'  
          where CODIGO_CITA = '$codigo_cita_espiritual';";

         $consult=$conn->query($update);

        }else{
          echo "<script>
          alert('Error al crear');
          window.location = 'procesoConsultaEspiritual'
          </script>";

        }

      }
    }
   ?>


<?php
//CODIGO PARA FINALIZAR UNA CITA ESPIRITUAL 
if(isset($_POST['EXPEDIENTE_CITA_ESPIRITUAL'])){
    if(isset($_POST['FINALIZAR_CITA_ESPIRITUAL'])){
        $codigo = ($_POST['EXPEDIENTE_CITA_ESPIRITUAL']);
        $estado = "13";
        $update = "UPDATE tbl_inscripcion_cita set CODIGO_ESTADO = '$estado'  where CODIGO_CITA = '$codigo'";
        $consulTITA=$conn->query($update);
        if ($consulTITA >0 ){
            echo "<script> 
            window.location = 'crudPacientesEspirituales';
            </script>";  
            exit;
        }else{
            echo "<script> 
            window.location = 'crudPacientesEspirituales';
            </script>";  
            exit;
        }
    }
}
?>