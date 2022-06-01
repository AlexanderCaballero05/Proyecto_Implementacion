<?php
  include_once "conexion.php";
  include_once "conexion3.php";
  include "conexionpdo.php";
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
 <!-- Content Wrapper. Contains page content -->
 <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->
    <!-- Main content -->
    <section class="content">
    <div class="container-fluid">
     <div class="row">
       <div class="col-md-5">
        <?php
          $nomUser= $_SESSION['vario'];
          $query = "SELECT p.CODIGO_PERSONA, p.PRIMER_NOMBRE,p.SEGUNDO_NOMBRE,p.PRIMER_APELLIDO, p.SEGUNDO_APELLIDO,p.DNI,
          t.NUMERO_TELEFONO, c.CORREO_PERSONA, p.DIRECCION, u.CODIGO_USUARIO ,u.imagen
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
              $var12 = $row['imagen'];
           }  }
          ?>
        <div class="card card-success card-outline">
          <div class="card-body box-profile">
           <div class="text-center">
            <br>
            <div class="row">
              <div class="col-sm-12">
                <div class="form-group" >
                  <img class="profile-user-img img-circle"  style=" width: 135px; height: 160px;"  src="data:image/jpeg;base64,<?php echo base64_encode($var12); ?>" alt="User profile picture">
                </div>
              </div>
              <div class="col-sm-12">
               <a href="#MOSTRAR<?php echo $var1 ?>" data-toggle="modal">
                 <button class="btn btn-warning" type='button' data-dismiss="modal"> Editar foto de perfil <span><i class="nav-icon fas fa-camera"></i></span></button>
               </a>
              </div>
              
            </div>
            
          </div>
          
          <h3 class="profile-username text-center"><?php ?></h3>
         <p class="text-muted text-center"><?php ?></p>
        
        <form method="POST" class="needs-validation" novalidate>
          
            <div class="row">
             <input hidden value="<?php echo $var1; ?>" name="codigoPersona"> 
              <div class="col-sm-6 mb-3">
                <strong><i class="fas fa-user mb-2 "></i> Primer Nombre</strong>
                <input type="text" value="<?php echo $var2; ?>" class="form-control" maxlength="20" minlength="5" onKeyDown="sinespacio(this);" onkeyup="mayus(this);" autocomplete="off" type="text" onkeypress="return soloLetras(event);"
                name="p_nombre" id="p_nombre">
              </div>
              <div class="col-sm-6 mb-3">
              <strong><i class="fas fa-user mb-2"></i> Segundo Nombre</strong>
                <input type="text" value="<?php echo $var3; ?>" class="form-control" maxlength="20" minlength="5" onKeyDown="sinespacio(this);" onkeyup="mayus(this);" autocomplete="off" type="text" onkeypress="return soloLetras(event);"
                  name="s_nombre" id="s_nombre">
                </div>
            </div>
          
          
            <div class="row">
              <div class="col-sm-6 mb-3">
              <strong><i class="fas fa-user mb-2"></i> Primer Apellido</strong>
                 <input type="text" value="<?php echo $var4; ?>" class="form-control" maxlength="20" minlength="5" onKeyDown="sinespacio(this);" onkeyup="mayus(this);" autocomplete="off" type="text" onkeypress="return soloLetras(event);"
                  name="p_apellido" id="P_nombre">
              </div>
              <div class="col-sm-6 mb-3">
                <strong><i class="fas fa-user mb-2 "></i> Segundo Apellido</strong>
                 <input type="text" value="<?php echo $var5; ?>" class="form-control" maxlength="20" minlength="5" onKeyDown="sinespacio(this);" onkeyup="mayus(this);" autocomplete="off" type="text" onkeypress="return soloLetras(event);"
                 name="s_apellido" id="s_nombre">
              </div>
            </div>
          
          
           <div class="row">
              <div class="col-sm-12 mb-3">
              <strong><i class="fas fa-envelope mb-2"></i> Correo electrónico</strong>
                <input type="email" value="<?php echo $var7; ?>" class="form-control" maxlength="50" minlength="5" onKeyDown="sinespacio(this);" autocomplete="off" 
                  name="correo" id="correo">
              </div>
            </div>
           
           
            <div class="row">
                <div class="col-sm-12 mb-2">
                  <strong><i class="fas fa-phone mb-1"></i> Teléfono </strong>
                  <input class="form-control" type="text" value="<?php echo $var8; ?>" minlength="8" maxlength="8"  name="telefono" id="" onKeyDown="sinespacio(this);"  autocomplete = "off" onblur="quitarespacios(this);" onkeypress="return solonumeros(event);">
                </div>
            </div>
            
              <div class="d-grid">
                <button type="submit" name="ACTUALIZAR" class="btn btn-success btn-block"><span> <i class="nav-icon fa fa-edit "></i></span>Actualizar perfil</button>
              </div>
            </form>
         
       </div>
    </div>
</div>
 

