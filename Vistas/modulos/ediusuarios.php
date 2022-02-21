 <!-- Content Wrapper. Contains page content -->
 <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->
    <!-- Main content -->
    <section class="content">
    <div class="container-fluid">
    <div class="row">
         <!-- next column -->
         <div class="col-md-12">
            <!-- jquery validation -->
            <div class="card card-primary bg-transparent">
              <!-- /.card-header -->
              <!-- form start -->
              <form  method="POST">
                <div class="card-body">
        <!-- TITULO ENCABEZADO DATOS PERSONALES -->
        <div class="card-header text-center bg-yellow">
          <h3 class="card-title"><strong>Editar Información Personal</strong></h3>
        </div>
         <!-- TITULO ENCABEZADO DATOS ROLES -->
        </br>
        <!-- DATOS ROL -->
        <table id="example1" class="table table-bordered table-striped">
                  <thead>
                  <tr>
                    <th>Acción</th>
                    <th>Número Identidad</th>
                    <th>Nombre</th>
                    <th>Apellido</th>
                    <th>Usuario</th>
                    <th>Rol Usuario</th>
                    <th>Estado</th>
                    <th>Fecha Registro</th>
                    <th>Usuario Registro</th>
                    <th>Fecha Modificación</th>
                    <th>Usuario Modificación</th>
                  </tr>
                  </thead>
                  <tbody>
