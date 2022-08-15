<!-- 
-----------------------------------------------------------------------
Universidad Nacional Autonoma de Honduras (UNAH)
		Facultad de Ciencias Economicas
Departamento de Informatica administrativa
Analisis, Programacion y Evaluacion de Sistemas
           Primer Periodo 2016

Equipo:
Arnold Alexander Caballero Garcia (aacaballero@unah.hn)
  Luz Maria Montoya Medina (luz.montoya@unah.hn)
  Diana Rut Garcia Amador (drgarciaa@unah.hn)
  Any Melissa Hernandez (anyhernandez@unah.hn)
  Gissela Yamileth Diaz (gdiaza@unah.hn)
  Cesar Fernando Rovelo (Cesar.rovelo@unah.hn)
  D'aniel Ferdinand Martinez Moradel (ferdinand.martinez@unah.hn)
Catedratico:
Lic. Claudia Nuñez (Analisis)
Lic. Giancarlo Martini Scalici Aguilar (Implementación)
Lic. Karla Melisa Garcia Pineda (Evaluación)

---------------------------------------------------------------------

Programa:         Pantalla de Ingreso a mantenimiento tipo de sangre
Fecha:             01-jan-2016
Programador:       Gissela Diaz 
descripcion:       Pantalla que contrala el tipo de sangre de las personas pacientes

-----------------------------------------------------------------------
                      Historial de Cambio
-----------------------------------------------------------------------
Programador               Fecha                      Descripcion
  D'aniel Martinez          11-07-2022                 Arreglar ortografía
  D'aniel Martinez          10-07-2022                 Eliminar bitacora de ingreso al mantenimiento
  D'aniel Martinez          11-07-2022                 Arreglar validación minimo y maximo.
  D'aniel Martinez          11-07-2022                 Permitir que valide bien los campos en modal editar
  D'aniel Martinez          11-07-2022                 Arreglar Validaciones inputs (No espacio al inicio y final,)
----------------------------------------------------------------------->
<?php
 include_once "conexion.php";
 include_once "conexion3.php";
 ?>
<head>

</head>
<body oncopy="return false" onpaste="return false">
  

