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
            $usuario = "Administrador";
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
             $otro_telefono = ($_POST['otro_telefono']);
             $correo = ($_POST['correo']);
             $direccion = ($_POST['direccion']);
             $nombre_usuario = ($_POST['nombre_usuario']);
             $estado = "1";  
             $contrasena = crypt($_POST['contrasena'],'$2a$07$usesomesillystringforsalt$');
             $fechaActual = date('Y-m-d');  
             $especialidad_medico = ($_POST['medico']);   
             $especialidad_psicologo = ($_POST['psicologo']); 
             $especialidad_catequista =   ($_POST['catequista']); 
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
                    }else{
                      $dias_vencimiento = "ADMIN_DIAS_VIGENCIA";
                      $sentencia = $db->prepare("SELECT  VALOR  FROM  tbl_parametros WHERE  PARAMETRO = (?);");
                      $sentencia->execute(array($dias_vencimiento));
                      $row=$sentencia->fetchColumn();
                      if ($row>0) {
                        $dias_ven = $row;
                      }
                      $fechaActual = date('Y-m-d'); 
                      $fecha_vencimiento = date("d-m-Y",strtotime($fechaActual."+'$60'+ days")); 
                      try{ //Se evalua el tipo de persona,dependiendo de que tipo es se llenan en sus correspondientes tablas
                        
                         if($tipo_persona == "1" ){// Para registrar tipo de persona administrador
                            $sentencia = $db->prepare("SELECT nombre_usuario FROM `tbl_usuario`  where NOMBRE_USUARIO = (?) ");
                            $sentencia->execute(array($nombre_usuario));
                            $row=$sentencia->fetchColumn();
                            if($row>0){// si hay registros con el mismo nombre 
                              echo "<script>
                              alert('El Nombre de usuario $nombre_usuario ya se encuentra registrado');
                              window.location = 'crudpersonas';
                              </script>";
                              exit;
                             }else{//si el usuario no existe en tbl_usuario,entonces se puede registrar 
                              try{
                                $rol= "1";
                                $insert = "CALL Sp_insertar_usuario('$primer_nombre','$segundo_nombre','$primer_apellido','$segundo_apellido','$identidad',
                                '$fecha_nacimiento','$lugar_nacimiento','$tipo_persona','$usuario','$sexo','$direccion','$telefono','$correo','$nombre_usuario',
                                '$estado','$rol','$contrasena');" ;
                                 $consulta=$conn->query($insert);
                                 if ($resultadomateria = mysqli_fetch_assoc($consulta)>0) {
                                  echo "<script> 
                                    location.href = 'crudpersonas';
                                    </script>";
                                    $codigoObjeto=1;
                                    $accion='Registro';
                                    $descripcion= 'Se registro un Usuario ';
                                    bitacora($codigoObjeto, $accion,$descripcion);
                                    exit;
                                  }else{
                                    echo "<script> 
                                    alert('Ocurrio algun error,comunicarse con el administrador!');
                                    location.href = 'crudpersonas';
                                    </script>";
                                    exit;
                                  }
                              }catch(PDOException $e){
                                echo $e->getMessage(); 
                                return false;
                              }
                            }//fin del else de insertar administrador
                          }else if($tipo_persona == "2"){ //Para tutores uwu
                            try{
                              $sentencia = $db->prepare("SELECT nombre_usuario FROM `tbl_usuario`  where NOMBRE_USUARIO = (?) ");
                              $sentencia->execute(array($nombre_usuario));
                              $row=$sentencia->fetchColumn();
                              if($row>0){// si hay registros con el mismo nombre 
                                echo "<script>
                                alert('El Nombre de usuario $nombre_usuario ya se encuentra registrado');
                                window.location = 'crudpersonas';
                                </script>";
                                exit;
                              }else{
                                $rol= "2";
                                $insert = "CALL Sp_insertar_usuario('$primer_nombre','$segundo_nombre','$primer_apellido','$segundo_apellido','$identidad',
                                '$fecha_nacimiento','$lugar_nacimiento','$tipo_persona','$usuario','$sexo','$direccion','$telefono','$correo','$nombre_usuario',
                                '$estado','$rol','$contrasena');" ;
                                 $consulta=$conn->query($insert);
                                if($resultado = mysqli_fetch_assoc($consulta)>0 ){
                                  echo "<script> 
                                  location.href = 'crudpersonas';
                                  </script>";
                                  exit;
                                }else{
                                  echo "<script> 
                                  alert('No se puede registrar al tutor');
                                  location.href = 'crudpersonas';
                                  </script>";
                                  exit;
                                }
                              }
                            }catch(PDOException $e){
                            echo $e->getMessage(); 
                            return false;
                            }//Fin de registrar tutor

                          }else if($tipo_persona == "9" ){//para enfermeras y enfermeros si existen :v
                            try{
                              $sentencia = $db->prepare("SELECT nombre_usuario FROM `tbl_usuario`  where NOMBRE_USUARIO = (?) ");
                              $sentencia->execute(array($nombre_usuario));
                              $row=$sentencia->fetchColumn();
                              if($row>0){// si hay registros con el mismo nombre 
                                echo "<script>
                                alert('El Nombre de usuario $nombre_usuario ya se encuentra registrado');
                                window.location = 'crudpersonas';
                                </script>";
                                exit;
                              }else{
                                $rol= "7"; //roll de enfermero
                                $insert = "CALL Sp_insertar_usuario('$primer_nombre','$segundo_nombre','$primer_apellido','$segundo_apellido','$identidad',
                                '$fecha_nacimiento','$lugar_nacimiento','$tipo_persona','$usuario','$sexo','$direccion','$telefono','$correo','$nombre_usuario',
                                '$estado','$rol','$contrasena');" ;
                                 $consulta=$conn->query($insert);
                                if($resultado = mysqli_fetch_assoc($consulta)>0 ){
                                  echo "<script> 
                                  location.href = 'crudpersonas';
                                  </script>";
                                  exit;
                                }else{
                                  echo "<script> 
                                  alert('No se puede registrar al tutor');
                                  location.href = 'crudpersonas';
                                  </script>";
                                  exit;
                                }
                              }
                            }catch(PDOException $e){
                            echo $e->getMessage(); 
                            return false;
                            }//fin regisrtrar enfermeros


                          }elseif($tipo_persona == "4" ){ //para estudiantes
                           try{
                              $queryregistrarp = "INSERT INTO TBL_PERSONA( PRIMER_NOMBRE,SEGUNDO_NOMBRE,PRIMER_APELLIDO,SEGUNDO_APELLIDO,DNI, FECHA_NACIMIENTO,LUGAR_NACIMIENTO,
                              FECHA_INSCRIPCION,CODIGO_TIPO_PERSONA,CREADO_POR_USUARIO,SEXO,DIRECCION)
                              VALUES('$primer_nombre','$segundo_nombre','$primer_apellido','$segundo_apellido','$identidad','$fecha_nacimiento','$lugar_nacimiento',
                              '$fechaActual','$tipo_persona','$usuario','$sexo','$direccion')";
                              $resultado=$conn->query($queryregistrarp);
                              $codigo = mysqli_insert_id($conn);
                              //inserta en telefono
                              $querytelefono = "INSERT INTO TBL_TELEFONO (NUMERO_TELEFONO, CODIGO_PERSONA) VALUES('$telefono','$codigo')";
                              $resultado1=$conn->query($querytelefono);
                               //inserta en  correo
                              $querycorreo = "INSERT INTO TBL_CORREO_ELECTRONICO(CORREO_PERSONA, CODIGO_PERSONA) VALUES ('$correo','$codigo')";
                              $resultado2=$conn->query($querycorreo);

                              if (is_array($_POST['sacramento'])) {
                                foreach ($_POST['sacramento'] as $sacramento){
                                  $sentencia = $db->prepare(" CALL Sp_insertar_sacramentos(?,?);");
                                  $sentencia->execute(array($sacramento,$codigo));
                                  $row1=$sentencia->fetchColumn();
                                }
                                $row1=$sentencia->fetchColumn();
                              }
                                $conn->commit();
                              if($resultado>0  &&  $resultado1 >0  &&  $resultado2 > 0  ){ 
                                echo "<script> 
                                location.href = 'crudpersonas';
                                </script>";
                                exit;
                              }else{
                                $conn->rollback();
                                echo "<script> 
                                alert('No se pudo registrar la persona,comunicarse con el admin');
                                location.href = 'crudpersonas';
                                </script>";
                                exit;
                              }
                            }catch(PDOException $e){
                            echo $e->getMessage(); 
                            return false;
                            }
                            //CODIGO PARA INSERTAR UN MEDICO CON SU ESPECIALIDAD
                          }elseif( ($tipo_persona == "5") ){
                            $rol = "5";
                            try{
                              $sentencia = $db->prepare("SELECT nombre_usuario FROM `tbl_usuario`  where NOMBRE_USUARIO = (?) ");
                              $sentencia->execute(array($nombre_usuario));
                              $row=$sentencia->fetchColumn();
                              if($row>0){// si hay registros con el mismo nombre 
                                echo "<script>
                                alert('El Nombre de usuario $nombre_usuario ya se encuentra registrado');
                                window.location = 'crudpersonas';
                                </script>";
                                exit;
                              }else{
                                $insert_medico = " CALL Sp_insertar_usuario_especialidad('$primer_nombre','$segundo_nombre','$primer_apellido','$segundo_apellido','$identidad',
                                '$fecha_nacimiento','$lugar_nacimiento','$tipo_persona','$usuario','$sexo','$direccion','$telefono','$correo','$nombre_usuario',
                                '$estado','$rol','$contrasena','$especialidad_medico');" ;
                                $consul =$conn->query($insert_medico);
  
                                if($resultado = mysqli_fetch_assoc($consul)>0 ){
                                  echo "<script> 
                                  location.href = 'crudpersonas';
                                  </script>";
                                  exit;
                                }else{
                                  echo "<script> 
                                  alert('No se puede registrar el medico');
                                  location.href = 'crudpersonas';
                                  </script>";
                                  exit;
                                }
                              }
                            }catch(PDOException $e){
                            echo $e->getMessage(); 
                            return false;
                            }//Fin de registrar medico
                            //CODIGO PARA INSERTAR UN PSICOLOGO CON SU ESPECIALIDAD
                          }elseif ($tipo_persona == "6"){
                            $sentencia = $db->prepare("SELECT nombre_usuario FROM `tbl_usuario`  where NOMBRE_USUARIO = (?) ");
                            $sentencia->execute(array($nombre_usuario));
                            $row=$sentencia->fetchColumn();
                            if($row>0){// si hay registros con el mismo nombre 
                              echo "<script>
                              alert('El Nombre de usuario $nombre_usuario ya se encuentra registrado');
                              window.location = 'crudpersonas';
                              </script>";
                              exit;
                            }else{
                              try{
                                $rol= "4";
                                $insert_medico = " CALL Sp_insertar_usuario_especialidad('$primer_nombre','$segundo_nombre','$primer_apellido','$segundo_apellido','$identidad',
                                '$fecha_nacimiento','$lugar_nacimiento','$tipo_persona','$usuario','$sexo','$direccion','$telefono','$correo','$nombre_usuario',
                                '$estado','$rol','$contrasena','$especialidad_psicologo');" ;
                                $consul =$conn->query($insert_medico);
  
                                if($resultado = mysqli_fetch_assoc($consul)>0 ){
                                  echo "<script> 
                                  location.href = 'crudpersonas';</script>";
                                  exit;
                                }else{
                                  echo "<script> 
                                  alert('No se puede registrar el medico');location.href = 'crudpersonas'</script>";
                                  exit;
                                }
                              }catch(PDOException $e){
                              echo $e->getMessage(); 
                              return false;
                              }

                            }
                            
                          }else if($tipo_persona == "8"){//para insertar un catequiste,comenta Diana Rut :v
                            $sentencia = $db->prepare("SELECT nombre_usuario FROM `tbl_usuario`  where NOMBRE_USUARIO = (?) ");
                            $sentencia->execute(array($nombre_usuario));
                            $row=$sentencia->fetchColumn();
                            if($row>0){// si hay registros con el mismo nombre 
                              echo "<script>
                              alert('El Nombre de usuario $nombre_usuario ya se encuentra registrado');
                              window.location = 'crudpersonas';
                              </script>";
                              exit;
                            }else{
                              try{
                                $rol ="8";
                                $insert_medico = " CALL Sp_insertar_usuario_especialidad('$primer_nombre','$segundo_nombre','$primer_apellido','$segundo_apellido','$identidad',
                                '$fecha_nacimiento','$lugar_nacimiento','$tipo_persona','$usuario','$sexo','$direccion','$telefono','$correo','$nombre_usuario',
                                '$estado','$rol','$contrasena','$especialidad_catequista');" ;
                                $consul =$conn->query($insert_medico);
  
                                if($resultado = mysqli_fetch_assoc($consul)>0 ){
                                  echo "<script> 
                                  location.href = 'crudpersonas';
                                  </script>";
                                  exit;
                                }else{
                                  echo "<script> 
                                  alert('No se puede registrar el medico');location.href = 'crudpersonas';</script>";
                                  exit;
                                }
                              }catch(PDOException $e){
                              echo $e->getMessage(); 
                              return false;
                              }
                            }
                          }else{
                            try{
                              //Insertar  personas mortales ok no :v ,demas personas no importantes del sistema :)
                              $rol = "3";
                              $insert_persona = "CALL Sp_insertar_personas_normales('$primer_nombre','$segundo_nombre','$primer_apellido',
                              '$segundo_apellido','$identidad','$fecha_nacimiento','$lugar_nacimiento','$tipo_persona','$usuario','$sexo','$direccion','$telefono','$correo');" ;
                              $consulti =$conn->query($insert_persona);
                              if($resultado = mysqli_fetch_assoc($consulti)>0 ){
                                echo "<script> 
                                location.href = 'crudpersonas';
                                </script>";
                                exit;
                              }else{
                                echo "<script> 
                                alert('No se pudo registrar la persona,comunicarse con el admin');
                                location.href = 'crudpersonas';
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



//************EDITAR USUARIO************ */
  if(isset($_POST['CODUSUARIO'])) { 
    $userregis = ($_SESSION['vario']);
    if (isset($_POST['ACT_PERSONA'])){
      $CODUSUARIO = ($_POST['CODUSUARIO']);
      $USUARIO = ($_POST['NOMUSUARIO']); 
      $PASS = ($_POST['clave_nueva']);
      $CONFIRMA = ($_POST['confirmar_clave']);
      $ROL = ($_POST['ROLUSUARIO']);
      $ESTADO = ($_POST['ESTADOUSUARIO']);
      $correo_mofi = ($_POST['correo_modi']);
      $nombre_modi = ($_POST['nombre_modi']);
      $apellido_modi = ($_POST['apellido_modi']);
      $connueva = ($_POST['clave_nueva']);
      $confconn = ($_POST['confirmar_clave']);
      $expre = " /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]/ ";
          try{
            // evaluemos si el CORREO existe y veamos a quien le pertenece (si es igual a 0 significa que no existe si es igual o mayor a 1 significa que ya lo tiene alguien)
            $sentencia = $db->prepare("SELECT CODIGO_PERSONA FROM tbl_correo_electronico WHERE correo_persona = ?;");
            $sentencia->execute(array($correo_mofi));
            $row=$sentencia->fetchColumn();
            $ID_PERSONA_CORREO = $row;
            if($ID_PERSONA_CORREO <= 0 || $ID_PERSONA_CORREO == $CODUSUARIO){
                try{
                $sql = "CALL Sp_modificar_usuarios('$CODUSUARIO','$nombre_modi','$apellido_modi','$correo_mofi','$USUARIO','$ESTADO','$ROL','$userregis');" ;
                $consulta=$conn->query($sql);
                if ($consulta>0) {
                  if (empty($connueva) and empty($confconn)) {
                    echo "<script>
                    window.location = 'ediusuarios';
                    </script>";
                  }else{
                    if($connueva<>$confconn){
                      echo "<script>
                    alert('Las contraseñas no son iguales');
                    window.location = 'ediusuarios';
                    </script>";
                    }else{
                      if(preg_match($expre,$connueva)){
                        $pass= crypt($connueva,'$2a$07$usesomesillystringforsalt$');
                        $sql = "CALL Sp_reset_contrasena('$CODUSUARIO', '$pass';" ;
                        $consulta=$conn->query($sql);
                        if ($consulta>0) {
                          echo "<script>
                          window.location = 'ediusuarios';
                          </script>";
                        }
                      }else{
                        echo "<script>
                        alert('La contraseña que ingreso no es segura');
                        window.location = 'ediusuarios';
                        </script>";
                      }
                    }
                  }
                }else{ 
                echo "<script>
                alert('Error al actualizar el registro');
                window.location = 'ediusuarios';
                </script>";
                }
                return true;
                } catch(PDOException $e) {
                echo $e->getMessage();  
                return false;
                }
            }elseif($ID_PERSONA_CORREO <> $CODUSUARIO){ 
            echo "<script>
            alert('Ya existe una persona con el número de telefono: $correo_mofi');
           window.location = 'ediusuarios';
            </script>";
            }//if del correo 
            return true;
          } catch(PDOException $e) {
          echo $e->getMessage();  
          return false;
          }
  }//if padre
}//if padre del padre :v

  
  //FUNCION PARA ELIMINAR EL USUARIO,FUNCIONA BIEN,NO TOCAR,no funciona del todo bien :v asi que si pueden tocar
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


  