<?php
include_once "conexionpdo.php";
//$sentencia = $db->prepare("");
// llamar al procedimiento almacenado
//$sentencia->execute();
//$rows=$sentencia->fetchAll();
     // output data of each row
     foreach($rows as $row) {
      $var1 = $row['ID_PERSONA'];
			$var2 = $row['NUM_IDENTIDAD'];
			$var3 = $row['NOM_PERSONA'];
			$var4 = $row['APE_PERSONA'];
      $var5 = $row['FEC_NAC'];
      $var6 = $row['SEX_PERSONA'];
      $var7 = $row['TIP_PERSONA'];
			$var8 = $row['COR_PERSONA'];
      $var9 = $row['DIR_PERSONA'];
      $var10 = $row['TEL_PERSONA'];
      $var11 = $row['NOM_USUARIO'];
      $var12 = $row['ROL'];
      $var13 = $row['EST_USUARIO'];
      $var14 = $row['ROL_USUARIO'];
      $var15 = $row['USER_REGISTRO'];
      $var16 = $row['FEC_REGISTRO'];
      $var17 = $row['USER_MODIFICACION'];
      $var18 = $row['FEC_MODIFICACION'];
?>
                  <tr>
                    <td>
                    <center>
                    <a href="#EDITARPERSONA<?php echo $var1 ?>" data-toggle="modal">
					        	<button type='button'class='btn btn-success'>Editar</button>
					          </a>
                    </center>
                    </td>
                    <td class="text-center"><?php echo $var2 ?></td>
                    <td class="text-center"><?php echo $var3 ?></td>
                    <td class="text-center"><?php echo $var4 ?></td>
                    <td class="text-center"><?php echo $var11 ?></td>
                    <td class="text-center"><?php echo $var12 ?></td>
                    <td class="text-center"><?php echo $var13 ?></td>
                    <td class="text-center"><?php echo $var16 ?></td>
                    <td class="text-center"><?php echo $var15 ?></td>
                    <td class="text-center"><?php echo $var18 ?></td>
                    <td class="text-center"><?php echo $var17 ?></td>
<!--- ESTE ES EL MODAL EDITAR -->
<div class="modal fade" id="EDITARPERSONA<?php echo $var1 ?>">
        <div class="modal-dialog modal-xl">
          <div class="modal-content">
            <form id="FORMEDITRAPERSONAS" method="POST">
            <div class="modal-header bg-black">
              <h4 class="modal-title">Editar Información Personal</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
          <!-- DATOS PERSONALES -->
          <input class="form-control" hidden="true" name="ID_PERSONA_U" id="ID_PERSONA_U" value="<?php echo $var1; ?>" readonly="true" type="text">
                       <div class="row"> 
        <!--INICIO IDENTIDAD--> 
        <div class="col-md-4">  
              <label for="identidad" class="control-label">Número de Identidad</label> 
              <div class="form-group">
                <input class="form-control" value="<?php echo $var2 ?>" type="text" maxlength="13" minlength="13" name="NUM_IDENTIDAD_U" id="NUM_IDENTIDAD_U" onKeyDown="sinespacio(this);"  autocomplete = "off" onblur="quitarespacios(this);" onkeypress="return solonumeros(event);" placeholder="Ej: 0801199716227" required="" >
              </div>
        </div>
        <!--FIN IDENTIDAD--> 
        <!--INICIO 1er NOMBRE--> 
        <div class="col-md-4">  
              <label for="nombre" class="control-label">Nombres</label> 
              <div class="form-group">
                <input class="form-control" maxlength="20" value="<?php echo $var3 ?>" minlength="5"  name="NOM_PERSONA_U" id="NOM_PERSONA_U" onkeyup="mayus(this);" autocomplete = "off" type="text" onkeypress="return soloLetras(event);" placeholder="Ingrese Nombre" required="">
              </div>
            </div>
         <!--FIN 1er NOMBRE-->
            <!--INICIO APELLIDO-->
        <div class="col-md-4">  
              <label for="identidad" class="control-label">Apellidos</label> 
              <div class="form-group">
                <input class="form-control" maxlength="20" minlength="10" value="<?php echo $var4 ?>" name="APE_PERSONA_U" id="APE_PERSONA_U" onkeyup="mayus(this);"  autocomplete = "off" type="text" onkeypress="return soloLetras(event);" placeholder="Ingrese Apellido" required="" >
              </div>
            </div>
        <!--FIN 1er APELLIDO-->
         </div>
         <div class="row">  
        <!--INICIO FECHANAC-->
        <div class="col-md-4">  
            <label for="fecha" class="control-label">Fecha Nacimiento</label>  
            <div class="form-group">
                <input placeholder="Fecha" name="FEC_NAC_U" max="2002-01-01" min="1950-01-01" id="FEC_NAC_U" value="<?php echo $var5 ?>" type="date" class="form-control" required="">
              </div>
         </div>
         <!--FIN  FECHANAC-->
         <!--INICIO TIPO PERSONA-->
         <div class="col-md-4">  
            <label for="cbx_persona" class="control-label">Tipo Persona</label>  
            <div class="form-group">
              <select class="form-control select"   style="width: 100%;" name="TIP_PERSONA_U" id="TIP_PERSONA_U" required="">
             <option value="<?php echo $var7 ?>"><?php echo $var7 ?></option>
              <option value="J">JURIDICA</option>
              <option  value="N">NATURAL</option>
            </select>
            </div>  
       </div>
       <!--FIN TIPO PERSONA-->
        <!--INICIO SEXO--> 
        <div class="col-md-4">  
            <label for="cbx_persona" class="control-label">Sexo</label>  
            <div class="form-group">
            <select class="form-control select"   style="width: 100%;" name="SEX_PERSONA_U" id="SEX_PERSONA_U" required="">
             <option value="<?php echo $var6 ?>"><?php echo $var6 ?></option>
              <option value="F">FEMENINO</option>
              <option  value="M">MASCULINO</option>
            </select> 
             </div> 
      </div>   
      <!--FIN SEXO-->
      </div> 
       <div class="row"> 
      <!--INICIO TELEFONO-->
      <div class="col-md-4">  
              <label for="apellido" class="control-label">Número Teléfono</label> 
              <div class="form-group">
                <input class="form-control" maxlength="8" value="<?php echo $var10 ?>" name="TEL_PERSONA_U" id="TEL_PERSONA_U" onblur="quitarespacios(this);" onKeyDown="sinespacio(this);" minlength="8"  onkeyup="mayus(this);" autocomplete = "off" type="text" onkeypress="return solonumeros(event);" placeholder="Ej: 88996633" required="">
              </div>
              </div>
        <!--FIN TELEFONO-->
        <!--INICIO CORREO-->
      <div class="col-md-8">  
              <label for="apellido" class="control-label">Correo Electrónico</label> 
              <div class="form-group">
                <input class="form-control" value="<?php echo $var8 ?>"  name="COR_PERSONA_U" id="COR_PERSONA_U" maxlength="50" onblur="quitarespacios(this);" onKeyDown="sinespacio(this);" minlength="10" type="email" onkeyup="mayus(this);" autocomplete = "off" type="text" onkeypress="" placeholder="Ej: Example@gmail.com" required="">
              </div>
              </div>
        <!--FIN CORREO-->
        </div> 
         <!--INICIO DIRECCION--> 
        <label for="apellido" class="control-label">Dirección</label> 
        <div class="form-group">
        <textarea class="form-control" type="text"  name="DIR_PERSONA_U" id="DIR_PERSONA_U" onkeyup="mayus(this);" autocomplete = "off" onkeypress="" placeholder="Ingrese Direccion" required="" cols="40" rows="1"><?php echo $var9 ?></textarea>
        </div>
        <!--FIN DIRECCION-->
        <!-- DATOS PERSONALES -->
        <!-- DATOS USUARIO -->
        <div class="row">
        <!--INICIO ROL--> 
        <?php
     include "conexionbd.php";
     $queryd = "CALL Sp_lista_roles_activos()";
     $resultadod=$conn->query($queryd);                
     ?> 
         <div class="col-md-4">  
            <label for="cbx_persona" class="control-label">Rol Usuario</label>  
            <div class="form-group">
            <select class="form-control select2 select2-primary"   style="width: 100%;" name="ROL_U" id="ROL_U" required="">
             <option value="<?php echo $var14 ?>"><?php echo $var12 ?></option>
             <?php 
                     if ($resultadod->num_rows > 0) {
                    while($rowt = $resultadod->fetch_assoc()) { ?>
                     <option value="<?php echo $rowt['ID_ROL'];?>"><?php echo $rowt['ROL']; ?></option>
                   <?php } 
                          }?>
            </select> 
             </div> 
            </div>   
      <!--FIN ROL-->
      <!--INICIO ESTADO USUARIO-->  
      <div class="col-md-4">  
            <label for="cbx_persona" class="control-label">Estado Usuario</label>  
            <div class="form-group">
            <select class="form-control select"   style="width: 100%;" name="EST_USUARIO_U" id="EST_USUARIO_U" required="">
             <option value="<?php echo $var13 ?>"><?php echo $var13 ?></option>
             <option value="A">ACTIVO</option>
             <option value="I">INACTIVO</option>
            </select> 
             </div> 
            </div>   
      <!--FIN ROL-->
       <!--INICIO USUARIO--> 
       <div class="col-md-4"> 
         <label for="apellido" class="control-label">Usuario</label> 
        <div class="form-group">
        <input class="form-control" maxlength="20" value="<?php echo $var11 ?>" minlength="8" name="NOM_USUARIO_U" id="NOM_USUARIO_U" readonly="true" onKeyDown="sinespacio(this);" type="text"  onkeyup="mayus(this);" autocomplete = "off" type="text" onkeypress="" onblur="quitarespacios(this);" placeholder="Nombre Usuario" required="">
        </div>
        </div>
        <!--FIN USUARIO-->
        </div>
        <div class="row">
      <!--INICIO USUARIO--> 
      <div class="col-md-4"> 
        <input class="form-control" hidden value="<?php echo $_SESSION["vario"]; ?>" readonly name="USER_MODIFICACION" id="USER_MODIFICACION" maxlength="20" minlength="8" onKeyDown="sinespacio(this);" type="text" onkeyup="mayus(this);" autocomplete = "off" type="text" onkeypress="" onblur="quitarespacios(this);" placeholder="Nombre Usuario" required="">
        </div>
        <!--FIN USUARIO-->
        <!-- DATOS USUARIO -->
            </div>
            <div class="modal-footer justify-content">
              <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
              <?php
    $usuarr = $_SESSION['vario'];
    $sentencia = $db->prepare("CALL Evaluar_tipo_usuario(?);");
    // llamar al procedimiento almacenado
    $sentencia->execute(array($usuarr));
    $row=$sentencia->fetchColumn();
      // Conexion de las tablas a las variables
      $usuarimo = $row;
     $sentencia = $db->prepare("CALL Sp_permiso_update(?,?);");
     // llamar al procedimiento almacenado
     $sentencia->execute(array($usuarimo,'4'));
     $row=$sentencia->fetchColumn();
     $permiso = $row;
    ?>
    <?php
     if ($permiso == 'ACTIVO')
     {
    ?>
              <button type="submit" id="ACT_PERSONA" name="ACT_PERSONA" class="btn btn-success">Guardar</button>
    <?php
     }
    ?>
            </div>
          </div>
        </form>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
      <!-- /.modal -->
<!--- ESTE ES EL MODAL EDITAR -->
                   </tr>             
<?php
}
?>
                  </tbody>
                  <tfoot>
                  <tr>
                    <th>Acción</th>
                    <th>Número Identidad</th>
                    <th>Nombre</th>
                    <th>Apellido</th>
                    <th>Usuario</th>
                    <th>Rol Usuario</th>
                    <th>Estado</th>
                    <th>Fecha Registro</th>
                    <th>Usuario Registro</th>
                    <th>Fecha Modificación</th>
                    <th>Usuario Modificación</th>
                  </tr>
                  </tfoot>
                </table>
        <!-- DATOS ROL -->
                </div>
                <!-- /.card-body -->
              </form>
            </div>
            <!-- /.card -->
            </div>
          <!--/.col (next) -->

        </div>
        <!-- /.row -->
    </div>
    
