<?php
include_once "conexion.php";
include_once "conexion3.php";
  $parametro ="ADMIN_SERVIDOR_CORREO";
  $sentencia = $db->prepare("SELECT VALOR FROM tbl_parametros WHERE PARAMETRO =(?);");
  $sentencia->execute(array($parametro));
  $row=$sentencia->fetchColumn();
  
  if($row>0){
    $valor = $row;
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
    $valor1 = $row1;
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
    $valor2 = $row2;
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
    $valor3 = $row3;
  }
?>



<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

if(isset($_POST['recupUsuario'])) { // if que verfica el nombre de usuario
    if(isset($_POST['recupCorreo'])) { // if que captura el identificador del button que se presiono para enviar la solicitud de cambio de correo

       $usuario=($_POST['recupUsuario']); // se captura el valor del nombre del usuario

session_start();
$_SESSION['mi_variable'] = $usuario; // para ser usado a lo largo del archivo
$consultar_usuario="SELECT * FROM tbl_usuario WHERE NOMBRE_USUARIO='$usuario'"; 
        $existe=$conn->query($consultar_usuario);
        $filas=$existe->num_rows;
      

        if($filas==0){
            
            echo '<script>
            alert("Datos incorrectos");
            window.location="../Vistas/modulos/metodos_recuperar_clave.php";
                  </script>';
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

                            echo '<script>
                            alert("Verifique su Correo se ha enviado la clave");
                         window.location="../login";
                               </script>';
               
                            require "PHPMailer/Exception.php"; // aqui se utliza la libreria de PHPMAILER
                            require "PHPMailer/PHPMailer.php";
                            require "PHPMailer/SMTP.php";


                            function contraseña_random($length=8) // FUNCION para generar la contraseña aleatoria
                                {
                                $charset=" /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]/";
                                $contraseña="";
                         
                                for ($i=0;$i < $length;$i++)
                                {
                                 $rand= rand() % strlen($charset);
                                 $contraseña.= substr($charset,$rand,1);
                         
                                }
                                return $contraseña;
                         
                                 }
                                 
                                $contra= (contraseña_random()) ; //se captura la contrasena generada

                            //Se construye el update para cambiar la contrasena anterior por generada Y el estado pasa a pendiente
                           $query_cambio="UPDATE tbl_usuario
                                          SET CONTRASENA='$contra',
                                          CODIGO_ESTADO = 5
                                          WHERE NOMBRE_USUARIO= '$usuario'";

                            

                            $contraseña_cambiada=$conn->query($query_cambio); // se hace elquery a la base de datos

                            $oMail= new PHPMailer(true);


                           // $parametros_mail="SELECT "

                            $oMail->isSMTP();
                            $oMail->Host=($valor);
                            $oMail->Port=($valor1);
                            $oMail->SMTPSecure="tls";
                            $oMail->SMTPAuth=true;

                            $oMail->Username="$valor2";//  
                            $oMail->Password="$valor3";
                            $oMail->setFrom("$valor2"); // direccion de correo de destino hacia los correos de usuarios
                            $oMail->addAddress($correo); //Variable que recoger el correo al que sera enviado la clave de recuperacion.
                            $mensaje="<h2>Hola, $usuario</h2> Usted ha realizado una solicitud de recuperación de contraseña:</p>
                            <p><h3>La nueva contraseña para ingresar al sistema es: ".utf8_decode($contra)."</h3></p>
                            <p>Al ingresar al sistema por razones de seguridad automaticamente se le pedirá cambiar su contraseña de recuperación</p>
                            <p>Esta contraseña solo tiene validez por 24 horas desde su fecha de envio.</p>
                            
                            <a href='http://localhost/Rama_Proyecto_Implementacion/index.php'>
                            <button class='btn btn-primary btn-flat'> Cambiar contraseña</button>
                            </a>
                            
                            <p><h3>Gracias, Atentamente Proyecto Prosecar</h3></p>
                                  
                           ";

                           $oMail->Subject=utf8_decode("RECUPERACION DE CONTRASEÑA");
                            $oMail->msgHTML(utf8_decode($mensaje));
                            if(!$oMail->send())
                            echo $oMail->ErrorInfo;
                 }

            }
                            else {
                                echo '<script>
                                    alert("Verifique su Correo esta malo");
                                window.location="../vistas/modulos/tipo_recuperacion.php";
                                        </script>';
                            }


        }






    }

}




?>