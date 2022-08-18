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

    Programa:          Valida el metodo seleccionado de recuperacion de contraseña por correo
    Fecha:             04-Marzo-2022
    Programador:       Arnold Caballero 
    descripcion:       Valida el metodo seleccionado de recuperacion de contraseña por correo y si es por preguntas lo envia a la pantalla de ingresar la pregunta

-----------------------------------------------------------------------
                      Historial de Cambio
-----------------------------------------------------------------------

    Programador               Fecha                      Descripcion
    Arnold Caballero     		01-06-2022                 cambio de nombre de variables para la recuperacion por correo
    Arnold Caballero     		03-06-2022                 cambio del cuerpo y el diseño del mensaje enviado al correo electronico.

----------------------------------------------------------------------->

<?php
 session_start();
include "function_bitacora.php";
include_once "conexion.php";
include_once "conexion3.php";
  $parametro ="ADMIN_SERVIDOR_CORREO";
  $sentencia = $db->prepare("SELECT VALOR FROM tbl_parametros WHERE PARAMETRO =(?);");
  $sentencia->execute(array($parametro));
  $row=$sentencia->fetchColumn();
  
  if($row>0){
    $servidor_correo = $row;
  }
?>

<?php
include_once "conexion.php";
include_once "conexion3.php";
  $parametro1 ="ADMIN_CPUERTO";
  $sentencia1 = $db->prepare("SELECT VALOR FROM tbl_parametros WHERE PARAMETRO =(?);");
  $sentencia1->execute(array($parametro1));
  $row1=$sentencia1->fetchColumn();
  
  if($row1>0){
    $puerto_servidor = $row1;
  }
?>

<?php
include_once "conexion.php";
include_once "conexion3.php";
  $parametro2 ="ADMIN_CUSUARIO";
  $sentencia2 = $db->prepare("SELECT VALOR FROM tbl_parametros WHERE PARAMETRO =(?);");
  $sentencia2->execute(array($parametro2));
  $row2=$sentencia2->fetchColumn();
  
  if($row2>0){
    $usuario_correo = $row2;
  }
?>




<?php
include_once "conexion.php";
include_once "conexion3.php";
  $parametro3 ="ADMIN_CPASSWORD";
  $sentencia3 = $db->prepare("SELECT VALOR FROM tbl_parametros WHERE PARAMETRO =(?);");
  $sentencia3->execute(array($parametro3));
  $row3=$sentencia3->fetchColumn();
  
  if($row3>0){
    $contrasena_usuario = $row3;
  }
?>

<?php

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

