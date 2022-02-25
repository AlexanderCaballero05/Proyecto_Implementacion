<?php
  session_start();
  include_once 'conexion3.php';

  include_once 'conexion.php';
  include_once 'conexion2.php';


  include_once 'function_bitacora.php';

?>



<?php
  if(isset($_POST['identidad'])){
     try{
         if(isset($_POST['GUARDAR'])){
             $usuario = $_SESSION['usua'];
             $identidad = ($_POST['identidad']);
             $primer_nombre = ($_POST['primer_nombre']);
             $segundo_nombre = ($_POST['segundo_nombre']);
             $primer_apellido = ($_POST['primer_apellido']);
             $segundo_apellido = ($_POST['segundo_apellido']);
             $fecha_nacimiento = ($_POST['fecha_nacimiento']);
             $lugar_nacimiento = ($_POST['lugar_nacimiento']);
             $tipo_persona = ($_POST['tipo_persona']);
             $sexo = ($_POST['sexo']);
             $telefono = ($_POST['telefono']);
             $correo = ($_POST['correo']);
             $fecha_baja = ($_POST['fecha_baja']);
             $direccion = ($_POST['direccion']);
             $nombre_usuario = ($_POST['nombre_usuario']);
             $estado = ($_POST['estado']);
             $rol = ($_POST['rol']);
             $contrasena = ($_POST['contrasena']);
             $fechaActual = date('Y-m-d');           
            try{ 
              $user_sesion = $_SESSION['usua'];
                 
                $consulta = $db->prepare("SELECT DNI FROM tbl_persona WHERE DNI = (?);");//consulta pra verificar si el DNI existe
                $consulta->execute(array($identidad));
                $row=$consulta->fetchColumn();
                if ($row>0){
                  echo "<script>
                  alert('El numero de identidad $identidad ya se encuentra registrado');
                  </script>";
                  exit;
                }else{// else para la sentencia de que si el correo ya existe
                  $consulta_correo = $db->prepare("SELECT  c.correo_persona FROM tbl_persona p ,tbl_correo_electronico c
                  where c.CODIGO_PERSONA = p.CODIGO_PERSONA and correo_persona = (?);");
                  $consulta_correo->execute(array($correo));
                  $row=$consulta_correo->fetchColumn();
                  if($row>0){
                    echo "<script>
                    alert('La direccion de correo electronico $correo ya se encuentra registrada');
                    window.location = 'agregarusuarios';
                    </script>";
                    exit;
                  }else{ //else de verificar el telefono 
                    $sentencia = $db->prepare("SELECT  NUMERO_TELEFONO FROM tbl_persona p ,tbl_telefono f
                    where f.CODIGO_PERSONA = p.CODIGO_PERSONA and NUMERO_TELEFONO = (?);");
                    $sentencia->execute(array($telefono));
                    $row=$sentencia->fetchColumn();
                    if($row >0){
                      echo "<script>
                      alert('El Número de telefono $telefono ya se encuentra registrado');
                      window.location = 'agregarusuarios';
                      </script>";
                      exit;
                    }else{//
                       
                      $dias_vencimiento = "ADMIN_DIAS_VIGENCIA";
                      $sentencia = $db->prepare("SELECT  VALOR  FROM  tbl_parametros WHERE  PARAMETRO = (?);");
                      $sentencia->execute(array($dias_vencimiento));
                      $row=$sentencia->fetchColumn();
                      if ($row>0) {
                        $dias_ven = $row;
                      }
                      $fechaActual = date('Y-m-d'); 
                      $fecha_vencimiento = date("d-m-Y",strtotime($fechaActual."+'$dias_ven'+ days")); 

                      
                      try {
                         if(($tipo_persona == "1") 	|| ($tipo_persona == "2") ){
                            $sentencia = $db->prepare("SELECT NOMBRE_USUARIO FROM tbl_usuario WHERE NOMBRE_USUARIO  = (?) ;");
                            $sentencia->execute(array($nombre_usuario));
                            $row=$sentencia->fetchColumn();
                            if($row>0){// si hay registros con el mismo nombre 
                              echo "<script>
                              alert('El Nombre de usuario $nombre_usuario ya se encuentra registrado');
                              window.location = 'categoria';
                              </script>";
                              exit;
                             }else{//si el usuario no existe en tbl_usuario,entonces se puede registrar ,por fin!!!
                              try{

                                //Insertar en las respectivas tablas (tbl_persona,tbl_usuario,tbl_correo_electonico)
                                $contrasena = password_hash($contrasena, PASSWORD_DEFAULT); //encripta la contraseña usando la misma variable de contraseña
                                $queryregistrarp = "INSERT INTO tbl_persona(PRIMER_NOMBRE,SEGUNDO_NOMBRE,PRIMER_APELLIDO,SEGUNDO_APELLIDO,DNI, FECHA_NACIMIENTO,LUGAR_NACIMIENTO, FECHA_INSCRIPCION, CODIGO_TIPO_PERSONA, CREADO_POR_USUARIO, FECHA_CREACION, FECHA_MODIFICACION, SEXO)
                                VALUES('$primer_nombre','$segundo_nombre','$primer_apellido','$segundo_apellido','$identidad','$fecha_nacimiento','$lugar_nacimiento', '$fechaActual','$tipo_persona','NO DEFINIDO', '$fechaActual','NO DEFINIDO','$sexo')";
                                $resultado=$conn->query($queryregistrarp);
                                if($resultado>0){
                                  //CODIGO PERSONA: 
                                  $codigo = mysqli_insert_id($conn);
                                  $querycorreo = "INSERT INTO tbl_correo_electronico(correo_persona, CODIGO_PERSONA) VALUES ('$correo','$codigo')";
                                  $resultado_correo=$conn->query($querycorreo);

                                  $querytelefono = " INSERT INTO tbl_telefono(CODIGO_TELEFONO, CODIGO_PERSONA,NUMERO_TELEFONO) VALUES ('$telefono','$codigo','$telefono')";
                                   $resultado_telefono=$conn->query($querytelefono);

                                  //registrar el usuario en tbl_usuario 

                                  $queryregisusuario = "INSERT INTO tbl_usuario(CODIGO_PERSONA, NOMBRE_USUARIO, CODIGO_ESTADO, CODIGO_TIPO_ROL,CONTRASENA,FECHA_CREACION,FECHA_VENCIMIENTO,CREADO_POR) 
                                  VALUES('$codigo','$nombre_usuario','$estado', '$rol','$contrasena','$fechaActual','$fecha_vencimiento','$user_sesion')";
                                  $resultado_usuario=$conn->query($queryregisusuario);
                                  if($resultado_usuario >0){
                                    echo "<script> 
                                    alert('usuario registrado correctamente');
                                    location.href = 'categoria';
                                    </script>";
                                    exit;
                                  }else{
                                    echo "<script> 
                                    alert('Error auxilio!');
                                    location.href = 'categoria';
                                    </script>";
                                    exit;
                                  }
                                 
                      $queryregisusuario = "INSERT INTO tbl_usuario(CODIGO_PERSONA, NOMBRE_USUARIO, CODIGO_ESTADO, CODIGO_TIPO_ROL,CONTRASENA,FECHA_CREACION) 
                                  VALUES('$codigo','$nombre_usuario','$estado', '$rol','$contrasena',$fechaActual)";
                                  $resultado_usuario=$conn->query( $queryregisusuario);

                                  

                            




                                  echo "<script> 
                                  alert('usuario registrado correctamente');
                                  location.href = 'registrar_personas';
                                  </script>";
                                  exit;


                                  
                                  $codigoObjeto=1;
                                  $accion='Registro';
                                  $descripcion= 'Registro de un Usuario';
                                  bitacora($codigoObjeto, $accion,$descripcion);




                                }
                              }catch(PDOException $e){
                                echo $e->getMessage(); 
                                return false;
                              }
                            }//fin del else de insertar personas
                          }else{ //si no es un tipo de persona administrador o tutor,es decir un estudiante
                           try{
                              //Insertar en las respectivas tablas (tbl_persona,,tbl_correo_electonico)
                            //  $contrasena = password_hash($contrasena, PASSWORD_DEFAULT); //encripta la contraseña usando la misma variable de contraseña
                              $registrar_persona = "INSERT INTO tbl_persona(PRIMER_NOMBRE,SEGUNDO_NOMBRE,PRIMER_APELLIDO,SEGUNDO_APELLIDO,DNI, FECHA_NACIMIENTO,LUGAR_NACIMIENTO, FECHA_INSCRIPCION, CODIGO_TIPO_PERSONA, CREADO_POR_USUARIO, FECHA_CREACION, FECHA_MODIFICACION, SEXO)
                              VALUES('$primer_nombre','$segundo_nombre','$primer_apellido','$segundo_apellido','$identidad','$fecha_nacimiento','$lugar_nacimiento', '$fechaActual','$tipo_persona','NO DEFINIDO', '$fechaActual','NO DEFINIDO','$sexo')";

                              $resultado_insert =$conn->query($registrar_persona);
                              if($resultado_insert > 0){


                              
                                
                                 //CODIGO PERSONA: 
                                $codigo = mysqli_insert_id($conn);
                                $querycorreo = " INSERT INTO tbl_correo_electronico(correo_persona, CODIGO_PERSONA) VALUES ('$correo','$codigo')";
                                $resultado_correo=$conn->query( $querycorreo);


                                
                                $querytelefono = " INSERT INTO tbl_telefono(CODIGO_TELEFONO, CODIGO_PERSONA,NUMERO_TELEFONO) VALUES ('$telefono','$codigo','$telefono')";
                                $resultado_telefono=$conn->query($querytelefono);


                                echo "<script> 
                                alert('persona registrada correctamente');
                                location.href = 'categoria';
                                </script>";
                                exit;
                              }else{
                                echo "<script> 
                                alert('No se pudo registrar la persona,por motivos desconocidos :v');
                                location.href = 'categoria';
                                </script>";
                                exit;
                              }
                            }catch(PDOException $e){
                            echo $e->getMessage(); 
                            return false;
                            }
                          }
                           
                         //cierre del else de tipos de usuario
                      }catch (PDOException $e) {
                        echo $e->getMessage(); 
                        return false;
                      }//final del try cathc
                      
                    }//final del else de comprobacion del usuario
                  }//final del else de comprbacion del telefono
                } //final del else de comprabacion del correo    
            }catch(PDOException $e) {
              echo $e->getMessage();  
              return false;
            } //fin del try cacht
          }//fin del if de ver si el boton guardar esta vacio
          return true;
        }catch(PDOException $e){
        echo $e->getMessage();  
        return false;
        } //fin del try catch principal
    }
      //fin del if de comprobar que el DNI no esta vacio
  //ELABORADO POR Diana Rut ****

  if(isset($_POST['CODUSUARIO'])) { 
    if (isset($_POST['ACT_PERSONA'])) {

        $CODUSUARIO = ($_POST['CODUSUARIO']);
        $USUARIO = ($_POST['NOMUSUARIO']); 
        $PASS = ($_POST['CONUSUARIO']);
        $ROL = ($_POST['ROLUSUARIO']);
        $ESTADO = ($_POST['ESTADOUSUARIO']);
        $fecha = ($_POST['FECHA_VENCIMIENTO']);
            try{

      $CODUSUARIO = ($_POST['CODUSUARIO']);
      $USUARIO = ($_POST['NOMUSUARIO']); 
      $PASS = ($_POST['CONUSUARIO']);
      $ROL = ($_POST['ROLUSUARIO']);
      $ESTADO = ($_POST['ESTADOUSUARIO']);
      try{
        //Declaras parámetros de salida
        $sentencia = $db->prepare("SELECT COUNT(*) FROM tbl_usuario WHERE NOMBRE_USUARIO = ?");
        // llamar al procedimiento almacenado
        $sentencia->execute(array($USUARIO));
        $row=$sentencia->fetchColumn();
        if ($row>0){ 
          echo "<script>
          alert('Ya existe una persona registrada con el nombre de usuario: $USUARIO');
          window.location = 'ediusuarios';
          </script>";
        }else{
          try{
            $sql = "CALL Sp_editar_usuarios('$CODUSUARIO','$ROL','$ESTADO','$USUARIO','$PASS');";
            $consulta=$conn->query($sql);
            if ($consulta>0) {


     


              echo "<script>
               Swal.fire({
                position: 'top-end',
                icon: 'success',
                title: 'Usuario registrado exitosamente',
                showConfirmButton: false,
                timer: 1500
              })
              </script>";


              include_once 'function_bitacora.php';
              $codigoObjeto=1;
              $accion='Modificacion';
              $descripcion= 'Se edito un Usuario ';
              bitacora($codigoObjeto, $accion,$descripcion);
            }else{ 
              echo "<script>
              alert('¡Error al modificar al usuario!');
              window.location = 'ediusuarios';
              </script>";
            }
           return true;
          }catch(PDOException $e) {
            echo $e->getMessage();  
            return false;
          }
        }
        return true; //FIN DEL ELSE
      }catch(PDOException $e) {
        echo $e->getMessage();  
        return false;
      }//FINAL DEL TRY CATCH PRINCIPAL 
    }// FINAL DEL IF SEGUNDO 
  }//FINAL DEL IF PRINCIPAL


               $consi ="SELECT NOMBRE_USUARIO from tbl_usuario where NOMBRE_USUARIO ='$USUARIO'  and CODIGO_USUARIO = '$CODUSUARIO'";
               $consulta=$conn->query($consi);
               if( $consulta >0){
                 $upda = " UPDATE tbl_usuario SET CODIGO_ESTADO = '$ESTADO' , CODIGO_TIPO_ROL = '$ROL' 
                 ,CONTRASENA = '$PASS' ,FECHA_VENCIMIENTO ='$fecha' ";
                 $respuesta=$conn->query($upda);  
                 echo "<script>
                 alert('se ha modificado');
                 window.location = 'ediusuarios';
                 </script>"; 
                 exit; 

               }else{
                                //Declaras parámetros de salida
              $sentencia = $db->prepare("SELECT COUNT(*) FROM tbl_usuario WHERE NOMBRE_USUARIO = ?");
              // llamar al procedimiento almacenado
              $sentencia->execute(array($USUARIO));
              $row=$sentencia->fetchColumn();
              if ($row>0){ 
                  echo "<script>
                      alert('Ya existe una persona registrada con el nombre de usuario: $USUARIO');
                      window.location = 'ediusuarios';
                      </script>";
                      exit;
              }else{
                  try{
                    $sql = " UPDATE tbl_usuario SET CODIGO_ESTADO = '$ESTADO' , CODIGO_TIPO_ROL = '$ROL' ,CONTRASENA = '$PASS'
                    WHERE CODIGO_USUARIO = '$CODUSUARIO', FECHA_VENCIMIENTO ='$fecha'  ";
                      $consulta=$conn->query($sql);
                      if ($consulta>0) {
                        echo "<script>
                        alert('¡Usuario modificado exitosamente!');
                        window.location = 'ediusuarios';
                         </script>";
                         }else{ 
                         echo "<script>
                        alert('¡Error al modificar al usuario!');
                        window.location = 'ediusuarios';
                         </script>";
                        }
                        return true;
                      } catch(PDOException $e) {
                  
                      echo $e->getMessage();  
                          return false;
                      }
               }

               }



                  return true;
              } catch(PDOException $e) {
          
              echo $e->getMessage();  
                  return false;
              }   
   } 
   
 }



  
  
  //FUNCION PARA ELIMINAR EL USUARIO,OJALA DE : /
  if(isset($_POST['usuario_eliminar'])){
    if(isset($_POST['ELIMINAR'])){
      $code = ($_POST['usuario_eliminar']);
      try{
        $query_tablas =  $db->prepare("SELECT  u.CODIGO_PERSONA  from  
        tbl_usuario  u ,tbl_ms_hist_contraseña h, tbl_preguntas_usuarios p
        where u.CODIGO_USUARIO = h.CODIGO_USUARIO and  u.CODIGO_USUARIO = p.CODIGO_USUARIO and u.CODIGO_USUARIO = (?);");
        $query_tablas->execute(array($code));
        $row=$query_tablas->fetchColumn();
         
          if($row >0){
           echo "<script>
           alert('¡No se puede eliminar este usuario,tiene relaciones!');
           window.location = 'ediusuarios';
           </script>";
           exit;
          }else{
             try{
              $link = mysqli_connect("localhost", "root", "", "db_proyecto_Prosecar");
              mysqli_query($link, "DELETE FROM tbl_usuario WHERE  CODIGO_USUARIO = '$code' AND CODIGO_USUARIO <>1");
              
              if(mysqli_affected_rows($link)>0){
                  echo "<script>
                  alert('¡Usuario eliminado!');
                  window.location = 'ediusuarios';
                  </script>";
                  exit;
              }else{
                echo "<script>
                alert('¡No se puede eliminar este usuario!');
                window.location = 'ediusuarios';
                </script>";
                exit;
              }
             }catch(PDOException $e) {
             echo $e->getMessage();  
             return false; }
          }//fin del else
        return true; //FIN DEL ELSE
      }catch(PDOException $e) {
       echo $e->getMessage();  
       return false; }
    }
  }
 
  ?> 
