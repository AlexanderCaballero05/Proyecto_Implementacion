
<!-- 
-----------------------------------------------------------------------
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
    Programa:          Mantenimiento de los trastornos 
    Fecha:             
    Programador:      
    descripcion:       Permite llevar un mantenimiento de los trastornos  es su relación  ,editar,eliminar nuevo
-----------------------------------------------------------------------
  Historial de Cambio
-----------------------------------------------------------------------
    Programador               Fecha                      Descripcion
  ANY HERNANDEZ         		11-06-2022                 revision de ortagrafia 
  Diana Rut Garcia        	21-06-2022                 Arreglos en los modales con funcionalidades
  D'aniel Martinez          10-07-2022                 Eliminar bitacora de ingreso al mantenimiento
  D'aniel Martinez          10-07-2022                 Arreglar validación minimo y maximo en Modales.
  D'aniel Martinez          10-07-2022                 Arreglar Validaciones inputs (No espacio al inicio y final,)
  D'aniel Martinez          10-07-2022                 Agregar funcion script para convertir todos los inputs en mayuscula sin necesidad de colocarlo en cada uno
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
  <div class="text-center">

    <div class="container-fluid">
    </div><!-- /.container-fluid -->
  </div>
  
  <section class="content">
    <div class="container-fluid">
    <section class="content-header text-xl-center mb-3 ">
        <h1>
            <h4>Mantenimiento de Trastornos</h4>
        </h1>     
    </section>
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
                    if ($permiso_registrar == 'SI') // Aqui valida que si permiso esta en ON se mostrara el botton de agregar
                    {

                    ?> 
                    <button  data-toggle="modal"  href="#AGREGAR_NOPATOLOGIA" type='button' id="btnGuardar"  style="color:white;"class="btn btn-primary mb-3"><span> <i class="nav-icon fa fa-plus-square mx-1"></i></span>Agregar Trastorno</button>
                    <button  onclick="Descargar()" data-toggle="modal"  href="" type='button' id="btnGuardar"  style="color:white; background-color:#FA0079"class="btn btn-danger mb-3"> <span><i class="nav-icon fa fa-file-pdf mx-1"></i></span>Generar Reporte</button>
                    <?php 
                      }
                    ?> 
          <!-- jquery validation -->
          <div class="card card-primary">
            <div class="card-header text-center" style="background-color: #0CCDE3"><!-- TITULO ENCABEZADO DATOS PERSONALES -->
               <h1 class=" card-title text-center"><strong style="color:black;"></strong></h1>
            </div>
            <form  method="POST"  class="needs-validation" novalidate ><!-- form start -->
              <div class="card-body">
                  
                <div class="table-responsive">
                  <table id="tabla_Transtornos" class="table table-bordered table-striped">
                      <thead>
                        <tr>
                        <th class="text-center">Acción</th>
                        <th class="text-center">Id</th>
                        <th class="text-center">Tipo de Trastorno</th>
                        </tr>
                      </thead>
                      <tbody>
                        <?php
                         $query = "SELECT np.CODIGO_TRANSTORNO, np.TIPO
                         FROM tbl_transtornos_corporales np;";
                         $result = $conn->query($query);
                         if ($result->num_rows > 0) {
                             while ($row = $result->fetch_assoc()) {
                                 $var1 = $row['CODIGO_TRANSTORNO'];
                                 $var2 = $row['TIPO'];
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
                                $evaluar_permiso_actualizar->execute(array($usuariomo, '30'));
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
                                $evaluar_permiso_eliminar->execute(array($usuariomo, '30'));
                                $row1=$evaluar_permiso_eliminar->fetchColumn();
                                $permiso_eliminar =$row1; 
                            }
                            ?> 
                                <?php
                                if ($permiso_eliminar == 'SI'){
                                    
                                ?> 
                               <a href="#ELIMINAR<?php echo $var1;?>" data-toggle="modal">
                                <button id="ELIMINAR_TRANSTORNO" name="ELIMINAR_TRANSTORNO" type='button'   class="btn btn-danger" data-dismiss="modal"><i class="nav-icon fas fa-trash"></i>
                               </button>
                               </a>
                               <?php
                                }
                                ?>


                               <?php
                                if ($permiso_actualizar == 'SI'){    
                                ?> 

                                <a href="#EDITARNOPATOLOGIA<?php echo $var1; ?>" data-toggle="modal">
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
                          
                         

                        <!--INICIO DEL MODAL DE EDITAR TRANSTORNO -->
                          <div id="EDITARNOPATOLOGIA<?php echo $var1 ?>" class="modal fade" role="dialog">
                            <div class="modal-dialog modal-md">
                              <div class="modal-content"><!-- Modal content-->
                                <div class="modal-header" style="background-color: #0CCDE3">
                                    <h4 class="text-center">Editar Trastorno</h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                <form id="FORMEDITRAPERSONAS" method="POST">
                                  <div class="modal-body"><!--CUERPO DEL MODAL -->
                                    <div class="row"><!-- INICIO PRIMERA ROW -->  
                                      <input type="text" value ="<?php echo $var1; ?>" hidden class="form-control" name="EDITARNOPATOLOGIA" id="EDITARNOPATOLOGIA">
                                      <div class="col-sm-12">
                                        <div class="form-group">
                                          <label for="txtcodigo_persona">Tipo</label>
                                          <input  type="text"  value ="<?php echo $var2; ?>" class="form-control" pattern=".{5,50}" maxlength="50" onkeypress="return soloLetras(event);" onkeyup="this.value=this.value.replace(/^\s+/,'');" autocomplete = "off" type="text" name="editar_tipo" id="editar_tipo" onblur="quitarespacios(this);" required="">
                                        </div>
                                      </div>
                                      </div>
                                  </div><!--FINAL DEL CARD BODY --> 
                                  <div class="modal-footer ">
                                    <button type="button" name="ELI" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                                    <button type="submit" id="editar_nopatologia" name="editar_nopatologia" class="btn btn-success"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>      
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
                                    <input type="text" value ="<?php echo $var1; ?>" hidden class="form-control" name="transtorno_eliminar" id="transtorno_eliminar">
                                    <h4 class="text-center">¿Está seguro de eliminar trastorno <?php echo $var2; ?>?</h4>
                                </div> <!--fin el card body -->
                                    <div class="modal-footer ">
                                      <button type="button" name="cerrar" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                                      <button type="submit"  name="ELIMINAR_TRANSTORNO" id="ELIMINAR_TRANSTORNO"  class="btn btn-primary">Si,eliminar</button>      
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

  <!--INICIO DEL MODAL DE AGREGAR UN NUEVO TRASNTORNO -->
  <div id="AGREGAR_NOPATOLOGIA" class="modal fade" role="dialog">
       <div class="modal-dialog modal-md">
           <div class="modal-content"><!-- Modal content-->
                <form id="FORMEDITRAPERSONAS" method="POST" class="needs-validation" novalidate>
                    <div class="modal-header" style="background-color: #0CCDE3">
                      <h4 class="text-center">Agregar Trastorno</h4>
                      <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body"><!--CUERPO DEL MODAL -->
                        <div class="row"><!-- INICIO PRIMERA ROW -->  
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="txtcodigo_persona">Tipo</label>
                                    <input  type="text"  class="form-control"  pattern=".{5,50}" maxlength="50" onkeypress="return soloLetras(event);" onkeyup="this.value=this.value.replace(/^\s+/,'');" autocomplete = "off" type="text" name="agregar_tipo" onblur="quitarespacios(this);" required>
                                    <div class="invalid-feedback">
                                     Campo obligatorio.
                                   </div>

                                </div>
                            </div>
                           
                        </div> <!-- FIN DE EL PRIMER ROW --> 
                    </div><!--FINAL DEL CARD BODY -->                     
                    <div class="modal-footer ">
                        <button type="button" name="ELI" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                        <button type="submit" id="agregar_patologia" name="agregar_patologia" class="btn btn-success"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>      
                    </div><!--FIN DEL DIV DE BOTONES DE GUARDAR -->
                </div>
            </form>
      </div>
   </div><!-- FIN DEL MODAL AGREGAR NUEVO TRANSTORNO --> 
</div>

<!-- funciones del sistema -->


<script>
    function Descargar() {
      window.open('Reportes_Prosecar/reporteTranstornos.php','_blank');
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
<script type="text/javascript"> 
  $(document).ready( function () {
      $('#tabla_Transtornos').DataTable({
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
        "search": "Buscar Transtorno:",
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
     $(document).ready( function () {
      $("input").on("keypress", function () {
       $input=$(this);
       setTimeout(function () {
        $input.val($input.val().toUpperCase());
       },50);
      })
     })
    </script>

 

