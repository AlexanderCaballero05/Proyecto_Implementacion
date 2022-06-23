<?php
 include_once "conexion.php";
 include_once "conexion3.php";
 $codigoObjeto=19;
 $accion='Ingreso a mantenimiento especialidad';
 $descripcion='mantenimiento especialidad';
bitacora($codigoObjeto,$accion,$descripcion);
?>

<head>

<head>

</head>
<body oncopy="return false" onpaste="return false">
<div class="content-wrapper">
  <div class="content-header">
    <div class="container-fluid">
    </div><!-- /.container-fluid -->
  </div>
  
  <section class="content">
     <div class="content-header text-xl-center mb-3 ">
            <h4>Mantenimiento Especialidad</h4>   
     </div>
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
                                $evaluar_permiso->execute(array($usuariomo, '41'));
                                $row1=$evaluar_permiso->fetchColumn();
                                $permiso_registrar =$row1;             
                            }
                            ?> <!-- fin del codigo para sustraer el permiso de insertar.-->
                            <?php
                             if ($permiso_registrar == 'SI'){

                             ?>

                          <button  data-toggle="modal"  href="#AGREGAR_ESPECIALIDAD" type='button' id="btnGuardar"  style="color:white;"class="btn btn-primary mb-3"><span> <i class="nav-icon fa fa-plus-square mx-1"></i></span>Agregar Especialidad</button>           
                          <button  onclick="Descargar()" data-toggle="modal"  href="" type='button' id="btnGuardar"  style="color:white; background-color:#FA0079"class="btn btn-danger mb-3"> <span><i class="nav-icon fa fa-file-pdf mx-1"></i></span>Descargar Reporte</button>  
                
                            <?php
                              }
                            ?>
          
          <!-- jquery validation -->
          <div class="card card-primary">
            <div class="card-header text-center" style="background-color: #0CCDE3"><!-- TITULO ENCABEZADO DATOS PERSONALES -->
            
            </div>
            <form  method="POST"><!-- form start -->
              <div class="card-body">
                  
                <div class="table-responsive">
                  <table id="tabla_especialidad" class="table table-bordered table-striped">
                      <thead>
                        <tr>
                        <td class="text-center">Acción</th>
                        <td class="text-center">Área</th>
                        <td class="text-center">Especialidad</th>  
                        <td class="text-center">Descripción</th>
                        </tr>
                      </thead>
                      <tbody>
                        <?php
                         $query = "SELECT ta.NOMBRE as area,te.NOMBRE as especialidad, te.DESCRIPCION, te.CODIGO_ESPECIALIDAD , ta.CODIGO_AREA from tbl_especialidad te ,tbl_area ta  
                         where te.CODIGO_AREA  = ta.CODIGO_AREA ORDER BY te.CODIGO_ESPECIALIDAD ASC;";
                         $result = $conn->query($query);
                         if ($result->num_rows > 0) {
                             while ($row = $result->fetch_assoc()) {
                                 $var1 = $row['CODIGO_ESPECIALIDAD'];
                                 $var2 = $row['especialidad'];
                                 $var3 = $row['area'];
                                 $var4 = $row['DESCRIPCION'];
                        ?>
                        <tr>
                          <td>
                            <div class="text-center" >
                              <div class="btn-group">
                                
                             
                               
                               <!-- Codigo de permiso para Eliminar -->

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
                                      $evaluar_permiso_eliminar->execute(array($usuariomo, '41'));
                                      $row1=$evaluar_permiso_eliminar->fetchColumn();
                                      $permiso_eliminar =$row1; 
                                  }
                                  ?>  
                                  <?php
                                    if ($permiso_eliminar == 'SI'){

                                  ?>

                              <a href="#ELIMINAR<?php echo $var1;?>" data-toggle="modal">
                               <button id="ELIMINAR_ESPECIALIDAD" name="ELIMINAR_ESPECIALIDAD" type='button'   class="btn btn-danger" data-dismiss="modal"><i class="nav-icon fas fa-trash"></i>
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
                                      $evaluar_permiso_actualizar->execute(array($usuariomo, '41'));
                                      $row1=$evaluar_permiso_actualizar->fetchColumn();
                                      $permiso_actualizar =$row1; 
                                    
                                  }
                                  ?>
                                 <?php
                                    if ($permiso_actualizar == 'SI'){

                                  ?>
                                <a href="#EDITARESPECIALIDAD<?php echo $var1; ?>" data-toggle="modal">
                                <button type='button' id="btnGuardar"  style="color:white;"class="btn btn-warning"><span> <i class="nav-icon fas fa-edit mx-1"></i></span></button>
                              </a>

                                <?php
                                  }
                                 ?>
                              
                              </div>
                            </div><!-- final del text-center -->
                          </td>
                                  <td class="text-center"><?php echo $var3; ?></td>
                                  <td class="text-center"><?php echo $var2; ?></td>
                                  <td class="text-center"><?php echo $var4; ?></td>
                          
                          <!--INICIO DEL MODAL DE EDITA ESPECIALIDAD -->
                          <div id="EDITARESPECIALIDAD<?php echo $var1 ?>" class="modal fade" role="dialog">
                            <div class="modal-dialog modal-md">
                              <div class="modal-content"><!-- Modal content-->
                               <div class="modal-header" style="background-color: #0CCDE3">
                                    <h4 class="text-center">Editar Especialidad</h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                <form id="FORMEDITRAPERSONAS" method="POST">
                                  <div class="modal-body"><!--CUERPO DEL MODAL -->
                                    <div class="row"><!-- INICIO PRIMERA ROW -->  
                                      <input type="text" value ="<?php echo $var1; ?>" hidden class="form-control" name="id_especialidad" id="id_especialidad">
                                      <div class="col-sm-12">
                                        <div class="form-group">
                                            <label for="txtcodigo_persona">Especialidad</label>
                                            <input type="text"
                                                value="<?php echo $var2; ?>"
                                                class="form-control" maxlength="50"
                                                minlength="15"
                                                onKeyDown="sinespacio(this);"
                                                onkeyup="mayus(this);"
                                                autocomplete="off" type="text" onkeypress="return soloLetras(event);"
                                                name="editespecialidad" id="editespecialidad"  required="">
                                                <div class="invalid-feedback">
                                                Campo Obligatorio.
                                                </div>
                                        </div>
                                    </div>
                                      <div class="col-sm-12">
                                        <div class="form-group">
                                          <label for="txtcodigo_persona">Descripcion</label>
                                          <textarea required type="text" class="form-control"  maxlength="35"
                                            minlength="5" onkeyup="mayus(this);"  onkeyup="mayus(this);" autocomplete="off" type="text" onkeypress="return soloLetras(event);"
                                              onkeypress="return soloLetras(event);" name="editar_descripcion" id="editar_descripcion" required><?php echo $var4;?></textarea>
                                          <div class="invalid-feedback">
                                            Campo Obligatorio.
                                          </div>
                                        </div>
                                      </div>
                                    </div> <!-- FIN DE EL PRIMER ROW --> 
                                  </div><!--FINAL DEL CARD BODY -->                       
                                  <div class="modal-footer ">
                                    <button type="button" name="ELI" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                                    <button type="submit" id="editare" name="editare" class="btn btn-success"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>      
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
                                    <h4 class="text-center">¿Está seguro de eliminar el tipo de especialidad <?php echo $var2; ?>?</h4>
                                </div> <!--fin el card body -->
                                    <div class="modal-footer ">
                                      <button type="button" name="cerrar" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                                      <button type="submit"  name="ELIMINAR_ESPECIALIDAD" id="ELIMINAR_ESPECIALIDAD"  class="btn btn-primary">Si,eliminar</button>      
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

  <!--INICIO DEL MODAL DE AGREGAR UN NUEVA ESPECIALIDAD -->
  <div id="AGREGAR_ESPECIALIDAD" class="modal fade" role="dialog">
       <div class="modal-dialog modal-md">
           <div class="modal-content"><!-- Modal content-->
                <form id="FORMEDITARMODA" method="POST">
                    <div class="modal-header" style="background-color: #0CCDE3">
                        <h4 class="text-center">Agregar Especialidad</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body"><!--CUERPO DEL MODAL -->
                        <div class="row"><!-- INICIO PRIMERA ROW -->  
                        <div class="col-sm-12">
                                        <div class="form-group">
                                            <label for="txtcodigo_persona">Especialidad</label>
                                            <input type="text"
                                                value=""
                                                class="form-control" maxlength="40"
                                                minlength="15"
                                                placeholder="Agregue  la especialidad"
                                                onkeyup="mayus(this);"
                                                autocomplete="off" type="text" onkeypress="return soloLetras(event);"
                                                name="agregarespecialidad" id="agregarespecialidad"  required="" >
                                                <div class="invalid-feedback">
                                                Campo Obligatorio.
                                                </div>
                                        </div>
                                    </div>
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="txtmodalidad">Descripción</label>
                                    <textarea  type="text"   class="form-control"
                                      maxlength="35"   onkeyup="mayus(this);"  
                                      autocomplete = "off" type="text"  onkeypress="return soloLetras(event);"
                                      placeholder="Agregue una descripción de la especialidad" 
                                      name="agregardescripcion"
                                       id="agregardescripcion" required=""></textarea>
                                    <div class="invalid-feedback">
                                     Campo Obligatorio.
                                   </div>
                                </div>
                            </div> 


                               <div class="col-sm-12">
                                <?php //--INICIO DEL ESTADO
                                  $query = "SELECT  CODIGO_AREA,NOMBRE FROM tbl_area";
                                  $resultadod=$conn->query($query);                
                                ?>
                                <label  class="control-label">Area</label>  
                                <div class="form-group">
                                    <select class="form-control select2 select2-primary"   
                                      style="width: 100%;" name="codigo_area" id="codigo_area" 
                                      required="">
                                      <option > --Seleccione-- </option>
                                      <?php 
                                       if ($resultadod->num_rows > 0) {
                                       while($row = $resultadod->fetch_assoc()) { 
                                       $codigo_area = $row['CODIGO_AREA'];
                                       $area = $row['NOMBRE'];
                                       ?>
                                      <option value="<?php echo $codigo_area?>" ><?php echo $area;?></option>
                                      <?php } 
                                      }?>
                                    </select>
                                </div>
                                <div class="invalid-feedback">
                                     Campo Obligatorio.
                                   </div> 
                             </div>
                        </div> <!-- FIN DE EL PRIMER ROW --> 
                    </div><!--FINAL DEL CARD BODY -->                       
                     <div class="modal-footer ">
                        <button type="button" name="ELI" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                        <button type="submit" id="nueva_espe" name="nueva_espe" class="btn btn-success"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>      
                    </div><!--FIN DEL DIV DE BOTONES DE GUARDAR -->
                </div>
            </form>
      </div>
   </div><!-- FIN DEL MODAL AGREGAR NUEVO --> 
  </div>
   <!--Funcion de la datatable -->

  
</body>

<!-- Modal -->
<script>
    window.onload = function() {
     var myinput = document.getElementByld('bloquear');// el id del input donde quieres aplicarlo
     myinput.onpaste = function(e){
       e.preventDefault();
     }
     myinput.oncopy = function(e){
      e.preventDefault();
     }
    }
  </script>
<script>
    function Descargar() {
      window.open('Reportes_Prosecar/reporteespecialidad.php','_blank');
      window.open(this.href,'_self');
    }
  </script>
  

<script type="text/javascript"> 
   //funcion de mostrar el estilo de la datatable
   $(document).ready( function () {
      $('#tabla_especialidad').DataTable({

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
        "search": "Buscar Especialidad:",
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

//funcion para poner mayusculas
    function mayus(e) {
        e.value = e.value.toUpperCase();
    }

   

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