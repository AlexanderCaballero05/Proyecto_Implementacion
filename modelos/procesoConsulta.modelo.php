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
  D'aniel Ferdinand Martinez Moradel (ferdinand.martinez@unah.hn)
  
  Catedratico:
  Lic. Claudia Nuñez (Analisis)
  Lic. Giancarlo Martini Scalici Aguilar (Implementación)
  Lic. Karla Melisa Garcia Pineda (Evaluación)
---------------------------------------------------------------------
    Programa:          Proceso Consulta (código)
    Fecha:             
    Programador:      
    descripcion:       Permite insertar registros a la base de datos
-----------------------------------------------------------------------
  Historial de Cambio
-----------------------------------------------------------------------
    Programador               Fecha                      Descripcion
 D'aniel Martinez          11-07-2022                 Agregar bitacora de la creación de una consulta a estudiante #
----------------------------------------------------------------------->

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
        $consulta4 = mysqli_query($conn,"SELECT CODIGO_PERSONA FROM `tbl_inscripcion_cita` WHERE CODIGO_CITA='$codigo_cita'");
        $IDE2=mysqli_fetch_array($consulta4);                  
        $codigoObjeto=30;
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