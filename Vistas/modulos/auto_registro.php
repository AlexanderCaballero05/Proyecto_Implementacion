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
Programa:          Autoregistro de usuarios
Fecha:             10-dic-2021
Programador:       Luz María Montoya Medina
Descripcion:       Pantalla que registra usuarios desde afuera del administrador
-----------------------------------------------------------------------
 Historial de Cambio
-----------------------------------------------------------------------
Programador            Fecha                Descripcion
Diana Rut Garcia	 	26-may-2022       Cambio en validaciones  -->
<?php
  include_once "conexion3.php";
?>
<?php
 include "conexionpdo.php";
  // Parametro de minimo nombre usuario
  $min_usuario = "MIN_USUARIO";
  $sentencia = $db->prepare("SELECT VALOR FROM tbl_parametros WHERE PARAMETRO =(?);");
  $sentencia->execute(array($min_usuario));
  $row=$sentencia->fetchColumn();
  if($row>0){
    $valor1 = $row;
  }
  ?>
  <?php
  //Parametro de maximo nombre usuario
  $max_usuario = "MAX_USUARIO";
  $sentencia1 = $db->prepare("SELECT VALOR FROM tbl_parametros WHERE PARAMETRO =(?);");
  $sentencia1->execute(array($max_usuario));
  $row1=$sentencia1->fetchColumn();
  if($row1>0){
    $valor2 = $row1;
  }
 ?>
<?php
  //Parametro de maximo contraseña
  $max_clave = "NUM_MAX_CARACTER";
  $sentencia2 = $db->prepare("SELECT VALOR FROM tbl_parametros WHERE PARAMETRO =(?);");
  $sentencia2->execute(array($max_clave));
  $row2=$sentencia2->fetchColumn();
  if($row2>0){
    $valor3 = $row2;
  }
?>
<?php
  $min_clave ="NUM_MIN_CARACTER";
  $sentencia3 = $db->prepare("SELECT VALOR FROM tbl_parametros WHERE PARAMETRO =(?);");
  $sentencia3->execute(array($min_clave));
  $row3 = $sentencia3->fetchColumn();
  if($row1>0){
    $valor4 = $row3;
  }
