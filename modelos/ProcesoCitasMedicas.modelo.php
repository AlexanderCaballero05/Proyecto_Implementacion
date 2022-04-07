<?php
 include_once 'conexion3.php';
 include_once 'conexion.php';
 include_once 'conexion2.php';
 include_once 'function_bitacora.php';

?>


<?php
    if(isset($_POST['codigo_enviar_cita'])){
        if(isset($_POST['enviar_cita_medica'])){ 
        $codigo_cita_medica = ($_POST['codigo_enviar_cita']);
        //$estado_cita_medica = ($_POST['estado_cita_medica']);
        $codigo_persona = ($_POST['codigo_persona']);

        $consulta_expediente = $db->prepare("SELECT CODIGO_PERSONA FROM TBL_EXPEDIENTE_MEDICO WHERE CODIGO_PERSONA = (?);");
        $consulta_expediente->execute(array($codigo_persona));
        $row=$consulta_expediente->fetchColumn();


        if($row>0){
            $enviar_cita_medico = "UPDATE tbl_inscripcion_cita
            SET CODIGO_ESTADO = '10'
            WHERE CODIGO_CITA = '$codigo_cita_medica'";

            $consulta_cita_medico =$conn->query($enviar_cita_medico);

             echo "<script> 
          window.location = 'procesoPreClinica';
          </script>";

        }else{

            $enviar_cita_medico = "UPDATE tbl_inscripcion_cita
            SET CODIGO_ESTADO = '10'
            WHERE CODIGO_CITA = '$codigo_cita_medica'";

          $consulta_cita_medico =$conn->query($enviar_cita_medico);
            
          echo "<script>
                window.location = 'procesoExpedienteMedico'
             </script>";

        }
        
        }


    }
?>