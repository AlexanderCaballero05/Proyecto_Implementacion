<?php
include_once "conexion.php";
include_once "conexion3.php";
include_once 'conexionpdo.php';
include "conexionpdo.php";
?>


<?php
    if(isset($_POST['receta_medica'])){ 
    $codigo_consulta = ($_POST['codigo_consulta']);
    $fecha_receta = ($_POST['fecha_receta']);
    $codigo_medicamento = ($_POST['codigo_medicamento']);
    $indicaciones =  ($_POST['indicaciones']);
    $observaciones =  ($_POST['observaciones']);

    $insertar_reseta = "INSERT INTO `tbl_receta_medica` (`CODIGO_CONSULTA`, `CODIGO_MEDICAMENTO`, `INDICACIONES_RECETA`, `OBSERVACIONES`, `FECHA_RECETA`, `CREADO_POR_USUARIO`, `FECHA_CREACION`)
                                                    VALUES('$codigo_consulta', '$codigo_medicamento', '$indicaciones', '$observaciones', '$fecha_receta', 'ADMIN', '$fecha_receta')";

            $consulta_receta =$conn->query($insertar_reseta);
            if($consulta_receta>0){

              


            echo "<script>
                    alert('receta insertada');
                    window.location = 'procesoRecetaMedica';
                    </script>";
                    exit;

            }else{ 
            echo "<script> 
                    alert('error en el registro');
                    window.location = 'procesoConsulta';
                    </script>";  
                    exit;

            }

    }


    if(isset($_POST['finalizar_consulta'])){

        $codigo_cita = ($_POST['codigo_cita']);

        $cambiar_estado = "UPDATE tbl_inscripcion_cita
        SET CODIGO_ESTADO = '12'
        WHERE CODIGO_CITA = ' $codigo_cita'";

       $consulta_estado =$conn->query($cambiar_estado);


                echo "<script>
                window.location = 'ProcesoCitasMedicos';
                </script>";
                exit;



    }


?>