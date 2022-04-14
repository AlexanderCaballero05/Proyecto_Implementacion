<?php
include_once "conexion.php";
include_once "conexion3.php";
include_once 'conexionpdo.php';
 include "conexionpdo.php";

 ?>
 <?php

?>

      <!--llamada de la fuction bitacora -->
     <?php 
      $codigoObjeto=1;
      $accion='Ingreso a la pantalla de mantenimiento usuarios';
      $descripcion= 'Ver los registros de los usuarios';
      bitacora($codigoObjeto, $accion,$descripcion);
      ?>
      
<head>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="../vistas/assets/plugins/jquery/jquery.min.js"></script>
</head>

<div class="content-wrapper">
  <div class="content-header">
    <div class="container-fluid">
    </div><!-- /.container-fluid -->
  </div>
  <section class="content-header text-xl-center mb-3 btn-light"> 
          <h4> PREGUNTAS DE SEGURIDAD USUARIO  <i class="nav-icon fas fa"></i></h4>
        </section>
  
  <section class="content">
    <div class="container-fluid">
  <button  data-toggle="modal"  href="#AGREGAR_PREGUNTA" type='button' id="btnGuardar"   style="color:white;"class="btn btn-primary mb-3"><span> <i class="nav-icon fa fa-plus-square mx-1"></i></span>Agregar Pregunta</button>
  <button  onclick="Descargar()" data-toggle="modal"  href="" type='button' id="btnGuardar"  style="color:white; background-color:#FA0079" class="btn btn-danger mb-3"> <span><i class="nav-icon fa fa-file-pdf mx-1"></i></span>Generar Reporte</button>

      <div class="row">
        <div class="col-md-12">
          <!-- jquery validation -->
          <div class="card card-primary">
            <div class="card-header text-center" style="background-color: #0CCDE3"><!-- TITULO ENCABEZADO DATOS PERSONALES -->
               <h1 class=" card-title text-center"></h1>
            </div>
            <form  method="POST" class="needs-validation" novalidate><!-- form start -->
              <div class="card-body">
                <div class="table-responsive">
                  <table id="tabla_preguntas" class="table table-bordered table-striped">
                  <thead class="text-center">
                        <tr>
                          <th>Acción</th>
                          <th>Id</th>
                          <th>Pregunta</th>
                          <th>Nombre Usuario</th>
                          
                         </tr>
                      </thead>
                      <tbody>

                                   <?php
                                        $usuario= $_SESSION['vario'];
                                        //Consulta que trae el codigo del usuario
                                        $sentencia1 = $db->prepare("SELECT p.CODIGO_PERSONA
                                        FROM tbl_usuario u, tbl_persona p 
                                        WHERE u.CODIGO_PERSONA = p.CODIGO_PERSONA
                                        AND NOMBRE_USUARIO = (?);");
                                        $sentencia1->execute(array($usuario));
                                        $cod_usuario=$sentencia1->fetchColumn();
                                    ?>

                        <?php
                        //debo de colocar el id de la tabla para poder hacer el proceso de eliminar filas
                        $query = "SELECT pu.CODIGO_PREGUNTA_USUARIO, u.CODIGO_USUARIO, p.PREGUNTA, u.NOMBRE_USUARIO, pu.RESPUESTA, pu.CODIGO_PREGUNTAS
                        from tbl_usuario u, tbl_preguntas_usuarios pu, tbl_preguntas p, tbl_persona per
                        where u.CODIGO_USUARIO = pu.CODIGO_USUARIO
                        and p.CODIGO_PREGUNTAS = pu.CODIGO_PREGUNTAS
                        and u.CODIGO_PERSONA = per.CODIGO_PERSONA
                        and per.CODIGO_PERSONA = '$cod_usuario'
                        ORDER BY pu.CODIGO_PREGUNTAS ASC;";
                        $result = $conn->query($query);
                        if ($result->num_rows > 0) {
                          while($row = $result->fetch_assoc()) {
                            $var1 = $row['CODIGO_USUARIO'];
                            $var2 = $row['PREGUNTA'];
                            $var3 = $row['NOMBRE_USUARIO'];
                            $var4 = $row['CODIGO_PREGUNTAS'];
                            $var5 = $row['CODIGO_PREGUNTA_USUARIO'];
                           
                        ?>
                        <tr>
                          <td>
                            <div class="text-center" >
                              <div class="btn-group">
                              <!--debo de colocar el id de la tabla para poder hacer el proceso de eliminar filas-->
                               <a href="#ELIMINAR<?php echo $var5;?>" data-toggle="modal">
                                <button id="ELIMINAR_USUARIO" name="ELIMINAR_USUARIO" type='button'   class="btn btn-danger" data-dismiss="modal"><i class="nav-icon fas fa-trash"></i>
                               </button>
                               </a>
                                
                              </div>
                            </div><!-- final del text-center -->
                          </td>
                          <td class="text-center"><?php echo $var4; ?></td>
                          <td class="text-center"><?php echo $var2; ?></td>
                          <td class="text-center"><?php echo $var3; ?></td>

         
                              <!--debo de colocar el id de la tabla para poder hacer el proceso de eliminar filas-->
                          <div id="ELIMINAR<?php echo $var5 ?>"  name="div_eliminar" id="div_eliminar"class="modal fade" role="dialog">
                            <div class="modal-dialog">
                              <div class="modal-content">
                                <div class="modal-header">
                                  <h5 class="modal-title" id="exampleModalLabel"></h5>
                                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                <form id="" method="POST">
                                  <div class="modal-body">
                                    <input type="text" value ="<?php echo $var5; ?>" hidden class="form-control" name="codigo_pregunta_usuario" id="usuario_eliminar">
                                    <input type="text" value ="<?php echo $var1; ?>" hidden class="form-control" name="codigo_usuario" id="usuario_eliminar">
                                    <h4 class="text-center">¿Esta seguro de eliminar la pregunta?<?php echo $var2; ?></h4>
                                    <input type="text" value ="<?php echo $var4; ?>" hidden class="form-control" name="codigo_pregunta" id="usuario_eliminar">
                                    
                                </div> <!--fin el card body -->
                                    <div class="modal-footer ">
                                      <button type="button" name="cerrar" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                                      <button type="submit"  name="ELIMINAR_PREGUNTA" id="ELIMINAR"  class="btn btn-primary">Si,eliminar</button>      
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

  <!-- Button trigger modal -->


<!-- Modal -->


                    <?php
                    include_once "conexion3.php";
                    $query1= "SELECT  CODIGO_PREGUNTAS, PREGUNTA FROM tbl_preguntas;";
                    $resultado= $conn->query($query1);
                    ?>
<!-- Inicio para agregar preguntas usuario-->

<div id="AGREGAR_PREGUNTA" class="modal fade" role="dialog">
       <div class="modal-dialog modal-md">
           <div class="modal-content"><!-- Modal content-->
            <form method="POST" class="needs-validation" novalidate>
                    <div class="modal-header" style="background-color: #0CCDE3">
                        <h4 class="text-center">Agregar Pregunta</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body"><!--CUERPO DEL MODAL -->


                    <div class="row"><!-- INICIO PRIMERA ROW -->  
                            <div class="col-sm-12">
                                 <!--INICIO COMOBOX TIPO DE ROL-->
                                <div class="form-group">
                                    <label for="txtcodigo_persona">pregunta:</label>
                                    <select class="form-control" name="pregunta_usuario_individual" required="">
                                        <option selected disabled value="">Seleccionar preguntas...</option>
                                        <?php //Muestra los datos de la tabla de preguntas en el select
                              foreach($resultado as $pregunta){
                              $valuep =$pregunta['CODIGO_PREGUNTAS'];
                              $pre =  $pregunta['PREGUNTA'];
                              ?>
                              <option value="<?php echo $valuep?>"> <?php echo $pre;?></option>
                              <?php
                                }
                              
                              ?>
                                    </select>
                                             <div class="invalid-feedback">
                                                Eliga una opción.
                                             </div>
                                </div>
                            </div> <!--FIN DEL COMOBOX TIPO DE ROL-->
                    </div>
                    
                    
                   <div class="row">
                   <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="txtcodigo_persona">Respuesta:</label>
                      <input type="text" name="respuesta_usuario_individual" id="respuesta_usuario_individual" class="form-control" id="" onkeyup="mayus(this);" 
                         placeholder="respuesta de seguridad" onkeypress="return soloLetras(event);" autocomplete = "off" required="">
                       </div>

                       <div class="valid-feedback">
                        ¡Se ve bien!
                   </div>
                    </div>
                </div> 
                    </div><!--FINAL DEL CARD BODY -->                       
                    <div class="modal-footer ">
                        <button type="button" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                        <button type="submit" id="agregar_pregunta_usuario" name="agregar_pregunta_usuario" class="btn btn-success"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>      
                    </div><!--FIN DEL DIV DE BOTONES DE GUARDAR -->
          </form>
          </div>
      </div>
   </div><!-- FIN DEL MODAL AGREGAR NUEVO PREGUNTA --> 




</div><!-- /.content-wrapper -->
  <aside class="control-sidebar control-sidebar-dark"><!-- Control Sidebar -->
  </aside>
  <!-- /.control-sidebar -->
</div>
  </div><!-- /.content-wrapper -->
  <aside class="control-sidebar control-sidebar-dark"><!-- Control Sidebar -->
  </aside>
</div><!-- ./wrapper -->





 




 
 



<script type="text/javascript"> 
$( function() {
    $("#ESTADOUSUARIO").change( function() {
        if ($(this).val() === "4") {
          document.getElementById('CONUSUARIO').disable = true;
        
        } else{
          document.getElementById('CONUSUARIO').disable = false;
         
        }
    });
 }); //este codigo si me costo 

</script>



<script type="text/javascript"> 
   //funcion de mostrar el estilo de la datatable
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

                                  
<!-- funciones del sistema -->
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

<script type="text/javascript"> 
   //funcion de mostrar el estilo de la datatable
  $(document).ready( function () {
      $('#tabla_preguntas').DataTable({

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
        "search": "Buscar personas:",
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