</section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<script type="text/javascript">
  
  $( function() {
    $("#cbx_persona").change( function() {
        if ($(this).val() === "2") {
           document.getElementById("c").style.display="block";
        } else {
            document.getElementById("c").style.display="none";
        }
    });
});
</script>
<script type="text/javascript">
function mostr() {
  document.getElementById("vi").style.display="block";
}
function ocultar() {
  document.getElementById("vi").style.display="none";
}
</script>
<script type="text/javascript">
function mostrarr() {
  document.getElementById("vii").style.display="block";
}
function ocultarr() {
  document.getElementById("vii").style.display="none";
}
</script>
<script type="text/javascript">
function mostrarrr() {
  document.getElementById("viii").style.display="block";
}
function ocultarrr() {
  document.getElementById("viii").style.display="none";
}
</script>
<script type="text/javascript">
 function mayus(e) {
   e.value = e.value.toUpperCase();
 }
</script>
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
function soloNumeros_tel(e)
{
        // capturamos la tecla pulsada
        var teclaPulsada=window.event ? window.event.keyCode:e.which;
        // capturamos el contenido del input
        var valor=document.getElementById("tele").value;

        if(valor.length<9)
        {
            // 13 = tecla enter
            // Si el usuario pulsa la tecla enter o el punto y no hay ningun otro
            // punto
            if(teclaPulsada==9)
            {
              return true;
            }

            // devolvemos true o false dependiendo de si es numerico o no
            return /\d/.test(String.fromCharCode(teclaPulsada));
          }else{
            return false;
          }
        }
      </script>

      <script type="text/javascript"> function solonumeros(e) {
       tecla = (document.all) ? e.keyCode : e.which;
       if (tecla==8) return true;
       else if (tecla==0||tecla==9)  return true;
          // patron =/[0-9\s]/;// -> solo letras
          patron =/[0-9\s]/;// -> solo numeros
          te = String.fromCharCode(tecla);
          return patron.test(te);
        }
      </script>
      <script type="text/javascript">

        function quitarespacios(e) {

          var cadena =  e.value;
          cadena = cadena.trim();

          e.value = cadena;

        };

      </script>
  </div>
  <!-- /.content-wrapper -->


  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->