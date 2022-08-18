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

    Programa:          Valida el ingreso y la eliminacion de las preguntas de seguridad por parte del usuario
    Fecha:             04-Marzo-2022
    Programador:       Arnold Caballero 
    descripcion:       Valida el ingreso y la eliminacion de las preguntas de seguridad por parte del usuario desde
                        la pantalla de preguntas de seguridad con el usuario ya en la sesion iniciada

-----------------------------------------------------------------------
                      Historial de Cambio
-----------------------------------------------------------------------

    Programador               Fecha                      Descripcion
    Arnold Caballero     		01-06-2022                 cambio de nombre de variables para la recuperacion por correo
    Arnold Caballero     		03-06-2022                 cambio del cuerpo y el diseño del mensaje enviado al correo electronico.

----------------------------------------------------------------------->
<?php

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
             if (isset($_REQUEST['agregar_pregunta_usuario'])){
                  $pregunta=($_POST['pregunta_usuario_individual']);

                
                  $usuario= $_SESSION['vario'];
                  $respuesta=($_POST['respuesta_usuario_individual']);  

                  //Consulta que trae el codigo del usuario
                  $sentencia1 = $db->prepare("SELECT CODIGO_USUARIO FROM tbl_usuario WHERE NOMBRE_USUARIO = (?);");
                  $sentencia1->execute(array($usuario));
                  $cod_usuario=$sentencia1->fetchColumn();

                  //Consulta que trae el numero de preguntas contestadas por el usuario
                  $sentencia2 = $db->prepare("SELECT p.PAR_VALOR
                  from tbl_usuario u, tbl_parametros_usuarios p 
                  WHERE u.CODIGO_USUARIO = p.CODIGO_USUARIO
                  AND P.CODIGO_PARAMETRO = 2
                  AND u.NOMBRE_USUARIO = (?);");
                  $sentencia2->execute(array($usuario));
                  $valor_usuario=$sentencia2->fetchColumn();

                  //Consulta que trae la pregunta contestada por el usuario para verficar que se repita
               $consultar_pregun = "SELECT * FROM tbl_preguntas_usuarios r, tbl_usuario u
                                       WHERE  r.CODIGO_USUARIO = u.CODIGO_USUARIO
                                       AND r.CODIGO_PREGUNTAS = '$pregunta'
                                       AND u.NOMBRE_USUARIO = '$usuario'";              
                 
                $existe1=$conn->query($consultar_pregun);
                $row=$existe1->num_rows;


                 if($row==1){ //aqui si es igual a 1 entonces encontro un registro 
                    echo "<script>
                     alert('No puede contestar la misma pregunta dos veces' );
                     location.href ='crudPreguntasUsuarios';
                     </script> ";
                     exit;
                 }
                     if($valor==$valor_usuario){// verifica si el numero de preguntas contestadas por el usuario es igual al del parametro de preguntas
                      echo "<script>
                      alert('Ya constesto sus preguntas' );
                      location.href ='crudPreguntasUsuarios';
                      </script> ";
                      exit;

                 }else{

                  $Insertar_pregunta = "INSERT INTO tbl_preguntas_usuarios(CODIGO_PREGUNTAS,CODIGO_USUARIO, RESPUESTA)
                  VALUES ('$pregunta', '$cod_usuario' ,'$respuesta')";
                  $Resultado1=$conn->query($Insertar_pregunta);

                     $query = "UPDATE tbl_parametros_usuarios SET 
                      PAR_VALOR=(PAR_VALOR+1)
                      WHERE CODIGO_USUARIO=(SELECT codigo_usuario From tbl_usuario where NOMBRE_USUARIO = '$usuario') AND CODIGO_PARAMETRO = 2;";
                      $dato=$conn->query($query);  
                       
                        
                        //si el parametro no es igual se envia a contestar la siguiente pregunta              
                      echo "<script>
                      alert('Pregunta contestada' );
                      location.href ='crudPreguntasUsuarios';
                      </script> ";

                 } 
                 
               
                 
                                              
                 }else {
 
                }            
  
    
?> 

<?php
if(isset($_POST['codigo_pregunta_usuario'])){
   if(isset($_POST['ELIMINAR_PREGUNTA'])){ 
   $codigo_pregunta_usuario = ($_POST['codigo_pregunta_usuario']);
   //$codigo_pregunta = ($_POST['codigo_pregunta']);
   $codigo_usuario = ($_POST['codigo_usuario']);

   $sentencia2 = $db->prepare("SELECT p.PAR_VALOR
   from tbl_usuario u, tbl_parametros_usuarios p 
   WHERE u.CODIGO_USUARIO = p.CODIGO_USUARIO
   AND P.CODIGO_PARAMETRO = 2
   AND u.CODIGO_USUARIO = (?);");
   $sentencia2->execute(array($codigo_usuario));
   $valor_usuario1=$sentencia2->fetchColumn();


         if($valor_usuario1 == 1){
            echo "<script>
            alert('!Error! Debe tener al menos una(1) pregunta contestada' );
            location.href ='crudPreguntasUsuarios';
            </script> ";
            exit;
         }

       
         $eliminar_pregunta = "DELETE FROM tbl_preguntas_usuarios 
         WHERE CODIGO_PREGUNTA_USUARIO = '$codigo_pregunta_usuario'; ";
         $consulta_eliminar=$conn->query($eliminar_pregunta);

         $query = "UPDATE tbl_parametros_usuarios SET 
         PAR_VALOR=(PAR_VALOR-1)
         WHERE CODIGO_USUARIO = $codigo_usuario
         AND CODIGO_PARAMETRO = 2;";
         $dato=$conn->query($query); 

      

   }

}

?>

