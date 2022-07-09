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

    Programa:          Archivo que valida los cambios e insersiones de permisos a los objetos o pantallas del sistema
    Fecha:             04-Marzo-2022
    Programador:       Arnold Caballero 
    descripcion:       Valida agregar a los roles de usuario permisos sobre objetos o modulos del sistema

-----------------------------------------------------------------------
                      Historial de Cambio
-----------------------------------------------------------------------

    Programador               Fecha                      Descripcion
    Arnold Caballero     		07-06-2022                 cambio en presentar mensaje de confirmacion  al guardar
.

----------------------------------------------------------------------->


<?php
  include_once "modelos/conexion.php";
  include_once "modelos/Conexionpdo.php";
?>

<?php 
if(isset($_POST['PERUSUARIO'])){
    $usuario=$_SESSION['vario'];
    
    try{
        $evaluar_usuario = $db->prepare("SELECT CODIGO_TIPO_ROL 
                                        FROM tbl_usuario 
                                        WHERE NOMBRE_USUARIO = (?);");
        $evaluar_usuario->execute(array($usuario));
        $row=$evaluar_usuario->fetchColumn();

        if($row>0){
            $usuarimo = $row;
        }

          if(isset($_POST['guardarpermisos'])){
            $perusuario = ($_POST['PERUSUARIO']);
            $modusuario = ($_POST['MODUSUARIO']);
            $insertar = ($_POST['INSERTAR']);
            $eliminar = ($_POST['ELIMINAR']);
            $actualizar = ($_POST['ACTUALIZAR']);
            $mostrar = ($_POST['MOSTRAR']);
            $fechaActual = date('Y-m-d');

              try{//evaluo si ya existe un registro con permisos para el Rol de usuario en el modulo
                  $permisos_usuarios = $db->prepare("CALL Sp_existen_permisos_asignados(?,?);");
                    $permisos_usuarios->execute(array($perusuario, $modusuario));
                    $row1=$permisos_usuarios->fetchColumn();
                    $dato=$row1;
                    if ($dato>0){
                        echo "<script>
                            alert('El tipo de usuario que ingreso ya tiene permisos asignados sobre este modulo');
                            window.location = 'crudPermisos';
                            </script>";
                    }else{
                          try{

                              $sql= "INSERT INTO tbl_permisos (CODIGO_TIPO_ROL, CODIGO_OBJETO, INSERTAR, ELIMINAR, ACTUALIZAR, MOSTRAR,  FECHA_CREACION, MODIFICADO_POR, FECHA_MODIFICACION)
                                                       VALUES ('$perusuario','$modusuario','$insertar','$eliminar','$actualizar','$mostrar','$fechaActual','','');";
                              $consulta=$conn->query($sql); 
                              if ($consulta>0) {
                                 echo "<script>
                                 alert('¡El Permiso ha sido asignado correctamente!');
                                window.location = 'crudPermisos';
                                 </script>";
                                 include_once 'function_bitacora.php';
                                 $codigoObjeto=5;
                                 $accion='INSERCIÓN';
                                 $descripcion= 'SE REGISTRO UN PERMISO SOBRE UN ROL';
                                  bitacora($codigoObjeto, $accion,$descripcion);
                                  exit;
                                 }else{
                                   
                                 echo "<script>
                                alert('Error al crear registro');
                                window.location = 'crudPermisos';
                                 </script>";
                                }

                              return true;

                          } catch(PDOException $e){

                            echo $e->getMessage();  
                            return false;

                        }


                    }
                    return true;

            } catch(PDOException $e){
                echo $e->getMessage();
                return false;

                }

            
        }

    }catch(PDOException $e) {
    
        echo $e->getMessage();
        return false;
        }

}

//FINAL DE LA VALIDACION PARA INSERTAR PERMISOS
?>

<?php
 include_once "modelos/conexion.php";
 include_once "modelos/Conexionpdo.php";
?>
 
<?php
//Inicio de validacion para modificar permisos

if(isset($_POST['EDITIPO'])){//Evaluo al tipo de usuario
  session_start();
  $usuario=$_SESSION['vario'];
      try{
        $evaluar_usuario = $db->prepare("SELECT CODIGO_TIPO_ROL 
        FROM tbl_usuario 
        WHERE NOMBRE_USUARIO = (?);");
        $evaluar_usuario->execute(array($usuario));
        $row1=$evaluar_usuario->fetchColumn();

          if($row1 > 0){
              $usuariomo = $row1;
         }  //Traigo los valores del formulario del modal modificar por el metodo POST
              if(isset($_POST['editarPermiso'])){
                $codigoTipo = ($_POST['EDITIPO']);
                $codigoObjeto = ($_POST['EDIOBJETO']);
                $insertar = ($_POST['ediInsertar']);
                $eliminar = ($_POST['ediEliminar']);
                $actualizar = ($_POST['ediActualizar']);
                $mostrar = ($_POST['ediMostrar']);
                $fechaActual = date('Y-m-d');

                  try{
                      $modificarPermisos ="UPDATE tbl_permisos
                                            SET INSERTAR ='$insertar',
                                                ELIMINAR ='$eliminar',
                                                ACTUALIZAR='$actualizar',
                                                MOSTRAR ='$mostrar',
                                                MODIFICADO_POR='$$usuariomo',
                                                FECHA_MODIFICACION='$fechaActual'
                                                WHERE CODIGO_TIPO_ROL = '$codigoTipo'
                                                AND   CODIGO_OBJETO = '$codigoObjeto'";
                      $consulta=$conn->query($modificarPermisos);

                      if ($consulta>0) {
                        echo "<script>
                        alert('Permiso actualizado');
                       window.location = 'crudPermisos';
                          </script>";

                        include_once 'function_bitacora.php';
                                 $codigoObjeto=5;
                                 $accion='MODIFICACIÓN';
                                 $descripcion= 'SE MODIFICO UN PERMISO A UN ROL';
                                  bitacora($codigoObjeto, $accion,$descripcion);
                                  exit;
                        }else{
                        echo "<script>
                       alert('Error al actualizar el registro');
                       window.location = 'crudPermisos';
                        </script>";
                       }





                      return true;
                 }catch (PDOException $e){
                    echo $e->getMessage();
                    return false;

                 }
           }

        return true;
  } catch (PDOException $e){
      echo $e->getMessage();
      return false;
    }

}
//Final de la validacion para modificar permisos
?>

<?php
 include_once "modelos/conexion.php";
 include_once "modelos/Conexionpdo.php";
?>

<?php
if(isset($_POST['ELIMINAR_PERMISO'])){
  if(isset($_POST['ELIMINAR_PERMISO'])){
    $code = ($_POST['ELIMINAR_PERMISO']);//asigna a una variable el id del estado a eliminar
    $code1 = ($_POST['ELIMINAR_ROL']);
    $code2 = ($_POST['ELIMINAR_OBJETO']);
     
      
        try{
          
          $ELIMINAR_PERMISO = "DELETE CODIGO_PERMISO,CODIGO_TIPO_ROL,CODIGO_OBJETO FROM tbl_permisos
           WHERE  CODIGO_PERMISO = '$code'
           AND CODIGO_TIPO_ROL = '$code1'
           AND CODIGO_OBJETO = '$code2' ";
            $consulta = $conn->query($ELIMINAR_PERMISO);

          if($consulta > 0){
            echo "<script>
            alert('¡Permiso eliminado!');
            window.location = 'crudPermisos';
            </script>";
            include_once 'function_bitacora.php';
                                 $codigoObjeto=5;
                                 $accion='ELIMINACIÓN';
                                 $descripcion= 'SE ELIMINO UN PERMISO A UN ROL';
                                  bitacora($codigoObjeto, $accion,$descripcion);
                                  exit;
          }else{
            echo "<script>
            alert('¡Error al eliminar el rol!');
            window.location = 'crudPermisos';
            </script>";
            exit;
          }
        }catch(PDOException $e){
        echo $e->getMessage(); 
        return false;
       }
      }
    
    }



?>