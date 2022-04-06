<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
 <?php

  //session_start();
  include_once 'conexion3.php';
  include_once 'conexion.php';
  include_once 'conexion2.php';
?>
<?php
//FUNCIONES DEL CRUD ,AGREGAR,EDITAR Y ELIMINAR UN ROL
    if(isset($_POST['nombremodalidad'])){
       try{
          if(isset($_POST['agregarmodalidad'])){
               $tipo_modalidad = ($_POST['nombremodalidad']);
               $descripcion = ($_POST['descripcionmodalidad']);
               $fechaActual = date('Y-m-d');
               $usuario =$_SESSION['vario'];   
              try{ 
                  $consulta_modalidad = $db->prepare("SELECT TIPO FROM tbl_MODALIDAD WHERE TIPO = (?);");
                  $consulta_modalidad->execute(array($tipo_modalidad));
                  $row=$consulta_modalidad->fetchColumn();
                  if($row>0){
                    echo "<script>
                    alert('La modalidad  $tipo_modalidad ya se encuentra registrada');
                    window.location = 'crudmodalidad';
                    </script>";
                  exit;
                  }else{
                    try{
                      $query_modalidad = " INSERT INTO tbl_modalidad( TIPO, DESCRIPCION) VALUES ('$tipo_modalidad','$descripcion'); ";
                      $resul=$conn->query($query_modalidad);
                      if($resul >0){
                        echo "<script> 
                        window.location = 'crudmodalidad';
                        </script>";
                        exit;
                        include_once 'function_bitacora.php';
                        $codigoObjeto=19;
                        $accion='Registro';
                        $descripcion= 'Se agrego una nueva  modalidad ';
                         bitacora($codigoObjeto, $accion,$descripcion);
                      }else{
                        echo "<script> 
                        alert('Error auxilio!');
                        window.location = 'crudmodalidad';
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
  if(isset($_POST['id_editar'])){
    if(isset($_POST['editar'])){
      $codigo_modalidad = ($_POST['id_editar']);
      $editar_modalidad = ($_POST['editar_modalidad']);
      $editar_descripcion = ($_POST['editar_descripcion1']);
      $fecha_modificacion = date('Y-m-d'); 
      $user=$_SESSION['vario'];

      try{
       // 
       $sentencia = $db->prepare("SELECT * FROM tbl_modalidad where TIPO = (?) and CODIGO_MODALIDA <> (?) ;");
       $sentencia->execute(array($editar_modalidad,$codigo_modalidad));
       $row=$sentencia->fetchColumn();
        if($row>0){
          echo "<script>
          alert('Ya existe la modalidad: $editar_modalidad');
          window.location = 'crudmodalidad';
          </script>";
          exit;
        }else{
          try{
            $sql = " UPDATE tbl_modalidad SET TIPO = '$editar_modalidad' ,DESCRIPCION = '$editar_descripcion'
            WHERE CODIGO_MODALIDA = '$codigo_modalidad' ";
            $consulta=$conn->query($sql);
            if ($consulta>0){
              echo '<script>
              
              window.location = "crudmodalidad";
              </script>';
              include_once 'function_bitacora.php';
              $codigoObjeto=19;
              $accion='Modificacion';
              $descripcion= 'Se edito la modalidad';
              bitacora($codigoObjeto, $accion,$descripcion);
              exit;
            }else{
              echo "<script>
              alert('¡Error al  intentar modificar la modalidad!');
              window.location = 'crudmodalidad';
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

//PARTE PARA ELIMINAR UNA MODALIDAD
if(isset($_POST['eliminar'])){
  if(isset($_POST['ELIMINAR_MODALIDAD'])){
    $codigo = ($_POST['eliminar']);//asigna a una variable el id de la pregunta a  eliminar
    try{
        $relacion_tablas =  $db->prepare("SELECT ca.CODIGO_CARGA, ca.CODIGO_MODALIDAD from  tbl_carga_academica ca  ,tbl_modalidad m
        where m.CODIGO_MODALIDA  = ca.CODIGO_MODALIDAD  and m.CODIGO_MODALIDA   = (?);");
      $relacion_tablas->execute(array($codigo));
      $row = $relacion_tablas->fetchColumn();
      if($row >0){
        echo "<script>
        alert('¡No se puede eliminar esta, relacionado con otras tablas!');
        window.location = 'crudmodalidad';
        </script>";
        exit;
      }else{
        try{
          $link = mysqli_connect("localhost", "root", "", "db_proyecto_Prosecar");
          mysqli_query($link, "DELETE FROM tbl_modalidad WHERE  CODIGO_MODALIDA = '$codigo' ");
          if(mysqli_affected_rows($link)>0){
            echo "<script>
            window.location = 'crudmodalidad';
            </script>";
            include_once 'function_bitacora.php';
            $codigoObjeto=19;
            $accion='Modificacion';
            $descripcion= 'Se elimino una modalidad ';
            bitacora($codigoObjeto, $accion,$descripcion);
            exit;
          }else{
            echo "<script>
            alert('¡Error al eliminar la modalidad!');
            window.location = 'crudmodalidad';
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


//*****Elaborado por Diana Rut,no quiten creditos :v, modificado por Gissela Diaz *******
?>