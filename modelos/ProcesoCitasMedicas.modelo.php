<?php
 include_once 'conexion3.php';
 include_once 'conexion.php';
 include_once 'conexion2.php';
 include_once 'function_bitacora.php';

?>


<?php
     //Codigo para enviar un paciente a pre-clinica
    if(isset($_POST['codigo_enviar_cita'])){
        if(isset($_POST['enviar_cita_medica'])){ 
        $codigo_cita_medica = ($_POST['codigo_enviar_cita']);
        //$estado_cita_medica = ($_POST['estado_cita_medica']);
        $enviar_cita_medico = "UPDATE tbl_inscripcion_cita
        SET CODIGO_ESTADO = '10'
        WHERE CODIGO_CITA = '$codigo_cita_medica'";
        $consulta_cita_medico =$conn->query($enviar_cita_medico);

        echo "<script> 
        window.location = 'procesoPreClinica';
        </script>";
    }
}//fin de mandar a pre-clinica
?>

<?php
// para mandar a consulta medica 
 if(isset($_POST['codigo_cita'])){
    if(isset($_POST['enviar_consulta'])){
        $codigo_cita_medica = ($_POST['codigo_cita']);
        $codigo_persona = ($_POST['codigo_persona']);
        $consulta_expediente = $db->prepare("SELECT CODIGO_PERSONA FROM TBL_EXPEDIENTE_MEDICO WHERE CODIGO_PERSONA = (?);");
        $consulta_expediente->execute(array($codigo_persona));
        $row=$consulta_expediente->fetchColumn();
        if($row>0){
            //Si la persona  tiene un expediente se manda directamente a consulta.
            $enviar_cita_medico = "UPDATE tbl_inscripcion_cita
            SET CODIGO_ESTADO = '15' WHERE CODIGO_CITA = '$codigo_cita_medica'";
            $consulta_cita_medico= $conn->query($enviar_cita_medico);
            echo "<script> 
            window.location = 'procesoConsulta';
            </script>";
        }else{
            //si el paciente no tiene un expediente se manda a crearlo
            $enviar_cita_medico = "UPDATE tbl_inscripcion_cita
            SET CODIGO_ESTADO = '15' WHERE CODIGO_CITA = '$codigo_cita_medica'";
            $consulta_cita_medico =$conn->query($enviar_cita_medico);
            echo "<script>
                window.location = 'procesoExpedienteMedico'
             </script>";
        }//fin del else

    }
 }

?>
 












      