<!-- 
-----------------------------------------------------------------------
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
    Programa:          codigo que realiza el mantemiento de roles del lado del backend
    Fecha:             04-Abril-2022
    Programador:       Diana Rut Garic
    descripcion:       Realiza las tres gestiones del mantenimiento del rol ,del lado del backend
-----------------------------------------------------------------------
 Historial de Cambio
-----------------------------------------------------------------------
Programador               Fecha                      Descripcion
Diana Rut Garica     		05-06-2022               Cambio en la consultas
----------------------------------------------------------------------->
 <?php
  include_once 'conexion3.php';
  include_once 'conexion.php';
  include_once 'conexion2.php';
?>
<?php
    if(isset($_POST['nombre_rol'])){
       try{
          if(isset($_POST['agregar_rol'])){
               $nombre_rol = ($_POST['nombre_rol']);
               $descripcion = ($_POST['descripcion_rol']);
               $fechaActual = date('Y-m-d');
               $usuario =$_SESSION['vario'];   
              try{ 
                  $consulta_rol = $db->prepare("SELECT COUNT(*) FROM tbl_roles WHERE NOMBRE = ?");
                  $consulta_rol->execute(array($nombre_rol));
                  $row=$consulta_rol->fetchColumn();
                  if($row>0){
                    echo "<script>
                    alert('El rol $nombre_rol ya se encuentra registrado');
                    window.location = 'crudRoles';
                    </script>";
                  exit;
                  }else{
                    try{
                      $query_rol = " INSERT INTO tbl_roles( NOMBRE, DESCRIPCION, FECHA_CREACION,CREADO_POR_USUARIO) VALUES ('$nombre_rol','$descripcion','$fechaActual','$usuario'); ";
                      $resul=$conn->query($query_rol);
                      if($resul >0){
                        echo "<script> 
                        alert('Rol registrado correctamente');
                        window.location = 'crudRoles';
                        </script>";
                        exit;
                        include_once 'function_bitacora.php';
                        $codigoObjeto=2;
                        $accion='Registro';
                        $descripcion= 'Se agrego un nuevo rol ';
                         bitacora($codigoObjeto, $accion,$descripcion);
                      }else{
                        echo "<script> 
                        alert('Error auxilio');
                        window.location = 'crudRoles';
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
    }

//*******************CODIGO PARA EDITAR UN ROLL******************
  if(isset($_POST['id_rol'])){
    if(isset($_POST['editar_rol'])){
      $codigo_rol = ($_POST['id_rol']);
      $editar_nombre = ($_POST['editar_nombre']);
      $editar_descripcion = ($_POST['editar_descripcion']);
      $fecha_modificacion = date('Y-m-d'); 
      $user=$_SESSION['vario'];
      try{
       // consulta para saber si el rol ya existe y otra cosa :v
       $sentencia = $db->prepare("SELECT * FROM tbl_roles where NOMBRE = ? and CODIGO_TIPO_ROL <> (?) ;");
       $sentencia->execute(array($editar_nombre,$codigo_rol));
       $row=$sentencia->fetchColumn();
        if($row>0){
          echo "<script>
          alert('Ya existe un rol con este mismo nombre: $editar_nombre');
          window.location = 'crudRoles';
          </script>";
          exit;
        }else{
          try{
            $sql = " UPDATE tbl_roles SET NOMBRE = '$editar_nombre' ,DESCRIPCION = '$editar_descripcion',FECHA_MODIFICACION = '$fecha_modificacion', MODIFICADO_POR = '$user'
            WHERE CODIGO_TIPO_ROL = '$codigo_rol' ";
            $consulta=$conn->query($sql);
            if ($consulta>0){
              echo '<script>              
              window.location = "crudRoles";
              </script>';
              include_once 'function_bitacora.php';
              $codigoObjeto=2;
              $accion='Modificacion';
              $descripcion= 'Se edito un rol ';
              bitacora($codigoObjeto, $accion,$descripcion);
              exit;
            }else{
              echo "<script>
              alert('¡Error al  intentar modificar el rol!');
              window.location = 'crudRoles';
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

//**********CODIGO PARA ELIMINAR UN ROL****************
if(isset($_POST['rol_eliminar'])){
  if(isset($_POST['ELIMINAR_ROL'])){
    $code = ($_POST['rol_eliminar']);//asigna a una variable el id del estado a eliminar
    try{
      $relacion_tablas =  $db->prepare("SELECT COUNT(*) from  tbl_usuario  u ,tbl_roles r
      where r.CODIGO_TIPO_ROL  = u.CODIGO_TIPO_ROL  and r.CODIGO_TIPO_ROL  = (?);");
      $relacion_tablas->execute(array($code));
      $row = $relacion_tablas->fetchColumn();
      if($row >0){
        echo "<script>
        alert('¡No se puede eliminar este rol,tien relación con otras tablas!');
        window.location = 'crudRoles';
        </script>";
        exit;
      }else{
        try{
          $link = mysqli_connect("localhost", "root", "", "db_proyecto_Prosecar");
          mysqli_query($link, "DELETE FROM tbl_roles WHERE  CODIGO_TIPO_ROL = '$code' ");
          if(mysqli_affected_rows($link)>0){
            echo "<script>
            window.location = 'crudRoles';
            </script>";
            include_once 'function_bitacora.php';
            $codigoObjeto=2;
            $accion='Eliminación';
            $descripcion= 'Se elimino un rol ';
            bitacora($codigoObjeto, $accion,$descripcion);
            exit;
          }else{
            echo "<script>
            alert('¡Error al eliminar el rol!');
            window.location = 'crudRoles';
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
}
?>