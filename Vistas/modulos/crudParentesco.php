<!-- ---------------------------------------------------------------------
ELABORADO POR alguien
	Universidad Nacional Autonoma de Honduras (UNAH)
	  	Facultad de Ciencias Economicas
	Departamento de Informatica administrativa
     Analisis, Programacion y Evaluacion de Sistemas
             Segundo periodo 2022
Equipo:
Arnold Caballero.......... (no me acuerdo)

Catedratico:
Lic. Karla Melisa Garcia Pineda  --Evaluacion
Lic Giancarlo Scalichi -- Implementacion de sistemas
Clauidia Nuñez -- Analisis y diseño
---------------------------------------------------------------------
Programa:          Pantalla que muestra los parentescos
Fecha:             01-jan-2022
Programador:       ?
descripcion:       Mantenimiento de parenteso agrega uno nuevo edita y elimina
-----------------------------------------------------------------------
Historial de Cambio
-----------------------------------------------------------------------
Programador               Fecha                      Descripcion
Diana Rut               31/05/2022            Se modifico la pantala
Diana Rut               09/06/2022            Se modifico los mensajes de bitacora y otras cosas visuales como el titulo y modal editar
----------------------------------------------------------------------->
<?php
include_once "conexion.php";
include_once "conexion3.php";

?>
 <!--llamada de la fuction bitacora -->
     <?php 
      $codigoObjeto=44;
      $accion='INGRESO A LA PANTALLA MANTENIMIENTO PARENTESCO';
      $descripcion= 'SE AUTENTIFICO';
      bitacora($codigoObjeto, $accion,$descripcion);
      ?>
 <head>