?>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="./fontawesome-free/css/all.min.css">
    <title>Autoregistro</title>
    <link rel="shortcut icon" href="../assets/dist/img/logoparroquia.jpg" type="image/x-icon">
  </head>

  <style>
       
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
   <div class="container-fluid">
     <div class="row justify-content-center mt-5 mb-5">
       <div class="col-md-6 d-lg-block col-md-8  col-sm-10  col-xl-6">
        <div  class="card ">
          <div class="card-header  ">
           <h3 class="fw-bold text-center py-3">REGISTRARSE</h3>
          </div>
          <div class="card-body">
           <form  action="../../modelos/autoregistro_validar.php"  method="POST" class="formulario" id="formulario">
           <h5>Datos Personales</h5><hr size="5px;" style="color:blue;">
             <div class="row">
                <div class="col-md-6 mb-2"><!--INICIO 1er NOMBRE-->
                 <label  class="control-label mb-2">Primer Nombre</label> 
                  <div class="form-group">
                   <input type="text" name="nombre1" class="form-control"  onkeyup="mayus(this);" minlength="3" maxlength="20" onkeypress="return soloLetras(event);"  required onblur="quitarespacios(this);" onkeydown="sinespacio(this);" required=""> 
                  </div>
                </div>
                <div class="col-md-6 mb-3"><!--INICIO 2er NOMBRE-->
                 <label  class="control-label mb-2">Segundo Nombre</label> 
                  <div class="form-group">
                   <input type="text" name="nombre2" class="form-control"  onkeyup="mayus(this);" minlength="3" maxlength="20" onkeypress="return soloLetras(event);"   > 
                  </div>
                </div>
                <div class="col-md-6 mb-3"><!--INICIO 1er APELLIDO-->
                 <label  class="control-label mb-2">Primer Apellido</label> 
                  <div class="form-group">
                   <input type="text" name="apellido1" class="form-control"  aria-label="primer apellido" onkeyup="mayus(this);" minlength="3" maxlength="20" onkeypress="return soloLetras(event);"  required onblur="quitarespacios(this);" onkeydown="sinespacio(this);" required="">
                  </div>
                </div>
                <div class="col-md-6 mb-3"><!--INICIO 2er APELLIDO-->
                 <label  class="control-label mb-2">Segundo Apellido</label> 
                  <div class="form-group">
                   <input type="text" name="apellido2" class="form-control"  aria-label="segundo apellido" onkeyup="mayus(this);" minlength="3" maxlength="20" onkeypress="return soloLetras(event);"   >
                  </div>
                </div>
             </div><!--fin del row -->
             <div class="row">
               <div class="col-md-6 mb-3">
                 <label  class="control-label mb-2">Telefono</label> 
                  <div class="form-group">
                   <input type="text" name="telefono" class="form-control" placeholder="Eje:99001100" aria-label="Número de teléfono"  maxlength="8" minlength="8" onkeypress="return solonumero(event)" required pattern="[0-9]{8,8}" onblur="quitarespacios(this);" onkeydown="sinespacio(this);" onkeyup="noespacio(this, event)">
                  </div>
                </div>
                <div class="col-md-6 mb-3">
                 <label  class="control-label mb-2">Dirección</label> 
                  <div class="form-group">
                   <input type="text" name="direccion" class="form-control"  aria-label="segundo nombre" onkeyup="mayus(this);" minlength="5" maxlength="50" onkeypress="return soloLetras(event);"    required="">
                  </div>
                </div>
              </div><!--fin row -->
              <div class="row">
               <div class="col-md-6 mb-3">
                 <label  class="control-label mb-2">DNI</label> 
                  <div class="form-group">
                    <input type="text" name="dni" class="form-control" placeholder="EJEM: 0801200308465" aria-label="dni" minlength="13" maxlength="13" required pattern="[0-9]{13,13}" onkeypress="return solonumero(event)" onblur="quitarespacios(this);" onkeydown="sinespacio(this);" onkeyup="noespacio(this, event)">
                  </div>
                </div>
                <div class="col-md-6 mb-3">
                 <label  class="control-label mb-2">Sexo</label> 
                  <div class="form-group">
                    <select name="sexo" class="form-select">
                      <?php
                        $query = "SELECT CODIGO_SEXO, SEXO FROM TBL_SEXO;";
                        $resultado=$conn->query($query);
                       ?>
                      <option selected disabled value="">--Seleccionar--</option>
                        <?php 
                         if($resultado->num_rows > 0) {
                            while($row = $resultado->fetch_assoc()) { 
                            $codigo = $row['CODIGO_SEXO'];
                            $sexo = $row['SEXO'];
                        ?>
                      <option value="<?php echo $codigo?>" ><?php echo $sexo;?></option>
                       <?php 
                         } 
                         }
                        ?>
                    </select>
                  </div>
                </div>
              </div><!--fin row -->
              <div class="row">
                <div class="col-md-6 mb-3">
                 <label  class="control-label mb-2">Fecha nacimiento</label> 
                  <div class="form-group">
                   <input type="date" name="fechana" class="form-control"  aria-label="fecha nacimiento" max="2011-01-01" min="1950-01-01">
                  </div>
                </div>
                <div class="col-md-6 mb-3">
                 <label  class="control-label mb-2">Lugar nacimiento</label> 
                  <div class="form-group">
                   <input type="text" name="lugarna" class="form-control" placeholder="Ciudad" aria-label="lugar" onkeyup="mayus(this);" maxlength="30">
                  </div>
                </div>
              </div><!--fin row -->
              <!-- datos que solo tiene que ver con la tabla de usuarios -->
              <h5>Datos de usuario</h5><hr size="5px;" style="color:blue;">
              <div class="row">
               <div class="col-md-6 mb-3">
                  <div class="input-group">
                    <span class="input-group-text" id=""><i class="fas fa-user"></i></span>
                    <input name = "ingusuario" type="text" class="form-control" placeholder="Ingresa nombre de usuario"  onkeyup="noespacio(this, event);mayus(this)" minlength="<?php echo $valor1;?>" maxlength="<?php echo $valor2;?>"  onkeypress="return soloLetras(event);" required pattern="[A-Z]{<?php echo $valor1;?>,<?php echo $valor2;?>}" onblur="quitarespacios(this);" onkeydown="sinespacio(this);" >
                  </div>
                </div>
                <div class="col-md-6 mb-3">
                  <div class="input-group">
                  <span  class="input-group-text" id=""><i class="fa fa-envelope"></i></span> 
                      <input name ="ingcorreo" type="email" class="form-control" placeholder="Ingresa un correo electronico" minlength="8" maxlength="50" onblur="quitarespacios(this);" onkeyup="noespacio(this, event);" onkeydown="sinespacio(this);" >
                  </div>
                </div>
                
              </div><!-- fin row-->
              <div class="row">
                <div class="col-md-6 mb-3">
                  <div class="input-group mb-3" id="grupo__clave_nueva"><!--Para ingresar la contraseña -->
                    <span class="input-group-text"><i class="fas fa-lock"></i></span>
                    <input type="password" id="clave_nueva" name="clave_nueva" class="form-control" placeholder="Ingresa tu contrase&ntilde;a"  onkeyup="noespacio(this, event)" minlength="<?php echo $valor4;?>" maxlength="<?php echo $valor3;?>" required onblur="quitarespacios(this);"onkeyup="sinespacio(this);">
                      <span class="input-group-text" onclick="mostrar1()"><i class=" icon1 fa fa-eye-slash"></i></span>
                      <div class="invalid-tooltip">
                          Llene este campo
                      </div>
                  </div>
                </div>
                <div class="col-md-6 mb-3">
                  <div class="input-group mb-3" id="grupo__confirmar_clave" ><!--Para ingresar la contraseña -->
                    <span class="input-group-text"><i class="fas fa-lock"></i></span>
                    <input type="password" id="confirmar_clave" name="confirmar_clave" class="form-control" placeholder="Ingresa tu contrase&ntilde;a" onkeyup="noespacio(this, event)"  minlength="<?php echo $valor4;?>" maxlength="<?php echo $valor3;?>" required onblur="quitarespacios(this);"onkeyup="sinespacio(this);">
                      <span class="input-group-text" onclick="mostrar2()"><i class=" icon2 fa fa-eye-slash"></i></span>
                      <div class="invalid-tooltip">
                          Llene este campo
                      </div>
                  </div>
                </div>
              </div>
              <!-- botones -->
              <div class="d-grid mb-2">
                <button name = "btnregistrar" type="submit" class="btn btn-primary btn-block">REGISTRATE</button>
              </div>
              <div class="d-grid mb-2">
                <button  onclick="location.href='../../index.php'" name = "btncancelar" type="button" class="btn btn-danger btn-block">CANCELAR</button>
              </div>
           </form>
         </div>
        </div>
       </div>
     </div>
   </div>

    <script src="../../js/cambio_clave.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
  </body>
</html>

<script>
      function soloLetras(e){
       key = e.keyCode || e.which;
       tecla = String.fromCharCode(key).toLowerCase();
       letras = " áéíóúabcdefghijklmnñopqrstuvwxyz";
       especiales = ["8-37-39-46"];

       tecla_especial = false
       for(var i in especiales){
        if(key == especiales[i]){
          tecla_especial = true;
          break;
        }
      }

      if(letras.indexOf(tecla)==-1 && !tecla_especial){
        return false;
      }
    }
  </script>

<script type="text/javascript">
 function mayus(e) {
   e.value = e.value.toUpperCase();
 }
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

<script type="text/javascript">

function sinespacio(e) {

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

<script type="text/javascript">
  function quitarespacios(e) {
    var cadena =  e.value;
    cadena = cadena.trim();
    e.value = cadena;

  };
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
<script type="text/javascript"> function solonumero(e) {
        tecla = (document.all) ? e.keyCode : e.which;
        if (tecla==8) return true;
        else if (tecla==0||tecla==9)  return true;
       // patron =/[0-9\s]/;// -> solo letras
        patron =/[0-9\s]/;// -> solo numeros
        te = String.fromCharCode(tecla);
        return patron.test(te);
    }
	</script>

