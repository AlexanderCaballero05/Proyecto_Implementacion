<?php 
 include_once "conexion3.php";
 include_once "conexion.php";
?>
<!--validacion para cambio de contraseña-->
<?php
  if(isset($_POST['cambioContrasena'])) {
    $nomUser= $_SESSION['vario'];
    $contraActual=crypt($_POST['contraAnte'],'$2a$07$usesomesillystringforsalt$');//desincrepta la contraseña
    
          $consultar_usuario = $db->prepare("SELECT * FROM tbl_usuario
          WHERE NOMBRE_USUARIO = (?)
          AND CONTRASENA ='$contraActual'"); 
            $consultar_usuario->execute(array($nomUser));
            $row=$consultar_usuario->fetchColumn();
              if($row>0){
                $mostrarUser = $row;
                if(isset($_POST['cambioContrasena'])){
                  $contraNueva =($_POST['clave_nueva']);
                        $contraConfirm =($_POST['confirmar_clave']);
                        $expre = " /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]/ ";
                        if($contraNueva<>$contraConfirm){
                          echo "<script>
                          alert('Las contraseña no son iguales'); location.href = 'perfilUsuario'; </script>";
                        }else{
                          if(preg_match($expre,$contraNueva)){
                            $pass=crypt($contraNueva,'$2a$07$usesomesillystringforsalt$');
                                $sentencia ="SELECT * FROM tbl_usuario WHERE CONTRASENA = '$pass' AND CODIGO_USUARIO = '$mostrarUser';";
                                $datos=$conn->query($sentencia);
                                $row=$datos->num_rows;
                                if($row>0){ //si la contraseña es la misma que tiene en el sistema
                                    echo "<script> alert('!Utilice una contraseña que no haya usado anteriormente')
                                    location.href = 'perfilUsuario';
                                    </script>";
                                }else{
                                    $buscarclave = "SELECT * FROM tbl_ms_hist_contrasena  WHERE  CODIGO_USUARIO = '$mostrarUser'  AND CONTRASENA = '$pass';";
                                    $busqueda=$conn->query($buscarclave);
                                    $fila=$busqueda->num_rows;
                                    if($fila>0){
                                      echo "<script> alert('!Utilice una contraseña que no haya usado anteriormente')
                                      location.href = 'perfilUsuario';</script>";
                                    }else{
                                      $insert = "INSERT INTO tbl_ms_hist_contrasena (CODIGO_USUARIO,CONTRASENA,CREADO_POR_USUARIO)
                                      VALUES ('$mostrarUser','$pass','$mostrarUser')";
                                      $resultado=$conn->query($insert);
                                      if($resultado>0){
                                        //actualiza la tabla de tbl_usuario el campo de la contraseña el campo de modificado por
                                        $update = "UPDATE tbl_usuario u SET u.CONTRASENA = '$pass' WHERE u.NOMBRE_USUARIO ='$nomUser'";
                                        $resul=$conn->query($update);
                                        if($resul >0){
                                           echo "<script> 
                                           alert('!Se ha actulizado la contraseña¡');  location.href = 'perfilUsuario'; </script>";
                                        }
                                      }else{
                                        echo "<script> 
                                        alert('!Error al ingresar los datos¡');
                                        location.href = 'perfilUsuario'; </script>";
                                        exit;
                                      }                         
                                    }
                                    echo "<script> alert('!cambio de contraseña correcto')
                                    location.href = 'perfilUsuario'; </script>";
                                }
                              }else{
                                echo "<script> alert('La contraseña no cumple con los requisitos')
                                location.href = 'perfilUsuario'; </script>";
                              }
                        }
                }//fin del if de ver si esta lleno el boton de cambiar contraseña
            }else{
              echo "<script>
              alert('Error nombre de usuario y contraseña incorrectos');
              location.href = 'perfilUsuario';</script>";
            }
    }
?>
<!-- final de validacion para cambio de contraseña-->

<!--validacion para cambio de datos personales de usuario-->
<?php
include_once "conexion3.php";
include_once "conexion.php";

if(isset($_POST['ACTUALIZAR'])){
    $codigo_persona = $_POST['codigoPersona'];
    $p_nombre = $_POST['p_nombre'];
    $s_nombre = $_POST['s_nombre'];
    $p_apellido = $_POST['p_apellido'];
    $s_apellido = $_POST['s_apellido'];
    $dni = $_POST['DNI'];
    $correo = $_POST['correo'];
    $telefono =$_POST['telefono'];
    $direccion= $_POST['direccion'];

    //consulta para la table persona
    $update_perfil = "UPDATE tbl_persona 
     SET PRIMER_NOMBRE = '$p_nombre' ,
     SEGUNDO_NOMBRE = '$s_nombre' ,
     PRIMER_APELLIDO = '$p_apellido' ,
     SEGUNDO_APELLIDO = '$s_apellido' ,
     DNI = '$dni',
     DIRECCION = '$direccion'
    WHERE CODIGO_PERSONA = '$codigo_persona'; ";
    $resultado11=$conn->query($update_perfil);
    //consulta para la table correo
     $update_correo = "UPDATE tbl_correo_electronico
     SET CORREO_PERSONA = '$correo' 
     WHERE CODIGO_PERSONA = '$codigo_persona'; ";
    $resulta=$conn->query($update_correo);

    //consulta para la table telefono
     $update_telefono = "UPDATE tbl_telefono
     SET NUMERO_TELEFONO = '$telefono' 
     WHERE CODIGO_PERSONA = '$codigo_persona'; ";
    $resultatel=$conn->query($update_telefono);

    if($resultado11 > 0 && $resulta > 0 && $resultatel > 0){
      echo "<script> window.location = 'perfilUsuario'; </script>";
    }else{
      echo "<script>
      alert('!Actualizacion fallida!'); window.location = 'perfilUsuario'; </script>";
    }
}
?>

<?php
//Codigo para actualizar la foto de perfil :3
if(isset($_POST['ACTUALIZAR_FOTO'])){
    $cod = $_POST['codigo'];
    $imagen = addslashes(file_get_contents($_FILES['foto']['tmp_name']));// convierte la imagen en algo que se pueda trbajar 
    $quer ="UPDATE tbl_usuario SET imagen ='$imagen' WHERE CODIGO_PERSONA = '$cod'; ";
    $resul=$conn->query($quer);
    if($resul){//si todo fue bien al actualizar :)
      echo "<script>window.location = 'perfilUsuario';</script>";
    }else{//en caso que algo esta mal :c
      echo "<script> alert('Ocurrio un problema al tratar de actualizar la foto de perfil');window.location = 'perfilUsuario';</script>";
    }
}
?>
<!--final de validacion para cambio de datos personales de usuario-->
