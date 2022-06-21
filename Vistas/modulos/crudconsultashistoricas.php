<!-- -----------------------------------------------------------------------
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
    Programa:          Mantenimiento de CITAS
    Fecha:             
    Programador:       
    descripcion:       Edita,elimina y CITAS
-----------------------------------------------------------------------
  Historial de Cambio
-----------------------------------------------------------------------
    Programador           Fecha                      Descripcion
ANY HERNANDEZ         		11-06-2022                 revision de ortagrafia 
----------------------------------------------------------------------->

<?php
 include_once "conexion.php";
 include_once "conexion3.php";
 $codigoObjeto=32;
 $accion='Ingreso a mantenimiento preguntas';
 $descripcion='Pregunta realizadas al usuario para cambio de contraseña';
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
  <section class="content-header text-xl-center mb-3 btn-light">
              <h4>Mantenimietno Expediente de Consultas Psicologicas Historicas  </h4>
        </section>
  
  <section class="content">
    <div class="container-fluid">
      <div class="row">
        <div class="col-md-12">
            
            <button  onclick="Descargar()" data-toggle="modal"  href="" type='button' id="btnGuardar"  style="color:white; background-color:#FA0079" class="btn btn-danger mb-3"> <span><i class="nav-icon fa fa-file-pdf mx-1"></i></span>Generar Reporte</button>
                         
          <!-- jquery validation -->
          <div class="card card-primary">
          <div class="card-header text-center" style="background-color: #0CCDE3"><!-- TITULO ENCABEZADO DATOS PERSONALES -->
               <h1 class=" card-title text-center"><strong style="color:black;"></strong></h1>
            </div>
       
            <form  method="POST" class="needs-validation" novalidate><!-- form start -->
              <div class="card-body">
                  
                <div class="table-responsive">
                  <table id="tabla_preguntas" class="table table-bordered table-striped">
                      <thead>
                        <tr>
                        <th class="text-center">Acción</th>
                             <th class="text-center">Código</th>
                             <th class="text-center">Paciente</th>
                             <th class="text-center">Síntomas</th>
                             <th class="text-center">Diagnóstico de ingreso</th>
                             <th class="text-center">Diagnóstico de egreso</th>
                             <th class="text-center">Observaciones</th>
                     
                          
                      
                        </tr>
                      </thead>
                      <tbody>
                        <?php
                        $query = "SELECT epc.CODIGO_EXPEDIENTE_PSICO, 
                        CONCAT_WS(' ',tp.PRIMER_NOMBRE, tp.SEGUNDO_NOMBRE, tp.PRIMER_APELLIDO,tp.SEGUNDO_APELLIDO) AS PACIENTE, 
                        epc.SINTOMAS, 
                        epc.DIAGNOSTICO_INGRESO,
                         epc.DIAGNOSTICO_EGRESO, 
                        epc.OBSEVARCIONES FROM tbl_expediente_psicologico_consulta epc, 
                        tbl_inscripcion_cita ic, tbl_persona tp
                        where epc.CODIGO_CITA = ic.CODIGO_CITA and 
                       ic.CODIGO_PERSONA = tp.CODIGO_PERSONA;";
                        $result = $conn->query($query);
                        if ($result->num_rows > 0) {
                          while($row = $result->fetch_assoc()) {
                            $var1 = $row['CODIGO_EXPEDIENTE_PSICO'];
                             $var2 = $row['PACIENTE'];
                             $var3 = $row['SINTOMAS'];
                             $var4 = $row['DIAGNOSTICO_INGRESO'];
                             $var5 = $row['DIAGNOSTICO_EGRESO'];
                            $var6 = $row['OBSEVARCIONES'];
            
                         
                        ?>
                        <tr>
                          <td>
                            <div class="text-center" >
                              <div class="btn-group">
                                <a href="#EDITARCONSULTA<?php echo $var1; ?>" data-toggle="modal">
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
                                  $evaluar_permiso_actualizar->execute(array($usuariomo, '1'));
                                  $row1=$evaluar_permiso_actualizar->fetchColumn();
                                  $permiso_actualizar =$row1; 
                                    
                                  }
                                ?>
                                <?php
                                    if ($permiso_actualizar == 'SI'){

                                ?>
                                <button type='button' id="btnGuardar"  style="color:white;" class=" form-control btn btn-warning"><span> <i class="nav-icon fas fa-edit mx-1"></i></span></button>
                                <?php
                                  }
                                 ?> 
                              </a>
                              <a>
                                   <form method="post"  class="form-horizontal" role="form" action="Reportes_Prosecar/reporteindividualconhistopsico.php" target="_blank"> 
                                    <input type="hidden" name="imprimir" value="<?php echo $var1 ?>">
                                    <button type='submit' title='Imprimir'  style="color:white; "class=" form-control btn btn-info mb-3"><span><i class="nav-icon fa fa-file-pdf mx-1"></i></span></button> </form>
                                </a>
                              </div>
                            </div><!-- final del text-center -->
                          </td>
                          <td class="text-center"><?php echo $var1; ?></td>
                           <td class="text-center"><?php echo $var2; ?></td>
                           <td class="text-center"><?php echo $var3; ?></td>
                           <td class="text-center"><?php echo $var4; ?></td>
                           <td class="text-center"><?php echo $var5; ?></td>
                        <td class="text-center"><?php echo $var6; ?></td>
                                                

                          

                        <!--INICIO DEL MODAL DE EDITAR PREGUNTA -->
                          <div id="EDITARCONSULTA<?php echo $var1 ?>" class="modal fade" role="dialog">
                            <div class="modal-dialog modal-md">
                              <div class="modal-content"><!-- Modal content-->
                                <form  method="POST" class="needs-validation" novalidate>
                                  <div class="modal-header" style="background-color: #0CCDE3">
                                    <h4 class="text-center" >Editar consulta</h4>

                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                  </div>
                                  <div class="modal-body"><!--CUERPO DEL MODAL -->
                                    <div class="row"><!-- INICIO PRIMERA ROW -->  
                                      <input type="text" value ="<?php echo $var1; ?>" hidden class="form-control" name="cod_edit_con" id="codi_con">
                                      <div class="col-sm-12">
                                        <div class="form-group">
                                          <label for="txtcodigo_persona">Sintomas</label>
                                          <textarea type="text"  value ="<?php echo $var3; ?>" class="form-control"   maxlength="100" minlength="5"    autocomplete = "off" type="text"  
                                          name="sintomas" id="sintom" required=""> <?php echo $var3?></textarea>
                                          <div class="invalid-feedback">
                                       campo obligatorio.
                                   </div>
                                        </div>
                          </div>
                          <div class="col-sm-12">
                                        <div class="form-group">
                                          <label for="txtcodigo_persona">Diagnostico de ingreso</label>
                                          <textarea  type="text" class="form-control"   maxlength="200" minlength="5"    autocomplete = "off" type="text"  
                                          name="dingreso" id="ingre" required=""><?php echo $var4?></textarea>
                                          <div class="invalid-feedback">
                                       campo obligatorio.
                                   </div>
                                        </div>
                          </div>
                          
                                      <div class="col-sm-12">
                                        <div class="form-group">
                                          <label for="txtcodigo_persona">Diagnostico Egreso</label>
                                          <textarea  type="text"  value ="<?php echo $var5; ?>" class="form-control"   maxlength="200" minlength="5"    autocomplete = "off" type="text"  
                                          name="diegreso" id="die" required=""> <?php echo $var5?> </textarea>
                                          <div class="invalid-feedback">
                                       campo obligatorio.
                                   </div>
                                        </div>
                          </div>
                          <div class="col-sm-12">
                                        <div class="form-group">
                                          <label for="txtcodigo_persona">Observaciones</label>
                                          <textarea type="text"  class="form-control"   maxlength="600" minlength="5"    autocomplete = "off" type="text"  
                                          name="observaciones" id="observe" required=""> <?php echo $var6?></textarea>
                                          <div class="invalid-feedback">
                                       campo obligatorio.
                                   </div>
                                        </div>
                          </div>
                                    </div> <!-- FIN DE EL PRIMER ROW --> 
                                  </div><!--FINAL DEL CARD BODY -->                       
                                  <div class="modal-footer ">
                                    <button type="button" name="ELI" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                                    <button type="submit" id="edicon" name="edicon" class="btn btn-success"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>      
                                  </div><!--FIN DEL DIV DE BOTONES DE GUARDAR -->
                                </div>
                              </form>
                            </div>
                          </div><!-- FIN DEL MODAL EDITAR -->  
                            
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

  <!--INICIO DEL MODAL DE AGREGAR UN NUEVA PREGUNTAL -->
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
                                <div class="form-group">
                                    <label for="txtcodigo_pregunta">Preguntas</label>
                                    <input  type="text"   class="form-control"  maxlength="60" minlength="5"   autocomplete = "off" type="text"  name="pregunta" id="pregu" required="" onkeypress="return soloLetras(event);">
                                    <div class="invalid-feedback">
                                       campo obligatorio.
                                   </div>
                                </div>
                            </div>
                          
                        </div> <!-- FIN DE EL PRIMER ROW --> 
                    </div><!--FINAL DEL CARD BODY -->                       
                    <div class="modal-footer ">
                        <button type="button" name="ELI" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                        <button type="submit" id="agregar_pregunta" name="agregar_pregunta" class="btn btn-success"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>      
                    </div><!--FIN DEL DIV DE BOTONES DE GUARDAR -->
                </div>
            </form>
      </div>
   </div><!-- FIN DEL MODAL AGREGAR NUEVO PREGUNTA --> 
   </body>

  <!-- Button trigger modal -->


<!-- Modal -->


 <!--Funcion de la datatable -->
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
        "search": "Buscar:",
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
<script>
    function Descargar() {
      window.open('Reportes_Prosecar/reporteconsultahistoricapsico.php','_blank');
      window.open(this.href,'_self');
    }
  </script>

  <script>
        window.onload = function() {
      var pregu= document.getElementById('pregu');// el id del input donde quieres aplicarlo
      var edipre = document.getElementById('edipre');
      pregu.onpaste = function(e) {
        e.preventDefault();
      }
      edipre.onpaste = function(e) {
        e.preventDefault();
      }
      pregu.oncopy = function(e) {
        e.preventDefault();
     }
     edipre.oncopy = function(e) {
        e.preventDefault();
     }
    }
  </script>
  <script>
    var pregun=document.getElementById("pregu"); //el nombre del id del campo
    pregun.addEventListener('keydown', function(keyboardEvent) {
    //Si se está repitiendo, ignorar
    if (keyboardEvent.repeat)
        keyboardEvent.preventDefault();
});
var edipreg=document.getElementById("edipre"); //el nombre del id del campo
    edipreg.addEventListener('keydown', function(keyboardEvent) {
    //Si se está repitiendo, ignorar
    if (keyboardEvent.repeat)
        keyboardEvent.preventDefault();
});
</script>

  </script>

  <script>


  function soloLetras(e){
   key = e.keyCode || e.which;
   tecla = String.fromCharCode(key).toLowerCase();
   letras = " ¿áéíóúabcdefghijklmnñopqrstuvwxyz?";
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