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

   $usuario = $_POST["Loginusuario"];
   $contrasena = $_POST["Logincontraseña"]; 

   
        $query_select = "SELECT CODIGO_ESTADO FROM TBL_USUARIO
         WHERE nombre_usuario = ?
           AND CONTRASENA = ?";

          
        $resultados=mysqli_prepare($conexion, $query_select);
        
        $ok=mysqli_stmt_bind_param($resultados, 'ss', $usuario, $contrasena );
             
        $ok=mysqli_stmt_execute($resultados);
        
        if($ok==false){
          
          echo "Error en la consulta";
          
        } else{
         $ok=mysqli_stmt_bind_result($resultados,$codigo_estado);   
       
       }
       
       while(mysqli_stmt_fetch($resultados)){    
       }
       
       
       if($codigo_estado == "5"){
       
           echo "<script> 
           alert('!cambie su contrasena¡');
           window.location='../Vistas/modulos/cambio_contrasena_correo.php'
           </script>";
       
       }elseif($codigo_estado =="2") { 
         echo "<script> 
        alert('!Bienvenido Usuario¡');
            window.location='../Vistas/index.php'
            </script>";
                }else{









         echo "<script> alert('!Error en la autenticacion¡');
         window.location= 'index.php'
         </script>";              
          }
        
          

mysqli_stmt_close($resultados);
mysqli_close($conexion);
?>