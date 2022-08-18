<?php
  
  include_once 'conexion3.php';
  include_once 'conexion.php';
  include_once 'conexion2.php';
  
?>
<?php
//FUNCIONES DEL CRUD ,AGREGAR,EDITAR Y ELIMINAR AREA
    if(isset($_POST['nombre_area'])){
      $usuario=$_SESSION['vario']; //variable que trae el usuario que está logeado
       try{
          if(isset($_POST['agregar_area'])){
               $nombre_area = ($_POST['nombre_area']);
               $descripcion = ($_POST['descripcion_area']);
               $fechaActual = date('Y-m-d'); 
            
              try{ 
                  $consulta_estado = $db->prepare("SELECT COUNT(*) FROM tbl_area WHERE NOMBRE = (?);");
                  $consulta_estado->execute(array($nombre_area));
                  $row=$consulta_estado->fetchColumn();
                  if($row>0){
                    echo "<script>
                    alert('El área $nombre_area ya se encuentra registrada');
                    window.location = 'area';
                    </script>";
                  exit;
                  }else{
                    try{
                      $query_area = " INSERT INTO `tbl_area`( `NOMBRE`, `DESCRIPCION`, `FECHA_CREACION`, `CREADO_POR_USUARIO`,`CODIGO_ESTADO`) VALUES ('$nombre_area','$descripcion','$fechaActual','$usuario','2'); ";
                      $resul=$conn->query($query_area);
                      if($resul >0){
                        echo "<script> 
                        window.location = 'area';
                        </script>";
                       
                        exit;
                      }else{
                        echo "<script> 
                        alert('Error!');
                        window.location = 'area';
                        </script>";
                        exit;
                      }
                    }catch(PDOException $e){
                    echo $e->getMessage(); 
                    return false;
                    }
                  }//fin del else de si no existe el nombre del area
              }catch(PDOException $e){
              echo $e->getMessage(); 
              return false;
              }
            }//fin del if de verificar si hay datos

       }catch(PDOException $e){
        echo $e->getMessage(); 
        return false;
       }
    }//FIN DEL IF DE REGISTAR UNA AREA



  //PARTE PARA EDITAR UNA AREA
  if(isset($_POST['id_area'])){
    $usuario=$_SESSION['vario']; //variable que trae el usuario que está logeado
    if(isset($_POST['editar_area'])){
      $codigo_area = ($_POST['id_area']);
      $editar_nombre = ($_POST['editar_nombre']);
      $editar_descripcion = ($_POST['editar_descripcion']);
      $estado = ($_POST['ESTADOUSUARIO']);
      
      try{
       // 
       $sentencia = $db->prepare("SELECT COUNT(*) FROM tbl_area where NOMBRE = (?) and CODIGO_AREA <> (?) ;");
       $sentencia->execute(array($editar_nombre,$codigo_area));
       $row=$sentencia->fetchColumn();
       $fechaActual = date('Y-m-d'); 
        if($row>0){
          echo "<script>
          alert('Ya existe una área con este mismo nombre: $editar_nombre');
          window.location = 'area';
          </script>";
          exit;

        }else{
         
          try{
            $sql = " UPDATE tbl_area 
            SET NOMBRE = '$editar_nombre' ,
            DESCRIPCION = '$editar_descripcion', 
            FECHA_MODIFICACION = '$fechaActual',
            CODIGO_ESTADO = '$estado',
            MODIFICADO_POR = '$usuario'
            WHERE CODIGO_AREA = '$codigo_area' ";
            $consulta=$conn->query($sql);
            if ($consulta>0){
              echo "<script>
              window.location = 'area';
              </script>";
             
            }else{
              echo "<script>
              alert('¡Error al intentar modificar la area!');
              window.location = 'area';
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

//PARTE PARA ELIMINAR UNA AREA
if(isset($_POST['area_eli'])){
  if(isset($_POST['ELIMINAR_AREA'])){
    $code = ($_POST['area_eli']);//asigna a una variable el id del estado a eliminar
    try{
      $link = mysqli_connect("localhost", "root", "", "db_proyecto_Prosecar");
      mysqli_query($link, "DELETE FROM tbl_area WHERE  CODIGO_AREA = $code");
      if(mysqli_affected_rows($link)>0){
        echo "<script>
        window.location = 'area';
        </script>";
         //<!--llamada de la fuction bitacora -->
        
        exit;
      }else{
        echo "<script>
        alert('¡Error al eliminar la area!');
        window.location = 'area';
        </script>";
         //<!--llamada de la fuction bitacora --> 
        exit;
      }
    }catch(PDOException $e){
      echo $e->getMessage(); 
      return false;
    }
  }
}