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
     if(isset($_POST['agregar_patologia'])){
          $agregar_tipo = ($_POST['agregar_tipo']);
        
             
         try{ 
             $consulta_estado = $db->prepare("SELECT TIPO FROM tbl_transtornos_corporales WHERE TIPO = (?);");
             $consulta_estado->execute(array($agregar_tipo));
             $row=$consulta_estado->fetchColumn();
             if($row>0){
               echo "<script>
               alert('El nombre del estado $agregar_tipo ya se encuentra registrado');
               window.location = 'crudTranstornos';
               </script>";
             exit;
             }else{
               try{
                 $query_estado = " INSERT INTO `tbl_transtornos_corporales`(`TIPO`) VALUES ('$agregar_tipo'); ";
                 $resul=$conn->query($query_estado);
                 if($resul >0){
                   echo "<script> 
               
                   window.location = 'crudTranstornos';
                   </script>";
                   exit;
                 }else{
                   echo "<script> 
                   alert('Error auxilio!');
                   window.location = 'crudTranstornos';
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
}//FIN DEL IF DE REGISTAR UN TRANSTORNO

  //PARTE PARA EDITAR UN TRANSTORNO
  if(isset($_POST['EDITARNOPATOLOGIA'])){
    if(isset($_POST['editar_nopatologia'])){
      $codigo_nopatologia = ($_POST['EDITARNOPATOLOGIA']);
      $editar_tipo = ($_POST['editar_tipo']);

    
       // 
          try{
            $sql = "UPDATE tbl_transtornos_corporales SET TIPO = '$editar_tipo'
                  WHERE CODIGO_TRANSTORNO = '$codigo_nopatologia'; ";
            $consulta=$conn->query($sql);
            if ($consulta>0){
              echo '<script>
             
              window.location = "crudTranstornos";
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
              window.location = 'crudTranstornos';
              </script>";
            }
          }catch(PDOException $e){
          echo $e->getMessage(); 
          return false;
          }//fin del try catch
      }
  }//cierre del if principal

  //PARTE PARA ELIMINAR UN TRANTORNO
if(isset($_POST['transtorno_eliminar'])){
  if(isset($_POST['ELIMINAR_TRANSTORNO'])){
    $code = ($_POST['transtorno_eliminar']);//asigna a una variable el id del estado a eliminar
    try{
      $relacion_tablas =  $db->prepare("SELECT CODIGO_TRANSTORNO, TIPO
      FROM tbl_transtornos_corporales;");
      $relacion_tablas->execute(array($code));
      $row = $relacion_tablas->fetchColumn();
      if($row >0){
        echo "<script>
        alert('Transtorno se encuentra en función, no se puede eliminar!');
        window.location = 'crudTranstornos';
        </script>";
        exit;
      }else{
        try{
          $link = mysqli_connect("localhost", "root", "", "db_proyecto_Prosecar");
          mysqli_query($link, "DELETE FROM tbl_transtornos_corporales WHERE  CODIGO_TRANSTORNO = '$code' ");
          if(mysqli_affected_rows($link)>0){
            echo "<script>
            window.location = 'crudTranstornos';
            </script>";
            include_once 'function_bitacora.php';
            $codigoObjeto=1;
            $accion='Modificacion';
            $descripcion= 'Se elimino un Trantorno ';
            bitacora($codigoObjeto, $accion,$descripcion);
            exit;
          }else{
            echo "<script>
            alert('¡Error al eliminar el Transtorno!');
            window.location = 'crudTranstornos';
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
//*****Elaborado por Carlos Amador ,no quiten creditos :v *******
?>