
 <?php
 // session_start();
  include_once 'conexion3.php';
  include_once 'conexion.php';
  include_once 'conexion2.php';
  include_once "Conexionpdo.php";
  
?>
<?php
//FUNCIONES DEL CRUD 



//AGREGAR/REGISTRAR UN PARENTESCO
    if(isset($_POST['EstudianteParentesco'])){
        //session_start();
       try{
          if(isset($_POST['familiar_parentesco'])){
               $familiar_parentesco = ($_POST['FamiliarParentesco']);
               $EstudianteParentesco = ($_POST['EstudianteParentesco']);
               $Parentesco = ($_POST['parentesco']);

              try{ 
                  $consulta_nom = $db->prepare("SELECT CODIGO_FAMILIAR 
                                                  FROM tbl_familiares_estudiante 
                                                  WHERE CODIGO_FAMILIAR = (?);");
                  $consulta_nom->execute(array($familiar_parentesco));
                  $row=$consulta_nom->fetchColumn();
                  if($row>0){
                    echo "<script>
                    alert('el familiar ya se encuentra relacionado');
=
                    window.location = 'crudFamiliaresEstudiantes';
                    </script>";
                  exit;
                  }else{
                    try{

                      $query_param = "INSERT INTO `tbl_familiares_estudiante` (`CODIGO_ESTUDIANTE`, `CODIGO_FAMILIAR`, `CODIGO_PARENTESCO`) 
                      VALUES ('$EstudianteParentesco', '$familiar_parentesco', '$Parentesco');";

                      $resul=$conn->query($query_param);
                      if($resul >0){
                        echo "<script> 
                       
                        window.location = 'crudFamiliaresEstudiantes';
                        </script>";
                        

                        //<!--llamada de la fuction bitacora -->
    

                      }else{
                        echo "<script> 
                        alert'error'

                        window.location = 'crudFamiliaresEstudiantes';
                        </script>";
                        
                        //<!--llamada de la fuction bitacora -->

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
  if(isset($_POST['id_param'])){
    
    if(isset($_POST['Edit_parametro'])){
      $codigo_param = ($_POST['id_param']);
      $editar_valor = ($_POST['Edit_valor']);
      $fechaActual = date('Y-m-d');
      try{
       //   
       $sentencia = $db->prepare("SELECT * FROM tbl_parametros where PARAMETRO = (?) and CODIGO_PARAMETRO <> (?) ;");
       $sentencia->execute(array($editar_valor ,$codigo_param));
       $row=$sentencia->fetchColumn();
         
            $sql = " UPDATE tbl_parametros 
            SET VALOR = '$editar_valor',
                MODIFICADO_POR = '$usuario',
                FECHA_MODIFICACION = '$fechaActual'
            WHERE CODIGO_PARAMETRO = '$codigo_param' ";
            $consulta=$conn->query($sql);
            if ($consulta>0){
              echo "<script>
              
              window.location = 'crudFamiliaresEstudiantes';
              </script>";
              
              //<!--llamada de la fuction bitacora -->
              $codigoObjeto=3;
              $accion='Editar parámetro';
              $descripcion= 'Se editó el registro de un parámetro ya existente';
              bitacora($codigoObjeto, $accion,$descripcion);
            }else{
              echo "<script>
              
              window.location = 'crudFamiliaresEstudiantes';
              </script>";

              //<!--llamada de la fuction bitacora -->
              $codigoObjeto=3;
              $accion='Editar parámetro fallido';
              $descripcion= 'Se intentó editar el registro de un parámetro ya existente';
              bitacora($codigoObjeto, $accion,$descripcion);
            }

      }catch(PDOException $e){
        echo $e->getMessage(); 
        return false;
       }
    }
  }

//ELIMINAR  
if(isset($_POST['param_eliminar'])){
    //session_start();
    $usuario=$_SESSION['vario']; //variable que trae el usuario que está logeado

  if(isset($_POST['ELIMINARPARAM'])){
    $code = ($_POST['param_eliminar']);//asigna a una variable el id del estado a eliminar
    try{
      $relacion_tablas =  $db->prepare("SELECT a.CODIGO_PARAMETRO, a.CODIGO_PARAM_USUARIO
       from tbl_parametros_usuarios a ,tbl_parametros p 
       where p.CODIGO_PARAMETRO = a.CODIGO_PARAMETRO and p.CODIGO_PARAMETRO = (?);;");
      $relacion_tablas->execute(array($code));
      $row = $relacion_tablas->fetchColumn();
      if($row >0){
        echo "<script>
        alert('¡No se puede eliminar este parámetro,esta relacionado con otras tablas!');
        window.location = 'crudFamiliaresEstudiantes';
        </script>";
        
        //<!--llamada de la fuction bitacora -->
        $codigoObjeto=3;
        $accion='No eliminar parámetro';
        $descripcion= 'Intento de invalido de eliminar parametro';
        bitacora($codigoObjeto, $accion,$descripcion); 

      }else{
        try{
          $link = mysqli_connect("localhost", "root", "", "db_proyecto_Prosecar");
          mysqli_query($link, "DELETE FROM tbl_parametros WHERE  CODIGO_PARAMETRO = '$code' ");
          if(mysqli_affected_rows($link)>0){
            echo "<script>
            
            window.location = 'crudFamiliaresEstudiantes';
            </script>";

            //<!--llamada de la fuction bitacora -->
            $codigoObjeto=3;
            $accion='Eliminar parámetro';
            $descripcion= 'Se eliminó un registro de parámetro';
            bitacora($codigoObjeto, $accion,$descripcion);
            exit;
          }else{
            echo "<script>
           
            window.location = 'crudFamiliaresEstudiantes';
            </script>";
            exit;

            //<!--llamada de la fuction bitacora -->
            $codigoObjeto=3;
            $accion='Eliminar parámetro fallido';
            $descripcion= 'Falló eliminar el registro de parámetro';
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