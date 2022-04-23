<?php
include_once "conexion.php";
include_once "conexion3.php";

?>
      <!--llamada de la fuction bitacora -->
     <?php 
      $codigoObjeto=3;
      $accion='Ingreso a la pantalla de mantenimiento parámetros';
      $descripcion= 'Aqui se visualiza los registros existentes de la tabla parámetros';
      bitacora($codigoObjeto, $accion,$descripcion);
      ?>
      
 <head>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script> <!--Para que funcione el selecrt2 -->
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script> 
</head> 

<div class="content-wrapper">
  <div class="content-header">
    <div class="container-fluid">
    </div><!-- /.container-fluid -->
  </div>
  
  <section class="content">
    <div class="container-fluid">
    <section class="content-header text-xl-center mb-3 btn-light"> 
          <h4> RELACIÓN DEL FAMILIAR CON EL ESTUDIANTE  </h4>
        </section>
        <div class="card">
          <div class="card-header" style="background-color:#B3F2FF;">
          <ul class="nav nav-tabs card-header-tabs">
              <li class="nav-item">
                <a class="nav-link" style="color:#000000;" aria-current="true" href="crudfamiliares"> Ver Familiares </a>
              </li>
              <li class="nav-item">
                <a class="nav-link "  style="color:#000000;" href="procesoRegistrarFamiliares"> Agregar Familiar </a>
              </li>
              <li class="nav-item">
                <a class="nav-link active"  style="color:#000000;" href="crudFamiliaresEstudiantes"> Agregar relación Familiar-Estudiante </a>
              </li>
              <li class="nav-item">
                <a class="nav-link "  style="color:#000000;" href="crudParentesco"> Parentesco </a>
              </li>
            </ul>
          </div>
          <div class="card-body">
          </br> 
