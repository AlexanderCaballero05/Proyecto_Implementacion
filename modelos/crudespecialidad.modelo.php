<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
 <?php

  //session_start();
  include_once 'conexion3.php';
  include_once 'conexion.php';
  include_once 'conexion2.php';
?>
<?php
//FUNCIONES DEL CRUD ,AGREGAR,EDITAR Y ELIMINAR UN ROL
if(isset($_POST['nombre_especialidad'])){
  try{
     if(isset($_POST['nueva_espe'])){
          $nombre_especialidad = ($_POST['nombre_especialidad']);
          $descripcion_especialidad = ($_POST['descripcion_especialidad']);
          $nombre = ($_POST['nombre_area']);
          $area = ($_POST['codigo_area']);
          $fechaActual = date('Y-m-d');
          $usuario =$_SESSION['vario'];    
              try{ 
                  $consulta_modalidad = $db->prepare("SELECT NOMBRE_ESPECIALIDAD FROM tbl_especialidad WHERE NOMBRE_ESPECIALIDAD = (?);");
                  $consulta_modalidad->execute(array($nombre_especialidad));
                  $row=$consulta_modalidad->fetchColumn();
                  if($row>0){
                    echo "<script>
                    alert('La modalidad  $nombre_especialidad ya se encuentra registrada');
                    window.location = 'crudespecialidad';
                    </script>";
                  exit;
                  }else{
                    try{
                      $query_modalidad = " INSERT INTO tbl_especialidad( NOMBRE_ESPECIALIDAD,DESCRIPCION,CODIGO_AREA,NOMBRE) VALUES ('$nombre_especialidad','$descripcion_especialidad', '$area', '$nombre' ); ";
                      $resul=$conn->query($query_modalidad);
                      if($resul >0){
                        echo "<script> 
                        alert('especialidad registrada correctamente');
                        window.location = 'crudespecialidad';
                        </script>";
                        exit;
                        include_once 'function_bitacora.php';
                        $codigoObjeto=19;
                        $accion='Registro';
                        $descripcion= 'Se agrego una nueva  especialidad ';
                         bitacora($codigoObjeto, $accion,$descripcion);
                      }else{
                        echo "<script> 
                        alert('Error auxilio!');
                        window.location = 'crudespecialidad';
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
  if(isset($_POST['id_especialidad'])){
    if(isset($_POST['editare'])){
      $codigo_especialidad = ($_POST['id_especialidad']);
      $editar_nombre = ($_POST['editar_nombre']);
      $editar_area = ($_POST['editar_area']);
      $editar_especialidad = ($_POST['editar_especialidad']);
      $editar_descripcion = ($_POST['editar_descripcion']);
      $fecha_modificacion = date('Y-m-d'); 
      $user=$_SESSION['vario'];

      try{
       // 
       $sentencia = $db->prepare("SELECT * FROM tbl_especialidad where NOMBRE_ESPECIALIDAD = (?) and CODIGO_ESPECIALIDAD <> (?) ;");
       $sentencia->execute(array($editar_especialidad,$codigo_especialidad));
       $row=$sentencia->fetchColumn();
        if($row>0){
          echo "<script>
          alert('Ya existe la especialidad: $editar_especialidad');
          window.location = 'crudespecialidad';
          </script>";
          exit;
        }else{
          try{
            $sql = " UPDATE tbl_especialidad SET NOMBRE_ESPECIALIDAD = '$editar_especialidad', NOMBRE = '$editar_nombre',CODIGO_AREA = '$editar_area',DESCRIPCION = '$editar_descripcion'
            WHERE CODIGO_ESPECIALIDAD = '$codigo_especialidad' ";
            $consulta=$conn->query($sql);
            if ($consulta>0){
              echo '<script>
              alert("especialidad actualizada,exitosamente");
              
              window.location = "crudespecialidad";
              </script>';
              include_once 'function_bitacora.php';
              $codigoObjeto=19;
              $accion='Modificacion';
              $descripcion= 'Se edito la modalidad';
              bitacora($codigoObjeto, $accion,$descripcion);
              exit;
            }else{
              echo "<script>
              alert('¡Error al  intentar modificar la especialidad!');
              window.location = 'crudespecialidad';
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
if(isset($_POST['eliminar'])){
  if(isset($_POST['ELIMINAR_ESPECIALIDAD'])){
    $codigo = ($_POST['eliminar']);//asigna a una variable el id de la pregunta a  eliminar
    try{
        $relacion_tablas =  $db->prepare("SELECT a.CODIGO_AREA, e.CODIGO_ESPECIALIDAD from  tbl_area a  ,tbl_especialidad e
        where e.CODIGO_AREA = a.CODIGO_AREA  and e.CODIGO_ESPECIALIDAD   = (?);");
      $relacion_tablas =  $db->prepare("SELECT CODIGO_ESPECIALIDAD  from  tbl_ESPECIALIDAD where CODIGO_ESPECIALIDAD = (?);");
      $relacion_tablas->execute(array($codigo));
      $row = $relacion_tablas->fetchColumn();
      if($row >0){
        echo "<script>
        alert('¡No se puede eliminar esta, relacionado con otras tablas!');
        window.location = 'crudespecialidad';
        </script>";
        exit;
      }else{
        try{
          $link = mysqli_connect("localhost", "root", "", "db_proyecto_Prosecar");
          mysqli_query($link, "DELETE FROM tbl_especialidad WHERE  CODIGO_ESPECIALIDAD = '$codigo' ");
          if(mysqli_affected_rows($link)>0){
            echo "<script>
            alert('¡especialidad eliminada!');
            window.location = 'crudespecialidad';
            </script>";
            include_once 'function_bitacora.php';
            $codigoObjeto=19;
            $accion='Modificacion';
            $descripcion= 'Se elimino una especialidad';
            bitacora($codigoObjeto, $accion,$descripcion);
            exit;
          }else{
            echo "<script>
            alert('¡Error al eliminar la especialidad!');
            window.location = 'crudespecialidad';
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


//*****Elaborado por Diana Rut,no quiten creditos :v, modificado por yonatan *******
?>