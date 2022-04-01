<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
 <?php

  //session_start();
  include_once 'conexion3.php';
  include_once 'conexion.php';
  include_once 'conexion2.php';
?>
<?php

//FUNCIONES DEL CRUD ,AGREGAR,EDITAR Y ELIMINAR UN ESTADO
if(isset($_POST['agregar_tipo'])){
  try{
     if(isset($_POST['agregar_nopatologia'])){
          $agregar_tipo = ($_POST['agregar_tipo']);
          $descripcion = ($_POST['agregar_descripcion']);
             
         try{ 
             $consulta_estado = $db->prepare("SELECT TIPO FROM tbl_no_patologias WHERE TIPO = (?);");
             $consulta_estado->execute(array($agregar_tipo));
             $row=$consulta_estado->fetchColumn();
             if($row>0){
               echo "<script>
               alert('El nombre del estado $agregar_tipo_ ya se encuentra registrado');
               window.location = 'crudNoPatologia';
               </script>";
             exit;
             }else{
               try{
                 $query_estado = " INSERT INTO `tbl_no_patologias`( `TIPO`, `DESCRIPCION`) VALUES ('$agregar_tipo','$descripcion'); ";
                 $resul=$conn->query($query_estado);
                 if($resul >0){
                   echo "<script> 
                   alert('registrado correctamente');
                   window.location = 'crudNoPatologia';
                   </script>";
                   exit;
                 }else{
                   echo "<script> 
                   alert('Error auxilio!');
                   window.location = 'crudNoPatologia';
                   </script>";
                   exit;
                 }
               }catch(PDOException $e){
               echo $e->getMessage(); 
               return false;
               }
             }//fin del else de si no existe el nombre del estado
         }catch(PDOException $e){
         echo $e->getMessage(); 
         return false;
         }
       }//fin del if de verificar si hay datos

  }catch(PDOException $e){
   echo $e->getMessage(); 
   return false;
  }
}//FIN DEL IF DE REGISTAR UN ESTADO

  //PARTE PARA EDITAR UNA PERSONA PATOLOGIA
  if(isset($_POST['EDITARNOPATOLOGIA'])){
    if(isset($_POST['edit_nopatologia'])){
      $codigo_nopatologia = ($_POST['EDITARNOPATOLOGIA']);
      $editar_tipo = ($_POST['editar_tipo']);
      $editar_descripcion = ($_POST['editar_descripcion']);
    
       // 
          try{
            $sql = "UPDATE tbl_no_patologias SET TIPO = '$editar_tipo',
                                                DESCRIPCION = '$editar_descripcion'
                                                WHERE CODIGO_NO_PATOLOGIA = '$codigo_nopatologia'; ";
            $consulta=$conn->query($sql);
            if ($consulta>0){
              echo '<script>
              alert("Actualizacion Exitosa");
              window.location = "crudNoPatologia";
              </script>';
              include_once 'function_bitacora.php';
              $codigoObjeto=2;
              $accion='Modificacion';
              $descripcion= 'Se edito un registro ';
              bitacora($codigoObjeto, $accion,$descripcion);
              exit;
            }else{
              echo "<script>
              alert('¡Error al  intentar modificar el registro!');
              window.location = 'crudNoPatologia';
              </script>";
            }
          }catch(PDOException $e){
          echo $e->getMessage(); 
          return false;
          }//fin del try catch
      }
  }//cierre del if principal

//PARTE PARA ELIMINAR UNA PATOLOGIA
if(isset($_POST['eliminarnopato'])){
  if(isset($_POST['eliminar_nopato'])){
    $code = ($_POST['eliminarnopato']);//asigna a una variable el id del estado a eliminar
        try{
          $link = mysqli_connect("localhost", "root", "", "db_proyecto_Prosecar");
          mysqli_query($link, "DELETE FROM tbl_no_patologias WHERE CODIGO_NO_PATOLOGIA = '$code' ");
          if(mysqli_affected_rows($link)>0){
            echo "<script>
            alert('¡Dato eliminado!');
            window.location = 'crudNoPatologia';
            </script>";
            include_once 'function_bitacora.php';
            $codigoObjeto=2;
            $accion='Eliminación';
            $descripcion= 'Se elimino un registro ';
            bitacora($codigoObjeto, $accion,$descripcion);
            exit;
          }else{
            echo "<script>
            alert('¡No puede eliminar este registro!');
            window.location = 'crudNoPatologia';
            </script>";
            exit;
          }
        }catch(PDOException $e){
        echo $e->getMessage(); 
        return false;
       }
      }
}//Cirre del if padre


//*****Elaborado por Carlos Amador ,no quiten creditos :v *******
?>