<div class="col-md-7">
    <div class="card card-blue">
      <div class="card-header"><!-- Encabezado-->
        <h3 class="card-title"><i class="fa fa-key mx-2"></i> Restablecer  contraseña</h3>
      </div>
    <div class="card-body">
      <form method="POST" class="needs-validation" novalidate>
        <div class="input-group mb-3">
          <input type="text"  readonly="" value="Nombre de usuario: <?php echo $_SESSION['vario'];?>"  class="form-control" placeholder="Usuario">
        </div>
        <div class="input-group mb-3 ">
          <input type="password"  name="contraAnte" onkeyup="noespacio(this, event)" id="PASSACTUAL" class="form-control" placeholder="Ingrese su actual contraseña"
          minlength="<?php echo $valor4;?>" maxlength="<?php echo $valor3;?>" title="Configure con los valores solicitados" onkeyup="sinespacio(this);">
          <div class="input-group-append">
            <button id="show_password" class="form-control btn btn-info btn-sm btn-block" type="button"  onclick="Passactual()"><span class="icon2 fa fa-eye-slash"></button>
          </div>
          <div class="invalid-feedback">
              Su contraseña debe contener letras mayusculas, minisculas, caracteres especiales y un numero.
          </div>
        </div>
        <div class="input-group mb-3">
          <input  type="password" id="PASSNUEVA" onkeyup="noespacio(this, event)" name="clave_nueva" class="form-control" placeholder="Ingrese una nueva contraseña"
            autocomplete = "off"    required minlength="<?php echo $valor4;?>" maxlength="<?php echo "$valor3"?>"   title="Configure con los valores solicitados" onkeyup="sinespacio(this); ">
          <div class="input-group-append">
            <button id="show_password" class="form-control btn btn-info btn-sm btn-block" type="button"  onclick="Passnueva()"><span class="icon3 fa fa-eye-slash"></button>
          </div>
          <div class="invalid-feedback">
              Su contraseña debe contener letras mayusculas, minisculas, caracteres especiales y un numero.
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="password" id="CONFPASS" onkeyup="noespacio(this, event)" name="confirmar_clave" class="form-control" placeholder="Confirme la contraseña"
            autocomplete = "off"  required minlength="<?php echo $valor4;?>" maxlength="<?php echo "$valor3"?>"   title="Configure con los valores solicitados" onkeyup="sinespacio(this);">
          <div class="input-group-append">
            <button id="show_password" class="form-control btn btn-info btn-sm btn-block" type="button"  onclick="Confpass()"><span class="icon4 fa fa-eye-slash"></button>
          </div>
          <div class="invalid-feedback">
            Ambas contraseñas deben ser iguales.
          </div>
        </div>
        <div class="input-group mb-3">
           <button style="background-color:#07ACE0;" type="submit" name="cambioContrasena" class="btn btn-info mb-3"><span> <i class="nav-icon fa fa-edit mx-1"></i></span>Cambiar Contraseña</button> 
       </div>
      </form>
    </div>
</div><!-- Fin de la columna de cambio de contraseña-->




</section>

</div>

  <!-- /.content-wrapper -->
  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
  
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->
    
    <div id="MOSTRAR<?php echo $var1 ?>"  name="div_eliminar" class="modal fade" role="dialog"><!--Modal para cambiar la foto -->
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Editar foto de perfil usuario</h5>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
          </div>
           <form method="POST" enctype="multipart/form-data" class="needs-validation" novalidate>
            <div class="modal-body">
              <div class="row"> 
                <div class="col-sm-12" >
                  <div class="form-group">
                  <label >Subir foto</label>
                    <input hidden value="<?php echo $var1; ?>" name="codigo"> 
                    <input type="file" class="form-control" name="foto" required title="Configure con los valores solicitados">
                  </div>
                  <div class="invalid-feedback">
                     Debe de subir una imagen.
                  </div>
                  </div>
              </div>
            </div> <!--fin el card body -->
            <div class="modal-footer ">
            <button type="button" name="ELI" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cancelar</button>
              <button class="btn btn-success" type="submit" name="ACTUALIZAR_FOTO"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar cambios</button>    
            </div><!--FIN DEL DIV DE BOTONES DE GUARDAR -->
          </form>
        </div>
      </div>
     </div><!--fin del modal  -->





     
  <!-- Codigo para que se visualice la contraseña en los tres campos :) -->
  <script type="text/javascript">
    function Passactual(){
      var cambio1 = document.getElementById("PASSACTUAL");
      if(cambio1.type == "password"){
          cambio1.type = "text";
      $('.icon2').removeClass('fa fa-eye-slash').addClass('fa fa-eye');
      }else{
          cambio1.type = "password";
      $('.icon2').removeClass('fa fa-eye').addClass('fa fa-eye-slash');
      }        
    }
  </script>
  <script type="text/javascript">
    function Passnueva(){
      var cambio1 = document.getElementById("PASSNUEVA");
      if(cambio1.type == "password"){
          cambio1.type = "text";
      $('.icon3').removeClass('fa fa-eye-slash').addClass('fa fa-eye');
      }else{
          cambio1.type = "password";
      $('.icon3').removeClass('fa fa-eye').addClass('fa fa-eye-slash');
      }        
    }
  </script>
  <script type="text/javascript">
  function Confpass(){
    var cambio1 = document.getElementById("CONFPASS");
    if(cambio1.type == "password"){
        cambio1.type = "text";
    $('.icon4').removeClass('fa fa-eye-slash').addClass('fa fa-eye');
    }else{
        cambio1.type = "password";
    $('.icon4').removeClass('fa fa-eye').addClass('fa fa-eye-slash');
    }        
  }
  </script>
<script>
  (function() {
    'use strict'
    var forms = document.querySelectorAll('.needs-validation')
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
<!-- Codigo para evitar los espacios cuando se coloca el cursor en medio de la constraseña-->
<script language="javascript">
  function noespacio(campo, event) {
    CadenaaReemplazar = " ";
    CadenaReemplazo = "";
    CadenaTexto = campo.value;
    CadenaTextoNueva = CadenaTexto.split(CadenaaReemplazar).join(CadenaReemplazo);
    campo.value = CadenaTextoNueva;
  }
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>