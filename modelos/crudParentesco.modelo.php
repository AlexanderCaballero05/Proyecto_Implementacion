
 <?php
 // session_start();
  include_once 'conexion3.php';
  include_once 'conexion.php';
  include_once 'conexion2.php';
  include_once "modelos/Conexionpdo.php";
  include_once 'function_bitacora.php';
  
?>
<?php
//FUNCIONES DEL CRUD ,AGREGAR,EDITAR Y ELIMINAR PARENTESCO


//AGREGAR/REGISTRAR 
    if(isset($_POST['parentesco'])){
        
       try{
          if(isset($_POST['agregar_paren'])){
               $nombre_paren = ($_POST['parentesco']);  
              try{ 
                  $consulta_nom = $db->prepare("SELECT NOMBRE FROM tbl_parentesco WHERE NOMBRE = (?);");
                  $consulta_nom->execute(array($nombre_paren));
                  $row=$consulta_nom->fetchColumn();
                  if($row>0){
                    echo "<script>
                    alert('El nombre de parentesco de $nombre_paren ya se encuentra registrado');
                    window.location = 'crudParentesco';
                    </script>";
                  exit;
                  }else{
                    try{
                      $query_paren= " INSERT INTO `tbl_parentesco`( `NOMBRE` ) VALUES ('$nombre_paren'); ";
                      $resul=$conn->query($query_paren);
                      if($resul >0){
                        echo "<script> 
                       
                        window.location = 'crudParentesco';
                        </script>";
                        

                        //<!--llamada de la fuction bitacora -->
                        $codigoObjeto=3;
                        $accion='Insertar parentesco';
                        $descripcion= 'Agregó/insertó un nuevo parentesco';
                        bitacora($codigoObjeto, $accion,$descripcion);

                      }else{
                        echo "<script> 
                        
                        window.location = 'crudParentesco';
                        </script>";
                        
                        //<!--llamada de la fuction bitacora -->
                        $codigoObjeto=3;
                        $accion='Registro fallido de parámetro';
                        $descripcion= 'Se intentó insertar un nuevo parámetro';
                        bitacora($codigoObjeto, $accion,$descripcion);
                      }
                    }catch(PDOException $e){
                    echo $e->getMessage(); 
                    return false;
                    }
                  }//fin del else de si no existe el nombre del parametro
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



  //EDITAR  
  if(isset($_POST['id_parentes'])){
    //session_start();
    $usuario=$_SESSION['vario']; //variable que trae el usuario que está logeado

    if(isset($_POST['Edit_parentesco'])){
      $codigo_paren = ($_POST['id_parentes']);
      $editar_nombrep = ($_POST['Edit_paren']);
      try{
       //   
       $sentencia = $db->prepare("SELECT * FROM tbl_parentesco where NOMBRE = (?) and CODIGO_PARENTESCO <> (?) ;");
       $sentencia->execute(array($editar_nombrep ,$codigo_paren));
       $row=$sentencia->fetchColumn();
         
            $sql = " UPDATE tbl_parentesco 
            SET NOMBRE = '$editar_nombrep',
            WHERE CODIGO_PARENTESCO = '$codigo_paren' ";
            $consulta=$conn->query($sql);
            if ($consulta>0){
              echo "<script>
              alert('¡Ese registro de parentesco ya existe!')
              window.location = 'crudParentesco';
              </script>";
              
              //<!--llamada de la fuction bitacora -->
              $codigoObjeto=3;
              $accion='Editar parantesco';
              $descripcion= 'Se editó el registro de un parantesco ya existente';
              bitacora($codigoObjeto, $accion,$descripcion);
            }else{
              echo "<script>
              
              window.location = 'crudParentesco';
              </script>";

              //<!--llamada de la fuction bitacora -->
              $codigoObjeto=3;
              $accion='Editar parantesco fallido';
              $descripcion= 'Se intentó editar el registro de un parantesco ya existente';
              bitacora($codigoObjeto, $accion,$descripcion);
            }

      }catch(PDOException $e){
        echo $e->getMessage(); 
        return false;
       }
    }
  }

//ELIMINAR UN PARÁMETRO 
if(isset($_POST['paren_eliminar'])){

  if(isset($_POST['ELIMINARPAREN'])){
    $code = ($_POST['paren_eliminar']);//asigna a una variable el id del estado a eliminar
    try{
      $relacion_tablas =  $db->prepare("SELECT p.CODIGO_PARENTESCO, fe.CODIGO_FAM_EST
      FROM tbl_parentesco p, tbl_familiares_estudiante fe
      WHERE p.CODIGO_PARENTESCO = fe.CODIGO_PARENTESCO and p.CODIGO_PARENTESCO = (?);");
      $relacion_tablas->execute(array($code));
      $row = $relacion_tablas->fetchColumn();
      if($row >0){
        echo "<script>
        alert('¡No se puede eliminar este parantesco,esta relacionado con otras tablas!');
        window.location = 'crudParentesco';
        </script>";
        
        //<!--llamada de la fuction bitacora -->
        $codigoObjeto=3;
        $accion='No eliminar parantesco';
        $descripcion= 'Intento de invalido de eliminar parantesco';
        bitacora($codigoObjeto, $accion,$descripcion); 

      }else{
        try{
          $link = mysqli_connect("localhost", "root", "", "db_proyecto_Prosecar");
          mysqli_query($link, "DELETE FROM tbl_parentesco WHERE  CODIGO_PARENTESCO = '$code' ");
          if(mysqli_affected_rows($link)>0){
            echo "<script>
            
            window.location = 'crudParentesco';
            </script>";

            //<!--llamada de la fuction bitacora -->
            $codigoObjeto=3;
            $accion='Eliminar parantesco';
            $descripcion= 'Se eliminó un registro de parentesco';
            bitacora($codigoObjeto, $accion,$descripcion);
            exit;
          }else{
            echo "<script>
           
            window.location = 'crudParentesco';
            </script>";
            exit;

            //<!--llamada de la fuction bitacora -->
            $codigoObjeto=3;
            $accion='Eliminar parentesco fallido';
            $descripcion= 'Falló eliminar el registro de parentesco';
            bitacora($codigoObjeto, $accion,$descripcion);
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