<div class="content-wrapper">
  <div class="content-header">
    <div class="container-fluid">
    </div><!-- /.container-fluid -->
  </div>
  <section class="content-header text-xl-center mb-3 ">
              <h4>Tipo de Sangre </h4>
        </section>
  
  <section class="content">
    <div class="container-fluid">
      <div class="row">
        <div class="col-md-12">
                         <?php
                            include "conexionpdo.php";
                            $usuario=$_SESSION['vario'];
                            //Evaluo si existe el tipo de Rol
                            $evaluar_usuario = $db->prepare("SELECT CODIGO_TIPO_ROL 
                                                            FROM tbl_usuario 
                                                            WHERE NOMBRE_USUARIO = (?);");
                            $evaluar_usuario->execute(array($usuario));
                            $row=$evaluar_usuario->fetchColumn();
                            if($row > 0){
                                $usuariomo = $row;//capturo el nombre del ROl en la variable para usarla en el Procedimiento almacenado

                                //llamar al procedimiento almacenado
                                $evaluar_permiso = $db->prepare("CALL Sp_permiso_insertar(?,?);");
                                $evaluar_permiso->execute(array($usuariomo, '30'));
                                $row1=$evaluar_permiso->fetchColumn();
                                $permiso_registrar =$row1;             
                            }
                          ?> <!-- fin del codigo para sustraer el permiso de insertar.-->
                          <?php
                             if ($permiso_registrar == 'SI'){

                          ?>
                            <button  data-toggle="modal"  href="#AGREGAR_TIPOSANGRE" type='button' id="btnGuardar"  style="color:white;"class="btn btn-primary mb-3"><span> <i class="nav-icon fa fa-plus-square mx-1"></i></span>Agregar</button>
                            <button  onclick="Descargar()" data-toggle="modal"  href="" type='button' id="btnGuardar"  style="color:white; background-color:#FA0079" class="btn btn-danger mb-3"> <span><i class="nav-icon fa fa-file-pdf mx-1"></i></span>Reporte</button>
                          <?php
                              }
                          ?>
          
          
          <!-- jquery validation -->
          <div class="card card-primary">
          <div class="card-header text-center" style="background-color: #0CCDE3"><!-- TITULO ENCABEZADO DATOS PERSONALES -->
               <h1 class=" card-title text-center"><strong style="color:black;"></strong></h1>
            </div>
       
            <form  method="POST"class="needs-validation" novalidate><!-- form start -->
              <div class="card-body">
                  
                <div class="table-responsive">
                  <table id="tabla_tiposangre" class="table table-bordered table-striped">
                      <thead>
                        <tr>
                        <th class="text-center">Acción</th>
                          <th class="text-center">Código</th>
                          <th class="text-center">Tipo</th>
                          <th class="text-center">Estado</th>
                        </tr>
                      </thead>
                      <tbody>
                        <?php
                        $query = "SELECT  CODIGO_TIPO_SANGRE, TIPO,CODIGO_ESTADO FROM tbl_tipo_sangre;";
                        $result = $conn->query($query);
                        if ($result->num_rows > 0) {
                          while($row = $result->fetch_assoc()) {
                            $var1 = $row['CODIGO_TIPO_SANGRE'];
                            $var2 = $row['TIPO'];
                            $var4= $row['CODIGO_ESTADO'];
                        ?>
                        <tr>
                          <td>
                            <div class="text-center" >
                              <div class="btn-group">
                                
                               <?php
                                  include "conexionpdo.php";
                                  $usuario=$_SESSION['vario'];
                                  //Evaluo si existe el tipo de Rol
                                  $evaluar_usuario = $db->prepare("SELECT CODIGO_TIPO_ROL 
                                                                  FROM tbl_usuario 
                                                                  WHERE NOMBRE_USUARIO = (?);");
                                  $evaluar_usuario->execute(array($usuario));
                                  $row=$evaluar_usuario->fetchColumn();
                                  if($row > 0){
                                      $usuariomo = $row;//capturo el nombre del ROl en la variable para usarla en el Procedimiento almacenado

                                      $evaluar_permiso_eliminar = $db->prepare("CALL Sp_permiso_eliminar(?,?);");
                                      $evaluar_permiso_eliminar->execute(array($usuariomo, '30'));
                                      $row1=$evaluar_permiso_eliminar->fetchColumn();
                                      $permiso_eliminar =$row1; 
                                  }
                                ?>  
                                <?php
                                    if ($permiso_eliminar == 'SI'){

                                ?>
                               <a href="#ELIMINAR<?php echo $var1;?>" data-toggle="modal">
                                <button id="ELIMINAR_TIPOSANGRE" name="ELIMINAR_TIPOSANGRE" type='button'   class="btn btn-danger" data-dismiss="modal"><i class="nav-icon fas fa-trash"></i>
                               </button>
                               </a>

                               <?php
                                  }
                                ?>

                                <?php
                                  include "conexionpdo.php";
                                  $usuario=$_SESSION['vario'];
                                  //Evaluo si existe el tipo de Rol
                                  $evaluar_usuario = $db->prepare("SELECT CODIGO_TIPO_ROL 
                                                                  FROM tbl_usuario 
                                                                  WHERE NOMBRE_USUARIO = (?);");
                                  $evaluar_usuario->execute(array($usuario));
                                  $row=$evaluar_usuario->fetchColumn();
                                  if($row > 0){
                                      $usuariomo = $row;//capturo el nombre del ROl en la variable para usarla en el Procedimiento almacenado

                                   //llamar al procedimiento almacenado
                                  $evaluar_permiso_actualizar = $db->prepare("CALL Sp_permiso_actualizar(?,?);");
                                  $evaluar_permiso_actualizar->execute(array($usuariomo, '30'));
                                  $row1=$evaluar_permiso_actualizar->fetchColumn();
                                  $permiso_actualizar =$row1; 
                                    
                                  }
                                ?>
                                <?php
                                    if ($permiso_actualizar == 'SI'){

                                ?>
                                <a href="#EDITARTIPOSANGRE<?php echo $var1; ?>" data-toggle="modal">
                                <button type='button' id="btnGuardar"  style="color:white;"class="btn btn-warning"><span> <i class="nav-icon fas fa-edit mx-1"></i></span></button>
                              </a>

                                <?php
                                  }
                                 ?> 
                              </div>
                            </div><!-- final del text-center -->
                          </td>
                          <td class="text-center"><?php echo $var1; ?></td>
                          <td class="text-center"><?php echo $var2; ?></td>
                          <td class="text-center"><?php
                                                  $consulta1 = mysqli_query($conn,"SELECT NOMBRE FROM tbl_estado WHERE CODIGO_ESTADO='$var4'");
                                                  $IDE2=mysqli_fetch_array($consulta1); 
                                                  ECHO $IDE2['NOMBRE'];
                          ?></td>

                          

                        <!--INICIO DEL MODAL DE EDITAR TIPOSANGRE -->
                          <div id="EDITARTIPOSANGRE<?php echo $var1 ?>" class="modal fade" role="dialog">
                            <div class="modal-dialog modal-md">
                              <div class="modal-content"><!-- Modal content-->
                                <div class="modal-header" style="background-color: #0CCDE3">
                                    <h4 class="text-center">Editar Tipo de Sangre</h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                <form id="FORMEDITARTIPOSANGRE" method="POST"  >
                                  <div class="modal-body"><!--CUERPO DEL MODAL -->
                                    <div class="row"><!-- INICIO PRIMERA ROW -->  
                                      <input type="text" value ="<?php echo $var1; ?>" hidden class="form-control" name="id_tiposangre" id="id_tiposangre">
                                      <div class="col-sm-12">
                                        <div class="form-group" >
                                          <label for="txtcodigo_persona">Tipo de Sangre</label>
                                          <input  type="text"  value ="<?php echo $var2; ?>" class="form-control" pattern=".{6,15}"  maxlength="15"oninput="this.value = this.value.replace(/[^a-zA-Z ]/,'')" onkeyup="this.value=this.value.replace(/^\s+/,'');"   
                                          autocomplete = "off"   name="editar_tiposangre" id="tisangre"onblur="quitarespacios(this);" required>
                                          <div class="invalid-feedback">
                                              Campo Obligatorio.
                                          </div>
                                        </div>
                                        <div class="col-md-4"><!--INICIO estado--> 
                                            <label class="control-label">Estado:</label>
                                            <div class="form-group">
                                            
                                              <select class="form-control select2 select2-primary"   style="width: 100%;" name="EDITARESTADO" id="EDITARESTADO" required>
                                                <option  disabled value="">-- Seleccione --</option>
                                                <option value="2"<?php if ($var4==2) { ECHO "selected"; } ?>>ACTIVO</option>
                                                <option value="3"<?php if ($var4==3) { ECHO "selected"; } ?>>INACTIVO</option>
                                            </select> 
                                                <div class="invalid-feedback">
                                                        Elija una opción.
                                                </div>
                                            </div>
                                      </div> <!--Fin estado -->
                          </div>
                                    </div> <!-- FIN DE EL PRIMER ROW --> 
                                  </div><!--FINAL DEL CARD BODY -->                       
                                  <div class="modal-footer ">
                                    <button type="button" name="ELI" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                                    <button type="submit" id="editar" name="editar" class="btn btn-success"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>      
                                  </div><!--FIN DEL DIV DE BOTONES DE GUARDAR -->
                                </div>
                              </form>
                            </div>
                          </div><!-- FIN DEL MODAL EDITAR -->  
                            
                          <!--INCICIO DEL MODAL ELIMINAR   -->
                          <div id="ELIMINAR<?php echo $var1 ?>"  name="div_eliminar" id="div_eliminar"class="modal fade" role="dialog">
                            <div class="modal-dialog">
                              <div class="modal-content">
                                <div class="modal-header">
                                  <h5 class="modal-title" id="exampleModalLabel"></h5>
                                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                <form id="FORMeliminar" method="POST">
                                  <div class="modal-body">
                                    <input type="text" value ="<?php echo $var1; ?>" hidden class="form-control" name="eliminar_tiposangre" id="eliminar_tiposangre">
                                    <h4 class="text-center">¿Está seguro de eliminar el tipo de sangre? <?php echo $var2; ?>?</h4>
                                </div> <!--fin el card body -->
                                    <div class="modal-footer ">
                                      <button type="button" name="cerrar" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                                      <button type="submit"  name="ELIMINAR_TIPOSANGRE" id="ELIMINAR_TIPOSANGRE"  class="btn btn-primary">Si, eliminar</button>      
                                    </div>
                               </form>
                               </div><!--fin del modal contener -->
                            </div><!--fin del modal dialog -->
                          </div><!--fin del modal de eliminar -->
                      </tr>             
                        <?php
                        }
                        }
                        ?>
                      </tbody>
                  </table>
                </div><!--fin del div de responsivi -->
              </div> <!-- /.card-body -->
            </form>
          </div><!-- fINAL DEL card PRIMARY -->
        </div><!--FINAL DE COL-M12-->
      </div><!-- FINAL ROW PADRE -->
    </div><!-- FINAL CONTAINER FLUID --> 
  </section><!-- FINAL SECTION -->

  <!--INICIO DEL MODAL DE AGREGAR UN NUEVo TIPO DE SANGRE -->
  <div id="AGREGAR_TIPOSANGRE" class="modal fade" role="dialog">
       <div class="modal-dialog modal-md">
           <div class="modal-content"><!-- Modal content-->
                <form method="POST" class="needs-validation" novalidate>
                    <div class="modal-header" style="background-color: #0CCDE3">
                        <h4 class="text-center">Agregar Tipo de Sangre</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body"><!--CUERPO DEL MODAL -->
                        <div class="row"><!-- INICIO PRIMERA ROW -->  
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="txtcodigo_pregunta">Tipo de Sangre</label>
                                    <input  type="text"   class="form-control" pattern=".{6,10}"  maxlength="10" onkeypress="return soloLetras(event);" onkeyup="this.value=this.value.replace(/^\s+/,'');" autocomplete = "off" type="text" name="tiposangre" id="sangretipo"onblur="quitarespacios(this);" required>
                                    <div class="invalid-feedback">
                                       Campo Obligatorio.
                                   </div>
                                </div>
                            </div>
                            <div class="col-sm-12">
                                        <label for="cbx_persona" class="control-label">Estado</label>  
                                        <div class="form-group">
                                          <select class="form-control select2 select2-primary"   style="width: 100%;" name="ESTADOMANTENIMIENTO" id="ESTADOMANTENIMIENTO" required>
                                              <option selected disabled value="">-- Seleccione --</option>
                                              <option value="2">ACTIVO</option>
                                              <option value="3">INACTIVO</option>
                                          </select> 
                                        </div> 
                              </div>
                          
                        </div> <!-- FIN DE EL PRIMER ROW --> 
                    </div><!--FINAL DEL CARD BODY -->                       
                    <div class="modal-footer ">
                        <button type="button" name="ELI" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                        <button type="submit" id="agregar_tiposangre" name="agregar_tiposangre" class="btn btn-success"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>      
                    </div><!--FIN DEL DIV DE BOTONES DE GUARDAR -->
                </div>
            </form>
      </div>
   </div><!-- FIN DEL MODAL AGREGAR NUEVO TIPO DE SANGRE --> 
   </body>

  <!-- Button trigger modal -->
<script>
// Example starter JavaScript for disabling form submissions if there are invalid fields
(function () {
  'use strict'

  // Fetch all the forms we want to apply custom Bootstrap validation styles to
  var forms = document.querySelectorAll('.needs-validation')

  // Loop over them and prevent submission
  Array.prototype.slice.call(forms)
    .forEach(function (form) {
      form.addEventListener('submit', function (event) {
        if (!form.checkValidity()) {
          event.preventDefault()
          event.stopPropagation()
        }

        form.classList.add('was-validated')
      }, false)
    })
})()

</script>
<script type="text/javascript"> 
   //funcion de mostrar el estilo de la datatable
  $(document).ready( function () {
      $('#tabla_tiposangre').DataTable({

        language: {
        "decimal": "",
        "emptyTable": "No hay información",
        "info": "Mostrando _START_ a _END_ de _TOTAL_ Entradas",
        "infoEmpty": "Mostrando 0 a 0 de 0 Entradas",
        "infoFiltered": "(Filtrado de _MAX_ total entradas)",
        "infoPostFix": "",
        "thousands": ",",
        "lengthMenu": "Mostrar _MENU_ Entradas",
        "loadingRecords": "Cargando...",
        "processing": "Procesando...",
        "search": "Buscar tipo:",
        "zeroRecords": "Sin resultados encontrados",
        "paginate": {
            "first": "Primero",
            "last": "Ultimo",
            "next": "Siguiente",
            "previous": "Anterior"
        }
      },
        
      })
  } );
</script>
<script>
    function Descargar() {
      window.open('Reportes_Prosecar/reportetiposangre.php','_blank');
      window.open(this.href,'_self');
    }
  </script>
<script>
  sangretipo=document.getElementById("sangretipo"); //el nombre del id del campo
sangretipo.addEventListener('keydown', function(keyboardEvent) {
    //Si se está repitiendo, ignorar
    if (keyboardEvent.repeat)
        keyboardEvent.preventDefault();
});
</script>
<script>
var tisangre=document.getElementById("tisangre"); //el nombre del id del campo
tisangre.addEventListener('keydown', function(keyboardEvent) {
  if (keyboardEvent.repeat)
        keyboardEvent.preventDefault();
});
  </script>
  
  <script>


  function soloLetras(e){
   key = e.keyCode || e.which;
   tecla = String.fromCharCode(key).toLowerCase();
   letras = " ¿áéíóúabcdefghijklmnñopqrstuvwxyz?-";
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
 function soloLetrascaracteres(e){
   key = e.keyCode || e.which;
   tecla = String.fromCharCode(key).toLowerCase();
   letras = "áéíóúabcdefghijklmnñopqrstuvwxyz-";
   especiales = ["8-37-39-46" ];
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
 //funcion para solu numeros ingresar en el campo
 function soloNumeros_tel(e){
   var teclaPulsada=window.event ? window.event.keyCode:e.which;
    // capturamos el contenido del input
    var valor=document.getElementById("tele").value;
    if(valor.length<9){
      if(teclaPulsada==9){
        return true;
      }
    // devolvemos true o false dependiendo de si es numerico o no
    return /\d/.test(String.fromCharCode(teclaPulsada));
    }else{
    return false;
    }
  }
   //funcion para quitar espacios
  function quitarespacios(e) {
    var cadena =  e.value;
    cadena = cadena.trim();
    e.value = cadena;
  };
  //funcion para poner mayusculas
  function mayus(e) {
    e.value = e.value.toUpperCase();
  }
   //funcion sin espacios 
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
  //otra funcion para quitar espacios :V
  function quitarespacios(e) {
    var cadena =  e.value;
    cadena = cadena.trim();
    e.value = cadena;
  };
</script>
<script>
     $(document).ready( function () {
      $("input").on("keypress", function () {
       $input=$(this);
       setTimeout(function () {
        $input.val($input.val().toUpperCase());
       },50);
      })
     })
    </script>