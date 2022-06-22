<!-- 
-----------------------------------------------------------------------
Universidad Nacional Autonoma de Honduras (UNAH)
		Facultad de Ciencias Economicas
Departamento de Informatica administrativa
Analisis, Programacion y Evaluacion de Sistemas
           Primer Periodo 2016

Equipo:


Catedratico:
Lic. Claudia Nuñez (Analisis)
Lic. Giancarlo Martini Scalici Aguilar (Implementación)
Lic. Karla Melisa Garcia Pineda (Evaluación)

---------------------------------------------------------------------

Programa:         Pantalla de Ingreso a mantenimiento modalidad
Fecha:             01-jan-2016
Programador:       Gissela Diaz 
descripcion:       Pantalla que contrala la modalidad de las tutorias 

-----------------------------------------------------------------------
                      Historial de Cambio
-----------------------------------------------------------------------

Programador               Fecha                      Descripcion
----------------------------------------------------------------------->
<?php
 include_once "conexion.php";
 include_once "conexion3.php";
 $codigoObjeto=19;
 $accion='INGRESO A MANTENIMIENTO MODALIDAD';
 $descripcion='MANTENIMIENTO A LOS REGISTROS DE MODALIDAD';
bitacora($codigoObjeto,$accion,$descripcion);
?>
<head>

</head>
<body oncopy="return false" onpaste="return false">
 

