<?php
 include_once "conexion.php";
 include_once "conexion3.php";

 $codigoObjeto = 34;
 $accion = 'Ingreso a la pantalla de mantenimiento de especialidad  ';
 $descripcion = 'Ver los registros de especialidad';
 bitacora($codigoObjeto, $accion, $descripcion);
 ?>


?>
<head>

</head>
<body oncopy="return false" onpaste="return false" >
<div class="content-wrapper">
  <div class="content-header">
    <div class="text-center">
      <h2>RECETA MEDICA</h2>
    </div>
    <div class="container-fluid">
    </div><!-- /.container-fluid -->
  </div>
  
  <section class="content">
    <div class="container-fluid">
      <div class="row">
        <div class="col-md-12">

        
        <button  onclick="Descargar()" data-toggle="modal"  href="" type='button' id="btnGuardar"  style="color:white; background-color:#FA0079"class="btn btn-danger mb-3"> <span><i class="nav-icon fa fa-file-pdf mx-1"></i></span>Descargar Reporte</button>     
     
          <!-- jquery validation -->
          <div class="card card-primary">
            <div class="card-header text-center" style="background-color: #0CCDE3"><!-- TITULO ENCABEZADO DATOS PERSONALES -->
               <h1 class=" card-title text-center"><strong style="color:black;"></strong></h1>
            </div>
            <form  method="POST"><!-- form start -->
              <div class="card-body">
                  
                <div class="table-responsive">
                  <table id="tabla_area" class="table table-bordered table-striped">
                      <thead>
                    
                        <th class="text-center">EDITAR</th>
                        <th class="text-center">NOMBRE PACIENTE</th>
                        <th class="text-center">NOMBRE MEDICAMENTO</th>
                        <th class="text-center">INDICACIONES RECETA</th>
                        <th class="text-center">OBSERVACIONES</th>
                        <th class="text-center">FECHA RECETA</th>
                          
                        </tr>
                      </thead>
                      <tbody>
                        <?php
                        $query = "SELECT CONCAT_WS (' ','DNI',DNI,PRIMER_NOMBRE, ' ',SEGUNDO_NOMBRE,' ',PRIMER_APELLIDO)
                         AS NOMBRE, tm.NOMBRE_MEDICAMENTO, trm.INDICACIONES_RECETA, trm.OBSERVACIONES, trm.FECHA_RECETA
                         from tbl_receta_medica trm 
                        left join tbl_medicamento tm  on  trm.CODIGO_MEDICAMENTO  = tm.CODIGO_MEDICAMENTO 
                        left join tbl_consulta_medica tcm  on tcm.CODIGO_CONSULTA = trm.CODIGO_CONSULTA
                        left join tbl_inscripcion_cita tic on tcm.CODIGO_CITA = tic.CODIGO_CITA 
                        left join tbl_persona tp  on tp.CODIGO_PERSONA  = tic.CODIGO_PERSONA";
                        $result = $conn->query($query);
                        if ($result->num_rows > 0) {
                          while($row = $result->fetch_assoc()) {
                            $var1 = $row['NOMBRE'];
                            $var2 = $row['NOMBRE_MEDICAMENTO'];
                            $var3 = $row['INDICACIONES_RECETA'];
                            $var4 = $row['OBSERVACIONES'];
                            $var5 = $row['FECHA_RECETA']; 
                           
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

                                //llamar al procedimiento almacenado
                                $evaluar_permiso_actualizar = $db->prepare("CALL Sp_permiso_actualizar(?,?);");
                                $evaluar_permiso_actualizar->execute(array($usuariomo, '34'));
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
                                $evaluar_permiso_eliminar->execute(array($usuariomo, '34'));
                                $row1=$evaluar_permiso_eliminar->fetchColumn();
                                $permiso_eliminar =$row1; 
                            }
                            ?> 
                                <?php
                                if ($permiso_eliminar == 'SI'){
                                    
                                ?> 
                               <a href="#ELIMINAR<?php echo $var1;?>" data-toggle="modal">
                                <button id="ELIMINAR_RECETA" name="ELIMINAR_RECETA" type='button'   class="btn btn-danger" data-dismiss="modal"><i class="nav-icon fas fa-trash"></i>
                               </button>
                               </a>
                               <?php
                                }
                                ?>


                               <?php
                                if ($permiso_actualizar == 'SI'){    
                                ?> 

                                <a href="#EDITARRECETA<?php echo $var1; ?>" data-toggle="modal">
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
                          <td class="text-center"><?php echo $var5; ?></td>
                      
                         

                        <!--INICIO DEL MODAL DE EDITAR AREA -->
                          <div id="EDITARRECETA<?php echo $var1 ?>" class="modal fade" role="dialog">
                            <div class="modal-dialog modal-md">
                              <div class="modal-content"><!-- Modal content-->
                                <form id="FORMEDITRAPERSONAS" method="POST">
                                  <div class="modal-header" style="background-color: #0CCDE3">
                                    <h4 class="text-center">Editar Receta Medica</h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                  </div>
                                  <div class="modal-body"><!--CUERPO DEL MODAL -->
                                    <div class="row"><!-- INICIO PRIMERA ROW -->  
                                      <input type="text" value ="<?php echo $var1; ?>" hidden class="form-control" name="id_rece" id="id_rece">
                                      <div class="col-sm-12">
                                        <div class="form-group">
                                          <label for="txtcodigo_persona">Nombre medicamento</label>
                                          <input  type="text"  value ="<?php echo $var2; ?>" class="form-control"  maxlength="150"     autocomplete = "off" type="text" onkeypress="return soloLetras(event);" onkeyup="mayus(this);"  name="editar_nombre" id="editar_nombre">
                                        </div>
                                      </div>
                                      <div class="col-sm-12">
                                        <div class="form-group">
                                          <label for="txtcodigo_persona">Indicaciones receta</label>
                                          <input  type="text"  value ="<?php echo $var3; ?>" class="form-control"  maxlength="150"     autocomplete = "off" type="text" onkeypress="return soloLetras(event);" onkeyup="mayus(this);"  name="editar_indicacion" id="editar_indicacion">
                                        </div>
                                      </div>
                                      <div class="col-sm-12">
                                        <div class="form-group">
                                          <label for="txtcodigo_persona">Observaciones</label>
                                          <input  type="text"  value ="<?php echo $var4; ?>" class="form-control"  maxlength="150"     autocomplete = "off" type="text" onkeypress="return soloLetras(event);" onkeyup="mayus(this);"  name="editar_observaciones" id="editar_observaciones">
                                        </div>
                                      </div>
                                    </div> <!-- FIN DE EL PRIMER ROW --> 
                                  </div><!--FINAL DEL CARD BODY --> 

                                  <div class="modal-footer ">
                                    <button type="button" name="ELI" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                                    <button type="submit" id="id_rece" name="editar_receta" class="btn btn-success"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>      
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
                                <form id="FORMEeliminar" method="POST">
                                  <div class="modal-body">
                                    <input type="text" value ="<?php echo $var1; ?>" hidden class="form-control" name="rece_eli" id="rece_eli">
                                    <h4 class="text-center">¿Esta seguro de eliminar la receta medica  <?php echo $var2; ?>?</h4>
                                </div> <!--fin el card body -->
                                    <div class="modal-footer ">
                                      <button type="button" name="cerrar" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                                      <button type="submit"  name="ELIMINAR_RECETA" id="ELIMINAR_RECETA"  class="btn btn-primary">Si,eliminar</button>      
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
                      </body>

<script type="text/javascript"> 
   //funcion de mostrar el estilo de la datatable
  $(document).ready( function () {
      $('#tabla_area').DataTable({

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
        "search": "Buscar receta medica:",
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
</body>
<script>
    function Descargar() {
      window.open('Reportes_Prosecar/reporteRecetamedica.php','_blank');
      window.open(this.href,'_self');
    } 

    //funcion para poner mayusculas
  function mayus(e) {
    e.value = e.value.toUpperCase();
  }
  </script>