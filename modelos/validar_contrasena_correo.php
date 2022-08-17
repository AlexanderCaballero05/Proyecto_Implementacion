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

    Programa:          Valida cambio de contraseña por correo
    Fecha:             04-Marzo-2022
    Programador:       Arnold Caballero 
    descripcion:       Valida el metodo seleccionado de recuperacion de contraseña por correo y si es por preguntas lo envia a la pantalla de ingresar la pregunta

-----------------------------------------------------------------------
                      Historial de Cambio
-----------------------------------------------------------------------

    Programador               Fecha                      Descripcion
    Arnold Caballero     		01-06-2022                 cambio de nombre de variables para la recuperacion por correo

----------------------------------------------------------------------->

<?php
 session_start();
 include_once "conexion3.php";
include_once "conexion.php";
?>
<?php
if(isset($_SESSION['vario'] )) {
    $nomUser=$_SESSION['vario'] ;
    $contraActual=crypt($_POST['contraAnte'],'$2a$07$usesomesillystringforsalt$');
    try{   
          //$sentencia_sp =$db->prepare("CALL Sp_obtener_cod_usuario(?,?);"); //llamar al procedimiento almacenado con la fucion prepare de PHP
          $consultar_usuario = $db->prepare("SELECT * FROM tbl_usuario
          WHERE NOMBRE_USUARIO= (?)
          AND CONTRASENA ='$contraActual'"); 
            $consultar_usuario->execute(array($nomUser));
            $row=$consultar_usuario->fetchColumn();
              if($row>0){
                 $mostrarUser = $row;
                    if(isset($_POST['GUARDARCONTRA'])){
                        $contraNueva =($_POST['clave_nueva']);
                        $contraConfirm =($_POST['confirmar_clave']);
                        $pass= crypt($contraNueva,'$2a$07$usesomesillystringforsalt$'); // para que pueda leer la contraseña encriptada
                        $expre = " /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]/ ";/*se le asigana expresion regular
                        que valida que la contraseña tenga minimo una letra mayuscula,minuscula,codigo especial y numeros  */
                            if($contraNueva<>$contraConfirm){
                                echo "<script>
                                alert('Las contraseña no son iguales');
                                location.href = '../Vistas/modulos/cambio_contrasena_correo.php';
                               </script>";
                             }
                            else{
                                if(preg_match($expre,$contraNueva)){
                                    //se puede mandar a laas otras validaciones
                                    try{
                                        $sentencia ="SELECT * FROM tbl_usuario WHERE CONTRASENA = '$pass' AND CODIGO_USUARIO = '$mostrarUser';";
                                        $datos=$conn->query($sentencia);
                                        $row=$datos->num_rows;
                                        if($row>0){ //si la contraseña es la misma que tiene en el sistema
                                            echo "<script> alert('!Utilice una contraseña que no haya usado anteriormente')
                                            location.href = '../Vistas/modulos/cambio_contrasena_correo.php';
                                            </script>";
                                        }
                                        else{ //si la contraseña es diferente de la que tiene en el sistema
                                            try{
                                                $buscarclave = "SELECT * FROM tbl_ms_hist_contrasena  WHERE  CODIGO_USUARIO = '$mostrarUser'  AND CONTRASENA = '$pass';";
                                                $busqueda=$conn->query($buscarclave);
                                                $fila=$busqueda->num_rows;
                                                if($fila>0){
                                                    echo "<script> alert('!Utilice una contraseña que no haya usado anteriormente')
                                                    location.href = '../Vistas/modulos/cambio_contrasena_correo.php'; </script>";
                                                }
                                                else{
                                                    try{ //insert en la tabla de historial de contraseñas la nueva contraseña por el usario
                                                        $insert = "INSERT INTO tbl_ms_hist_contrasena(CODIGO_USUARIO,CONTRASENA,CREADO_POR_USUARIO)
                                                        VALUES ('$mostrarUser','$pass','$mostrarUser')";
                                                        $resultado=$conn->query($insert);
                                                        
                                                        if($resultado>0){
                                                        //actualiza la tabla de tbl_usuario el campo de la contraseña el campo de modificado por
                                                            $update = "UPDATE tbl_usuario u
                                                            SET u.CONTRASENA = '$pass',
                                                            u.CODIGO_ESTADO = 2
                                                            WHERE u.NOMBRE_USUARIO ='$nomUser'";
                                                            $resul=$conn->query($update);
                                                            if($resul >0){//En caso que la contraseña se actualice correctamente.
                                                              echo "<script> alert('¡Cambio de contraseña correcto!') location.href = '../index.php'; </script>";
                                                              $_SESSION['vario'] =$nomUser;
                                                              $codigoObjeto=54;

                                                              $accion='MODIFICACIÓN DE CONTRASEÑA';
                                                              $descripcion= 'EL USUARIO MODIFICÓ LA CONTRASEÑA POR EL METODO DE CORREO';
                                                              bitacora($codigoObjeto, $accion,$descripcion);
                                                            }
                                                         }
                                                        else{//error al ingresar los datos,saber que error sera :v (pero hay que mostrar mensaje de error xd )
                                                            echo "<script> 
                                                            alert('!Error al ingresar los datos¡');
                                                            location.href = '../Vistas/modulos/cambio_contrasena_correo.php'; </script>";exit;
                                                        }
                                                    }catch (PDOException $e){
                                                    echo $e->getMessage();  
                                                    return false;
                                                    }
                                                } //cierre del else
                                            }catch (PDOException $e){
                                                echo $e->getMessage();  
                                                return false;
                                            }
                                            echo "<script> 
                                            location.href = '../index.php';
                                            </script>";
                                            
                                        }//final del else
                                    }catch (PDOException $e){
                                    echo $e->getMessage();  
                                    return false;
                                    }
                                }else{
                                    echo "<script> alert('La contraseña no cumple con los requisitos') location.href = '../Vistas/modulos/cambio_contrasena_correo.php'; </script>";
                                }
                          }      
                 } //fin del if de ver si esta lleno el boton de cambiar contraseña
              }else {
                echo "<script>alert('Error nombre de usuario y contraseña incorrectos');
                location.href = '../Vistas/modulos/cambio_contrasena_correo.php'; </script>";
            }
            return true;
       }catch(PDOException $e){
        echo $e->getMessage();
        return false;
    }
}



























?>