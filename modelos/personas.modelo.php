<!-- -----------------------------------------------------------------------
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
    Programa:          Pantalla de codigo que registra elimina y editar usuarios
    Fecha:             09-Junio-2022
    Programador:       Diana Rut Garcia
    descripcion:       Edita,elimina y registra un usuario
-----------------------------------------------------------------------
  Historial de Cambio
-----------------------------------------------------------------------
    Programador           Fecha                      Descripcion
Diana Rut Garcia     		09-06-2022                Cambio en mensajes bitacora
Diana Rut Garcia     		15-06-2022                Se agregaron mensajes de registro correctamente
Diana Rut Garcia        06-08-2022               Se agreo un update a la parte de actualizar el usuario
Diana Rut Garcia        11-08-2022               Modificacion en registrar familiares 
----------------------------------------------------------------------->
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
             $usuario = $_SESSION['vario'];
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
             $direccion = ($_POST['direccion']);
             $nombre_usuario = ($_POST['nombre_usuario']);
             $estado = "1";  
             $contrasena = crypt($_POST['contrasena'],'$2a$07$usesomesillystringforsalt$');
             $fechaActual = date('Y-m-d');  
               
            try{ 
                $consulta = $db->prepare("SELECT COUNT(*)  FROM tbl_persona WHERE DNI = (?);");//consulta pra verificar si el DNI existe
                $consulta->execute(array($identidad));
                $row=$consulta->fetchColumn();
                if ($row>0){
                  echo "<script>
                  alert('El numero de identidad $identidad ya se encuentra registrado');
                  window.location = 'categoria';
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
                    window.location = 'categoria';
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
                      window.location = 'categoria';
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
                            $sentencia = $db->prepare("SELECT COUNT(*)  FROM `tbl_usuario`  where NOMBRE_USUARIO = (?) ");
                            $sentencia->execute(array($nombre_usuario));
                            $row=$sentencia->fetchColumn();
                            if($row>0){// si hay registros con el mismo nombre 
                              echo "<script>
                              alert('El Nombre de usuario $nombre_usuario ya se encuentra registrado');
                              window.location = 'categoria';
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
                                   alert('Usuario registrado correctamente');
                                    location.href = 'crudpersonas';
                                    </script>";
                                   
                                    exit;
                                  }else{
                                    echo "<script> 
                                    alert('Ocurrio algun error,comunicarse con el administrador!');
                                    location.href = 'categoria';
                                    </script>";
                                    exit;
                                  }
                              }catch(PDOException $e){
                                echo $e->getMessage(); 
                                return false;
                              }
                            }//fin del else de insertar administrador
                          }else if($tipo_persona == "2"){ //Para registrar tutores uwu
                            try{
                              $sentencia = $db->prepare("SELECT COUNT(*)  FROM `tbl_usuario`  where NOMBRE_USUARIO = (?) ");
                              $sentencia->execute(array($nombre_usuario));
                              $row=$sentencia->fetchColumn();
                              if($row>0){// si hay registros con el mismo nombre 
                                echo "<script>
                                alert('El Nombre de usuario $nombre_usuario ya se encuentra registrado');
                                window.location = 'categoria';
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
                                  alert('Usuario registrado correctamente');
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
                              $sentencia = $db->prepare("SELECT COUNT(*)  FROM `tbl_usuario`  where NOMBRE_USUARIO = (?) ");
                              $sentencia->execute(array($nombre_usuario));
                              $row=$sentencia->fetchColumn();
                              if($row>0){// si hay registros con el mismo nombre 
                                echo "<script>
                                alert('El Nombre de usuario $nombre_usuario ya se encuentra registrado');
                                window.location = 'categoria';
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
                                  alert('Usuario registrado correctamente');
                                  location.href = 'crudpersonas';
                                  </script>";
                                  
                                  exit;
                                }else{
                                  echo "<script> 
                                  alert('No se puede registrar el enfermero');
                                  location.href = 'crudpersonas';
                                  </script>";
                                 
                                    exit;
                                }
                              }
                            }catch(PDOException $e){
                            echo $e->getMessage(); 
                            return false;
                            }//fin regisrtrar enfermeros

                          }elseif($tipo_persona == "4" ){ //para insertar usuarios estudiantes    Arnold dejo un desastre el codigo que yo tenia ordenado 
                           try{
                              $sentencia = $db->prepare("SELECT COUNT(*)  FROM `tbl_usuario`  where NOMBRE_USUARIO = (?) ");
                              $sentencia->execute(array($nombre_usuario));
                              $row=$sentencia->fetchColumn();
                              if($row>0){
                                echo "<script> alert('El Nombre de usuario $nombre_usuario ya se encuentra registrado'); window.location = 'categoria';</script>";
                                exit;
                              }else{
                                $rol= "8";
                                $fechaActual = date('Y-m-d');

                                 $insert = "INSERT INTO TBL_PERSONA (PRIMER_NOMBRE, SEGUNDO_NOMBRE, PRIMER_APELLIDO, SEGUNDO_APELLIDO,
                                 DNI, FECHA_NACIMIENTO, LUGAR_NACIMIENTO, CODIGO_TIPO_PERSONA, SEXO, DIRECCION, FECHA_INSCRIPCION)
                                VALUES ('$primer_nombre','$segundo_nombre','$primer_apellido','$segundo_apellido','$identidad',
                                '$fecha_nacimiento','$lugar_nacimiento','$tipo_persona','$sexo','$direccion','$fechaActual' )";
                                $consulta=$conn->query($insert);
                                $codigo_persona = mysqli_insert_id($conn);
                                $insert_telefono = "INSERT INTO tbl_telefono(NUMERO_TELEFONO, CODIGO_PERSONA)
                                VALUES('$telefono', '$codigo_persona')";
                                $consulta_telefono=$conn->query($insert_telefono);

                                $insert_correo = "INSERT INTO tbl_correo_electronico(correo_persona,CODIGO_PERSONA) VALUES ('$correo', '$codigo_persona')";
                                $consulta_correo=$conn->query($insert_correo);

                                $insert_usuario = "INSERT INTO tbl_usuario(CODIGO_PERSONA,NOMBRE_USUARIO,CODIGO_ESTADO, CODIGO_TIPO_ROL, CONTRASENA, CREADO_POR, FECHA_CREACION)
                                VALUES ('$codigo_persona', '$nombre_usuario', '$estado','$rol','$contrasena', '$usuario','$fechaActual')";      
                                $consulta_usuario=$conn->query($insert_usuario);
                                         
                                 $grado = ($_POST['GRADO']);
                                 $repitente = ($_POST['REPITENTE']);
                                 $indice = ($_POST['INDICE']);
                                 $materias = ($_POST['MATERIAS']);
                                 $pasatiempos = ($_POST['PASATIEMPOS']);
                                 $distractores = ($_POST['DISTRACTORES']);
                                 $metas = ($_POST['METAS']);

                                 $query_estudiante = "INSERT INTO tbl_estudiante(CODIGO_PERSONA, GRADO_ACTUAL, REPITENTE, INDICE_ACADEMICO, MATE_BAJO_RENDI, PASATIEMPOS, DISTRACTORES_ESCOLARES, METAS)
                                 VALUES ('$codigo_persona','$grado','$repitente','$indice','$materias', '$pasatiempos', '$distractores', '$metas'); ";
                                $resul=$conn->query($query_estudiante);
                                $codigo = mysqli_insert_id($conn);

                                //inicio del insert de dispositivos
                              if(is_array($_POST['dispositivos'])){
                                foreach ($_POST['dispositivos'] as $dispositivos){
                                  $query_contenido = $db->prepare("CALL Sp_insertar_socieconomico_dispositivos(?,?);");
                                  $query_contenido->execute(array($dispositivos,$codigo));     
                                $conn->commit();
                                }
                            }  //fin del insert de dispositivos

                            //inicio del insert de servicios
                            if(is_array($_POST['servicios'])){
                                foreach($_POST['servicios'] as $servicios){
                                  $sp_servicios = $db->prepare("CALL Sp_insertar_socieconomico_servicios(?,?);");
                                  $sp_servicios->execute(array($servicios,$codigo));
                                  $conn->commit();
                                }
                            } //fin del insert de servicios

                            //inicio del insert de proveedor
                          if(is_array($_POST['proveedor'])){
                            foreach($_POST['proveedor'] as $proveedor){
                            $sp_proveedor = $db->prepare("CALL Sp_insertar_socieconomico_proveedor(?,?);");
                            $sp_proveedor->execute(array($proveedor,$codigo));
                            $conn->commit();
                              }
                          } //fin del insert de servicios

                            //inicio del insert de basicos
                        if(is_array($_POST['basicos'])){
                          foreach($_POST['basicos'] as $basicos){
                          $sp_basicos = $db->prepare("CALL Sp_insertar_socieconomico_basicos(?,?);");
                          $sp_basicos->execute(array($basicos,$codigo));
                          $conn->commit();
                          }
                        } //fin del insert de servicios

                        if(is_array($_POST['sacramento'])) {//codigo para insertar los sacramentos
                          foreach ($_POST['sacramento'] as $sacramento){
                            $sentencia = $db->prepare(" CALL Sp_insertar_sacramentos(?,?);");
                            $sentencia->execute(array($sacramento,$codigo));
                            $conn->commit();
                          }
                      }//fin del insert de sacramentos estudiantes

                         if($consulta >0 ){
                          echo "<script> 
                          alert('Usuario registrado correctamente');
                          location.href = 'crudpersonas';
                           </script>";
                          
                           exit;
                          }else{
                            echo "<script> 
                            alert('No se puede registrar el estudiante');
                            location.href = 'categoria';
                            </script>";
                            exit;
                          }
                        }
                          }catch(PDOException $e){
                            echo $e->getMessage(); 
                            return false;
                            }//fin de insertar al estudiante
                            
                          }elseif( ($tipo_persona == "5") ){ //CODIGO PARA INSERTAR UN MEDICO CON SU ESPECIALIDAD
                            $rol = "5";//rol de medico
                            try{
                              $sentencia = $db->prepare("SELECT COUNT(*)  FROM `tbl_usuario`  where NOMBRE_USUARIO = (?) ");
                              $sentencia->execute(array($nombre_usuario));
                              $row=$sentencia->fetchColumn();
                              if($row>0){// si hay registros con el mismo nombre 
                                echo "<script>
                                alert('El Nombre de usuario $nombre_usuario ya se encuentra registrado');
                                window.location = 'categoria';
                                </script>";
                                exit;
                              }else{
                                $especialidad_medico = ($_POST['medico']); 
                                $insert_medico = " CALL Sp_insertar_usuario_especialidad('$primer_nombre','$segundo_nombre','$primer_apellido','$segundo_apellido','$identidad',
                                '$fecha_nacimiento','$lugar_nacimiento','$tipo_persona','$usuario','$sexo','$direccion','$telefono','$correo','$nombre_usuario',
                                '$estado','$rol','$contrasena','$especialidad_medico');" ;
                                $consul =$conn->query($insert_medico);
  
                                if($resultado = mysqli_fetch_assoc($consul)>0 ){
                                  echo "<script> 
                                  alert('Usuario registrado correctamente');
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
                            $sentencia = $db->prepare("SELECT COUNT(*)  FROM `tbl_usuario`  where NOMBRE_USUARIO = (?) ");
                            $sentencia->execute(array($nombre_usuario));
                            $row=$sentencia->fetchColumn();
                            if($row>0){// si hay registros con el mismo nombre 
                              echo "<script>
                              alert('El Nombre de usuario $nombre_usuario ya se encuentra registrado');
                              window.location = 'categoria';
                              </script>";
                              exit;
                            }else{
                              try{
                                $rol= "4";//rol del psicologo
                                $especialidad_psicologo = ($_POST['psicologo']); 
                                $insert_medico = " CALL Sp_insertar_usuario_especialidad('$primer_nombre','$segundo_nombre','$primer_apellido','$segundo_apellido','$identidad',
                                '$fecha_nacimiento','$lugar_nacimiento','$tipo_persona','$usuario','$sexo','$direccion','$telefono','$correo','$nombre_usuario',
                                '$estado','$rol','$contrasena','$especialidad_psicologo');" ;
                                $consul =$conn->query($insert_medico);
  
                                if($resultado = mysqli_fetch_assoc($consul)>0 ){
                                  echo "<script>
                                  alert('Usuario registrado correctamente');
                                  location.href = 'crudpersonas';</script>";
                                  
                                    exit;
                                }else{
                                  echo "<script> 
                                  alert('No se puede registrar el medico');location.href = 'categoria'</script>";
                                  exit;
                                }
                              }catch(PDOException $e){
                              echo $e->getMessage(); 
                              return false;
                              }
                            }
                          }else if($tipo_persona == "8"){//Para insertar un catequista :)
                            $sentencia = $db->prepare("SELECT COUNT(*)  FROM `tbl_usuario`  where NOMBRE_USUARIO = (?) ");
                            $sentencia->execute(array($nombre_usuario));
                            $row=$sentencia->fetchColumn();
                            if($row>0){// si hay registros con el mismo nombre 
                              echo "<script>
                              alert('El Nombre de usuario $nombre_usuario ya se encuentra registrado');
                              window.location = 'categoria';
                              </script>";
                              exit;
                            }else{
                              try{
                                $especialidad_catequista =   ($_POST['catequista']); 
                                $rol ="6";//rol de catequista
                                $insert_medico = " CALL Sp_insertar_usuario_especialidad('$primer_nombre','$segundo_nombre','$primer_apellido','$segundo_apellido','$identidad',
                                '$fecha_nacimiento','$lugar_nacimiento','$tipo_persona','$usuario','$sexo','$direccion','$telefono','$correo','$nombre_usuario',
                                '$estado','$rol','$contrasena','$especialidad_catequista');" ;
                                $consul =$conn->query($insert_medico);
                                if($resultado = mysqli_fetch_assoc($consul)>0 ){
                                  echo "<script> 
                                  alert('Usuario registrado correctamente');
                                  location.href = 'crudpersonas';
                                  </script>";
                                  
                                    exit;
                                }else{
                                  echo "<script> 
                                  alert('No se puede registrar el medico');location.href = 'categoria';</script>";
                                  exit;
                                }
                              }catch(PDOException $e){
                              echo $e->getMessage(); 
                              return false;
                              }
                            }
                          }else{ //para insertar familiares
                            try{
                              //Insertar  personas FAMILIARES
                              $estado_civil = ($_POST['estado_civil']);
                              $nivel_edu = ($_POST['nivel_educativo']);
                              $ingresos = ($_POST['ingresos']);
                              $iglesia = ($_POST['iglesia']);
                              $insert_persona = "CALL Sp_insertar_familiares('$primer_nombre','$segundo_nombre','$primer_apellido',
                              '$segundo_apellido','$identidad','$fecha_nacimiento','$lugar_nacimiento','$tipo_persona','$usuario','$sexo','$direccion','$telefono','$correo',
                              '$estado_civil','$nivel_edu','$ingresos','$iglesia');" ;
                              $consulti =$conn->query($insert_persona);

                              if($resultado = mysqli_fetch_assoc($consulti)>0 ){
                                echo "<script> 
                                alert('persona registrada correctamente');
                                location.href = 'crudpersonas';
                                </script>";
                                  
                              }else{
                                echo "<script> 
                                alert('No se pudo registrar la persona,comunicarse con el admin');
                                location.href = 'categoria';
                                </script>";
                                exit;
                              }
                            }catch(PDOException $e){
                            echo $e->getMessage(); 
                            return false;
                            }
                          }//cierre del else de tipos de usuario
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
//Ordenado y comentado para su comprension persona que revise este codigo Y SI TOCA DEJOLO COMO ESTA,SI


