
 <?php
 // session_start();
  include_once 'conexion3.php';
  include_once 'conexion.php';
  include_once 'conexion2.php';
  include_once "modelos/Conexionpdo.php";
  include_once 'function_bitacora.php';
  
?>
<?php
//FUNCIONES DEL CRUD ,AGREGAR,EDITAR Y ELIMINAR 


//AGREGAR/REGISTRAR 
    if(isset($_POST['prueba'])){
       session_start();
        $usuario = $_SESSION['vario']; //variable que trae el usuario que está logeado
       try{
          if(isset($_POST['agregar_pruebap'])){
               $nombre_prueba = ($_POST['prueba']);
               $descripcionp = ($_POST['descripcionPrueba']);
               $fechaActual = date('Y-m-d');   
              try{ 
                  $consulta_nom = $db->prepare("SELECT NOMBRE FROM tbl_prueba_psicometrica WHERE NOMBRE = (?);");
                  $consulta_nom->execute(array($nombre_prueba));
                  $row=$consulta_nom->fetchColumn();
                  if($row>0){
                    echo "<script>
                    alert('El nombre de la prueba $nombre_prueba ya se encuentra registrado');
                    window.location = 'crudPruebapsicometrica';
                    </script>";
                  exit;
                  }else{
                    try{
                      $query_prueba = " INSERT INTO `tbl_prueba_psicometrica`( `NOMBRE`, `DESCRIPCION`, `CREADO_POR_USUARIO`,  `FECHA_CREACION` ) VALUES ('$nombre_prueba','$descripcionp','$usuario','$fechaActual' ); ";
                      $resul=$conn->query($query_prueba);
                      if($resul >0){
                        echo "<script> 
                        alert('La Prueba Psicométrica se ha registrado correctamente');
                        window.location = 'crudPruebapsicometrica';
                        </script>";
                        

                        

                      }else{
                        echo "<script> 
                        alert('Error!');
                        window.location = 'crudPruebapsicometrica';
                        </script>";
                        
                        
                      }
                    }catch(PDOException $e){
                    echo $e->getMessage(); 
                    return false;
                    }
                  }//fin del else de si no existe el nombre de la prueba
              }catch(PDOException $e){
              echo $e->getMessage(); 
              return false;
              }
            }//fin del if de verificar si hay datos

       }catch(PDOException $e){
        echo $e->getMessage(); 
        return false;
       }
    }//FIN DEL IF DE REGISTAR 



  //EDITAR UN PRUEBA 
  if(isset($_POST['cod_edit_prue'])){

    $usuario=$_SESSION['vario']; //variable que trae el usuario que está logeado

    if(isset($_POST['edit_nombre'])){
      $codigo_prueba = ($_POST['cod_edit_prue']);
      $editar_nom = ($_POST['edit_nombre']);
      $editar_desc = ($_POST['edit_descripcion']);
      $fechaActual = date('Y-m-d');
      try{
       //   
       $sentencia = $db->prepare("SELECT * FROM tbl_prueba_psicometrica  where NOMBRE = (?) and DESCRIPCION = (?) and CODIGO_PRUEBA <> (?) ;");
       $sentencia->execute(array($editar_nom, $editar_desc ,$codigo_prueba));
       $row=$sentencia->fetchColumn();
         
            $sql = " UPDATE tbl_prueba_psicometrica 
            SET NOMBRE = '$editar_nom',
                DESCRIPCION = '$editar_desc',
                MODIFICADO_POR = '$usuario',
                FECHA_MODIFICACION = '$fechaActual'
            WHERE CODIGO_PRUEBA = '$codigo_prueba' ";
            $consulta=$conn->query($sql);
            if ($consulta>0){
              echo "<script>
              alert('¡Prueba psicométrica modificada exitosamente!');
              window.location = 'crudPruebapsicometrica';
              </script>";
              
             
            }else{
              echo "<script>
              alert('¡Error al  intentar modificar esta prueba psicométrica!');
              window.location = 'crudPruebapsicometrica';
              </script>";

              
            }

      }catch(PDOException $e){
        echo $e->getMessage(); 
        return false;
       }
    }
  }

//ELIMINAR  
if(isset($_POST['eliminar_pruebap'])){

    $usuario=$_SESSION['vario']; //variable que trae el usuario que está logeado

  if(isset($_POST['eliminar_pruebapsi'])){
    $code = ($_POST['eliminar_pruebap']);//asigna a una variable el id del estado a eliminar
    try{
      $relacion_tablas =  $db->prepare("SELECT a.CODIGO_PRUEBA, a.CODIGO_PRUEBA_ESTUDIANTE
       from tbl_prueba_psicometrica_paciente a ,tbl_prueba_psicometrica p 
       where p.CODIGO_PRUEBA = a.CODIGO_PRUEBA and p.CODIGO_PRUEBA = (?);;");
      $relacion_tablas->execute(array($code));
      $row = $relacion_tablas->fetchColumn();
      if($row >0){
        echo "<script>
        alert('¡No se puede eliminar esta prueba,esta relacionado con otras tablas!');
        window.location = 'crudPruebapsicometrica';
        </script>";
        
       
      }else{
        try{
          $link = mysqli_connect("localhost", "root", "", "db_proyecto_Prosecar");
          mysqli_query($link, "DELETE FROM tbl_prueba_psicometrica WHERE  CODIGO_PRUEBA = '$code' ");
          if(mysqli_affected_rows($link)>0){
            echo "<script>
            alert('¡Prueba Psicométrica eliminada!');
            window.location = 'crudPruebapsicometrica';
            </script>";

            //<!--llamada de la fuction bitacora -->
          
            exit;
          }else{
            echo "<script>
            alert('¡Error al eliminar el prueba psicométrica!');
            window.location = 'crudPruebapsicometrica';
            </script>";
            exit;

            //<!--llamada de la fuction bitacora -->
           
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
}//Cierre del if 


?>