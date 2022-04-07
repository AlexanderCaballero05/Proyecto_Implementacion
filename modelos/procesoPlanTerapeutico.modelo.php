<?php
 include_once 'conexion3.php';
 include_once 'conexion.php';
 include_once 'conexion2.php';
 include_once  "conexionpdo.php";
 
?>

<?php
    if(isset($_POST['codigo_consulta'])){
        
            
            $codigo_consulta = ($_POST['codigo_consulta']);
            $codigo_cita = ($_POST['codigo_cita']);
            $actividad = ($_POST['Actividades']);
            $tecnica = ($_POST['tecnicas']);
            $materiales = ($_POST['Materiales']);
            $tareas = ($_POST['Tareas']);
            $resultados = ($_POST['Resultados']); 
         


            $insertar_plan ="INSERT INTO tbl_plan_terapeutico (CODIGO_CONSULTA, ACTIVIDAD , TECNICA , MATERIALES, TAREAS, RESULTADOS) 
                                                                VALUES ('$codigo_consulta', '$actividad','$tecnica', '$materiales', '$tareas','$resultados')";
           
            $consulta=$conn->query($insertar_plan);

                        if($consulta >0){

                            $cambiar_estado = "UPDATE tbl_inscripcion_cita
                            SET CODIGO_ESTADO = '13'
                            WHERE CODIGO_CITA = ' $codigo_cita'";

                            $consulta_estado =$conn->query($cambiar_estado);

                            echo "<script>
                            window.location = 'ProcesoCitasPsicologicas'
                            </script>";

                        }else{
                        echo "<script>
                        window.location = 'procesoPlanTerapeutico'
                        </script>";
                        }
        

            

    }


?>
