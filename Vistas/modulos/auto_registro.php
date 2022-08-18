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
Diana Rut Garcia	 	26-may-2022       Cambio en validaciones 
Luz María Montoya   11-Ago-2022       Modificación en el orden de los campos, y en colores y el tamaño de los botones
-->

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

<?php
  // Parametro de fecha de naciemiento
  $fecha_nacimiento = "FECHA_NACIMIENTO";
  $fecha = $db->prepare("SELECT VALOR FROM tbl_parametros WHERE PARAMETRO =(?);");
  $fecha->execute(array($fecha_nacimiento));
  $row=$fecha->fetchColumn();
  if($row>0){
    $fechana = $row;
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
           <h3 class="fw-bold text-center py-3">REGISTRATE</h3>
          </div>
          <div class="card-body">
           <form  action="../../modelos/autoregistro_validar.php"  method="POST" class="formulario" id="formulario">
           <h5>Datos Personales</h5><hr size="5px;" style="color:blue;">
             <div class="row"><!--INICIO del segundo row-->
             <div class="col-md-6 mb-3"><!--Campo del numero de identidad de la persona -->
                 <label  class="control-label mb-2">Número de Idendidad:</label> 
                  <div class="form-group">
                    <input type="text" name="dni" class="form-control" placeholder="Ej: 0801199908495" aria-label="dni" minlength="13" maxlength="13" required pattern="[0-9]{13,13}" onkeypress="return solonumero(event)" onblur="quitarespacios(this);" onkeydown="sinespacio(this);" onkeyup="noespacio(this, event)" autocomplete = "off">
                  </div>
                </div><!--Campo del numero de identidad de la persona -->
                <div class="col-md-6 mb-2"><!--INICIO 1er NOMBRE-->
                 <label  class="control-label mb-2">Primer Nombre:</label> 
                  <div class="form-group">
                   <input type="text" name="nombre1" class="form-control"  onkeyup="mayus(this);" minlength="3" maxlength="20" onkeypress="return soloLetras(event);"  required onblur="quitarespacios(this);" onkeydown="sinespacio(this);" required="" autocomplete = "off"> 
                  </div>
                </div>
                <div class="col-md-6 mb-3"><!--INICIO 2er NOMBRE-->
                 <label  class="control-label mb-2">Segundo Nombre:</label> 
                  <div class="form-group">
                   <input type="text" name="nombre2" class="form-control"  onkeyup="mayus(this);" minlength="3" maxlength="20" onkeypress="return soloLetras(event);" autocomplete = "off"  > 
                  </div>
                </div>
                <div class="col-md-6 mb-3"><!--INICIO 1er APELLIDO-->
                 <label  class="control-label mb-2">Primer Apellido:</label> 
                  <div class="form-group">
                   <input type="text" name="apellido1" class="form-control"  aria-label="primer apellido" onkeyup="mayus(this);" minlength="3" maxlength="20" onkeypress="return soloLetras(event);"  required onblur="quitarespacios(this);" onkeydown="sinespacio(this);" required="" autocomplete = "off">
                  </div>
                </div>
                
             </div><!--FIN del primer row -->
             <div class="row"><!--Inicio del segundorow -->
             <div class="col-md-6 mb-3"><!--INICIO 2er APELLIDO-->
                 <label  class="control-label mb-2">Segundo Apellido:</label> 
                  <div class="form-group">
                   <input type="text" name="apellido2" class="form-control"  aria-label="segundo apellido" onkeyup="mayus(this);" minlength="3" maxlength="20" onkeypress="return soloLetras(event);" autocomplete = "off"  >
                  </div>
                </div><!--Fin 2er APELLIDO-->
                <div class="col-md-6 mb-3"><!-- Inicio del campo fecha de nacimiento -->
                 <label  class="control-label mb-2">Fecha Nacimiento:</label> 
                  <div class="form-group">
                   <input type="date" name="fechana" class="form-control"  aria-label="fecha nacimiento" max="<?php echo $fechana;?>"  min="1950-01-01">
                  </div>
                </div><!-- Fin del campo fecha de nacimiento -->
               
              </div><!--fin del segundo row -->
              <div class="row"><!--Inicio del tercer row-->
              <div class="col-md-6 mb-3"><!-- Inicio del campo Lugar de nacimiento -->
                 <label  class="control-label mb-2">Lugar Nacimiento:</label> 
                  <div class="form-group">
                   <input type="text" name="lugarna" class="form-control"  aria-label="lugar" onkeyup="mayus(this);" maxlength="30" autocomplete = "off">
                  </div>
                </div><!-- Fin del campo Lugar de nacimiento -->
                <div class="col-md-6 mb-3"><!--Inicio del campo sexo-->
                 <label  class="control-label mb-2">Sexo:</label> 
                  <div class="form-group">
                    <select name="sexo" class="form-select">
                      <?php
                        $query = "SELECT CODIGO_SEXO, SEXO FROM TBL_SEXO;";
                        $resultado=$conn->query($query);
                       ?>
                      <option selected disabled value="">--Seleccionar Sexo--</option>
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
                </div><!--fin del campo sexo-->
              </div><!-- fin del tercer row -->
              <div class="row"><!-- Inicio del cuarto row -->
               <div class="col-md-6 mb-3"><!--inicio campo telefono-->
                 <label  class="control-label mb-2">Teléfono:</label> 
                  <div class="form-group">
                   <input type="text" name="telefono" class="form-control" placeholder="Eje:99001100" aria-label="Número de teléfono"  maxlength="8" minlength="8" onkeypress="return solonumero(event)" required pattern="[0-9]{8,8}" onblur="quitarespacios(this);" onkeydown="sinespacio(this);" onkeyup="noespacio(this, event)" autocomplete = "off">
                  </div>
                </div><!--final campo telefono-->
                <div class="col-md-6 mb-3">
                   <label  class="control-label mb-2">Correo electrónico:</label> 
                  <div class="form-group">
                      <input name ="ingcorreo" type="email" class="form-control" placeholder="nombre@dominio.com" minlength="8" maxlength="50" onblur="quitarespacios(this);" onkeyup="noespacio(this, event);" onkeydown="sinespacio(this);" autocomplete = "off" >
                  </div>
                </div>
              </div><!--fin del cuarto row -->
              <div class="row"><!--otro  row -->
              <div class="col-md-12 mb-3"><!--inicio campo dirección-->
                 <label  class="control-label mb-2">Dirección:</label> 
                  <div class="form-group">
                  <textarea type="text" name="direccion" class="form-control"  aria-label="segundo nombre" onkeyup="mayus(this);" minlength="5" maxlength="500" onkeypress="return soloLetras(event);"    required="" autocomplete = "off"></textarea>
                  </div>
                </div><!--fin campo dirección-->
              </div><!-- Fin del otro row -->
              <!-- datos que solo tiene que ver con la tabla de usuarios -->
              <h5>Datos de usuario</h5><hr size="5px;" style="color:blue;">
              <div class="row"><!-- Inicio del quinto  row -->
               <div class="col-md-6 mb-3">
               <label  class="control-label mb-2">Nombre Usuario:</label> 
                  <div class="input-group">
                    <span class="input-group-text" id=""><i class="fas fa-user"></i></span>
                    <input name = "ingusuario" type="text" class="form-control" placeholder="Ingresa nombre de usuario"  onkeyup="noespacio(this, event);mayus(this)" minlength="<?php echo $valor1;?>" maxlength="<?php echo $valor2;?>"  onkeypress="return soloLetras(event);" required pattern="[A-Z]{<?php echo $valor1;?>,<?php echo $valor2;?>}" onblur="quitarespacios(this);" onkeydown="sinespacio(this);" autocomplete = "off">
                  </div>
                </div>
                <div class="col-md-6 mb-3">
                <label  class="control-label mb-2">Contraseña:</label> 
                  <div class="input-group mb-3" id="grupo__clave_nueva"><!--Para ingresar la contraseña -->
                    <span class="input-group-text"><i class="fas fa-lock"></i></span>
                    <input class="form-control"  required pattern="[A-Z,1-9,a-z,@$!%*?&]{<?php echo $valor4;?>,<?php echo $valor3;?>}"; minlength="<?php echo $valor4;?>"  maxlength="<?php echo $valor3?>" onKeyDown="sinespacio(this);" onkeyup="noespacio(this, event);" type="password" id="clave_nueva" name="clave_nueva" >
                             <div class="input-group-append">
                               <button id="show_password" class="form-control " onclick="mostrar1()" type="button" onKeyDown="sinespacio(this);"><span class="icon1 fa fa-eye-slash"></button></span>
                             </div>
                          </div> 
                           <FONT SIZE=2>*Debe tener minimo <?php echo $valor4; ?> caracteres, numeros, mayusculas minusculas.</FONT>
                        </div>
                
              
              
              <!-- botones -->
              <div class="d-grid gap-2 d-md-block"> 
              <button  onclick="location.href='../../index.php'" name = "btncancelar" type="button" class="btn btn-outline-danger btn-lg">Cancelar</button>
                <button name = "btnregistrar" type="submit" class="btn btn-primary btn-lg">Registrate</button>
              </div> 
           </form>
         </div><!-- div de cierre del card -->
        </div>
       </div>
     </div>
   </div><!-- div de cierre del container(contenedor)-->

    <script src="../../js/cambio_clave.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
  </body>
</html>

<!-- *********************************************script de las validaciones***************************************** -->
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

<!-- No permite ingresar espacios -->
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

<!-- Quita los espacios ingresados -->
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

 <!-- Validación para que en el campo solo se ingresen números -->
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

