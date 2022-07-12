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
    Programa:          Crud Examenes Medicos (código)
    Fecha:             
    Programador:      
    descripcion:       Permite insertar,eliminar y editar registros a la base de datos
-----------------------------------------------------------------------
  Historial de Cambio
-----------------------------------------------------------------------
    Programador               Fecha                      Descripcion
 D'aniel Martinez          11-07-2022                 Modificar modal eliminar
----------------------------------------------------------------------->

<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
 <?php

  //session_start();
  include_once 'conexion3.php';
  include_once 'conexion.php';
  include_once 'conexion2.php';
?>
<?php
//FUNCIONES DEL CRUD ,AGREGAR,EDITAR Y ELIMINAR UN ROL
if(isset($_POST['nombre_examen'])){
  try{
     if(isset($_POST['nuevo_ex'])){
          $nombre_examen= ($_POST['nombre_examen']);
          $descripcion_examen = ($_POST['descripcion_examen']);
          $fechaActual = date('Y-m-d');
          $usuario =$_SESSION['vario'];    
              try{ 
                  $consulta_modalidad = $db->prepare("SELECT COUNT(*) FROM tbl_examenes_medicos WHERE EXAMEN_MEDICO = (?);");
                  $consulta_modalidad->execute(array($nombre_examen));
                  $row=$consulta_modalidad->fetchColumn();
                  if($row>0){
                    echo "<script>
                    alert('el examen  $nombre_examen ya se encuentra registrado');
                    window.location = 'crudExamenesMedicos';
                    </script>";
                  exit;
                  }else{
                    try{
                      $query_modalidad = " INSERT INTO tbl_examenes_medicos( EXAMEN_MEDICO,DESCRIPCION) VALUES ('$nombre_examen','$descripcion_examen' ); ";
                      $resul=$conn->query($query_modalidad);
                      if($resul >0){
                        echo "<script> 
                        alert('Examen registrado correctamente');
                        window.location = 'crudExamenesMedicos';
                        </script>";
                        exit;
                        include_once 'function_bitacora.php';
                        $codigoObjeto=19;
                        $accion='Registro';
                        $descripcion= 'Se agrego un examen ';
                         bitacora($codigoObjeto, $accion,$descripcion);
                      }else{
                        echo "<script> 
                        alert('Error!');
                        window.location = 'crudExamenesMedicos';
                        </script>";
                        exit;
                      }
                    }catch(PDOException $e){
                    echo $e->getMessage(); 
                    return false;
                    }
                  }//fin del else de si no existe el nombre del rol
              }catch(PDOException $e){
              echo $e->getMessage(); 
              return false;
              }
            }//fin del if de verificar si hay datos
       }catch(PDOException $e){
        echo $e->getMessage(); 
        return false;
       }
    }//FIN DEL IF DE REGISTAR UN ROL



  //PARTE PARA EDITAR UN tipo de modalidad
  if(isset($_POST['id_examen'])){
    if(isset($_POST['editaexa'])){
      $codigo_examen = ($_POST['id_examen']);
      $editar_examen = ($_POST['editar_examen']);
      $editar_descripcion = ($_POST['editar_descripcionexamen']);
      $fecha_modificacion = date('Y-m-d'); 
      $user=$_SESSION['vario'];

      try{
       // 
       $sentencia = $db->prepare("SELECT COUNT(*) FROM tbl_examenes_medicos where EXAMEN_MEDICO = (?) and CODIGO_EXAMEN_MEDICO <> (?) ;");
       $sentencia->execute(array($editar_examen,$codigo_examen));
       $row=$sentencia->fetchColumn();
        if($row>0){
          echo "<script>
          alert('Ya existe el examen: $editar_examen');
          window.location = 'crudExamenesMedicos';
          </script>";
          exit;
        }else{
          try{
            $sql = " UPDATE tbl_examenes_medicos SET EXAMEN_MEDICO = '$editar_examen',DESCRIPCION = '$editar_descripcion'
            WHERE CODIGO_EXAMEN_MEDICO = '$codigo_examen' ";
            $consulta=$conn->query($sql);
            if ($consulta>0){
              echo '<script>
              alert("examen actualizado,exitosamente");
              
              window.location = "crudExamenesMedicos";
              </script>';
              include_once 'function_bitacora.php';
              $codigoObjeto=19;
              $accion='Modificacion';
              $descripcion= 'Se edito la modalidad';
              bitacora($codigoObjeto, $accion,$descripcion);
              exit;
            }else{
              echo "<script>
              alert('¡Error al  intentar modificar el examen!');
              window.location = 'crudExamenesMedicos';
              </script>";
            }
          }catch(PDOException $e){
          echo $e->getMessage(); 
          return false;
          }//fin del try catch
        }//fin del else
      }catch(PDOException $e){
        echo $e->getMessage(); 
        return false;
       }
    }
  }//cierre del if principal
//// eliminar examen  /////
if(isset($_POST['examen_eliminar'])){
  if(isset($_POST['ELIMINAR_EXAMEN'])){
    $codigo = ($_POST['examen_eliminar']);//asigna a una variable el id de la pregunta a  eliminar
    try{
        $relacion_tablas =  $db->prepare("SELECT rm.CODIGO_RECETA_MEDICA, rm.CODIGO_MEDICAMENTO from  tbl_receta_medica rm, tbl_medicamento m
        where m.CODIGO_MEDICAMENTO  = rm.CODIGO_MEDICAMENTO and m.CODIGO_MEDICAMENTO = (?);");
      $relacion_tablas->execute(array($codigo));
      $row = $relacion_tablas->fetchColumn();
      if($row >0){
        echo "<script>
        alert('¡No se puede eliminar esta, relacionado con otras tablas!');
        window.location = 'crudmedicamento';
        </script>";
        exit;
      }else{
        try{
          $link = mysqli_connect("localhost", "root", "", "db_proyecto_Prosecar");
          mysqli_query($link, "DELETE FROM tbl_examenes_medicos WHERE  CODIGO_EXAMEN_MEDICO = '$codigo' ");
          if(mysqli_affected_rows($link)>0){
            echo "<script>
            window.location = 'crudExamenesMedicos';
            </script>";
            include_once 'function_bitacora.php';
            $codigoObjeto=30;
            $accion='ELIMINACIÓN';
            $descripcion= 'SE ELIMINÓ UN TIPO DE EXAMEN MEDICO';
            bitacora($codigoObjeto, $accion,$descripcion);
            exit;
          }else{
            echo "<script>
            alert('¡Error al eliminar Examen Medico!');
            window.location = 'crudExamenesMedicos';
            </script>";
            exit;
          }
        }catch(PDOException $e){
        echo $e->getMessage(); 
        return false;
       }
      }
    }catch(PDOException $e){
     echo $e->getMessage(); 
     return false;
    }
  }
}//Cerre del if padre
?>