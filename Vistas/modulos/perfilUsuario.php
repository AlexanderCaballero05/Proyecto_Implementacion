            <?php
            include_once "conexion.php";
            include_once "conexion3.php";
            ?>

                    <?php
                        $nomUser= $_SESSION['vario'];
                        $query = "SELECT p.CODIGO_PERSONA, p.PRIMER_NOMBRE,p.SEGUNDO_NOMBRE,p.PRIMER_APELLIDO, p.SEGUNDO_APELLIDO,p.DNI,
                        t.NUMERO_TELEFONO, c.CORREO_PERSONA, p.DIRECCION, u.CODIGO_USUARIO
                              FROM tbl_persona p 
                              LEFT JOIN tbl_telefono t on p.CODIGO_PERSONA= t.CODIGO_PERSONA 
                              LEFT JOIN tbl_correo_electronico c on p.CODIGO_PERSONA = c.CODIGO_PERSONA 
                              Left join tbl_usuario u on p.CODIGO_PERSONA = u.CODIGO_PERSONA
                              WHERE u.NOMBRE_USUARIO = '$nomUser'
                              ORDER BY p.CODIGO_PERSONA ASC;";
                        $result = $conn->query($query);
                        if ($result->num_rows > 0) {
                          while($row = $result->fetch_assoc()) {
                            $var1 = $row['CODIGO_PERSONA'];
                            $var2 = $row['PRIMER_NOMBRE'];
                            $var3 = $row['SEGUNDO_NOMBRE'];
                            $var4 = $row['PRIMER_APELLIDO'];
                            $var5 = $row['SEGUNDO_APELLIDO'];
                            $var6 = $row['DNI'];
                            $var7 = $row ['CORREO_PERSONA'];
                            $var8 = $row ['NUMERO_TELEFONO'];
                            $var10 = $row['DIRECCION'];
                            $var11 = $row['CODIGO_USUARIO'];
                    ?>

 <style>
     /*Estilos aplicados para usar en las validaciones de js,donde los
     inputs cambien de colores  */
     body{
           background-color:#E8E8E1;
       }
    .fa-eye:hover{
        color:steelblue;
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


<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="m-4 text-center">
            <h1>Perfil Usuario</h1>
        </div>
       
          <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                <li class="nav-item active">
                  <a href="" class="nav-link bg-blue">
                    <i class="nav-icon fas fa-angle-right"></i>
                    <p>
                      Cambiar contraseña
                      <i class=""></i>
                      <span class="badge badge-info right"></span>
                    </p>
                  </a>
                  <ul class="nav nav-treeview">
                    <li class="nav-item active">
                                    <div class="pl-5 bg-gradient-info mb-4">
                                      <h3></h3>
                                    </div>
                      <form method="POST" class="needs-validation" novalidate>
                              
                              <!-----------------INFORMACION DEL USUARIO-------------------
                                ------------------------------------------------------>
                        <div class="row mb-3">
                          <div class="col-sm-4 pl-4">
                            <label for="" class="form-label">Actual contraseña</label>
                              <input type="password"  name="contraAnte" class="form-control" 
                                            required minlength="5" maxlength="30" title="Configure con los valores solicitados" onkeyup="sinespacio(this);"
                                            >
                                            <p class="formulario__input-error">Su contraseña debe que tener letras mayusculas, minisculas caracteres especiales y un numero.</p>
                                <div class="invalid-feedback">
                                Su contraseña debe que tener letras mayusculas, minisculas caracteres especiales y un numero.
                              </div>
                          </div>

                          <div class="col-sm-4 pl-4" id="grupo__clave_nueva">
                            <label for="" class="form-label">contraseña nueva</label>
                              <input  type="password" id="clave_nueva" name="clave_nueva" class="form-control" 
                                          required  minlength="5" maxlength="30"  title="Configure con los valores solicitados" onkeyup="sinespacio(this);"
                                            >
                                        <p class="formulario__input-error">Su contraseña debe que tener letras mayusculas, minisculas y caracteres especiales y un numero.</p>
                                <div class="invalid-feedback">
                              </div>
                          </div>

                          <div class="col-sm-4 pl-4" id="grupo__confirmar_clave">
                            <label for="" class="form-label">Confirmar contraseña</label>
                              <input  type="password" id="confirmar_clave" name="confirmar_clave" class="form-control"
                                          required minlength="5"  maxlength="30"   title="Configure con los valores solicitados" onkeyup="sinespacio(this);"
                                            >
                                        <p class="formulario__input-error" >Ambas contraseñas deben ser iguales.</p>
                              <div class="invalid-feedback">
                              </div>
                          </div>
                        </div>
                          <div class="panel-footer mt-4 PL-3">
                              <button type="submit" name="cambioContrasena" class="btn btn-info mb-3"><span> <i class="nav-icon fa fa-edit mx-1"></i></span>Cambiar Contraseña</button>
                          </div>
                    </form> <!--fin de formulario para cambio de contrasena-->
                    </li>
                  </ul>
                </li>

                   <?php 
                      if($var11 == 1){
                    ?>
              <!--Inicio de cambio de datos personales-->
                <li class="nav-item active">
                  <a href="" hidden class="nav-link bg-blue">
                    <i class="nav-icon fas fa-angle-right"></i>
                    <p>
                      Informacion del usuario
                      <i class=""></i>
                      <span class="badge badge-info right"></span>
                    </p>
                  </a>
                  <ul class="nav nav-treeview">
                    <li class="nav-item active">

                  <?php 
                      }else{
                  ?>


                 <li class="nav-item active">
                  <a href="" class="nav-link bg-blue">
                    <i class="nav-icon fas fa-angle-right"></i>
                    <p>
                      Informacion del usuario
                      <i class=""></i>
                      <span class="badge badge-info right"></span>
                    </p>
                  </a>
                  <ul class="nav nav-treeview">
                    <li class="nav-item active">
                              
                    <form method="POST" class="needs-validation" novalidate><!--formulario de cambio de datos personales-->
                            <div class="pl-5 mb-4 bg-gradient-blue">
                              <h3></h3>
                            </div>

                            <input hidden value="<?php echo $var1; ?>" name="codigoPersona"> 
                            
                        <div class="row mb-2 pl-3">
                          <div class="col-sm-3">
                            <label for="" class="form-label">Primer nombre</label>
                              <input type="text" value="<?php echo $var2; ?>" class="form-control" maxlength="20" minlength="5" onKeyDown="sinespacio(this);" onkeyup="mayus(this);" autocomplete="off" type="text" onkeypress="return soloLetras(event);"
                                     name="p_nombre" id="p_nombre">
                          </div>
                            
                          <div class="col-sm-3">
                            <label for="" class="form-label">Segundo Nombre</label>
                            <input type="text" value="<?php echo $var3; ?>" class="form-control" maxlength="20" minlength="5" onKeyDown="sinespacio(this);" onkeyup="mayus(this);" autocomplete="off" type="text" onkeypress="return soloLetras(event);"
                                     name="s_nombre" id="s_nombre">
                          </div>       
                            
                          <div class="col-sm-3">
                            <label for="" class="form-label">Primer Apellido</label>
                             <input type="text" value="<?php echo $var4; ?>" class="form-control" maxlength="20" minlength="5" onKeyDown="sinespacio(this);" onkeyup="mayus(this);" autocomplete="off" type="text" onkeypress="return soloLetras(event);"
                                     name="p_apellido" id="P_nombre">
                          </div>

                          <div class="col-sm-3">
                            <label for="" class="form-label">Segundo Apellido</label>
                             <input type="text" value="<?php echo $var5; ?>" class="form-control" maxlength="20" minlength="5" onKeyDown="sinespacio(this);" onkeyup="mayus(this);" autocomplete="off" type="text" onkeypress="return soloLetras(event);"
                                     name="s_apellido" id="s_nombre">
                          </div>
                        </div><!-- final de la row-->

                        <br>
                        <div class="row mb-2 pl-3">
                          <div class="col-sm-3">
                            <label for="" class="form-label">DNI</label>
                              <input type="text" value="<?php echo $var6; ?>" class="form-control" maxlength="20" minlength="5" onKeyDown="sinespacio(this);" onkeyup="mayus(this);" autocomplete="off" type="text" onkeypress="return"
                                     name="DNI" id="DNI">
                          </div>

                         <div class="col-sm-3">
                            <label for="" class="form-label">Correo</label>
                              <input type="email" value="<?php echo $var7; ?>" class="form-control" maxlength="50" minlength="5" onKeyDown="sinespacio(this);" autocomplete="off" 
                                     name="correo" id="correo">
                          </div>
                         
                          <div class="col-sm-3">
                            <label for="" class="form-label">Telefono</label>
                              <input type="number" value="<?php echo $var8; ?>" class="form-control" min="5" maxlength="8" onKeyDown="sinespacio(this);"
                                     name="telefono" id="telefono">
                          </div>
                          
                          <div class="col-sm-3">
                            <label for="apellido" class="control-label">Direccion</label> <!--INICIO DIRECCION-->
                              <div class="form-group">
                               <textarea class="form-control" type="textarea" name="direccion" id="DIRECCION" onkeyup="mayus(this);" autocomplete = "off" onkeypress=""><?php echo $var10; ?></textarea>
                              </div>
                          </div> 
                        </div>

                            <div class="panel-footer mt-4 PL-3">
                              <button type="submit" name="ACTUALIZAR" class="btn btn-warning mb-3"><span> <i class="nav-icon fa fa-edit mx-1"></i></span>Actualizar perfil</button>

                            </div>

                           
                      </form>

                      <?php
                          }
                      ?>

                      <?php
                                        }
                                      }
                                      ?>
                    </li>
                  </ul>
                </li>
            </u><!--final del item menu principal-->
          </nav>
      </div><!-- /.container-fluid -->
    </div>
  </div>

  <script type="text/javascript">// funcion que convierte en mayuscula lo que se vaya ingresando.

function mayus(e) {
 e.value = e.value.toUpperCase();
}

function mostrar_clave(){ //funcion para ver visualizar las contraseñas al mismo tiempo
 var cla = document.getElementById("clave_nueva");//se debe de crear un variable que recoja el id del input donde se quiera ver la clave.
 var cla1 = document.getElementById("confirmar_clave");
    if(cla.type==="password" && cla1.type==="password"){
       cla.type="text";
        cla1.type="text";
    }else{
        cla.type="password";
        cla1.type="text";
    }
}

</script>


<!-- funciones del sistema -->
<script>
function soloLetras(e) {
    key = e.keyCode || e.which;
    tecla = String.fromCharCode(key).toLowerCase();
    letras = " áéíóúabcdefghijklmnñopqrstuvwxyz";
    especiales = ["8-37-39-46"];
    tecla_especial = false
    for (var i in especiales) {
        if (key == especiales[i]) {
            tecla_especial = true;
            break;
        }
    }
    if (letras.indexOf(tecla) == -1 && !tecla_especial) {
        return false;
    }
}
//funcion para solu numeros ingresar en el campo
function soloNumeros_tel(e) {
    var teclaPulsada = window.event ? window.event.keyCode : e.which;
    // capturamos el contenido del input
    var valor = document.getElementById("tele").value;
    if (valor.length < 9) {
        if (teclaPulsada == 9) {
            return true;
        }
        // devolvemos true o false dependiendo de si es numerico o no
        return /\d/.test(String.fromCharCode(teclaPulsada));
    } else {
        return false;
    }
}





//funcion para quitar espacios
function quitarespacios(e) {
    var cadena = e.value;
    cadena = cadena.trim();
    e.value = cadena;
};
//funcion para poner mayusculas
function mayus(e) {
    e.value = e.value.toUpperCase();
}
//funcion sin espacios 
function sinespacio(e) {
    var cadena = e.value;
    var limpia = "";
    var parts = cadena.split(" ");
    var length = parts.length;
    for (var i = 0; i < length; i++) {
        nuevacadena = parts[i];
        subcadena = nuevacadena.trim();
        if (subcadena != "") {
            limpia += subcadena + " ";
        }
    }
    limpia = limpia.trim();
    e.value = limpia;
};
//otra funcion para quitar espacios :V
function quitarespacios(e) {
    var cadena = e.value;
    cadena = cadena.trim();
    e.value = cadena;
};
</script>

<script>
(function() {
    'use strict'

    // Fetch all the forms we want to apply custom Bootstrap validation styles to
    var forms = document.querySelectorAll('.needs-validation')

    // Loop over them and prevent submission
    Array.prototype.slice.call(forms)
        .forEach(function(form) {
            form.addEventListener('submit', function(event) {
                if (!form.checkValidity()) {
                    event.preventDefault()
                    event.stopPropagation()
                }

                form.classList.add('was-validated')
            }, false)
        })
})()
</script>

<script src="../../modelos/validacion_clave.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
