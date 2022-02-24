<?php
  session_start();
 include_once "conexion3.php";
 include_once "conexion.php";

 $parametro ="NUM_MAX_PREGUNTAS";
 $sentencia = $db->prepare("SELECT VALOR FROM tbl_parametros WHERE PARAMETRO =(?);");
 $sentencia->execute(array($parametro));
 $row=$sentencia->fetchColumn();
 
 if($row>0){
   $valor = $row;
 }
?> 




<?php
// se mando a llamar la variable de sesion antes declarada en usuario controlador
             if (isset($_REQUEST['verificar_res'])){
                  $pregunta=($_POST['pregunta_usuario1']);
                  $usuario= $_SESSION['vario'];
                  $respuesta=($_POST['respuesta1']);  
                  
               /*   $consultar_valor_usuario = "SELECT p.PAR_VALOR
                  from tbl_usuario u, tbl_parametros_usuarios p 
                  WHERE u.CODIGO_USUARIO = p.CODIGO_USUARIO
                  AND P.CODIGO_PARAMETRO = 2
                  AND u.NOMBRE_USUARIO = '$usuario'";

                 $resul_valor=$conn->query($consultar_valor_usuario);*/





               $consultar_pregun = "SELECT * FROM tbl_preguntas_usuarios r, tbl_usuario u
                                       WHERE  r.CODIGO_USUARIO = u.CODIGO_USUARIO
                                       AND r.CODIGO_PREGUNTAS = '$pregunta'
                                       AND u.NOMBRE_USUARIO = '$usuario'";              
                 
                $existe1=$conn->query($consultar_pregun);
                $row=$existe1->num_rows;
        


                 if($row==1){ //aqui si es igual a 1 entonces encontro un registro
                    echo "<script>
                     alert('No puede contestar la misma pregunta dos veces' );
                     location.href ='../vistas/modulos/preguntas_inicio.php';
                     </script> ";
                 } elseif ($valor==4){

                  echo "<script>
                  alert('Gracias por contestar todas las preguntas' );
                  location.href ='../vistas/modulos/preguntas_inicio.php';
                  </script> ";

                    
                    

                 }else{
                  $Insertar_pregunta = "INSERT INTO tbl_preguntas_usuarios(CODIGO_PREGUNTAS,CODIGO_USUARIO, RESPUESTA)
                  VALUES ('$pregunta', 19 ,'$respuesta')";

              $Resultado1=$conn->query($Insertar_pregunta);




              $query = "UPDATE tbl_parametros_usuarios SET 
              PAR_VALOR=(PAR_VALOR+1)

              WHERE CODIGO_USUARIO=(SELECT codigo_usuario From tbl_usuario where NOMBRE_USUARIO = '$usuario') AND CODIGO_PARAMETRO = 2;";
              $dato=$conn->query($query);

              



                 }
                 
                                              
                 }else {

  




                 }

            
        
       

   
   

    
?> 