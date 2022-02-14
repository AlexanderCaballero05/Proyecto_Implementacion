<?php
include_once "conexion.php"
?>
<?php
if(isset($_POST['nomUser'])) {
    $nomUser=$_POST['nomUser'];
    $contraActual=($_POST['contraAnte']);

      try{   
           
        //$sentencia_sp =$db->prepare("CALL Sp_obtener_cod_usuario(?,?);"); //llamar al procedimiento almacenado con la fucion prepare de PHP
           
        $consultar_usuario="SELECT * FROM tbl_usuario
         WHERE NOMBRE_USUARIO='$nomUser'
         AND CONTRASENA ='$contraActual'"; 
        $existe=$conn->query($consultar_usuario);
        $filas=$existe->num_rows;
      
           // $sentencia_sp->execute(array($nomUser,$contraActual));//ejecutar el procedimiento almacenado
           // $filas=$sentencia_sp->fetchColumn();
              if($filas>0){
                
                $mostrarUser= $filas;
                    if(isset($_POST['GUARDARCONTRA'])){
                        $contraNueva=($_POST['contraNueva']);
                        $contraConfirm=($_POST['contraConfirm']);

                            if($contraNueva<>$contraConfirm){
                                echo "<script>
                                alert('Las contraseña no son iguales');
                                location.href = '../Login/cambiar_contrasena.php';
                                      </script>";
                             }

                            else{
                                try
                                {
                                   // $sql = "CALL Sp_cambiar_con_provisional('$contraNueva','$mostrarUser');" ;
                                    $consulta=$conn->query($sql);
                                    
                                    if ($consulta>0) {
                                        echo "<script>
                                            alert('Contraseña guardada exitosamente');
                                             window.location = '..Vistas/index.php';
                                             </script>";
                                     }else{
                                       
                                     echo "<script>
                                    alert('Error al guardar la contraseña');
                                    location.href = '../Login/cambiar_contrasena.php';
                                     </script>";
                                    }
                                    return true;
                                } catch(PDOException $e) {
                                    echo $e->getMessage();  
                                    return false;
                                } 
                            


                          }      
                 }
                 

              }else {
                echo "<script>
                alert('Error nombre de usuario y contraseña incorrectos');
                location.href = '../Login/cambiar_contrasena.php';
                 </script>";


                  }



        return true;

      }catch(PDOException $e){

        echo $e->getMessage();
        return false;
      }
      






























}



























?>