//validacion de Recuperacion de contrasena por medio de correo
if(isset($_REQUEST['usuario'])) {  //aqui capturo el usuario enviado
    if(isset($_REQUEST['correo'])) { //este if es verdad si se presiono el boton correo <entonces.. entro al bloque de codigo
        $usuario = ($_POST["usuario"]);// entonces capturo el dato del usuario enviado mediante el metodo POST

        $_SESSION['vario']  = $_POST["usuario"]; // se crea una variable de sesion con el nombre del isuario
        $consultar_usuario=" SELECT * FROM tbl_usuario WHERE NOMBRE_USUARIO='$usuario' AND CODIGO_ESTADO ='2'  "; 
        $existe=$conn->query($consultar_usuario);
        $filas=$existe->num_rows;
      
        if($filas==0){
          echo '<script> alert("Datos incorrectos");
          window.location="../Vistas/modulos/metodos_recuperar_clave.php";</script>';
        } else{ //construir el query para traer el dato del correo al cual se enviara la clave de recuperacion
           $consultar_correo = "SELECT c.CORREO_PERSONA  
           FROM tbl_persona p, tbl_correo_electronico c, tbl_usuario u
           where p.CODIGO_PERSONA = c.CODIGO_PERSONA
           AND p.CODIGO_PERSONA = u.CODIGO_PERSONA
           AND u.NOMBRE_USUARIO = '$usuario'";    
           $revision_correo =$conn->query($consultar_correo);
            //se hace la consulta a la base de datos
            if($revision_correo->num_rows>0){
              while($fila=$revision_correo->fetch_assoc()){
               $correo= $fila['CORREO_PERSONA'];

               echo '<script>  alert("Verifique su correo electrónico se ha enviado una contraseña de restableción"); window.location="../login";</script>';
               $_SESSION['vario'] =$usuario;
                               //llamada de la fuction bitacora -->
              
               
               require "PHPMailer/Exception.php"; // aqui se utliza la libreria de PHPMAILER
               require "PHPMailer/PHPMailer.php";
               require "PHPMailer/SMTP.php";
                function contraseña_random($length=8){ // FUNCION para generar la contraseña aleatoria
                  $charset="^(?=.*?[A-Z])(?=(.*[a-z]){1,})(?=(.*[\d]){1,})(?=(.*[\W]){1,})(?!.*\s).{8,}$";
                  
                  $contraseña="";
                  for ($i=0;$i < $length;$i++) {
                    $rand= rand() % strlen($charset);
                    $contraseña.= substr($charset,$rand,1);
                  }
                  return $contraseña;
                }
                $contra= (contraseña_random()) ; //se captura la contrasena generada
                $pass= crypt($contra,'$2a$07$usesomesillystringforsalt$');
                 //Se construye el update para cambiar la contrasena anterior por generada Y el estado pasa a pendiente
                $query_cambio="UPDATE tbl_usuario SET CONTRASENA='$pass',CODIGO_ESTADO = 5 WHERE NOMBRE_USUARIO= '$usuario'";
                $contraseña_cambiada=$conn->query($query_cambio); // se hace elquery a la base de datos
                $oMail= new PHPMailer(true);
                // $parametros_mail="SELECT "

                $oMail->isSMTP();
                $oMail->Host=("smtp.office365.com");
                $oMail->Port=(587);
                $oMail->SMTPSecure="tls";
                $oMail->SMTPAuth=true;

                $oMail->Username=("aacaballero@unah.hn"); 
                $oMail->Password=("*Iamhappy.2020*");
                $oMail->setFrom("aacaballero@unah.hn"); // direccion de correo de destino hacia los correos de usuarios
                $oMail->addAddress($correo); //Variable que recoger el correo al que sera enviado la clave de recuperacion.
                $mensaje="
                
                <!--Copia desde aquí-->
                <table style='max-width: 600px; padding: 10px; margin:0 auto; border-collapse: collapse;'>
                  <tr>
                    <td style='background-color: #ecf0f1; text-align: left; padding: 0'>
                      
                  
                      
                    </td>
                  </tr>
                
                  
                  <tr>
                    <td style='background-color: #ecf0f1'>
                      <div style='color: #000105; margin: 4% 10% 2%; text-align: justify;font-family: sans-serif'>
                        <h2 style='color: #e67e22; margin: 0 0 7px'>Hola, $usuario</h2>
                        <p style='margin: 2px; font-size: 15px'><h3>
                        Usted ha realizado una solicitud de recuperación de contraseña del sistema del Proyecto Prosecar.<h3></p>
                        <p style='margin: 2px; font-size: 15px'><h3>La nueva contraseña de acceso al sistema es la siguiente:</h3></p>
                        <p style='margin: 2px; font-size: 15px'><h2> " .utf8_decode($contra)."</h2></p>
                        <p style='margin: 2px; font-size: 15px'><h3>Al ingresar al sistema por razones de seguridad automáticamente se le pedirá cambiar su contraseña de recuperación por una contraseña nueva.</h3></p>
                        <p style='margin: 2px; font-size: 15px'><h3>Esta contraseña solo tiene validez por 24 horas desde su fecha de envío.<h3></p>
                        
                        
                        
                        <div style='width: 100%; text-align: center'>
                          <a style='text-decoration: none; border-radius: 5px; padding: 11px 23px; color: white; background-color: #3498db' href='http://localhost/Proyecto_Implementacion11/login'>Ir a la página</a>	
                        </div>
                        <p style='color: #000105; font-size: 12px; text-align: center;margin: 30px 0 0'><h3>Gracias, Atentamente Proyecto Prosecar</h3></p>
                      </div>
                    </td>
                  </tr>
                </table>";
                $oMail->Subject=utf8_decode("PROSECAR Recuperación de contraseña");
                $oMail->msgHTML(utf8_decode($mensaje));
                if(!$oMail->send())
                   echo $oMail->ErrorInfo;
                }
              }
               else {
                echo '<script> alert("Verifique su Correo es incorrecto"); window.location="../vistas/modulos/tipo_recuperacion.php"; </script>';
              }
        }

      //validacion de Recuperacion de contrasena por medio de pregunta
    }else if(isset($_POST['recu'])) { // este if es verdad si se presiono el boton preguntas <entonces.. entro al bloque de codigo
      $usuario = ($_POST["usuario"]);
      session_start();
      $_SESSION['vario'] = $_POST["usuario"]; // se crea una variable de sesion con el nombre del isuario
      $consultar_usuario="SELECT * FROM tbl_usuario WHERE NOMBRE_USUARIO ='$usuario' AND CODIGO_ESTADO = '2';";
      $existe=$conn->query($consultar_usuario);
      $filas=$existe->num_rows;

      if($filas>0){
        header("location: ../Vistas/modulos/recuperacion_clave_preguntas.php"); 
      
      }else{
        
        echo '<script> alert("Datos incorrectos");window.location="../Vistas/modulos/metodos_recuperar_clave.php"; </script>';
      }
    }//Fin del else if

}
   
?>