<?php
  include_once 'conexion3.php';
  include_once 'conexion.php';
  include_once 'conexion2.php';
  
?>
<?php
//AGREGAR NUEVO REGISTRO A LA TABLA DE CONSULTA
if(isset($_POST['sintomas2'])){
 
  
  $fechaActual = date('Y-m-d');
  if(isset($_POST['Guardar_Consulta2'])){
    try{
      $sintomas = ($_POST['sintomas2']);
      $diagnostico1 = ($_POST['diagnostico1']);
      $evolucion = ($_POST['evolucion']);
      $diagnostico2 = ($_POST['diagnostico2']);
      $estado = "8";
      $codigo_pre = ($_POST['codigopre']);
      $codigo_cita = ($_POST['codigocita2']);
      //
      $inser ="INSERT INTO tbl_consulta_medica (`CODIGO_PRECLINICA`,`CODIGO_CITA`,`SINTOMAS`, `DIAGNOSTICO_INGRESO`, `EVOLUCION`, `DIAGNOSTICO_EGRESO`, `FECHA_CREACION`)
       VALUES ('$codigo_pre','$codigo_cita','$sintomas', '$diagnostico1', '$evolucion', ' $diagnostico2', '$fechaActual') ";
      $consulta=$conn->query($inser);
      $update = "UPDATE tbl_inscripcion_cita set CODIGO_ESTADO = '$estado'  where CODIGO_CITA = '$codigo_cita'";
      $consult=$conn->query($update);

      
      
      if ($consulta >0  && $consult >0 ){
        $conn->commit();
        echo "<script> 
        window.location = 'procesoRecetaMedica';
        </script>";  
        exit;
      
      }else{  
        echo "<script> 
        window.location = 'procesoConsulta';
        </script>";  
        exit;

      }
    }catch(PDOException $e){
      $conn->rollback();
    echo $e->getMessage(); 
    return false;
    }

  }

}
  
 
?>