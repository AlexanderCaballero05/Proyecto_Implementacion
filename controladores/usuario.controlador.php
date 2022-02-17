<?php

cLass ControladorUsuarios
{

/*=============================================
=            INGRESO DE USUARIO              =
=============================================*/

static public function ctrIngresoUsuario(){

	if(isset($_POST["usuario"])){

	include "conexion.php";

		$Usuario = $_POST["usuario"];
        $fechaactual=strtotime(date("d-m-Y H:i:00",time()));
		$tabla = "tbl_usuarios";
		$item = "nombre_usuario";
		$tbl= "tbl_parametros";
		$ite = "codigo_parametro";
		$val =1;
		$respuesta = ModeloUsuarios::MdlMostrarUsuarios($tabla, $item, $Usuario);
		$respu = ModeloUsuarios::MdlMostrarparametros($tbl, $ite, $val);
		$contra =$_POST["contrasena"];

								if ($respuesta["nombre_usuario"] == $_POST["usuario"] && $respuesta["AES_DECRYPT(contrasena,'SI-PP')"] == $contra && $respuesta["codigo_estado"] ==2)
									{

										$_SESSION["iniciarSesion"] = "ok";

										$va = $_POST["usuario"];
										
										$u=($_POST["usuario"]);

													$_SESSION['vario'] =$u;
													$_SESSION['userrr'] =$respuesta["codigo_tipo_rol"];

													echo '<script>
										Swal.fire({
											type: "success",
											title: "!Bienvenido al Sistema!",
											showConfirmButton: "true",
											confirmButtonText: "Entrar",
											closeOnConfirm: "false",
											background:"rgb(0,0,0,0.95)"

											}).then((result)=>{

												if (result.value){

													window.location="../Vistas/index.php"
												}
												});
												</script>';
                        //preguntar por el parametro =16
									}else if ($respuesta["nombre_usuario"] == $_POST["usuario"] && $respuesta["AES_DECRYPT(contrasena,'SI-PP')"] == $contra && $respuesta["CODIGO_ESTADO"] ==1){
										echo '<script>
										Swal.fire({
											type: "success",
											title: "!Debe contestar las preguntas de seguirdad y cambiar su contraseña provisional!",
											showConfirmButton: "true",
											confirmButtonText: "Entrar",
											closeOnConfirm: "false",
											background:"rgb(0,0,0,0.95)"

											}).then((result)=>{

												if (result.value){

													location.href = "vistas/modulos/preseguridad.php";
												}
												});
												</script>';
                     
											}else if ($respuesta["nombre_usuario"] == $_POST["usuario"] && $respuesta["AES_DECRYPT(Contrasena,'SI-PP')"] == $contra && $respuesta["codigo_estado"] ==17){
												echo '<script>
												Swal.fire({
													type: "success",
													title: "!Contraseña de recuperacion correcta, por razones de seguridad debe restablecer su contraseña!",
													showConfirmButton: "true",
													confirmButtonText: "Entrar",
													closeOnConfirm: "false",
													background:"rgb(0,0,0,0.95)"
		
													}).then((result)=>{
		
														if (result.value){
		
															location.href = "vistas/login/recuperar_clave.php";
														}
														});
														</script>';
									}else if ($respuesta["nombre_usuario"] == $_POST["usuario"] && $respuesta["AES_DECRYPT(contrasena,'SI-PP')"] == $contra && $respuesta["codigo_estado"] ==3){
													$va = $_POST["ingUsuario"];
													include "conexion3.php";
											echo '<script>
											Swal.fire({
												type: "error",
												title: "!Usuario Inhabilitado!",
												showConfirmButton: "true",
												confirmButtonText: "Intentar de nuevo",
												closeOnConfirm: "false",
												background:"rgb(0,0,0,0.95)"

												}).then((result)=>{

													if (result.value){

														location.href = "vistas/login/recuperar_clave.php"";// preguntar esta direccion
													}
													});
													</script>';
									} 
									else if ($respuesta["nombre_usuario"] == $_POST["usuario"] && $respuesta["AES_DECRYPT(contrasena,'SI-PP')"] == $contra && $respuesta["codigo_estado"] ==4){
										$va = $_POST["usuario"];
										include "conexion.php";
								echo '<script>
								Swal.fire({
									type: "error",
									title: "!Usuario Bloqueado!",
									showConfirmButton: "true",
									confirmButtonText: "Intentar de nuevo",
									closeOnConfirm: "false",
									background:"rgb(0,0,0,0.95)"

									}).then((result)=>{

										if (result.value){

											window.location = "login";
										}
										});
										</script>';
						} else if(($respuesta["Par_valor"]==$respu["Valor"])and ($respuesta["AES_DECRYPT(contrasena,'SI-PP')"] <> $_POST["contrasena"]) ){
              $db_host_name="localhost";
              $db_name="bd_prueba2_prosecar";
              $db_user_name="root";
              $db_password="";	

							$conn = new mysqli($db_host_name,   $db_name, $db_user_name,  $db_password);
											if($conn->connect_error){
												die("Conexión fallida: ".$conn->connect_error);

											}
							$usuario = $_POST["Usuario"];
							$query = "UPDATE tbl_ms_usuarios SET 
						     codigo_estado =4
						    WHERE nombre_usuario='$valor'";
							echo '<script>
							Swal.fire({
								type: "error",
								title: "!Usuario Bloqueado!",
								showConfirmButton: "true",
								confirmButtonText: "Intentar de nuevo",
								closeOnConfirm: "false",
								background:"rgb(0,0,0,0.95)"

								}).then((result)=>{

									if (result.value){

										window.location = "login";
									}
									});
									</script>';
						    $dato=$conn->query($query);
						} else {
              $db_host_name="localhost";
              $db_name="bd_Prueba2_Prosecar";
              $db_user_name="root";
              $db_password="";	

							$conn = new mysqli($db_host_name,   $db_name, $db_user_name,  $db_password);
							if($conn->connect_error){
								die("Conexión fallida: ".$conn->connect_error);

							}
			$va = $_POST["usuario"];
      //preguntar por la tbla de segmento 
			$query = "UPDATE tbl_parametros_usuario  SET 
			Par_Valor=Par_valor+1
		   WHERE codigo_usuario=(SELECT codigo_usuario From tbl_usuarios where nombre_usuario = '$va') AND Codigo_parametro = 1;";
		   $dato=$conn->query($query);
	echo '<script>
	Swal.fire({
		type: "error",
		title: "!Usuario y Contraseña Incorrectos !",
		showConfirmButton: "true",
		confirmButtonText: "Intentar de nuevo",
		closeOnConfirm: "false",
		background:"rgb(0,0,0,0.95)"

		}).then((result)=>{

			if (result.value){

				window.location = "login";
			}
			});
			</script>';				
														
									}


															}
														}

/*=============================================
=            REGISTRO DE USUARIO              =
=============================================*/



	/*--=====================================
  =            MOSTRAR USUARIO             =
  ======================================--*/

  static public function ctrMostrarUsuarios($item, $usuario){

  	$tabla = "tbl_usuarios";
  	$respuesta = ModeloUsuarios::MdlMostrarUsuarios($tabla, $item, $usuario );

  	return $respuesta;
  }

}