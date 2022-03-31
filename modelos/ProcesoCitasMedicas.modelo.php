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


        $enviar_cita_medico = "UPDATE tbl_inscripcion_cita
                         SET CODIGO_ESTADO = '10'
                         WHERE CODIGO_CITA = '$codigo_cita_medica'";

        $consulta_cita_medico =$conn->query($enviar_cita_medico);

        if ($consulta_cita_medico>0){
            echo "<script> 
            window.location = 'procesoPreClinica';
            </script>";
            
          }else{  
            echo "<script> 
            alert('Ocurrio algun error');
            window.location = 'ProcesoCitasMedicos';
            </script>";  
            exit;
    
          }
        }


    }
?>