</head>  
<div class="content-wrapper">
  <div class="content-header">
     <!-- Puede ir un titulo-->
  </div>
  <section class="content">
    <div class="container-fluid">
      <div class="content-header text-xl-center mb-3 ">
            <h4>Mantenimiento Parentesco Familiar</h4>    
      </div>
      <div class="row">
        <div class="col-md-12">
        <?php
         include "conexionpdo.php";
         $usuario=$_SESSION['vario'];
          //Evaluo si existe el tipo de Rol
          $evaluar_usuario = $db->prepare("SELECT CODIGO_TIPO_ROL FROM tbl_usuario WHERE NOMBRE_USUARIO = (?);");
          $evaluar_usuario->execute(array($usuario));
          $row=$evaluar_usuario->fetchColumn();
          if($row > 0){
           $usuariomo = $row;//capturo el nombre del ROl en la variable para usarla en el Procedimiento almacenado
           $evaluar_permiso = $db->prepare("CALL Sp_permiso_insertar(?,?);");
           $evaluar_permiso->execute(array($usuariomo, '44'));
           $row1=$evaluar_permiso->fetchColumn();
            $permiso_registrar =$row1;             
           }
          ?> <!-- fin del codigo para sustraer el permiso de insertar.-->          
          <?php
          if($permiso_registrar == 'SI'){
          ?>
            <button  data-toggle="modal"  href="#agregar_param" type='button' id="btnNuevo"  style="color:white;"class="btn btn-primary mb-3"><span><i class="nav-icon fa fa-plus-square mx-1"></i></span>Agregar Parentesco</button>
            <button  onclick="Descargar()" data-toggle="modal"  href="" type='button' id="btnGuardar"  style="color:white; background-color:#FA0079" class="btn btn-danger mb-3"> <span><i class="nav-icon fa fa-file-pdf mx-1"></i></span>Generar Reporte</button>
          <?php
           }
          ?>
          <!-- Inicios del card -->
          <div class="card card-primary">
            <div class="card-header text-center" style="background-color: #0CCDE3"><!-- TITULO ENCABEZADO DATOS PERSONALES -->
               <h1 class=" card-title text-center"><strong style="color:black;"></strong></h1>
            </div>
            <form  method="POST"><!-- form start -->
              <div class="card-body">
                  
                <div class="table-responsive">
                  <table id="tabla_parentesco" class="table table-bordered table-striped">
                      <thead>
                        <tr>
                          <th class="text-center">Acción</th>
                          <th class="text-center">Codigo</th>
                          <th class="text-center">Parentesco</th>
                        </tr>
                      </thead>
                      <tbody>
                        <?php
                          $query = "SELECT CODIGO_PARENTESCO, NOMBRE AS PARENTESCO
                          FROM TBL_PARENTESCO;";
                          $result = $conn->query($query);
                          if ($result->num_rows > 0) {
                            while($row = $result->fetch_assoc()) {
                              $var1 = $row['CODIGO_PARENTESCO'];
                              $var2 = $row['PARENTESCO'];
                        ?>
                        <tr>
                          <td>
                            <div class="text-center" >
                              <div class="btn-group">

                              <!-- Codigo de permiso para Eliminar -->
                              <?php
                                $usuario=$_SESSION['vario'];
                                //Evalua si existe el tipo de Rol
                                $evaluar_usuario = $db->prepare("SELECT CODIGO_TIPO_ROL  FROM tbl_usuario WHERE NOMBRE_USUARIO = (?);");
                                $evaluar_usuario->execute(array($usuario));
                                $row=$evaluar_usuario->fetchColumn();
                                if($row > 0){
                                  $usuariomo = $row;//capturo el nombre del ROl en la variable para usarla en el Procedimiento almacenado
                                  $evaluar_permiso_eliminar = $db->prepare("CALL Sp_permiso_eliminar(?,?);");
                                  $evaluar_permiso_eliminar->execute(array($usuariomo, '44'));
                                  $row1=$evaluar_permiso_eliminar->fetchColumn();
                                  $permiso_eliminar =$row1; 
                                }
                              ?> 
                               <?php
                                 if($permiso_eliminar == 'SI'){
                               ?>                            
                                <a href="#ELIMINARPARENTESCO<?php echo $var1;?>" data-toggle="modal">
                                 <button id="ELIMINARPARAM" name="ELIMINARPARAM" type='button'   class="btn btn-danger" data-dismiss="modal"><i class="nav-icon fas fa-trash"></i>
                                 </button>
                                </a>
                               <?php
                                }
                               ?><!--Fin del boton de eliminar -->
                              <?php
                               $usuario=$_SESSION['vario'];
                               //Evaluo si existe el tipo de Rol
                               $evaluar_usuario = $db->prepare("SELECT CODIGO_TIPO_ROL FROM tbl_usuario WHERE NOMBRE_USUARIO = (?);");
                               $evaluar_usuario->execute(array($usuario));
                               $row=$evaluar_usuario->fetchColumn();
                               if($row > 0){
                                  $usuariomo = $row;//capturo el nombre del ROl en la variable para usarla en el Procedimiento almacenado
                                  //llamar al procedimiento almacenado
                                  $evaluar_permiso_actualizar = $db->prepare("CALL Sp_permiso_actualizar(?,?);");
                                  $evaluar_permiso_actualizar->execute(array($usuariomo, '44'));
                                  $row2=$evaluar_permiso_actualizar->fetchColumn();
                                  $permiso_actualizar =$row2; 
                               }
                              ?>
                              <?php
                                if($permiso_actualizar == 'SI'){
                              ?>
                              <a href="#EDITARPARENTESCO<?php echo $var1; ?>" data-toggle="modal">
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
                        <!--INICIO DEL MODAL DE EDITAR -->
                          <div id="EDITARPARENTESCO<?php echo $var1 ?>" class="modal fade" role="dialog">
                            <div class="modal-dialog modal-md">
                              <div class="modal-content"><!-- Modal content-->
                               <div class="modal-header" style="background-color: #0CCDE3">
                                  <h4 class="text-center">Editar Parentesco</h4>
                                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                <form  method="POST" class="needs-validation" novalidate>
                                  <div class="modal-body"><!--CUERPO DEL MODAL -->
                                    <div class="row"><!-- INICIO PRIMERA ROW -->
                                      <div class="col-sm-12">
                                        <div class="form-group">
                                          <label class="form-label">Código Parentesco</label>
                                          <input  type="text" readonly value="<?php echo $var1;?>" class="form-control" name="codigo_parentesco" >
                                          <div class="invalid-feedback">
                                            Campo obligatorio.
                                          </div>
                                        </div>
                                      </div> 
                                      <div class="col-sm-12">
                                        <div class="form-group">
                                          <label >Parentesco</label>
                                          <input  type="text" onkeypress="return soloLetras(event);"  value ="<?php echo $var2; ?>" onkeyup="mayus(this);" class="form-control"  minlength="3" maxlength="100"     autocomplete = "off" type="text"   name="editar_parentesco"  required>
                                          <div class="invalid-feedback">
                                            Campo obligatorio.
                                          </div>
                                        </div>
                                      </div> 
                                      </div> <!-- FIN DE EL PRIMER ROW --> 
                                  </div><!--FINAL DEL CARD BODY -->                       
                                  <div class="modal-footer ">
                                    <button type="button" name="ELI" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                                    <button type="submit"  name="PARENTESCOEDITAR" class="btn btn-success"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>      
                                  </div><!--FIN DEL DIV DE BOTONES DE GUARDAR -->
                                </div>
                              </form>
                            </div>
                          </div><!-- FIN DEL MODAL EDITAR -->  
                            
                          <!--MODAL ELIMINAR -->
                          <div id="ELIMINARPARENTESCO<?php echo $var1 ?>"  name="div_eliminar" id="div_eliminar"class="modal fade" role="dialog">
                            <div class="modal-dialog">
                              <div class="modal-content">
                                <div class="modal-header">
                                  <h5 class="modal-title" id="exampleModalLabel"></h5>
                                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                <form id="FORMEeliminar" method="POST">
                                  <div class="modal-body">
                                    <input type="text" value ="<?php echo $var1; ?>" hidden class="form-control" name="paren_eliminar" id="paren_eliminar">
                                    <h4 class="text-center">¿Está seguro de eliminar el parentesco <?php echo $var2; ?>?</h4>
                                </div> <!--fin el card body -->
                                    <div class="modal-footer ">
                                      <button type="button" name="cerrar" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                                      <button type="submit"  name="ELIMINARPAREN" id="ELIMINARPAREN"  class="btn btn-primary">Si,eliminar</button>      
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
  

  <!--INICIO DEL MODAL DE AGREGAR PARAMETRO -->
  <div id="agregar_param" class="modal fade" role="dialog">
       <div class="modal-dialog modal-md">
           <div class="modal-content"><!-- Modal content-->
                <form id="FORMEDITRAPERSONAS" method="POST" class="needs-validation" novalidate>
                    <div class="modal-header" style="background-color: #0CCDE3">
                        <h4 class="text-center">Agregar Parentesco</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body"><!--CUERPO DEL MODAL -->
                        <div class="row"><!-- INICIO PRIMERA ROW -->  
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="txtparametro">Parentesco</label>
                                    <input  type="text" onkeypress="return soloLetras(event);" class="form-control"  maxlength="20" minlength="3"  onKeyDown="sinespacio(this);" onkeyup="mayus(this);" autocomplete = "off" type="text" onkeypress="return soloLetrascaracteres(event);" placeholder="Ingrese el parentesco" name="parentesco" id="parentesco" required>
                                    <div class="invalid-feedback">
                                      Campo obligatorio.
                                    </div>
                                </div>
                            
                            
                            </div>
                        </div> <!-- FIN DE EL PRIMER ROW --> 
                    </div><!--FINAL DEL CARD BODY -->                       
                    <div class="modal-footer ">
                        <button type="button" name="ELI" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                        <button type="submit" id="agregar_paren" name="agregar_paren" class="btn btn-success"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>      
                    </div><!--FIN DEL DIV DE BOTONES DE GUARDAR -->
                </div>
            </form>
      </div>
   </div><!-- FIN DEL MODAL AGREGAR NUEVO PARAMETRO -->

                                </div><!--fin del modal contener -->
              </div><!--fin del modal dialog -->
          </div><!--fin del modal de eliminar -->          
        </div><!--fIN DEL CARD GENERAL -->
   </div><!-- CIerre del container fluid--> 
  </section>



</div><!-- /.content-wrapper -->

  <!-- /.control-sidebar -->
</div>
  </div><!-- /.content-wrapper -->

</div><!-- ./wrapper -->

</body><!-- Final del body -->





                                  


<!-- Función para poder generar el reporte de la tabla -->
  <script>
    function Descargar() {
      window.open('Reportes_Prosecar/reporteParentesco.php','_blank');
      window.open(this.href,'_self');
    }
  </script>


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


<script type="text/javascript"> 
  $(document).ready( function () {
      $('#tabla_parentesco').DataTable({
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
        "search": "Buscar parentesco:",
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
 