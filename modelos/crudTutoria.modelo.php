<?php

  include_once 'conexion3.php';
  include_once 'conexion.php';
  include_once 'conexion2.php';
?>
<?php
//FUNCIONES DEL CRUD ,AGREGAR,EDITAR Y ELIMINAR UNA TUTORIA
    if(isset($_POST['nombre_tutoria'])){
       try{
          if(isset($_POST['nueva_tutoria'])){
               $nombre_tutoria = ($_POST['nombre_tutoria']);
               $area = ($_POST['codigo_area']);
               $fechaActual = date('Y-m-d');
               $usuario =$_SESSION['vario'];    
              try{ 
                  $consulta_rol = $db->prepare("SELECT NOMBRE FROM tbl_tutoria WHERE NOMBRE = (?);");
                  $consulta_rol->execute(array($nombre_tutoria));
                  $row=$consulta_rol->fetchColumn();
                  if($row>0){
                    echo "<script>
                    alert('El nombre de la tutoria  $nombre_tutoria ya se encuentra registrado');
                    window.location = 'crudTutorias';
                    </script>";
                  exit;
                  }else{
                    try{
                      $query_rol = " INSERT INTO `tbl_tutoria`( `NOMBRE`, `CODIGO_AREA`,  `FECHA_CREACION`,CREADO_POR) VALUES ('$nombre_tutoria','$area','$fechaActual','$usuario'); ";
                      $resul=$conn->query($query_rol);
                      if($resul >0){
                        echo "<script> 
                        window.location = 'crudTutorias';
                        </script>";
                        exit;
                        include_once 'function_bitacora.php';
                        $codigoObjeto=22;
                        $accion='Registro';
                        $descripcion= 'Se agrego una nueva tutoria ';
                         bitacora($codigoObjeto, $accion,$descripcion);
                      }else{
                        echo "<script> 
                        alert('Error auxilio,ok no!');
                        window.location = 'crudTutorias';
                        </script>";
                        exit;
                      }
                    }catch(PDOException $e){
                    echo $e->getMessage(); 
                    return false;
                    }
                  }//fin del else de si no existe el nombre de la tutoria
              }catch(PDOException $e){
              echo $e->getMessage(); 
              return false;
              }
            }//fin del if de verificar si hay datos

       }catch(PDOException $e){
        echo $e->getMessage(); 
        return false;
       }
    }//FIN DEL IF DE REGISTAR UNA TUTORIA



  //PARTE PARA EDITAR UNA TUTORIA
  if(isset($_POST['id_tutoria'])){
    if(isset($_POST['editar_tutoria'])){
      $codigo_tutoria = ($_POST['id_tutoria']);
      $editar_nombre = ($_POST['editar_nombre']);
      $editar_area = ($_POST['editar_area']);
      $fecha_modificacion = date('Y-m-d'); 
      $user =$_SESSION['vario'];  
      try{
       // 
       $sentencia = $db->prepare("SELECT * FROM tbl_tutoria where NOMBRE = (?) and CODIGO_TUTORIA <> (?) ;");
       $sentencia->execute(array($editar_nombre,$codigo_tutoria));
       $row=$sentencia->fetchColumn();
        if($row>0){
          echo "<script>
          alert('Ya existe una Tutoria con este mismo nombre: $editar_nombre');
          window.location = 'crudTutorias';
          </script>";
          exit;
        }else{
          try{
            $sql = " UPDATE tbl_tutoria SET NOMBRE = '$editar_nombre' ,CODIGO_AREA = '$editar_area',FECHA_MODIFICACION = '$fecha_modificacion',MODIFICADO_POR = '$user'
            WHERE CODIGO_TUTORIA = '$codigo_tutoria' ";
            $consulta=$conn->query($sql);
            if ($consulta>0){
              echo "<script>
              window.location = 'crudTutorias';
              </script>";
              include_once 'function_bitacora.php';
              $codigoObjeto=22;
              $accion='Modificacion';
              $descripcion= 'Se edito una tutoria ';
              bitacora($codigoObjeto, $accion,$descripcion);
            }else{
              echo "<script>
              alert('¡Error al  intentar modificar la tutoria!');
              window.location = 'crudTutorias';
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

//PARTE PARA ELIMINAR UNA TUTORIA
if(isset($_POST['tutoria_eliminar'])){
  if(isset($_POST['ELIMINAR_TUTORIA'])){
    $code = ($_POST['tutoria_eliminar']);//asigna a una variable el id del estado a eliminar
    try{
      $relacion_tablas =  $db->prepare("SELECT  t.CODIGO_TUTORIA  ,t.NOMBRE from tbl_tutoria t,tbl_carga_academica c
      where  t.CODIGO_TUTORIA = c.CODIGO_TUTORIA and t.CODIGO_TUTORIA  = (?); ");
      $relacion_tablas->execute(array($code));
      $row = $relacion_tablas->fetchColumn();
      if($row >0){
        echo "<script>
        alert('¡No se puede eliminar esta tutoria,esta relacionado con otras tablas!');
        window.location = 'crudTutorias';
        </script>";
        exit;
      }else{
        try{
          $link = mysqli_connect("localhost", "root", "", "db_proyecto_Prosecar");
          mysqli_query($link, "DELETE FROM tbl_tutoria WHERE  CODIGO_TUTORIA = '$code' ");
          if(mysqli_affected_rows($link)>0){
            echo "<script>
            alert('¡Tutoria eliminada!');
            window.location = 'crudTutorias';
            </script>";
            include_once 'function_bitacora.php';
            $codigoObjeto=22;
            $accion='Eliminación';
            $descripcion= 'Se elimino una Tutoria ';
            bitacora($codigoObjeto, $accion,$descripcion);
            exit;
          }else{
            echo "<script>
            alert('¡Error al eliminar la tutoria!');
            window.location = 'crudTutorias';
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
}//Cirre del if padre


//*****Elaborado por Diana Rut *******
?>