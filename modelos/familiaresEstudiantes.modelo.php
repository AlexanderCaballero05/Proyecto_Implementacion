
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
                        alert('¡Se agrego correctamente!');
                        window.location = 'crudFamiliaresEstudiantes';
                        </script>";
                        $codigoObjeto=26;
                        $accion='INSERTAR';
                        $descripcion= 'SE REGISTRO EL PARENTESCO DEL CODIGO '.$EstudianteParentesco.' DE ESTUDIANTE CON EL CODIGÓ '.$familiar_parentesco.' DE FAMILIAR ';
                        bitacora($codigoObjeto, $accion,$descripcion);
                        exit;

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



  //EDITAR familiares
  if(isset($_POST['editarEstudianteParentesco'])){
    //session_start();
   try{
      if(isset($_POST['editFamiliarParentesco'])){
           $familiar_parentesco1 = ($_POST['editFamiliarParentesco']);
           $EstudianteParentesco1 = ($_POST['editarEstudianteParentesco']);
           $Parentesco1 = ($_POST['editarparentesco']);
           $codigo_tabla = ($_POST['codigo_tabla']);


          try{ 
           
                try{

                  $query_familiar ="UPDATE  tbl_familiares_estudiante
                      SET CODIGO_ESTUDIANTE = '$EstudianteParentesco1', 
                        CODIGO_FAMILIAR = '$familiar_parentesco1',
                         CODIGO_PARENTESCO = '$Parentesco1'
                         WHERE CODIGO_FAMILIAR_ESTUDIANTE = '$codigo_tabla' ";

                  $resul=$conn->query($query_familiar);
                  if($resul >0){
                    echo "<script> 
                    alert('¡Se modificó correctamente!');
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


//ELIMINAR  
if(isset($_POST['ELIMINAR_FAMILIARES'])){
    //session_start();
    $usuario=$_SESSION['vario']; //variable que trae el usuario que está logeado

  if(isset($_POST['eliminar_familiares'])){
    $code = ($_POST['eliminar_familiares']);//asigna a una variable el id del estado a eliminar
  
    
        try{
          $link = mysqli_connect("localhost", "root", "", "db_proyecto_Prosecar");
          mysqli_query($link, "DELETE FROM tbl_familiares_estudiante WHERE  CODIGO_FAMILIAR_ESTUDIANTE = '$code' ");
          if(mysqli_affected_rows($link)>0){
            echo "<script>
            alert('¡se eliminó correctamente!');
            window.location = 'crudFamiliaresEstudiantes';
            </script>";

            
            exit;
          }else{
            echo "<script>
           
            window.location = 'crudFamiliaresEstudiantes';
            </script>";
            exit;

        
          }
        }catch(PDOException $e){
        echo $e->getMessage(); 
        return false;
       }
      }
   
  
}//Cierre del if 


?>