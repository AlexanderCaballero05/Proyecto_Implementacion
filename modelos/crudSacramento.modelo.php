<!-- ---------------------------------------------------------------------
ELABORADO POR Diana Rut
	Universidad Nacional Autonoma de Honduras (UNAH)
	  	Facultad de Ciencias Economicas
	Departamento de Informatica administrativa
     Analisis, Programacion y Evaluacion de Sistemas
             Segundo periodo 2022
Catedratico:
Lic. Karla Melisa Garcia Pineda  --Evaluacion
Lic Giancarlo Scalichi -- Implementacion de sistemas
Clauidia Nuñez -- Analisis y diseño
---------------------------------------------------------------------
Programa:          Codigo de mantenimiento de sacramentos
Fecha:             01-jan-2016
Programador:       Diana Rut Garcia
descripcion:       Codigo del manteniento de sacramentos,edita ,elimina y agrega
-----------------------------------------------------------------------
Historial de Cambio
-----------------------------------------------------------------------
Programador               Fecha                      Descripcion
Diana Rut               09/06/2022            Se modifico los mensajes de bitacora
----------------------------------------------------------------------->
 <?php
  include_once 'conexion3.php';
  include_once 'conexion.php';
  include_once 'conexion2.php';
?>
<?php
//FUNCIONES DEL CRUD ,AGREGAR,EDITAR Y ELIMINAR UN SACRAMENTO
    if(isset($_POST['nombre_sacramento'])){
       try{
          if(isset($_POST['agregar_sacramento'])){
               $nombre_sacramento = ($_POST['nombre_sacramento']);
               $descripcion = ($_POST['descripcion_sacramento']);  
              try{ 
                  $consulta_sacramento = $db->prepare("SELECT NOMBRE FROM tbl_sacramento WHERE NOMBRE = (?);");
                  $consulta_sacramento->execute(array($nombre_sacramento));
                  $row=$consulta_sacramento->fetchColumn();
                  if($row>0){
                    echo "<script>
                    alert('El nombre del sacramento $nombre_sacramento ya se encuentra registrado');
                    window.location = 'crudSacramentos';
                    </script>";
                  exit;
                  }else{
                    try{
                      $nombre_sacramento = " INSERT INTO tbl_sacramento( NOMBRE, DESCRIPCION) VALUES ('$nombre_sacramento','$descripcion'); ";
                      $resul=$conn->query($nombre_sacramento);
                      if($resul >0){
                        echo "<script> 
                        window.location = 'crudSacramentos';
                        </script>";
                        include_once 'function_bitacora.php';
                        $codigoObjeto=45;
                        $accion='INSERCIÓN';
                        $descripcion= 'SE REGISTRO UN SACRAMENTO';
                         bitacora($codigoObjeto, $accion,$descripcion);
                         exit;
                      }else{
                        echo "<script> 
                        alert('Error auxilio!');
                        window.location = 'crudSacramentos';
                        </script>";
                        exit;
                      }
                    }catch(PDOException $e){
                    echo $e->getMessage(); 
                    return false;
                    }
                  }//fin del else de si no existe el nombre del sacramento
              }catch(PDOException $e){
              echo $e->getMessage(); 
              return false;
              }
            }//fin del if de verificar si hay datos

       }catch(PDOException $e){
        echo $e->getMessage(); 
        return false;
       }
    }//FIN DEL IF DE REGISTAR UN sacramento

  //PARTE PARA EDITAR UN sacramento
  if(isset($_POST['id_sacramento'])){
    if(isset($_POST['editar_sacramento'])){
      $codigo_sacramento = ($_POST['id_sacramento']);
      $editar_nombre = ($_POST['editar_nombre']);
      $editar_descripcion = ($_POST['editar_descripcion']);
      try{
       $sentencia = $db->prepare("SELECT * FROM tbl_sacramento where NOMBRE = (?) and CODIGO_SACRAMENTO <> (?) ;");
       $sentencia->execute(array($editar_nombre,$codigo_sacramento));
       $row=$sentencia->fetchColumn();
        if($row>0){
          echo "<script>
          alert('Ya existe un sacramento con este mismo nombre: $editar_nombre');
          window.location = 'crudSacramentos';
          </script>";
          exit;
        }else{
          try{
            $sql = " UPDATE tbl_sacramento SET NOMBRE = '$editar_nombre' ,DESCRIPCION = '$editar_descripcion'
            WHERE CODIGO_SACRAMENTO = '$codigo_sacramento' ";
            $consulta=$conn->query($sql);
            if ($consulta>0){
              echo '<script>              
              window.location = "crudSacramentos";
              </script>';
              include_once 'function_bitacora.php';
              $codigoObjeto=45;
              $accion='MODIFICACIÓN';
              $descripcion= 'SE MODIFICO UN SACRAMENTO';
              bitacora($codigoObjeto, $accion,$descripcion);
              exit;
            }else{
              echo "<script>
              alert('¡Error al  intentar modificar el sacramento,comuniquese con el Admin!');
              window.location = 'crudSacramentos';
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
  }

//PARTE PARA ELIMINAR UN sacramento
if(isset($_POST['sacramento_eliminar'])){
  if(isset($_POST['ELIMINAR_SACRAMENTO'])){
    $code = ($_POST['sacramento_eliminar']);//asigna a una variable el id del estado a eliminar
    try{
      $relacion_tablas =  $db->prepare("SELECT s.CODIGO_SACRAMENTO from  tbl_sacramento s ,tbl_sacramento_persona r
      where r.CODIGO_SACRAMENTO  = s.CODIGO_SACRAMENTO  and r.CODIGO_SACRAMENTO  = (?);");
      $relacion_tablas->execute(array($code));
      $row = $relacion_tablas->fetchColumn();
      if($row >0){
        echo "<script>
        alert('¡No se puede eliminar este sacramento,esta relacionado con otro registro!');
        window.location = 'crudSacramentos';
        </script>";
        exit;
      }else{
        try{
          $link = mysqli_connect("localhost", "root", "", "db_proyecto_Prosecar");
          mysqli_query($link, "DELETE FROM tbl_sacramento WHERE  CODIGO_SACRAMENTO = '$code' ");
          if(mysqli_affected_rows($link)>0){
            echo "<script>
            alert('¡Sacramento eliminado!');
            window.location = 'crudSacramentos';
            </script>";
            include_once 'function_bitacora.php';
            $codigoObjeto=45;
            $accion='ELIMINACIÓN';
            $descripcion= 'SE ELIMINO UN SACRAMENTO';
            bitacora($codigoObjeto, $accion,$descripcion);
            exit;
          }else{
            echo "<script>
            alert('¡Error al eliminar el sacramento,comuniquese con el admin!');
            window.location = 'crudSacramentos';
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