//************EDITAR USUARIO************ */
  if(isset($_POST['CODUSUARIO'])) { 
    $userregis = ($_SESSION['vario']);
    if (isset($_POST['ACT_PERSONA'])){
      $CODUSUARIO = ($_POST['CODUSUARIO']);
      $USUARIO = ($_POST['NOMUSUARIO']); 
      $PASS = ($_POST['clave_nueva']);
      $CONFIRMA = ($_POST['confirmar_clave']);
      $ESTADO = ($_POST['ESTADOUSUARIO']);
      $ROLL = ($_POST['ROLUSUARIO']);
      $correo_mofi = ($_POST['correo_modi']);
      $nombre_modi = ($_POST['nombre_modi']);
      $apellido_modi = ($_POST['apellido_modi']);
      $connueva = ($_POST['clave_nueva']);
      $confconn = ($_POST['confirmar_clave']);
      $expre = " /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]/ ";
      date_default_timezone_set("America/Guatemala");
      $Fechaactual=  date("Y-m-d" );

            //Para cuando se cambie el estado a activo de la persona se modifique el par valor del usuario
            if($ESTADO == '2'){
            $sql = "UPDATE tbl_parametros_usuarios 
            SET PAR_VALOR = '0'
            WHERE CODIGO_USUARIO = '$CODUSUARIO'
            AND CODIGO_PARAMETRO = '1'; ";
            $consulta=$conn->query($sql); 
            }

      if($ROLL == "1"){ //Determina depende del roll que tipo de persona le corresponde,asi poder actualizar con ese tipo de persona
        $tipoPersona = "1"; // persona administrador
      }elseif($ROLL == "2"){
        $tipoPersona = "2"; // persona tutor
      }elseif($ROLL == "3"){
        $tipoPersona = "3"; //persona no definiada
      }elseif($ROLL == "4"){
        $tipoPersona = "6"; // persona psicologo
      }elseif($ROLL == "5"){
        $tipoPersona = "5"; // persona medico
      }elseif($ROLL == "6"){
        $tipoPersona = "8";// persona catequista
      }elseif($ROLL == "7"){
        $tipoPersona = "9"; // persona enfermero
      }elseif($ROLL == "8"){
        $tipoPersona = "4"; // persona estudiante
      }else{
        $tipoPersona = "3"; // En el caso de ser diferente
      }
      

      if($ESTADO == "3"){
        $actualizaresatado = "UPDATE TBL_CARGA_ACADEMICA SET FECHA_FINAL = '$Fechaactual' WHERE CODIGO_PERSONA = '$CODUSUARIO';";
        $Respuesta=$conn->query($actualizaresatado);
        if($Respuesta>0){
          echo "<script>
          window.location = 'ediusuarios';
          </script>";
        }else{
          echo "<script>
          window.location = 'ediusuarios';
          </script>";
        }
      }
          try{
            // evaluemos si el CORREO existe y veamos a quien le pertenece (si es igual a 0 significa que no existe si es igual o mayor a 1 significa que ya lo tiene alguien)
            $sentencia = $db->prepare("SELECT CODIGO_PERSONA FROM tbl_correo_electronico WHERE correo_persona = ?;");
            $sentencia->execute(array($correo_mofi));
            $row=$sentencia->fetchColumn();
            $ID_PERSONA_CORREO = $row;
            if($ID_PERSONA_CORREO <= 0 || $ID_PERSONA_CORREO == $CODUSUARIO){
                try{

               

                $sql = "CALL Sp_modificar_usuarios('$CODUSUARIO','$nombre_modi','$apellido_modi','$correo_mofi','$USUARIO','$ESTADO','$userregis','$ROLL');" ;
                $consulta=$conn->query($sql);
                //Para cuando se cambie el rol de la persona tambien se cambie el tipo de persona 
                $UPDA = "UPDATE TBL_PERSONA SET CODIGO_TIPO_PERSONA ='$tipoPersona' WHERE CODIGO_PERSONA= '$CODUSUARIO' ";
                $updarespu=$conn->query($UPDA);
              

                 

                if ($consulta>0) {
                  if (empty($connueva) and empty($confconn)) {
                    echo "<script> alert('Usuario modificado exitosamente');
                    window.location = 'ediusuarios'; </script>";
                    include_once 'function_bitacora.php';
                    $codigoObjeto=14;
                    $codigo_registro = 2;
                    $campo = 'hola';
                    $actividad = 'SE ACTUALIZO LA INFORMACION DE UNA PERSONA';
                    $valor_actual = 'hola';
                    $valor_anterior = 'hola';
                    bitacora($codigoObjeto, $codigo_registro,$campo,$actividad,$valor_actual,$valor_anterior);
              
                    exit;

                  }else{ //Si las contraseñas son diferentes ,no permitira que se registre
                    if($connueva<>$confconn){
                      echo "<script>
                      alert('Las contraseñas no son iguales');window.location = 'ediusuarios'; </script>";
                    }else{
                      if(preg_match($expre,$connueva)){ //evalua la expresion regular,que define una contraseña segura :3
                        $pass= crypt($connueva,'$2a$07$usesomesillystringforsalt$');
                        $sql = "CALL Sp_reset_contrasena('$CODUSUARIO', '$pass');" ; //Al cumplir con los requerimientos ,se llama al procedimiento alamcenado y se actualiza la contraseña
                        $consulta=$conn->query($sql);
                        if (($consulta)>0) {
                          echo "<script> alert('Cambio exitosamente');window.location = 'ediusuarios';</script>";
                       
                          exit;
                        }
                      }else{
                        echo "<script>
                        alert('La contraseña que ingreso no es segura');window.location = 'ediusuarios';</script>";
                      }
                    }
                  }
                }else{ //En caso que surja algun error que no se puede manejar saldra el mensaje que no se pudo actualizar 
                  echo "<script>
                  alert('Error al actualizar el registro');window.location = 'ediusuarios';</script>";
                }
                return true;
                }catch(PDOException $e) {
                  echo $e->getMessage();  
                  return false;
                }
            }elseif($ID_PERSONA_CORREO <> $CODUSUARIO){  //validacion que si el numero de telefono a existe
              echo "<script>
              alert('Ya existe una persona con el número de telefono: $correo_mofi');
              window.location = 'ediusuarios';</script>";
              }//if del correo 
            return true;
          } catch(PDOException $e) {
          echo $e->getMessage();  
          return false;
          }
  }//if padre
}




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
<!-- Elaborado por Diana Rut -->