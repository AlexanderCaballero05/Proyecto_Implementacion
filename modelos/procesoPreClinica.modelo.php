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
    Programa:          Proceso preclinica (código)
    Fecha:             
    Programador:      
    descripcion:       Permite insertar registros a la base de datos
-----------------------------------------------------------------------
  Historial de Cambio
-----------------------------------------------------------------------
    Programador               Fecha                      Descripcion
 D'aniel Martinez          11-07-2022                 Eliminar bitacora de editar registro
----------------------------------------------------------------------->
<?php
  include_once 'conexion3.php';
  include_once 'conexion.php';
  include_once 'conexion2.php';
  
?>
<?php
//parte para agregar un nuveo registro
if(isset($_POST['codigo_paciente'])){
  if(isset($_POST['Guardar_PreClinica'])){
    try{
      $codigo_cita = ($_POST['codigo_paciente']);
      $peso = ($_POST['peso']);
      $estatura = ($_POST['estatura']);
      $fc = ($_POST['FC']);
      $fr = ($_POST['FR']);
      $pulso = ($_POST['pulso']);
      $masa_corporal = ($_POST['masa_corporal']);
      $desnutricion = ($_POST['desnutricion']);
      $temperatura = ($_POST['temperatura']);
      $fechaActual = date('Y-m-d'); 
      $user = 'admin';
      $estado = "11";
      //
      $inser ="INSERT INTO tbl_preclinica (`CODIGO_CITA`, `PESO`, `MASA_CORPORAL`, `ESTATURA`, `TEMPERATURA` ,`PULSO`, `FECHA_CREACION`,FRECUENCIA_CARDIACA, FRECUENCIA_RESPIRATORIA,`DESNUTRICION`)
       VALUES ('$codigo_cita',  '$peso', '$masa_corporal', '$estatura', '$temperatura', '$pulso' , '$fechaActual','$fc','$fr','$desnutricion') ";
      $consulta=$conn->query($inser);
      $update = "UPDATE tbl_inscripcion_cita set CODIGO_ESTADO = '$estado'  where CODIGO_CITA = '$codigo_cita'";
      $consulTITA=$conn->query($update);

      //CODIGO PERSONA: para poder relacionar las otras tablas de correo y usuario con el código de persona
      
      if ($consulta>0  && $consulTITA >0 ){
        $conn->commit();
        echo "<script> 
        window.location = 'procesoCitaspPreclinica';
        </script>";  
        exit;
      
      }else{  
        echo "<script> 
        alert('Ocurrio algun error,comuniquese con el admin :)');
        window.location = 'procesoCitaspPreclinica';
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
  
 

  







  //PARTE PARA EDITAR UN REGISTRO EN PRECLINICA
  if(isset($_POST['id_preclinica'])){
    if(isset($_POST['editar_preclinica'])){
      $codigo_preclinica = ($_POST['id_preclinica']);
      $editar_peso = ($_POST['editar_peso']);
      $editar_estatura = ($_POST['editar_estatura']);
      $editar_FC = ($_POST['editar_fc']);
      $editar_FR = ($_POST['editar_fr']);

      $editar_FR = ($_POST['editar_masa']);
      $editar_FR = ($_POST['editar_pulso']);
      $editar_FR = ($_POST['editar_temperatura']);
      
      $editar_FR = ($_POST['editar_desnutricion']);
      
     
      try{         
          try{
            $sql = " UPDATE tbl_Preclinica SET PESO = '$editar_peso', FRECUENCIA_CARDIACA ='$editar_FC', FRECUENCIA_RESPIRATORIA = '$editar_FR',  ESTATURA = '$editar_estatura' WHERE CODIGO_PRECLINICA = '$codigo_preclinica' ";
            $consulta=$conn->query($sql);
            if ($consulta>0){
              echo "<script>
              alert('Registro modificado exitosamente!');
              window.location = 'crudPreClinica';
              </script>";
              include_once 'function_bitacora.php';
            }else{
              echo "<script>
              alert('¡Error al  intentar modificar un registro en Preclinica!');
              window.location = 'crudPreClinica';
              </script>";
            }
          }catch(PDOException $e){
          echo $e->getMessage(); 
          return false;
          }//fin del try catch
        
      }catch(PDOException $e){
        echo $e->getMessage(); 
        return false;
       }
    }
  }//cierre del if principal

//PARTE PARA ELIMINAR UN REGISTRO EN PRECLINICA
if(isset($_POST['preclinica_eliminar'])){
  if(isset($_POST['ELIMINAR_PRECLINICA'])){
    $code = ($_POST['preclinica_eliminar']);//
    try{
      
        try{
          $link = mysqli_connect("localhost", "root", "", "db_proyecto_Prosecar");
          mysqli_query($link, "DELETE FROM tbl_Preclinica WHERE  CODIGO_PRECLINCA = '$code' ");
          if(mysqli_affected_rows($link)>0){
            echo "<script>
            alert('Registro eliminado!');
            window.location = 'crudPreclinica';
            </script>";
           
            exit;
          }else{
            echo "<script>
            alert('¡Error al eliminar un registro!');
            window.location = 'crudPreclinica';
            </script>";
            exit;
          }
        }catch(PDOException $e){
        echo $e->getMessage(); 
        return false;
       }
      //}//
    }catch(PDOException $e){
     echo $e->getMessage(); 
     return false;
    }
  }
}//Cerre del if padre

//Solo la parte de eliminar ***********
//*****Realizo solo la parte de eliminar y no completa*** por Carlos Amador,no quiten creditos :v *******
?>