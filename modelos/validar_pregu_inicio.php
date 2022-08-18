<!-- 
-----------------------------------------------------------------------
Universidad Nacional Autonoma de Honduras (UNAH)
		Facultad de Ciencias Economicas
Departamento de Informatica administrativa
Analisis, Programacion y Evaluacion de Sistemas
           Primer Periodo 2016

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

Programa:         Pantalla modelo de Validar preguntas de inicio
Fecha:            01-jan-2016
Programador:       
descripcion:      Pantalla que contrala las preguntas que contestará el usuario por primera vez

-----------------------------------------------------------------------
                      Historial de Cambio
-----------------------------------------------------------------------

Programador               Fecha                      Descripcion
Gissela Diaz        		02-06-2022                 cambio en agregar que no acepte respuestas duplicadas y mensaje de error
                                                   al no guardar una pregunta


----------------------------------------------------------------------->
<?php
  session_start();
  include "function_bitacora.php";
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
                     location.href ='../vistas/modulos/preguntas_inicio.php';
                     </script> ";
                    }else{
                      $consultar_res= "SELECT * FROM tbl_preguntas_usuarios r, tbl_usuario u
                      WHERE  r.CODIGO_USUARIO = u.CODIGO_USUARIO
                      AND r.RESPUESTA = '$respuesta'
                      AND u.NOMBRE_USUARIO = '$usuario'";              
                      $existe2=$conn->query($consultar_res);
                      $row=$existe2->num_rows;

                      if($row==1){ //aqui si es igual a 1 entonces encontro un registro 
                        echo "<script>
                          alert('No puede contestar con la misma respuesta dos veces' );
                          location.href ='../vistas/modulos/preguntas_inicio.php';
                          </script> ";
                      }else{
                  $Insertar_pregunta = "INSERT INTO tbl_preguntas_usuarios(CODIGO_PREGUNTAS,CODIGO_USUARIO, RESPUESTA)
                  VALUES ('$pregunta', '$cod_usuario' ,'$respuesta')";
                  $Resultado1=$conn->query($Insertar_pregunta);
              if ($Resultado1 > 0){
                     $query = "UPDATE tbl_parametros_usuarios SET 
                      PAR_VALOR=(PAR_VALOR+1)
                      WHERE CODIGO_USUARIO=(SELECT codigo_usuario From tbl_usuario where NOMBRE_USUARIO = '$usuario') AND CODIGO_PARAMETRO = 2;";
                      $dato=$conn->query($query);  

                        if($valor-1==$valor_usuario){// verifica si el numero de preguntas contestadas por el usuario es igual al del parametro de preguntas
                          echo "<script>
                          alert('Gracias por contestar todas las preguntas' );
                          location.href ='../Vistas/modulos/cambio_contrasena_usuario_nuevo.php';
                          </script> "; 
                          $query = "UPDATE tbl_usuario SET 
                          CODIGO_ESTADO=2
                          WHERE CODIGO_USUARIO=(SELECT codigo_usuario From tbl_usuario where NOMBRE_USUARIO = '$usuario');";
                            $dato=$conn->query($query); 
                            //llamada de la fuction bitacora -->
                        

                        }
                        //si el parametro no es igual se envia a contestar la siguiente pregunta              
                        echo "<script>
                      alert('Pregunta contestada' );
                      location.href ='../vistas/modulos/preguntas_inicio.php';
                      </script> ";
                    }
                      else {
                        echo "<script>
                      alert('Error' );
                      location.href ='../vistas/modulos/preguntas_inicio.php';
                      </script> ";
                      }
                      
                      }
                    
                 }     
                                                    
                }
  
    
?> 