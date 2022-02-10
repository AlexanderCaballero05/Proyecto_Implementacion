<?php
include_once "conexion.php";
?>


<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

if(isset($_POST['recupUsuario'])) {
    if(isset($_POST['recupCorreo'])) {

       $usuario=($_POST['recupUsuario']);

session_start();
$_SESSION['mi_variable'] =$usuario;
$consultar_usuario="SELECT * FROM tbl_ms_usuario WHERE NOMBRE_USUARIO='$usuario'";
        $existe=$conn->query($consultar_usuario);
        $filas=$existe->num_rows;
      

        if($filas==0){
            echo '<script>
            alert(" El Usuario Ingresado no Existe ");
            window.location="../Login/metodos_recuperar_clave.php";
                  </script>';
        } else{
               $consultar_correo = "SELECT CORREO_ELECTRONICO
                FROM tbl_ms_usuario 
                WHERE NOMBRE_USUARIO = '$usuario'";    

                $revision_correo=$conn->query($consultar_correo);
             if($revision_correo->num_rows>0){
                 while($fila=$revision_correo->fetch_assoc()){
                  $correo= $fila['CORREO_ELECTRONICO'];


                            echo '<script>
                            alert("Verifique su Correo se ha enviado la clave");
                         window.location="../login/login.php";
                               </script>';
               
                            require "PHPMailer/Exception.php";
                            require "PHPMailer/PHPMailer.php";
                            require "PHPMailer/SMTP.php";


                            function contraseña_random($length=8)
                                {
                                $charset="abcdefghijklmnopqrstuvwxyz1234567890@";
                                $contraseña="";
                         
                                for ($i=0;$i < $length;$i++)
                                {
                                 $rand= rand() % strlen($charset);
                                 $contraseña.= substr($charset,$rand,1);
                         
                                }
                                return $contraseña;
                         
                                 }
                                 
                                $contra= (contraseña_random()) ;

                           $query_cambio="UPDATE tbl_ms_usuario
                                          SET CONTRASENA='$contra'
                                          WHERE NOMBRE_USUARIO= '$usuario'
                                          ";
                            $contraseña_cambiada=$conn->query($query_cambio);

                            $oMail= new PHPMailer(true);

                            $oMail->isSMTP();
                            $oMail->Host='smtp-mail.outlook.com';
                            $oMail->Port=587;
                            $oMail->SMTPSecure="tls";
                            $oMail->SMTPAuth=true;

                            $oMail->Username="aacaballero@unah.hn";
                            $oMail->Password="Caballero1995+";
                            $oMail->setFrom("aacaballero@unah.hn","Proyecto Prosecar");
                            $oMail->addAddress($correo);
                            $mensaje="<h2>Hola, $usuario</h2> Usted ha realizado una solicitud de recuperación de contraseña:</p>
                            <p><h3>La nueva contraseña para ingresar al sistema es: ".utf8_decode($contra)."</h3></p>
                            <p>Al ingresar al sistema por razones de seguridad automaticamente se le pedirá cambiar su contraseña de recuperación</p>
                            <p>Esta contraseña solo tiene validez por 24 horas desde su fecha de envio.</p>
                            
                            <a href='http://localhost/Rama_Proyecto_Implementacion/Login/index.php'>
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