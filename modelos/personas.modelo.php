<?php
  session_start();
  include_once 'conexion.php';
  include_once 'conexion3.php';
  include_once 'function_bitacora.php';
?>



<?php
  if(isset($_POST['identidad'])){
     try{
         if(isset($_POST['GUARDAR'])){
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
             $fecha_vencimiento= ($_POST['fecha_vencimiento']);
             $fechaActual = date('Y-m-d');
            try{ 
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
                      
                      try {
                         if(($tipo_persona == "1") 	|| ($tipo_persona == "2") ){
                            $sentencia = $db->prepare("SELECT NOMBRE_USUARIO FROM tbl_usuario WHERE NOMBRE_USUARIO  = (?) ;");
                            $sentencia->execute(array($nombre_usuario));
                            $row=$sentencia->fetchColumn();
                            if($row>0){// si hay registros con el mismo nombre 
                              echo "<script>
                              alert('El Nombre de usuario $nombre_usuario ya se encuentra registrado');
                              window.location = 'registrar_personas';
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

                                  //registrar el usuario en tbl_usuario 
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


  //FUNCION PARA ELIMINAR EL USUARIO,OJALA DE : /

  


  



  



?>