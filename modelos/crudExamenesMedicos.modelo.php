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
                  $consulta_modalidad = $db->prepare("SELECT EXAMEN_MEDICO FROM tbl_examenes_medicos WHERE EXAMEN_MEDICO = (?);");
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
                        alert('examen registrado correctamente');
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
       $sentencia = $db->prepare("SELECT * FROM tbl_examenes_medicos where EXAMEN_MEDICO = (?) and CODIGO_EXAMEN_MEDICO <> (?) ;");
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

//PARTE PARA ELIMINAR UNA ESPECIALIDAD
if (isset($_POST['eliminar_medica']) && isset($_POST['eliminar_medicamento'])){
  $codigo =($_POST['eliminar_medicamento']);
      try {
          $link = mysqli_connect("localhost", "root", "", "db_proyecto_Prosecar");
          mysqli_query($link, "DELETE FROM tbl_apariencia_fisica WHERE CODIGO_APARIENCIA  = '$codigo' ");
          if(mysqli_affected_rows($link)>0){
            echo "<script>
          alert('Medicamento eliminada!');
          window.location = 'crudAparienciaFisica';
          </script>";
          include_once 'function_bitacora.php';
          $codigoObjeto=25; //cmabiar 
          $accion='Eliminación';
          $descripcion= 'Se elimino un medicamento  ';
          bitacora($codigoObjeto, $accion,$descripcion);
          exit;
      }else{
          echo "<script>
          alert('¡Error al eliminar la apariencia tiene relacion con otras tablas !');
          window.location = 'crudAparienciaFisica';
          </script>";
          exit;
        } 
        }catch(PDOException $e){
              echo $e->getMessage(); 
              return false;
                      } 
 
} // fin if 
?>