<body oncopy="return false" onpaste="return false">
  

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
                                $evaluar_permiso->execute(array($usuariomo, '3'));
                                $row1=$evaluar_permiso->fetchColumn();
                                $permiso_registrar =$row1;             
                            }
                            ?> <!-- fin del codigo para sustraer el permiso de insertar.-->

                    <?php 
                    if ($permiso_registrar == 'SI') // Aqui valida que si permiso esta en ON se mostrara el botton de agregar
                    {
                    ?>      

                    <button  data-toggle="modal"  href="#agregar_relfam" type='button' id="btnNuevo"  style="color:white;"class="btn btn-primary mb-3"><span><i class="nav-icon fa fa-plus-square mx-1"></i></span>Agregar Relación Familiar-Estudiante</button>


                   <?php
                    }
                    ?>

                  <button  onclick="Descargar()" data-toggle="modal"  href="" type='button' id="btnGuardar"  style="color:white; background-color:#FA0079" class="btn btn-danger mb-3"> <span><i class="nav-icon fa fa-file-pdf mx-1"></i></span>Generar Reporte</button>



          <!-- jquery validation -->
          <div class="card card-primary">
            <div class="card-header text-center" style="background-color: #0CCDE3"><!-- TITULO ENCABEZADO DATOS PERSONALES -->
            </div>
            <form  method="POST" ><!-- form start -->
              <div class="card-body">
                <div class="table-responsive">
                  <table id="tabla_familiaresEstudiantes" class="table table-bordered table-striped">
                      <thead>
                        <tr>
                          <th class="text-center">Acción</th>
                          <th class="text-center">ID</th>
                          <th class="text-center">Familiar</th>
                          <th class="text-center">Parentesco</th>
                          <th class="text-center">Estudiante</th>
                        </tr>
                      </thead>
                      <tbody>
                        <?php
                        $query = "SELECT  fe.CODIGO_FAM_EST,
                        (select concat_ws (' ',tp2.PRIMER_NOMBRE, ' ',tp2.SEGUNDO_NOMBRE,' ',tp2.PRIMER_APELLIDO,' ',tp2.SEGUNDO_APELLIDO) from tbl_persona tp2
                         where fa.CODIGO_PERSONA = tp2.CODIGO_PERSONA) as FAMILIAR, pa.NOMBRE as PARENTESCO,
                         CONCAT(' ',p.PRIMER_NOMBRE, ' ',p.SEGUNDO_NOMBRE,' ',p.PRIMER_APELLIDO,' ',p.SEGUNDO_APELLIDO) AS ESTUDIANTE
                        FROM tbl_estudiante es, tbl_parentesco pa, tbl_familiares_estudiante fe, tbl_persona p, tbl_familiar fa
                        WHERE es.CODIGO_PERSONA = p.CODIGO_PERSONA
                       AND pa.CODIGO_PARENTESCO = fe.CODIGO_PARENTESCO
                       AND fa.CODIGO_FAMILIAR = fe.CODIGO_FAMILIAR
                        AND fe.CODIGO_ESTUDIANTE = es.CODIGO_ESTUDIANTE;";
                        $result = $conn->query($query);
                        if ($result->num_rows > 0) {
                          while($row = $result->fetch_assoc()) {
                            $var1 = $row['CODIGO_FAM_EST'];
                            $var2 = $row['FAMILIAR'];
                            $var3 = $row['PARENTESCO'];
                            $var4 = $row['ESTUDIANTE'];
                            
                           

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
                                $evaluar_permiso_actualizar->execute(array($usuariomo, '3'));
                                $row1=$evaluar_permiso_actualizar->fetchColumn();
                                $permiso_actualizar =$row1; 
                                
                                
                               
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

                                $evaluar_permiso_eliminar = $db->prepare("CALL Sp_permiso_eliminar(?,?);");
                                $evaluar_permiso_eliminar->execute(array($usuariomo, '3'));
                                $row1=$evaluar_permiso_eliminar->fetchColumn();
                                $permiso_eliminar =$row1; 
                            }
                            ?> 
                            
                       
                        <tr>
                          <td>
                            <div class="text-center" >
                              <div class="btn-group">
                                
                              <?php
                              if($permiso_eliminar == 'SI')
                               {
                            ?>

                               <a href="#ELIMINARFAMILIAREST<?php echo $var1;?>" data-toggle="modal">
                                <button id="ELIMINARPARAM" name="ELIMINARPARAM" type='button'   class="btn btn-danger" data-dismiss="modal"><i class="nav-icon fas fa-trash"></i>
                               </button>
                               </a>


                               <?php
                                }
                               ?>


                               <?php 
                                if ($permiso_actualizar == 'SI')
                                {
                                ?>

                                <a href="#EDITARFAMILIAREST<?php echo $var1; ?>" data-toggle="modal">
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
                          <td class="text-center"><?php echo $var4; ?></td>
                        
                        <!--INICIO DEL MODAL DE EDITAR -->
                          <div id="EDITARFAMILIAREST<?php echo $var1 ?>" class="modal fade" role="dialog">
                            <div class="modal-dialog modal-md">
                              <div class="modal-content"><!-- Modal content-->
                                <form id="FORMEDITPARAMETROS" method="POST" class=" needs-validation">
                                  <div class="modal-header" style="background-color: #0CCDE3">
                                    <h4 class="text-center">Editar Parentesco</h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                  </div>
                                  <div class="modal-body"><!--CUERPO DEL MODAL -->
                                    <div class="row"><!-- INICIO PRIMERA ROW -->  
                                      <input type="text" value ="<?php echo $var1; ?>" hidden class="form-control" name="id_param" id="id_param">
                                      <div class="col-sm-12">
                                        <div class="form-group">
                                          <label for="txtcodigo_parametro">Familiar: </label>
                                          <input  type="text" disabled = "disabled" value ="<?php echo $var2; ?>" class="form-control"  maxlength="50" minlength="5"  onKeyDown="sinespacio(this);" onkeyup="mayus(this);" autocomplete = "off" type="text" onkeypress="return soloLetras(event);" placeholder="Ingrese el parámetro" name="Edit_nomparam" id="Edit_nomparam">
                                        </div>
                                      </div>
                                     
                                      <div class="col-sm-6">
                                        <div class="form-group">
                                          <label for="txtnombre_usuario">Estudiante: </label>
                                          <input  type="text" disabled = "disabled" value ="<?php echo $var4; ?>" class="form-control"  minlength="1" maxlength="100"     autocomplete = "off" type="text"   name="Edit_valor" id="Edit_valor" required>
                                          <div class="invalid-feedback">
                                           Llene este campo.
                                          </div>
                                        </div>
                                      </div> 


                                      <div class="col-sm-6">
                                        <div class="form-group">
                                          <label for="txtnombre_usuario">Parentesco: </label>
                                          <input  type="text"  value ="<?php echo $var3; ?>" class="form-control"  minlength="1" maxlength="100"     autocomplete = "off" type="text"   name="Edit_valor" id="Edit_valor" required>
                                          <div class="invalid-feedback">
                                           Llene este campo.
                                          </div>
                                        </div>
                                      </div> 
                                      
                                      </div> <!-- FIN DE EL PRIMER ROW --> 
                                  </div><!--FINAL DEL CARD BODY -->                       
                                  <div class="modal-footer ">
                                    <button type="button" name="ELI" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                                    <button type="submit" id="Edit_parametro" name="Edit_parametro" class="btn btn-success"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>      
                                  </div><!--FIN DEL DIV DE BOTONES DE GUARDAR -->
                                </div>
                              </form>
                            </div>
                          </div><!-- FIN DEL MODAL EDITAR -->  


                          <!--MODAL ELIMINAR -->
                          <div id="ELIMINARFAMILIAREST<?php echo $var1 ?>"  name="div_eliminar" id="div_eliminar"class="modal fade" role="dialog">
                            <div class="modal-dialog">
                              <div class="modal-content">
                                <div class="modal-header">
                                  <h5 class="modal-title" id="exampleModalLabel"></h5>
                                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                <form id="FORMEeliminar" method="POST">
                                  <div class="modal-body">
                                    <input type="text" value ="<?php echo $var1; ?>" hidden class="form-control" name="param_eliminar" id="param_eliminar">
                                    <h4 class="text-center">¿Esta seguro de eliminar el registro de parentesco de  <?php echo $var2; ?> ?</h4>
                                </div> <!--fin el card body -->
                                    <div class="modal-footer ">
                                      <button type="button" name="cerrar" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                                      <button type="submit"  name="ELIMINARPARAM" id="ELIMINARPARAM"  class="btn btn-primary">Si,eliminar</button>      
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
            
          </div><!-- fINAL DEL card PRIMARY -->
        </div><!--FINAL DE COL-M12-->
      </div><!-- FINAL ROW PADRE -->
    </div><!-- FINAL CONTAINER FLUID --> 
  </section><!-- FINAL SECTION -->

  <!--INICIO DEL MODAL DE RELACIÓN DE ESTUDIANTES Y FAMILIARES -->
  <div id="agregar_relfam" class="modal fade" role="dialog">
       <div class="modal-dialog modal-md">
           <div class="modal-content"><!-- Modal content-->
                <form id="FORMEDITRAPERSONAS" method="POST" class=" needs-validation">
                    <div class="modal-header" style="background-color: #0CCDE3">
                        <h4 class="text-center">Agregar Parentesco</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body"><!--CUERPO DEL MODAL -->
                        <div class="row"><!-- INICIO PRIMERA ROW -->
                        
                        
                        <!-- ***********BUSCAR AL FAMILIAR*********** -->
                       <label for="">Familiar: </label>
                            <div class="col-sm-12">
                                <?php //
                    $query = "SELECT CODIGO_PERSONA, CONCAT(DNI, ' ',PRIMER_NOMBRE, ' ',SEGUNDO_NOMBRE,' ',PRIMER_APELLIDO) AS NOMBRE
                    FROM tbl_persona WHERE CODIGO_TIPO_PERSONA = 7;";
                    $resultadod=$conn->query($query);                
                    ?>

             <a href="categoria">
              <button  data-toggle="modal"  href="" type='button' id="btnGuardar"  style="color:white;"class="btn btn-primary mb-3 mt-2"><span> <i class="nav-icon fa fa-plus-square mx-1"></i></span>Agregar persona</button>
              </a>
              
                  <div class="col-sm-8 order-2 pl-2 mt-2 mb-2">
                    <select  style="width: 100%;"  class="form-control select2" name="FAMILIAR3" id="" type="text" required >
                    <option selected disabled value=""> Buscar familiares...</option>
                        <?php 
                          if ($resultadod->num_rows > 0) {
                          while($row = $resultadod->fetch_assoc()) { 
                          $codigo = $row['CODIGO_PERSONA'];
                          $nombre = $row['NOMBRE'];
                          
                          ?>
                        <option value="<?php echo $codigo?>" ><?php echo $nombre;?></option>
                        <?php 
                        } 
                        }
                        ?>
                      </select>
                          
                      <div class="invalid-feedback">
                          Agregue un nombre!
                      </div>

                      <div class="valid-feedback">
                        ¡Se ve bien!
                   </div>
                </div>
          </div>


           <!-- ***********BUSCAR PARENTESCO*********** -->
           <label for="">Parentesco: </label>
                            <div class="col-sm-12">
                                <?php //
                    $query = "SELECT CODIGO_PARENTESCO, NOMBRE
                              FROM TBL_PARENTESCO;";
                    $resultadod=$conn->query($query);                
                    ?>
              
                  <div class="col-sm-8 order-2 pl-2 mt-2 mb-2">
                    <select  style="width: 100%;"  class="form-control select2" name="CODPARENTESCO2" id="CODPARENTESCO2" type="text" required >
                    <option selected disabled value=""> Buscar Parentesco...</option>
                        <?php 
                          if ($resultadod->num_rows > 0) {
                          while($row = $resultadod->fetch_assoc()) { 
                          $codigo = $row['CODIGO_PARENTESCO'];
                          $nombre = $row['NOMBRE'];
                          
                          ?>
                        <option value="<?php echo $codigo?>" ><?php echo $nombre;?></option>
                        <?php 
                        } 
                        }
                        ?>
                      </select>
                          
                      <div class="invalid-feedback">
                          Agregue un nombre!
                      </div>

                      <div class="valid-feedback">
                        ¡Se ve bien!
                   </div>
                </div>
          </div>
                            


                            <!-- ***********BUSCAR AL ESTUDIANTE*********** -->

                            <label for="">Estudiante:</label>
                            <div class="col-sm-12">
                            <?php //
                    $query = "SELECT CODIGO_PERSONA, CONCAT(DNI, ' ',PRIMER_NOMBRE, ' ',SEGUNDO_NOMBRE,' ',PRIMER_APELLIDO) AS NOMBRE
                    FROM tbl_persona WHERE CODIGO_TIPO_PERSONA = 4;";
                    $resultadod=$conn->query($query);                
                    ?>

             <a href="categoria">
              <button  data-toggle="modal"  href="" type='button' id="btnGuardar"  style="color:white;"class="btn btn-primary mb-3 mt-2"><span> <i class="nav-icon fa fa-plus-square mx-1"></i></span>Agregar persona</button>
              </a>
                  <div class="col-sm-8 order-2 pl-2 mt-2 mb-2">
                    <select  style="width: 100%;"  class="form-control select2" name="CODfamEstudiante" id="CODfamEstudiante" type="text" required >
                    <option selected disabled value=""> Buscar Estudiantes...</option>
                        <?php 
                          if ($resultadod->num_rows > 0) {
                          while($row = $resultadod->fetch_assoc()) { 
                          $codigo = $row['CODIGO_PERSONA'];
                          $nombre = $row['NOMBRE'];
                          
                          ?>
                        <option value="<?php echo $codigo?>" ><?php echo $nombre;?></option>
                        <?php 
                        } 
                        }
                        ?>
                      </select>
                          
                      <div class="invalid-feedback">
                          Agregue un nombre!
                      </div>

                      <div class="valid-feedback">
                        ¡Se ve bien!
                   </div>
                </div>
                            </div>


                            <div class="col-sm-4 order-2 pl-2 mt-2 mb-2">
                      <label for="">¿Es encargado del estudiante?</label>
                    <select  style="width: 100%;"  class="form-control" name="encargadoES" id="" type="text" required >
                        <option selected disabled value=""> Seleccionar la opción...</option>
                        <option value="SI" >SI</option>
                        <option value="NO" >NO</option>
                      </select>
                          
                      <div class="invalid-feedback">
                         seleccione una opción!
                      </div>

                      <div class="valid-feedback">
                        ¡Se ve bien!
                   </div>
                </div>
            
                        </div> <!-- FIN DE EL PRIMER ROW --> 
                    </div><!--FINAL DEL CARD BODY -->                       
                    <div class="modal-footer ">
                        <button type="button" name="ELI" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                        <button type="submit" id="agregar_relfam" name="agregar_relfam" class="btn btn-success"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>      
                    </div><!--FIN DEL DIV DE BOTONES DE GUARDAR -->
                </div>
            </form>
      </div>
   </div><!-- FIN DEL MODAL AGREGAR NUEVO PARAMETRO -->

  <!-- Button trigger modal -->


<!-- Modal -->
                                </div><!--fin del modal contener -->
              </div><!--fin del modal dialog -->
          </div><!--fin del modal de eliminar -->          
        </div><!--fIN DEL CARD GENERAL -->
   </div><!-- CIerre del container fluid--> 
  </section>



</div><!-- /.content-wrapper -->
  <aside class="control-sidebar control-sidebar-dark"><!-- Control Sidebar -->
  </aside>
  <!-- /.control-sidebar -->
</div>
  </div><!-- /.content-wrapper -->
  <aside class="control-sidebar control-sidebar-dark"><!-- Control Sidebar -->
  </aside>
</div><!-- ./wrapper -->

</body><!-- Final del body -->





                                  
<!-- funciones del sistema -->
<script>
  function soloLetras(e){
   key = e.keyCode || e.which;
   tecla = String.fromCharCode(key).toLowerCase();
   letras = " áéíóúabcdefghijklmnñopqrstuvwxyz_-";
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

//funcion para solo letras y algunos caracteres
function soloLetrascaracteres(e){
   key = e.keyCode || e.which;
   tecla = String.fromCharCode(key).toLowerCase();
   letras = "_áéíóúabcdefghijklmnñopqrstuvwxyz";
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
  //otra funcion para quitar espacios 
  function quitarespacios(e) {
    var cadena =  e.value;
    cadena = cadena.trim();
    e.value = cadena;
  };
</script>


<!-- Función para poder generar el reporte de la tabla -->
<script>
    function Descargar() {
      window.open('Reportes_Prosecar/reporteFamiliarEstudiante.php','_blank');
      window.open(this.href,'_self');
    }
  </script>


<!-- función para no dejar espacios en blanco -->
<script>

$(document).ready(function() {
    $('.hb').select2();
});

    (function () { 
        'use strict'
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


<!-- Función para dejar la tabla en español -->
<script type="text/javascript"> 
   //funcion de mostrar el estilo de la datatable
$(document).ready( function () {
    $('#tabla_familiaresEstudiantes').DataTable({
      language:espanol
    });
} );


let = espanol = {
    "processing": "Procesando...",
    "lengthMenu": "Mostrar _MENU_ registros",
    "zeroRecords": "No se encontraron resultados",
    "emptyTable": "Ningún dato disponible en esta tabla",
    "infoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
    "infoFiltered": "(filtrado de un total de _MAX_ registros)",
    "search": "Buscar:",
    "infoThousands": ",",
    "loadingRecords": "Cargando...",
    "paginate": {
        "first": "Primero",
        "last": "Último",
        "next": "Siguiente",
        "previous": "Anterior"
    },
    "aria": {
        "sortAscending": ": Activar para ordenar la columna de manera ascendente",
        "sortDescending": ": Activar para ordenar la columna de manera descendente"
    },
    "buttons": {
        "copy": "Copiar",
        "colvis": "Visibilidad",
        "collection": "Colección",
        "colvisRestore": "Restaurar visibilidad",
        "copyKeys": "Presione ctrl o u2318 + C para copiar los datos de la tabla al portapapeles del sistema. <br \/> <br \/> Para cancelar, haga clic en este mensaje o presione escape.",
        "copySuccess": {
            "1": "Copiada 1 fila al portapapeles",
            "_": "Copiadas %ds fila al portapapeles"
        },
        "copyTitle": "Copiar al portapapeles",
        "csv": "CSV",
        "excel": "Excel",
        "pageLength": {
            "-1": "Mostrar todas las filas",
            "_": "Mostrar %d filas"
        },
        "pdf": "PDF",
        "print": "Imprimir",
        "renameState": "Cambiar nombre",
        "updateState": "Actualizar",
        "createState": "Crear Estado",
        "removeAllStates": "Remover Estados",
        "removeState": "Remover",
        "savedStates": "Estados Guardados",
        "stateRestore": "Estado %d"
    },
    "autoFill": {
        "cancel": "Cancelar",
        "fill": "Rellene todas las celdas con <i>%d<\/i>",
        "fillHorizontal": "Rellenar celdas horizontalmente",
        "fillVertical": "Rellenar celdas verticalmentemente"
    },
    "decimal": ",",
    "searchBuilder": {
        "add": "Añadir condición",
        "button": {
            "0": "Constructor de búsqueda",
            "_": "Constructor de búsqueda (%d)"
        },
        "clearAll": "Borrar todo",
        "condition": "Condición",
        "conditions": {
            "date": {
                "after": "Despues",
                "before": "Antes",
                "between": "Entre",
                "empty": "Vacío",
                "equals": "Igual a",
                "notBetween": "No entre",
                "notEmpty": "No Vacio",
                "not": "Diferente de"
            },
            "number": {
                "between": "Entre",
                "empty": "Vacio",
                "equals": "Igual a",
                "gt": "Mayor a",
                "gte": "Mayor o igual a",
                "lt": "Menor que",
                "lte": "Menor o igual que",
                "notBetween": "No entre",
                "notEmpty": "No vacío",
                "not": "Diferente de"
            },
            "string": {
                "contains": "Contiene",
                "empty": "Vacío",
                "endsWith": "Termina en",
                "equals": "Igual a",
                "notEmpty": "No Vacio",
                "startsWith": "Empieza con",
                "not": "Diferente de",
                "notContains": "No Contiene",
                "notStarts": "No empieza con",
                "notEnds": "No termina con"
            },
            "array": {
                "not": "Diferente de",
                "equals": "Igual",
                "empty": "Vacío",
                "contains": "Contiene",
                "notEmpty": "No Vacío",
                "without": "Sin"
            }
        },
        "data": "Data",
        "deleteTitle": "Eliminar regla de filtrado",
        "leftTitle": "Criterios anulados",
        "logicAnd": "Y",
        "logicOr": "O",
        "rightTitle": "Criterios de sangría",
        "title": {
            "0": "Constructor de búsqueda",
            "_": "Constructor de búsqueda (%d)"
        },
        "value": "Valor"
    },
    "searchPanes": {
        "clearMessage": "Borrar todo",
        "collapse": {
            "0": "Paneles de búsqueda",
            "_": "Paneles de búsqueda (%d)"
        },
        "count": "{total}",
        "countFiltered": "{shown} ({total})",
        "emptyPanes": "Sin paneles de búsqueda",
        "loadMessage": "Cargando paneles de búsqueda",
        "title": "Filtros Activos - %d",
        "showMessage": "Mostrar Todo",
        "collapseMessage": "Colapsar Todo"
    },
    "select": {
        "cells": {
            "1": "1 celda seleccionada",
            "_": "%d celdas seleccionadas"
        },
        "columns": {
            "1": "1 columna seleccionada",
            "_": "%d columnas seleccionadas"
        },
        "rows": {
            "1": "1 fila seleccionada",
            "_": "%d filas seleccionadas"
        }
    },
    "thousands": ".",
    "datetime": {
        "previous": "Anterior",
        "next": "Proximo",
        "hours": "Horas",
        "minutes": "Minutos",
        "seconds": "Segundos",
        "unknown": "-",
        "amPm": [
            "AM",
            "PM"
        ],
        "months": {
            "0": "Enero",
            "1": "Febrero",
            "10": "Noviembre",
            "11": "Diciembre",
            "2": "Marzo",
            "3": "Abril",
            "4": "Mayo",
            "5": "Junio",
            "6": "Julio",
            "7": "Agosto",
            "8": "Septiembre",
            "9": "Octubre"
        },
        "weekdays": [
            "Dom",
            "Lun",
            "Mar",
            "Mie",
            "Jue",
            "Vie",
            "Sab"
        ]
    },
    "editor": {
        "close": "Cerrar",
        "create": {
            "button": "Nuevo",
            "title": "Crear Nuevo Registro",
            "submit": "Crear"
        },
        "edit": {
            "button": "Editar",
            "title": "Editar Registro",
            "submit": "Actualizar"
        },
        "remove": {
            "button": "Eliminar",
            "title": "Eliminar Registro",
            "submit": "Eliminar",
            "confirm": {
                "_": "¿Está seguro que desea eliminar %d filas?",
                "1": "¿Está seguro que desea eliminar 1 fila?"
            }
        },
        "error": {
            "system": "Ha ocurrido un error en el sistema (<a target=\"\\\" rel=\"\\ nofollow\" href=\"\\\">Más información&lt;\\\/a&gt;).<\/a>"
        },
        "multi": {
            "title": "Múltiples Valores",
            "info": "Los elementos seleccionados contienen diferentes valores para este registro. Para editar y establecer todos los elementos de este registro con el mismo valor, hacer click o tap aquí, de lo contrario conservarán sus valores individuales.",
            "restore": "Deshacer Cambios",
            "noMulti": "Este registro puede ser editado individualmente, pero no como parte de un grupo."
        }
    },
    "info": "Mostrando _START_ a _END_ de _TOTAL_ registros",
    "stateRestore": {
        "creationModal": {
            "button": "Crear",
            "name": "Nombre:",
            "order": "Clasificación",
            "paging": "Paginación",
            "search": "Busqueda",
            "select": "Seleccionar",
            "columns": {
                "search": "Búsqueda de Columna",
                "visible": "Visibilidad de Columna"
            },
            "title": "Crear Nuevo Estado",
            "toggleLabel": "Incluir:"
        },
        "emptyError": "El nombre no puede estar vacio",
        "removeConfirm": "¿Seguro que quiere eliminar este %s?",
        "removeError": "Error al eliminar el registro",
        "removeJoiner": "y",
        "removeSubmit": "Eliminar",
        "renameButton": "Cambiar Nombre",
        "renameLabel": "Nuevo nombre para %s",
        "duplicateError": "Ya existe un Estado con este nombre.",
        "emptyStates": "No hay Estados guardados",
        "removeTitle": "Remover Estado",
        "renameTitle": "Cambiar Nombre Estado"
    }
} 

</script>