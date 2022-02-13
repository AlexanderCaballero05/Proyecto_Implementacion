<?php

$db_host_name="localhost";
$db_user_name="root";
$db_password="";
$db_name="DB_Proyecto_Prosecar";


$conexion=mysqli_connect($db_host_name, $db_user_name, $db_password);

if(mysqli_connect_errno()){
    echo "Fallo al conectar con la BBDD";
    exit();
    }
   //seleccionar la base de datos concreta
    mysqli_select_db($conexion, $db_name) or die ("no se encontro la DDBB");
    //establece conjunto de caracteres predeterminados
    mysqli_set_charset($conexion, "utf8");

   $usuario = $_POST["ingusuario"];
   $contrasena = $_POST["ingcontrasena"];
   session_start();
   if (isset($_POST['Cerrar_sesion'])){// si existe cerrar sesion
     session_unset();
     session_destroy();// cerrar sesion
   }
 
   

   
        $query_select = "SELECT CODIGO_USUARIO,  USUARIO, CONTRASENA,  CODIGO_TIPO_ROL FROM TBL_USUARIO WHERE nombre_usuario = ?   AND CONTRASENA =    ?";

          
        $resultados=mysqli_prepare($conexion, $query_select);
        
        $ok=mysqli_stmt_bind_param($resultados, 'ss', $usuario, $contrasena);
             
        $ok=mysqli_stmt_execute($resultados);
        
        if($ok==false){
          
          echo "Error en la consulta";
          
        } else{
         $ok=mysqli_stmt_bind_result($resultados,$ID_USUARIO,$usuario,$contrasena, $codigo_tipo_rol);   
       
       }
       
       while(mysqli_stmt_fetch($resultados)){    
       }
       
       
       if($codigo_tipo_rol== "1"){
       
           echo "<script> 
           alert('!Bienvenido Administrador se ha logeado exitosamente¡');
           window.location='../Vistas/index.php'
           </script>";
       
       }elseif($codigo_tipo_rol== "2") { 
         echo "<script> 
        alert('!Bienvenido Usuario se ha logeado exitosamente¡');
            window.location='../Vistas/index.php'
            </script>";
         }
         else{
           
        if (isset($_COOKIE["bloquear".$usuario])){
          echo "<script> 
          alert('!El suario esta bloqueado ¡');
              window.location='../index.php'
              </script>";
         
        }else {
          //si existe la cookie con ese nombre del usuario, crea contador 
          if(isset($_COOKIE["$usuario"])){
          $contador= $_COOKIE["$usuario"];
          $contador++;
           echo "<script> alert('!Error en la autenticacion¡');
          window.location= 'index.php'
         </script>";     
          //setea la cookie 
          setcookie($usuario,$contador);
          if ($contador>=3){
        setcookie("bloquear".$usuario, $contador);

}
          }else {
          setcookie($usuario,1);

          }
         // echo "<script> alert('!Error en la autenticacion¡');
          // window.location= 'index.php'
         //</script>";              
           }
          }
          

mysqli_stmt_close($resultados);
mysqli_close($conexion);

?>