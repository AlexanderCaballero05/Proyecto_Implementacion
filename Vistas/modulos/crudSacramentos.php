<!-- ---------------------------------------------------------------------
ELABORADO POR Diana Rut
	Universidad Nacional Autonoma de Honduras (UNAH)
	  	Facultad de Ciencias Economicas
	Departamento de Informatica administrativa
     Analisis, Programacion y Evaluacion de Sistemas
             Segundo periodo 2022
Catedratico:
Lic. Karla Melisa Garcia Pineda  --Evaluacion
Lic Giancarlo Scalichi -- Implementacion de sistemas
Clauidia Nuñez -- Analisis y diseño
---------------------------------------------------------------------
Programa:          Pantalla de mantenimiento de sacramentos
Fecha:             01-jan-2016
Programador:       Diana Rut Garcia
descripcion:       Mantenimiento de sacramentos,agrega edita elimina
-----------------------------------------------------------------------
Historial de Cambio
-----------------------------------------------------------------------
Programador               Fecha                      Descripcion
Diana Rut               09/06/2022            Se modifico los mensajes de bitacora,con correciones pequeñas de escritura
Luz Montoya             18/06/2022            Arreglo de errores de ortografía
----------------------------------------------------------------------->
<?php
 include_once "conexion.php";
 include_once "conexion3.php";
 include "conexionpdo.php";
 
