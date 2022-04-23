<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
 <?php

  //session_start();
  include_once 'conexion3.php';
  include_once 'conexion.php';
  include_once 'conexion2.php';
?>
<?php
//FUNCIONES DEL CRUD ,AGREGAR,EDITAR Y ELIMINAR UN ROL
if(isset($_POST['apariencia'])){
  try{
     if(isset($_POST['nuevo'])){
          $nombre_apariencia= ($_POST['apariencia']);
          $fechaActual = date('Y-m-d');
          $usuario =$_SESSION['vario'];    
              try{ 
                  $consulta_modalidad = $db->prepare("SELECT TIPO FROM tbl_apariencia_fisica WHERE TIPO = (?);");
                  $consulta_modalidad->execute(array($nombre_apariencia));
                  $row=$consulta_modalidad->fetchColumn();
                  if($row>0){
                    echo "<script>
                    alert('El nombre $nombre_apariencia ya se encuentra registrado');
                    window.location = 'crudAparienciaFisica';
                    </script>";
                  exit;
                  }else{
                    try{
                      $query_modalidad = " INSERT INTO tbl_apariencia_fisica (TIPO) VALUES ('$nombre_apariencia' ); ";
                      $resul=$conn->query($query_modalidad);
                      if($resul >0){
                        echo "<script> 
                        window.location = 'crudAparienciaFisica';
                        </script>";
                        exit;
                        include_once 'function_bitacora.php';
                        $codigoObjeto=19;
                        $accion='Registro';
                        $descripcion= 'Se agrego una apariencia ';
                         bitacora($codigoObjeto, $accion,$descripcion);
                      }else{
                        echo "<script> 
                        alert('Error !');
                        window.location = 'crudAparienciaFisica';
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
  if(isset($_POST['id_apariencia'])){
    if(isset($_POST['editaapariencia'])){
      $codigo_examen = ($_POST['id_apariencia']);
      $editar_examen = ($_POST['editar_apariencia']);
      $fecha_modificacion = date('Y-m-d'); 
      $user=$_SESSION['vario'];

      try{
       // 
       $sentencia = $db->prepare("SELECT * FROM tbl_apariencia_fisica where TIPO = (?) and CODIGO_APARIENCIA <> (?) ;");
       $sentencia->execute(array($editar_examen,$codigo_examen));
       $row=$sentencia->fetchColumn();
        if($row>0){
          echo "<script>
          alert('Ya existe la apariencia: $editar_examen');
          window.location = 'crudAparienciaFisica';
          </script>";
          exit;
        }else{
          try{
            $sql = " UPDATE tbl_apariencia_fisica SET TIPO = '$editar_examen'
            WHERE CODIGO_APARIENCIA = '$codigo_examen' ";
            $consulta=$conn->query($sql);
            if ($consulta>0){
              echo '<script>
              
              window.location = "crudAparienciaFisica";
              </script>';
              include_once 'function_bitacora.php';
              $codigoObjeto=19;
              $accion='Modificacion';
              $descripcion= 'Se edito una apariencia';
              bitacora($codigoObjeto, $accion,$descripcion);
              exit;
            }else{
              echo "<script>
              alert('¡Error al  intentar modificar la apariencia!');
              window.location = 'crudAparienciaFisica';
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


 
 if (isset($_POST['eliminar_medica']) && isset($_POST['eliminar_medicamento'])){
  $codigo =($_POST['eliminar_medicamento']);
      try {
          $link = mysqli_connect("localhost", "root", "", "db_proyecto_Prosecar");
          mysqli_query($link, "DELETE FROM tbl_apariencia_fisica WHERE CODIGO_APARIENCIA  = '$codigo' ");
          if(mysqli_affected_rows($link)>0){
            echo "<script>
          alert('Apariencia eliminada!');
          window.location = 'crudAparienciaFisica';
          </script>";
          include_once 'function_bitacora.php';
          $codigoObjeto=25; //cmabiar 
          $accion='Eliminación';
          $descripcion= 'Se elimino una apriencia ';
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