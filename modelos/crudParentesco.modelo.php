<!-- -----------------------------------------------------------------------
        Universidad Nacional Autonoma de Honduras (UNAH)
	            	Facultad de Ciencias Economicas
          Departamento de Informatica administrativa
         Analisis, Programacion y Evaluacion de Sistemas
                   Segundo Periodo 2022

  Equipo:
  Arnold Alexander Caballero Garcia (aacaballero@unah.hn)
  Luz Maria Montoya Medina (luz.montoya@unah.hn)
  Diana Rut Garcia Amador (drgarciaa@unah.hn)
  Any Melissa Hernandez (anyhernandez@unah.hn)
  Gissela Yamileth Diaz (gdiaza@unah.hn)
  Cesar Fernando Rovelo (Cesar.rovelo@unah.hn)

  Catedratico:
  Lic. Claudia Nuñez (Analisis)
  Lic. Giancarlo Martini Scalici Aguilar (Implementación)
  Lic. Karla Melisa Garcia Pineda (Evaluación)
---------------------------------------------------------------------
    Programa:          Mantenimiento de secciones
    Fecha:             09-Junio-2022
    Programador:        Ya no esta en el eqipo
    descripcion:       Edita,elimina y registra una seccion
-----------------------------------------------------------------------
  Historial de Cambio
-----------------------------------------------------------------------
    Programador           Fecha                      Descripcion
Diana Rut Garcia     		10-06-2022                Cambio en las consultas de editar y elminar,se arrglo para que se pudieran hacer
                                                   estas acciones correctamente,ya que la persona que lo hizo lo hizo malo y no funcionaban 
----------------------------------------------------------------------->
 <?php
 // session_start();
  include_once 'conexion3.php';
  include_once 'conexion.php';
  include_once 'conexion2.php';
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
                  $consulta_nom = $db->prepare("SELECT COUNT(*) FROM tbl_parentesco WHERE NOMBRE = (?);");
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
                        alert('Se registro el parentesco correctamente');
                        window.location = 'crudParentesco';
                        </script>";
                        //<!--llamada de la fuction bitacora -->
                        $codigoObjeto=44;
                        $accion='INSERCIÓN';
                        $descripcion= 'SE REGISTRO UN PARENTESCO';
                        bitacora($codigoObjeto, $accion,$descripcion);
                        exit;
                      }else{
                        echo "<script> 
                        alert('Ocurrio algun error');
                        window.location = 'crudParentesco';
                        </script>";
                        
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


//ELIMINAR UN PARÁMETRO 
if(isset($_POST['paren_eliminar'])){

  if(isset($_POST['ELIMINARPAREN'])){
    $code = ($_POST['paren_eliminar']);//asigna a una variable el id del estado a eliminar
    try{
      $relacion_tablas =  $db->prepare("SELECT fe.CODIGO_PARENTESCO, fe.CODIGO_FAMILIAR
      FROM tbl_parentesco p, tbl_familiares_estudiante fe
      WHERE p.CODIGO_PARENTESCO = fe.CODIGO_PARENTESCO and p.CODIGO_PARENTESCO = (?)");
      $relacion_tablas->execute(array($code));
      $row = $relacion_tablas->fetchColumn();
      if($row >0){
        echo "<script>
        alert('¡No se puede eliminar este parantesco,esta relacionado con otras tablas!');
        window.location = 'crudParentesco';
        </script>";
      }else{
        try{
          $link = mysqli_connect("localhost", "root", "", "db_proyecto_Prosecar");
          mysqli_query($link, "DELETE FROM tbl_parentesco WHERE  CODIGO_PARENTESCO = '$code';");
          if(mysqli_affected_rows($link)>0){
            echo "<script>
            alert('¡Registro eliminado exitosamente!');
            window.location = 'crudParentesco';
            </script>";
            //<!--llamada de la fuction bitacora -->
            $codigoObjeto=44;
            $accion='ELIMINACIÓN';
            $descripcion= 'SE ELIMINO UN PARENTESCO';
            bitacora($codigoObjeto, $accion,$descripcion);
            exit;
          }else{
            echo "<script>
            window.location = 'crudParentesco';
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
}//Cierre del if 

?>
<?php
if(isset($_POST['codigo_parentesco'])){
  if(isset($_POST['PARENTESCOEDITAR'])){
    $parentesco_editar = ($_POST['editar_parentesco']);
    $codigo_editar = ($_POST['codigo_parentesco']);
    try{
      $consulta_datos = $db->prepare("SELECT COUNT(*) FROM tbl_parentesco where NOMBRE = (?) and CODIGO_PARENTESCO <> (?) ;");
      $consulta_datos->execute(array($parentesco_editar,$codigo_editar));
      $fila=$consulta_datos->fetchColumn();
      if($fila>0){
         echo "<script>
          alert('Ya existe un parentesco con el mismo nombre:$parentesco_editar');
          window.location = 'crudParentesco';
          </script>";
      }else{
        try{
          $sql = "UPDATE tbl_parentesco 
          SET NOMBRE = '$parentesco_editar'
          WHERE CODIGO_PARENTESCO = '$codigo_editar'";
          $consulta=$conn->query($sql);
          if($consulta>0){
            echo "<script>
            alert('Se modifico el parentesco correctamente');
            window.location = 'crudParentesco';
            </script>";
            include_once 'function_bitacora.php';
            $codigoObjeto=44; //<!--llamada de la fuction bitacora -->
            $accion='MODIFICACIÓN';
            $descripcion= 'SE MODIFICO UN PARENTESCO';
            bitacora($codigoObjeto, $accion,$descripcion);
            exit;
          }else{
            echo "<script>
            alert('Ocurrio algun error');
            window.location = 'crudParentesco';
            </script>";
            exit;
          }
        }catch(PDOException $e){
         echo $e->getMessage(); 
         return false;
        }
      }//fin else
    }catch(PDOException $e){
     echo $e->getMessage(); 
     return false;
    }
  }
}
?>