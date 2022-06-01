<?php
session_start();
include_once "../../modelos/conexion3.php";
?>
<?php
  $parametro ="NUM_MAX_CARACTER";
  $sentencia = $db->prepare("SELECT VALOR FROM tbl_parametros WHERE PARAMETRO =(?);");
  $sentencia->execute(array($parametro));
  $row=$sentencia->fetchColumn();
  if($row>0){
    $valor = $row;
  }
?>
<?php
  $parametro1 ="NUM_MIN_CARACTER";
  $sentencia1 = $db->prepare("SELECT VALOR FROM tbl_parametros WHERE PARAMETRO =(?);");
  $sentencia1->execute(array($parametro1));
  $row1 = $sentencia1->fetchColumn();
  if($row1>0){
    $valor1 = $row1;
  }
?>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="./fontawesome-free/css/all.min.css">
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <title>Cambio de contraseña</title>
  </head>
 <style>
     /*Estilos aplicados para usar en las validaciones de js,donde los
     inputs cambien de colores  */
     body{
        background-color:#e9ecef; 
     }
    .formulario__input-error {
      font-size: 13px;
      margin-bottom: 0;
      display: none;
     }
    .formulario__input-error-activo {
     display: block;
     }
    .formulario__grupo-incorrecto .form-control{
     border: 3px solid #bb2929;
    }
    .formulario__grupo-correcto .form-control{
     border:  solid #1ed12d;
     }
 </style>
<body>
    <div class="row align-items-center justify-content-center mt-5 pt-4">
          <div class="col-md-5 rounded" style="width: 23rem;" >
            
            <div  class="card">
              <div class="card-body"> <!--action que  manda al archivo donde estan las validaciones,acuerdensen de poner el method="POST"! -->
                 <h4 class="fw-bold text-center ">Cambiar Contraseña</h4><hr style="color:green;" size="4px";>
                <form  method="POST" action="../../modelos/validar_contrasena_preguntas.php" class="formulario" id="formulario">
                  <div class="row">
                     <label class="control-label mb-2">Usuario</label> <!--Muestra el usuario que se ingreso desde la pantalla para cambio de contraseña -->
                     <div class="input-group mb-3">
                        <input onkeyup="mayus(this);" autocomplete = "off" value="<?php echo ($_SESSION['vario']);?>"  id="usuarioc" type="text" name="usuarioc" class="form-control" readonly required >
                    </div>
                    <label class="control-label mb-2">Contrase&ntilde;a</label>
                    <div class="input-group mb-3" id="grupo__clave_nueva">
                        <input  type="password" id="clave_nueva" name="clave_nueva" class="form-control" 
                          required  minlength="<?php echo $valor1;?>"  maxlength="<?php echo $valor?>"  title="Configure con los valores solicitados" onkeyup="noespacio(this, event)" onkeyup="sinespacio(this);">
                          <div class="input-group-prepend">
                            <button id="show_password" class="form-control btn-outline-secondary  btn-block" type="button" onKeyDown="sinespacio(this);" onclick="mostrar1()"><span class="icon1 fa fa-eye-slash"></button>
                          </div>
                        <p class="formulario__input-error">Debe tener minimo <?php echo $valor1;?> caracteres,una minúscula,mayúscula ,número y caracter especial.</p>
                    </div>
                    
                    <label class="control-label mb-2">Confirmar contrase&ntilde;a</label>
                    <div class="input-group mb-3 " id="grupo__confirmar_clave">
                        <input  type="password" id="confirmar_clave" name="confirmar_clave" class="form-control"
                         required minlength="<?php echo $valor1;?>"  maxlength="<?php echo $valor?>"   title="Configure con los valores solicitados" onkeyup="noespacio(this, event)" onkeyup="sinespacio(this);">
                         <div class="input-group-append">
                           <button id="show_password" class="form-control btn-outline-secondary btn-block" type="button"  onclick="mostrar2()"><span class="icon2 fa fa-eye-slash"></button>
                         </div>
                    </div>
                    <br><br>
                    <div class="d-grid">
                      <button type="submit" name="cambiar_clave" id="cambiar_clave" class="btn btn btn-success btn-block">Cambiar Contrase&ntilde;a</button>
                    </div>
                
                  </div>
                </form>
              </div>
           </div>
        </div>
    </div>
    <!--Funciones para visualizar la contraseña -->
    <script type="text/javascript">// funcion que convierte en mayuscula lo que se vaya ingresando.
        function mayus(e) {
        e.value = e.value.toUpperCase();
        }
        </script>
        <script type="text/javascript">
        //funciones para ver la contraseña por cada input
        function mostrar2(){ 
        var cla1 = document.getElementById("confirmar_clave");
            if(cla1.type == "password"){
              cla1.type = "text";
              $('.icon2').removeClass('fa fa-eye-slash').addClass('fa fa-eye');
          }else{
              cla1.type = "password";
              $('.icon2').removeClass('fa fa-eye').addClass('fa fa-eye-slash');
            }
        }
      </script>

    <script type="text/javascript">
      function mostrar1(){
        var cla = document.getElementById("clave_nueva");//se debe de crear un variable que recoja el id del input donde se quiera ver la clave.
        if(cla.type == "password"){
          cla.type = "text";
          $('.icon1').removeClass('fa fa-eye-slash').addClass('fa fa-eye');
        }else{
          cla.type = "password";
          $('.icon1').removeClass('fa fa-eye').addClass('fa fa-eye-slash');
        }
      }
    </script>
    <script type="text/javascript">
      function sinespacio(e) { //funcion sin espacion la clave
        var cadena =  e.value;
        var limpia = "";
        var parts = cadena.split(" ");
        var length = parts.length;
        for (var i = 0; i < length; i++) {
          nuevacadena = parts[i];
          subcadena = nuevacadena.trim();
          if(subcadena != "") {
            limpia += subcadena + " ";
          }
        }
        limpia = limpia.trim();
        e.value = limpia;
      };
    </script>
  <script language="javascript">
    function noespacio(campo, event) {
      CadenaaReemplazar = " ";
      CadenaReemplazo = "";
      CadenaTexto = campo.value;
      CadenaTextoNueva = CadenaTexto.split(CadenaaReemplazar).join(CadenaReemplazo);
      campo.value = CadenaTextoNueva;
    }
 </script>
    <script src="../../modelos/validacion_clave.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
  </body>
</html>
