<?php
  include_once 'conexion3.php';
  include_once 'conexion.php';
  include_once 'conexion2.php';
  
?>
<?php
//AGREGAR NUEVO REGISTRO A LA TABLA DE CONSULTA
if(isset($_POST['sintomas'])){
  session_start();
  $usuario = $_SESSION['vario'];
  if(isset($_POST['Guardar_Consulta'])){
    try{
      $sintomas = ($_POST['sintomas']);
      $diagnostico1 = ($_POST['diagnostico1']);
      $evolucion = ($_POST['evolucion']);
      $diagnostico2 = ($_POST['diagnostico2']);
      $estado = "8";
      //
      $inser ="INSERT INTO tbl_consulta_medica (`SINTOMAS`, `DIAGNOSTICO_INGRESO`, `EVOLUCION`, `DIAGNOSTICO_EGRESO`,`CREADO_POR_USUARIO`, `FECHA_CREACION`)
       VALUES ('$sintomas',  '$diagnostico1', '$evolucion', ' $diagnostico2', '$usuario', '$fechaActual') ";
      $consulta=$conn->query($inser);
      $update = "UPDATE tbl_inscripcion_cita set CODIGO_ESTADO = '$estado'  where CODIGO_CITA = '$codigo_cita'";
      $consult=$conn->query($update);

      
      
      if ($consulta >0  && $consult >0 ){
        $conn->commit();
        echo "<script> 
        alert('Consulta Médica registrada exitosamente!');
        window.location = 'procesoRecetaMedica';
        </script>";  
        exit;
      
      }else{  
        echo "<script> 
        alert('Ocurrio algun error,comuniquese con el administrador');
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