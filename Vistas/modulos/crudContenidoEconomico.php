<!-- ---------------------------------------------------------------------
ELABORADO POR ARNOLD GARCIA u otr persona
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
Programa:          Pantalla que muestra los datos socioeconomicos de los estudiantes
Fecha:            
Programador:       
descripcion:       Pantalla de mantenimiento edita datos socieconomicos
-----------------------------------------------------------------------
Historial de Cambio
-----------------------------------------------------------------------
Programador               Fecha                      Descripcion
ANY HERNANDEZ         		11-06-2022                 revision de ortagrafia 
----------------------------------------------------------------------->

<?php
 include_once "conexion.php";
 include_once "conexion3.php";
?>
<head>

</head>

<div class="content-wrapper">
  <div class="content-header">
 
  <body oncopy="return false" onpaste="return false"> 
  <section class="content">

     <section class="content-header text-xl-center mb-3 btn-light">
          <h1>
              <h4>Contenido Socioeconómico</h4>
          </h1>     
      </section>


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
                                $evaluar_permiso->execute(array($usuariomo, '26'));
                                $row1=$evaluar_permiso->fetchColumn();
                                $permiso_registrar =$row1;             
                            }
                            ?> <!-- fin del codigo para sustraer el permiso de insertar.-->

                    <?php 
                    if ($permiso_registrar == 'SI') // Aqui valida que si permiso esta en ON se mostrara el botton de agregar
                    {
                    ?>
                     <button  data-toggle="modal"  href="#AGREGAR_CONTENIDO" type='button' id="btnGuardar"  style="color:white;"class="btn btn-primary mb-3"><span> <i class="nav-icon fa fa-plus-square mx-1"></i></span>Agregar</button>
                     <button  onclick="Descargar()" data-toggle="modal"  href="" type='button' id="btnGuardar"  style="color:white; background-color:#FA0079"class="btn btn-danger mb-3"> <span><i class="nav-icon fa fa-file-pdf mx-1"></i></span>Reporte</button>
                     <?php
                    }
                    ?>
          
          <!-- jquery validation -->
          <div class="card card-primary">
            <div class="card-header text-center" style="background-color: #0CCDE3"><!-- TITULO ENCABEZADO DATOS PERSONALES -->
               <h1 class=" card-title text-center"><strong style="color:black;"> </strong></h1>
            </div>
            <form  method="POST" ><!-- form start -->
              <div class="card-body">
                <div class="table-responsive">
                  <table id="tabla_ContenidoEconomico" class="table table-bordered table-striped">
                      <thead>
                        <tr>
                          <th class="text-center">Acción</th>

                          <th class="text-center">Código</th>
                          <th class="text-center">Tipo del Contenido socioeconómico</th>
                          <th class="text-center">Nombre del Contenido socioeconómico</th>

                          
                        </tr>
                      </thead>
                      <tbody>
                        <?php
                        $query = "SELECT c.CODIGO_CONTENIDO_SOCIOECONOMICO, T.TIPO as TIPO, c.NOMBRE_TIPO FROM tbl_contenido_socioeconomico c, tbl_tipo_socioeconomico t
                        WHERE t.CODIGO_TIPOSOCIO = c.CODIGO_TIPOSOCIO
                        ORDER BY c.CODIGO_CONTENIDO_SOCIOECONOMICO ASC;";


                        $result = $conn->query($query);
                        if ($result->num_rows > 0) {
                          while($row = $result->fetch_assoc()) {
                            $var1 = $row['CODIGO_CONTENIDO_SOCIOECONOMICO'];
                            $var2 = $row['TIPO'];
                            $var3 = $row['NOMBRE_TIPO'];
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
                                $evaluar_permiso_actualizar->execute(array($usuariomo, '26'));
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
                                $evaluar_permiso_eliminar->execute(array($usuariomo, '26'));
                                $row1=$evaluar_permiso_eliminar->fetchColumn();
                                $permiso_eliminar =$row1; 
                            }
                            ?> 
                                <?php
                                if ($permiso_eliminar == 'SI'){
                                    
                                ?> 
                              
                               <a href="#ELIMINAR<?php echo $var1;?>" data-toggle="modal">
                                <button id="ELIMINAR_CONTENIDO" name="ELIMINAR_CONTENIDO" type='button'   class="btn btn-danger" data-dismiss="modal"><i class="nav-icon fas fa-trash"></i>
                               </button>
                               </a>
                               <?php
                                }
                                ?>
                               
                               <?php
                                if ($permiso_actualizar == 'SI'){    
                                ?> 
                                <a href="#EDITARCONTENIDO<?php echo $var1; ?>" data-toggle="modal">
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
              
                        <!--INICIO DEL MODAL DE EDITAR CONTENIDO SOCIOECONOMICO -->
                          <div id="EDITARCONTENIDO<?php echo $var1 ?>" class="modal fade" role="dialog">
                            <div class="modal-dialog modal-md">
                              <div class="modal-content"><!-- Modal content-->

                                <form id="FORMEDITRAPERSONAS" method="POST" class="needs-validation" novalidate >
                                  <div class="modal-header" style="background-color: #0CCDE3">
                                    <h4 class="text-center">Editar Contenido </h4>

                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                  </div>
                                <form id="FORMEDITRAPERSONAS" method="POST">
                                  <div class="modal-body"><!--CUERPO DEL MODAL -->
                                    <div class="row"><!-- INICIO PRIMERA ROW -->  
                                      <input type="number" required value ="<?php echo $var1; ?>" hidden class="form-control" name="id_contenido" id="id_contenido">
              
                                      <div class="col-sm-12">
                                        <div class="form-group">

                                          <label for="txtcodigo_persona">Nombre del Contenido Socioeconomico</label>
                                          <input  type="text"  value ="<?php echo $var3; ?>" class="form-control"  maxlength="50" onkeyup="mayus(this);" onkeypress="return soloLetras(event);" autocomplete = "off" type="text"   name="editar_nombre" id="editar_nombre" required="">
                                          <div class="invalid-feedback">
                                              Campo Obligatorio.
                                              </div>

                                        </div>
                                      </div>
                                    </div> <!-- FIN DE EL PRIMER ROW --> 

                                    
                                  </div><!--FINAL DEL CARD BODY --> 

                                  <div class="modal-footer ">
                                    <button type="button" name="ELI" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                                    <button type="submit" id="editar_contenido" name="editar_contenido" class="btn btn-success"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>      
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
                                    <input type="text" value ="<?php echo $var1; ?>" hidden class="form-control" name="contenido_eliminar" >
                                    <h4 class="text-center">¿Está seguro que desea eliminar el contenido <?php echo $var3; ?>?</h4>
                                </div> <!--fin el card body -->
                                    <div class="modal-footer ">
                                      <button type="button" name="cerrar" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                                      <button type="submit"  name="ELIMINAR_CONTENIDO" id="ELIMINAR_CONTENIDO"  class="btn btn-primary">Si,eliminar</button>      
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
  </div>
</div>


   <!--INICIO DEL MODAL DE AGREGAR UN NUEVO CONTENIDO SOCIOECONOMICO -->
   <div id="AGREGAR_CONTENIDO" class="modal fade" role="dialog">
       <div class="modal-dialog modal-md">
       <?php
          include_once "conexion3.php";
          $query= "SELECT t.CODIGO_TIPOSOCIO,t.TIPO FROM tbl_tipo_socioeconomico t;";
          $result= $conn->query($query);
        ?>
           <div class="modal-content"><!-- Modal content-->

                <form id="FORMEDITRAPERSONAS" method="POST" class="needs-validation" novalidate >
                    <div class="modal-header" style="background-color: #0CCDE3">
                        <h4 class="text-center">Agregar Contenido</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <div class="modal-body"><!--CUERPO DEL MODAL -->
                        <div class="row"><!-- INICIO PRIMERA ROW -->  
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="txtcodigo_persona">Tipo Socioeconómico</label>
                                    <select class="form-control" name="codigo_contenido" id="codigo_contenido" required="">

                                     <option value="">--Seleccione un tipo--</option>
                                     <?php
                                      if ($result->num_rows > 0){
                                        while($row = $result->fetch_assoc()){
                                      ?>
                                     <option value="<?php echo $row['CODIGO_TIPOSOCIO'];?>"><?php echo $row['TIPO'];?></option>
                                     <?php
                                      }
                                     }
                                      ?>
                                   </select>
                                   <div class="invalid-feedback">
                                      Campo obligatorio.
                                   </div>
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="txtcodigo_persona">Contenido tipo socioeconómico</label>
                                    <textarea required type="text"  class="form-control"  maxlength="150"  onkeypress="return soloLetras(event);" onkeyup="mayus(this);" autocomplete = "off" type="text"  name="contenido_nombre" id="contenido_nombre"></textarea>
                                    <div class="invalid-feedback">
                                      Campo obligatorio.
                                  </div>
                            </div>
                        </div> <!-- FIN DE EL PRIMER ROW --> 
                    </div><!--FINAL DEL CARD BODY -->                       
                    <div class="modal-footer ">
                        <button type="button" name="ELI" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                        <button type="submit" id="agregar_contenido" name="agregar_contenido" class="btn btn-success"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>      
                    </div><!--FIN DEL DIV DE BOTONES DE GUARDAR -->
                </div>
            </form>
      </div>
   </div><!-- FIN DEL MODAL AGREGAR NUEVO ESTADO -->

 





<script>
    function Descargar() {
      window.open('Reportes_Prosecar/reporteContenidoEconomico.php','_blank');
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
      $('#tabla_ContenidoEconomico').DataTable({
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
        "search": "Buscar Contenido Socioeconómico:",
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