<div class="content-wrapper">
  <div class="content-header">
    <div class="container-fluid">
    </div><!-- /.container-fluid -->
  </div>
  <div class="content-header text-xl-center mb-3">
    <h4>Mantenimiento Modalidad </h4>
  </div>

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
                                $evaluar_permiso->execute(array($usuariomo, '19'));
                                $row1=$evaluar_permiso->fetchColumn();
                                $permiso_registrar =$row1;             
                            }
                            ?> <!-- fin del codigo para sustraer el permiso de insertar.-->
                            <?php
                             if ($permiso_registrar == 'SI'){

                             ?>

                              <button  data-toggle="modal"  href="#AGREGAR_MODALIDAD" type='button' id="btnGuardar"  style="color:white;"class="btn btn-primary mb-3"><span> <i class="nav-icon fa fa-plus-square mx-1"></i></span>Agregar Modalidad</button>
                              <button  onclick="Descargar()" data-toggle="modal"  href="" type='button' id="btnGuardar"  style="color:white; background-color:#FA0079" class="btn btn-danger mb-3"> <span><i class="nav-icon fa fa-file-pdf mx-1"></i></span>Generar Reporte</button>
                            <?php
                              }
                            ?>
          
          <!-- jquery validation -->
          <div class="card card-primary">
          <div class="card-header text-center" style="background-color: #0CCDE3"><!-- TITULO ENCABEZADO DATOS PERSONALES -->
               <h1 class=" card-title text-center"><strong style="color:black;"></strong></h1>
            </div>
       
            <form  method="POST" class="needs-validation" novalidate><!-- form start -->
              <div class="card-body">
                  
                <div class="table-responsive">
                  <table id="tabla_Modalidad" class="table table-bordered table-striped">
                      <thead>
                        <tr>
                        <th class="text-center">Acción</th>
                          <th class="text-center">Código</th>
                          <th class="text-center">Tipo modalidad</th>
                          <th class="text-center">Descripcion</th>
                        </tr>
                      </thead>
                      <tbody>
                        <?php
                        $query = "SELECT CODIGO_MODALIDA, TIPO, DESCRIPCION from tbl_modalidad;";
                        $result = $conn->query($query);
                        if ($result->num_rows > 0) {
                          while($row = $result->fetch_assoc()) {
                            $var1 = $row['CODIGO_MODALIDA'];
                            $var2 = $row['TIPO'];
                            $var3 = $row['DESCRIPCION'];
                           
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
                                $evaluar_permiso_eliminar->execute(array($usuariomo, '19'));
                                $row1=$evaluar_permiso_eliminar->fetchColumn();
                                $permiso_eliminar =$row1; 
                            }
                            ?> 

                                 <?php
                                  if($permiso_eliminar == 'SI')
                                   {
                                ?>
                                
                               <a href="#ELIMINAR<?php echo $var1;?>" data-toggle="modal">
                               
                              
                               <button id="ELIMINAR_MODALIDAD" name="ELIMINAR_MODALIDAD" type='button'   class="btn btn-danger" data-dismiss="modal"><i class="nav-icon fas fa-trash"></i>
                               </button>
                             </a>
                             <?php
                                  }
                                 ?>
                                  <!-- Codigo de permiso para Actualizar -->
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
                                      $evaluar_permiso_actualizar->execute(array($usuariomo, '19'));
                                      $row1=$evaluar_permiso_actualizar->fetchColumn();
                                      $permiso_actualizar =$row1; 
                                    
                                  }
                                  ?>
                                 <?php
                                    if ($permiso_actualizar == 'SI'){

                                  ?>

                               
                                <a href="#EDITARMODALIDAD<?php echo $var1; ?>" data-toggle="modal">
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
                          <td class="text-center"><?php echo $var3; ?></td>
    

                        <!--INICIO DEL MODAL DE EDITAR MODALIDAD-->
                        
                          
                        <div id="EDITARMODALIDAD<?php echo $var1 ?>" class="modal fade" role="dialog">
                            <div class="modal-dialog modal-md">
                              <div class="modal-content"><!-- Modal content-->
                                <div class="modal-header" style="background-color: #0CCDE3">
                                    <h4 class="text-center">Editar Modalidad</h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                  </div>
                                <form id="FORMEDITRAPERSONAS" method="POST" >
                                  <div class="modal-body"><!--CUERPO DEL MODAL -->
                                    <div class="row"><!-- INICIO PRIMERA ROW -->  
                                      <input type="text" value ="<?php echo $var1; ?>" hidden class="form-control" name="id_editar" id="id_editar">
                                   
                                      <div class="col-sm-12">
                                        <div class="form-group">
                                          <label for="txtcodigo_persona">Tipo Modalidad</label>
                                          <input  type="text"  value ="<?php echo $var2; ?>" class="form-control"  maxlength="20" minlength="5" onkeyup="mayus(this);" onkeypress="return soloLetras(event);" 
                                           autocomplete = "off" type="text"  name="editar_modalidad" id="edimoda" required="">
                                          <div class="invalid-feedback">
                                             Campo obligatorio.
                                          </div>
                                        </div>
                                   </div>
                                      <div class="col-sm-12">
                                        <div class="form-group">
                                          <label for="txtdescrpcion">Descripción</label>
                                          <input  type="text"  value ="<?php echo $var3; ?>" class="form-control"  maxlength="100"  onkeyup="mayus(this);" onkeypress="return soloLetras(event);" 
                                           autocomplete = "off" type="text"   name="editar_descripcion1" id="edidemoda" required="">
                                          <div class="invalid-feedback">
                                           Campo obligatorio.
                                           </div>
                                        </div>
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
                                    <input type="text" value ="<?php echo $var1; ?>" hidden class="form-control" name="eliminar" id="eliminar">
                                    <h4 class="text-center">¿Está seguro de eliminar la Modalidad <?php echo $var2; ?>?</h4>
                                </div> <!--fin el card body -->
                                    <div class="modal-footer ">
                                      <button type="button" name="cerrar" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                                      <button type="submit"  name="ELIMINAR_MODALIDAD" id="ELIMINAR_MODALIDAD"  class="btn btn-primary">Si,eliminar</button>      
                                    </div><!--FIN DEL DIV DE BOTONES DE GUARDAR -->
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

  <!--INICIO DEL MODAL DE AGREGAR UN NUEVA MODALIDAD -->
  <div id="AGREGAR_MODALIDAD" class="modal fade" role="dialog">
       <div class="modal-dialog modal-md">
           <div class="modal-content"><!-- Modal content-->
                <form id="FORMEDITARMODA" method="POST" class="needs-validation" novalidate>
                    <div class="modal-header" style="background-color: #0CCDE3">
                        <h4 class="text-center">Agregar Modalidad</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body"><!--CUERPO DEL MODAL -->
                        <div class="row"><!-- INICIO PRIMERA ROW -->  
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="txtmodalidad">Tipo Modalidad</label>
                                    <input  type="text"  class="form-control"  maxlength="20" minlength="5" onkeyup="mayus(this);"  onKeyDown="sinespacio(this);"  autocomplete = "off" type="text" onkeypress="return soloLetras(event);" 
                                    placeholder="Ingrese modalidad" name="nombremodalidad" id ="moda" required="">
                                    <div class="invalid-feedback">
                                  campo obligatorio.
                                   </div>

                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="txtmodalidad">Descripción</label>
                                    <textarea  type="text"   class="form-control"  maxlength="100"  onkeyup="mayus(this);"  autocomplete = "off" type="text" onkeypress="return soloLetras(event);"
                                     placeholder="Ingrese una descripción a la modalidad" name="descripcionmodalidad" id= "modali" required=""></textarea>
                                    <div class="invalid-feedback">
                                  campo obligatorio.
                                   </div>
                                </div>
                            </div>
                        </div> <!-- FIN DE EL PRIMER ROW --> 
                    </div><!--FINAL DEL CARD BODY -->                       
                    <div class="modal-footer ">
                        <button type="button" name="ELI" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                        <button type="submit" id="agregarmodalidad" name="agregarmodalidad" class="btn btn-success"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>      
                    </div><!--FIN DEL DIV DE BOTONES DE GUARDAR -->
                </div>
            </form>
      </div>
   </div><!-- FIN DEL MODAL AGREGAR NUEVO modalidad --> 
   </body>

<script type="text/javascript"> 
  $(document).ready( function () {
      $('#tabla_Modalidad').DataTable({
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
        "search": "Buscar Modalidad:",
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
  (function () {
    'use strict'
    var forms = document.querySelectorAll('.needs-validation')
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
    function Descargar() {
      window.open('Reportes_Prosecar/reportemodalidad.php','_blank');
      window.open(this.href,'_self');
    }
  </script>

<script>
    var moda=document.getElementById("moda"); //el nombre del id del campo
moda.addEventListener('keydown', function(keyboardEvent) {
    //Si se está repitiendo, ignorar
    if (keyboardEvent.repeat)
        keyboardEvent.preventDefault();
});
var modali=document.getElementById("modali"); //el nombre del id del campo
modali.addEventListener('keydown', function(keyboardEvent) {
    //Si se está repitiendo, ignorar
    if (keyboardEvent.repeat)
        keyboardEvent.preventDefault();
});
</script>
<script>
var edimoda=document.getElementById("edimoda"); //el nombre del id del campo
edimoda.addEventListener('keydown', function(keyboardEvent) {
    //Si se está repitiendo, ignorar
    if (keyboardEvent.repeat)
        keyboardEvent.preventDefault();
});
var edidemoda=document.getElementById("edidemoda"); //el nombre del id del campo
edidemoda.addEventListener('keydown', function(keyboardEvent) {
    //Si se está repitiendo, ignorar
    if (keyboardEvent.repeat)
        keyboardEvent.preventDefault();
});

  </script>
  
  <script>
function soloLetrascaracteres(e){
   key = e.keyCode || e.which;
   tecla = String.fromCharCode(key).toLowerCase();
   letras = "áéíóúabcdefghijklmnñopqrstuvwxyz-";
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
  