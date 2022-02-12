<?php

   $usuario = $_POST["nombre_usuario"];
   $contraseña = $_POST["contrasena"];

 
    require ("conexion.php");

    $conexion=mysqli_connect($db_host_name, $db_user_name, $db_password);

    if(mysqli_connect_errno()){
        echo "Fallo al conectar con la BBDD";
        exit();
        }
     
       //seleccionar la base de datos concreta
        mysqli_select_db($conexion, $db_name) or die ("no se encontro la DDBB");

        //establece conjunto de caracteres predeterminados
        mysqli_set_charset($conexion, "utf8");

        $query_select = "SELECT NOMBRE_USUARIO, CONTRASENA, CODIGO_ESTADO FROM TBL_USUARIO WHERE NOMBRE_USUARIO = ? AND CONTRASENA = ?";

          
 $resultados=mysqli_prepare($conexion, $query_select);
 
 $ok=mysqli_stmt_bind_param($resultados, 'ss', $usuario, $contraseña);
      
 $ok=mysqli_stmt_execute($resultados);
 
 if($ok==false){
   
   echo "Error en la consulta";
   
 } else{

  $ok=mysqli_stmt_bind_result($resultados,$usuario,$contraseña,$codigo_estado);   

}

while(mysqli_stmt_fetch($resultados)){    

}

if($codigo_estado== "2"){

    echo "<script> 
    alert('!Bienvenido Administrador se ha logeado exitosamente¡');
    window.location='../index.php'
    </script>";  

}elseif($codigo_estado== "5") { 
  echo "<script> 
 alert('!Bienvenido Usuario se ha logeado exitosamente¡');
     window.location='Login/cambio_contrasena.php'
     </script>";
    
  }else{

    echo "<script> 
    alert('!Error en la autenticacion¡');
    window.location= 'login.php'
    </script>";

  }

 
 
mysqli_stmt_close($resultados);
mysqli_close($conexion);


     

?>