?>
<head>
</head>
<body oncopy="return false" onpaste="return false"> 
<div class="content-wrapper">
  <div class="content-header">
     <!--Puede ir un titulo -->
  </div>
  <section class="content">
    <div class="container-fluid">
      <div class="content-header text-xl-center mb-3 ">
            <h4>Sacramentos</h4>    
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
           $evaluar_permiso->execute(array($usuariomo, '26'));
           $row1=$evaluar_permiso->fetchColumn();
            $permiso_registrar =$row1;             
           }
          ?> <!-- fin del codigo para sustraer el permiso de insertar.-->          
          <?php
          if($permiso_registrar == 'SI'){
          ?>
          
          <button  data-toggle="modal"  href="#AGREGAR_SACRAMENTO" type='button' id="btnGuardar"  style="color:white;"class="btn btn-primary mb-3"><span> <i class="nav-icon fa fa-plus-square mx-1"></i></span>Agregar</button>
          <button  onclick="Descargar()" data-toggle="modal"  href="" type='button' id="btnGuardar"  style="color:white; background-color:#FA0079"class="btn btn-danger mb-3"> <span><i class="nav-icon fa fa-file-pdf mx-1"></i></span>Reporte</button>
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
                  <table id="tabla_sacramentos" class="table table-bordered table-striped">
                      <thead>
                        <tr>
                          <th class="text-center">Acción</th>
                          <th class="text-center">Código</th>
                          <th class="text-center">Estado</th>
                          <th class="text-center">Nombre del Sacramento</th>
                          <th class="text-center">Descripción</th>
                        </tr>
                      </thead>
                      <tbody>
                        <?php
                        $query = "SELECT P.CODIGO_SACRAMENTO, P.CODIGO_ESTADO, P.NOMBRE, P.DESCRIPCION, E.NOMBRE as Nombre from tbl_sacramento P, tbl_estado E
                        where e.CODIGO_ESTADO = P.CODIGO_ESTADO
                        ORDER BY  CODIGO_SACRAMENTO ASC  ;";
                        $result = $conn->query($query);
                        if ($result->num_rows > 0) {
                          while($row = $result->fetch_assoc()) {
                            $var1 = $row['CODIGO_SACRAMENTO'];
                            $var4 = $row['Nombre'];
                            $var2 = $row['NOMBRE'];
                            $var3 = $row['DESCRIPCION'];
                            $var5 = $row['CODIGO_ESTADO'];
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
                                  $evaluar_permiso_eliminar->execute(array($usuariomo, '26'));
                                  $row1=$evaluar_permiso_eliminar->fetchColumn();
                                  $permiso_eliminar =$row1; 
                                }
                              ?> 
                               <?php
                                 if($permiso_eliminar == 'SI'){
                               ?>                            
                                <a href="#ELIMINAR<?php echo $var1;?>" data-toggle="modal">
                                <button  type='button'   class="btn btn-danger" data-dismiss="modal"><i class="nav-icon fas fa-trash"></i>
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
                                  $evaluar_permiso_actualizar->execute(array($usuariomo, '26'));
                                  $row2=$evaluar_permiso_actualizar->fetchColumn();
                                  $permiso_actualizar =$row2; 
                               }
                              ?>
                              <?php
                                if($permiso_actualizar == 'SI') {
                              ?>
                                <a href="#EDITARSACRAMENTO<?php echo $var1; ?>" data-toggle="modal">
                                <button type='button' id="btnGuardar"  style="color:white;"class="btn btn-warning"><span> <i class="nav-icon fas fa-edit mx-1"></i></span></button>
                                </a>
                              <?php
                                }
                              ?>
                              </div>
                            </div><!-- final del text-center -->
                          </td>
                          <td class="text-center"><?php echo $var1; ?></td>
                          <td class="text-center"><?php echo $var4; ?></td>
                          <td class="text-center"><?php echo $var2; ?></td>
                          <td class="text-center"><?php echo $var3; ?></td>
                        <!--INICIO DEL MODAL DE EDITAR SACRAMENTO -->
                          <div id="EDITARSACRAMENTO<?php echo $var1 ?>" class="modal fade" role="dialog">
                            <div class="modal-dialog modal-md">
                              <div class="modal-content"><!-- Modal content-->
                                <div class="modal-header" style="background-color: #0CCDE3">
                                    <h4 class="text-center">Editar Sacramento</h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                 </div>
                                <form id="FORMEDITRAPERSONAS" method="POST" class="needs-validation" novalidate>
                                  <div class="modal-body"><!--CUERPO DEL MODAL -->
                                    <div class="row"><!-- INICIO PRIMERA ROW -->  
                                      <input type="text" value ="<?php echo $var1; ?>" hidden class="form-control" name="id_sacramento" >
                                      <div class="col-sm-12">
                                        <div class="form-group">
                                          <label for="txtcodigo_persona">Nombre Sacramento</label>
                                          <input  type="text"  value ="<?php echo $var2; ?>" maxlength="20" minlength="5" class="form-control" onkeyup="mayus(this);"  autocomplete="off"  onkeypress="return soloLetras(event);"  name="editar_nombre" id="editar_nombre" required="">
                                           <div class="invalid-feedback">
                                            Campo obligatorio.
                                           </div>
                                        </div>
                                        
                                      </div>
                                      <div class="col-sm-12">
                                        <div class="form-group">
                                          <label for="txtcodigo_persona">Descripción</label>
                                          <input  type="text"  value ="<?php echo $var3; ?>" class="form-control" maxlength="50" minlength="10"  onkeyup="mayus(this);"    autocomplete="off" onkeypress="return soloLetras(event);" name="editar_descripcion" id="editar_descripcion" required="">
                                          <div class="invalid-feedback">
                                            Campo obligatorio.
                                          </div>
                                        </div>
                                      </div>
                                      <div class="col-sm-12">
                                        <?php //--INICIO DEL ESTADO
                                        $query = "SELECT  CODIGO_ESTADO, NOMBRE
                                        FROM tbl_estado
                                        where CODIGO_ESTADO BETWEEN 2 and 3";
                                        $resultadod=$conn->query($query);                
                                       ?>
                                       <label  class="control-label">Estado</label>  
                                       <div class="form-group">
                                         <select class="form-control select2 select2-primary"   style="width: 100%;" name="editar_estadosacra" id="editar_estado" required>
                                         <option  value="<?php echo $var5?>"><?php echo $var4;?></option>
                                          <?php 
                                          if ($resultadod->num_rows > 0) {
                                          while($row = $resultadod->fetch_assoc()) { 
                                          $codigo = $row['CODIGO_ESTADO'];
                                          $estado = $row['NOMBRE'];
                                          ?>
                                        <option value="<?php echo $codigo?>" ><?php echo $estado;?></option>
                                        <?php } 
                                         }?>
                                        </select> 
                                       </div>
                                      </div>
                                    </div> <!-- FIN DE EL PRIMER ROW --> 
                                  </div><!--FINAL DEL CARD BODY -->                       
                                  <div class="modal-footer ">
                                    <button type="button" name="ELI" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                                    <button type="submit" id="editar_sacramento" name="editar_sacramento" class="btn btn-success"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>      
                                  </div><!--FIN DEL DIV DE BOTONES DE GUARDAR -->
                                </div>
                              </form>
                            </div>
                          </div><!-- FIN DEL MODAL EDITAR -->  
                            
                          <!--INICIO DEL MODAL ELIMINAR   -->
                          <div id="ELIMINAR<?php echo $var1 ?>"  name="div_eliminar" id="div_eliminar"class="modal fade" role="dialog">
                            <div class="modal-dialog">
                              <div class="modal-content">
                                <div class="modal-header">
                                  <h5 class="modal-title" id="exampleModalLabel"></h5>
                                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                <form  method="POST">
                                  <div class="modal-body">
                                    <input type="text" value ="<?php echo $var1; ?>" hidden class="form-control" name="sacramento_eliminar" >
                                    <h4 class="text-center">¿Está seguro de eliminar el sacramento<?php echo $var2; ?>?</h4>
                                </div> <!--fin el card body -->
                                    <div class="modal-footer ">
                                      <button type="button" name="cerrar" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                                      <button type="submit"  name="ELIMINAR_SACRAMENTO"   class="btn btn-primary">Si,eliminar</button>      
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

  <!--INICIO DEL MODAL DE AGREGAR UN NUEVO SACRAMENTO -->
    <div id="AGREGAR_SACRAMENTO" class="modal fade" role="dialog">
       <div class="modal-dialog modal-md">
           <div class="modal-content"><!-- Modal content-->
                <form  method="POST" class="needs-validation" novalidate>
                    <div class="modal-header" style="background-color: #0CCDE3">
                        <h4 class="text-center">Agregar Sacramento</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body"><!--CUERPO DEL MODAL -->
                        <div class="row"><!-- INICIO PRIMERA ROW -->  
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="txtcodigo_persona">Nombre Sacramento</label>
                                    <input id="bloquear"  type="text"  class="form-control"  maxlength="20" minlength="5"   onkeyup="mayus(this);" autocomplete = "off" type="text" onkeypress="return soloLetras(event);" placeholder="Ingrese un nombre al sacramento" name="nombre_sacramento"required="">
                                    <div class="invalid-feedback">
                                     Campo obligatorio.
                                   </div>
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="txtcodigo_persona">Descripción</label>
                                    <textarea  type="text"   class="form-control"  maxlength="50" minlength="5"   autocomplete = "off" type="text" onkeyup="mayus(this);" autocomplete = "off" type="text" onkeypress="return soloLetras(event);" placeholder="Ingrese una descripción del sacramento" name="descripcion_sacramento" id="descripcion_sacramento" required=""></textarea>
                                    <div class="invalid-feedback">
                                      Campo obligatorio.
                                   </div>
                                </div>
                            </div>
                            <div class="col-sm-12">
                              <?php //--INICIO DEL ESTADO
                                $query = "SELECT  CODIGO_ESTADO, NOMBRE
                                FROM tbl_estado
                                where CODIGO_ESTADO BETWEEN 2 and 3";
                                $resultadod=$conn->query($query);                
                               ?>
                              <label  class="control-label">Estado de la Sección</label>  
                                <div class="form-group">
                                    <select class="form-control select2 select2-primary"   style="width: 100%;" name="estadosacramento" id="estadopre" required>
                                      <option selected enable value=""> --Seleccionar Estado-- </option>
                                      <?php 
                                       if ($resultadod->num_rows > 0) {
                                       while($row = $resultadod->fetch_assoc()) { 
                                       $codigo_estado= $row['CODIGO_ESTADO'];
                                       $estado= $row['NOMBRE'];
                                       ?>
                                      <option value="<?php echo $codigo_estado?>" ><?php echo $estado;?></option>
                                      <?php } 
                                      }?>
                                      <div class="invalid-feedback">
                                         Campo obligatorio.
                                     </div>
                                    </select> 
                                </div>
                            </div>
                        </div> <!-- FIN DE EL PRIMER ROW --> 
                    </div><!--FINAL DEL CARD BODY -->                       
                    <div class="modal-footer ">
                        <button type="button" name="ELI" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                        <button type="submit" id="agregar_sacramento" name="agregar_sacramento" class="btn btn-success"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>      
                    </div><!--FIN DEL DIV DE BOTONES DE GUARDAR -->
                </div>
            </form>
      </div>
   </div><!-- FIN DEL MODAL AGREGAR NUEVO SACRAMENTO --> 
   </body>

   <script>//previene que se mantenga una tecla pulsada
      var texto=document.getElementById('bloquear');
      texto.addEventListener('keydown', function(keyboardEvent) {
        if (keyboardEvent.repeat)
            keyboardEvent.preventDefault();
      });
      var texto1 =document.getElementById('bloquear1');
      texto1.addEventListener('keydown', function(keyboardEvent) {
        if (keyboardEvent.repeat)
            keyboardEvent.preventDefault();
      });
  </script>


<script type="text/javascript"> 
  $(document).ready( function () {
      $('#tabla_sacramentos').DataTable({
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
        "search": "Buscar Sacramento:",
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
      window.open('Reportes_Prosecar/reporteSacramentos.php','_blank');
      window.open(this.href,'_self');
    }
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
