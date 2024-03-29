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
    Programa:          Mantenimiento de Areas
    Fecha:             09-Junio-2022
    Programador:        DESCONODIDO
    descripcion:       Edita,elimina y registra una area
-----------------------------------------------------------------------
  Historial de Cambio
-----------------------------------------------------------------------
    Programador           Fecha                      Descripcion
Diana Rut Garcia     		09-06-2022                Cambio en mensajes bitacora,con detalles de escritura y otros
ANY HERNANDEZ       		11-08-2022                 AGREGAR ESTADOS Y SU MODIFICACIÓN Y AGREGAR 
----------------------------------------------------------------------->

<?php
 include_once "conexion.php";
 include_once "conexion3.php";
 
?>
<head>

</head>
<body oncopy="return false" onpaste="return false" >
<div class="content-wrapper">
  <div class="content-header">
    <div class="text-center">
    </div>
    <div class="container-fluid">
    </div><!-- /.container-fluid -->
  </div>
  
  <section class="content">
      <div class="content-header text-xl-center mb-3 ">
          <h4>Áreas</h4>   
      </div>
    <div class="container-fluid">
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
            //llamar al procedimiento almacenado
            $evaluar_permiso = $db->prepare("CALL Sp_permiso_insertar(?,?);");
            $evaluar_permiso->execute(array($usuariomo, '20'));
            $row1=$evaluar_permiso->fetchColumn();
            $permiso_registrar =$row1;             
         }
       ?> <!-- fin del codigo para sustraer el permiso de insertar.-->
                    <?php 
                    if ($permiso_registrar == 'SI'){ // Aqui valida que si permiso esta en ON se mostrara el botton de agregar
                    ?> 
                     <button  data-toggle="modal" href="#AGREGAR_AREA"  type='button' id="btnGuardar"  style="color:white;"class="btn btn-primary mb-3"><span> <i class="nav-icon fa fa-plus-square mx-1"></i></span>Agregar</button>
                     <button  onclick="Descargar()" data-toggle="modal"  href="" type='button' id="btnGuardar"  style="color:white; background-color:#FA0079"class="btn btn-danger mb-3"> <span><i class="nav-icon fa fa-file-pdf mx-1"></i></span>Reporte</button>
                    <?php 
                      }  
                    ?> 
          <div class="card card-primary">
            <div class="card-header text-center" style="background-color: #0CCDE3"><!-- TITULO ENCABEZADO DATOS PERSONALES -->
               <h1 class=" card-title text-center"><strong style="color:black;"></strong></h1>
            </div>
            <form  method="POST"><!-- form start -->
              <div class="card-body">
                <div class="table-responsive">
                  <table id="tabla_area" class="table table-bordered table-striped">
                      <thead>
                        <tr>
                        <th class="text-center">Acción</th>
                        <th class="text-center">Código</th>
                        <th class="text-center">Nombre Área</th>
                        <th class="text-center">Descripción</th>
                        <th class="text-center">Estado</th>

                        </tr>
                      </thead>
                      <tbody>
                        <?php
                        $query = " SELECT a.CODIGO_AREA, a.NOMBRE, a.DESCRIPCION,te.NOMBRE AS ESTADO ,te.CODIGO_ESTADO 
                        FROM tbl_area a
                        left join tbl_estado te  on te.CODIGO_ESTADO = a.CODIGO_ESTADO 
                        WHERE CODIGO_AREA  ORDER BY CODIGO_AREA desc; ";
                        $result = $conn->query($query);
                        if ($result->num_rows > 0) {
                          while($row = $result->fetch_assoc()) {
                            $var1 = $row['CODIGO_AREA'];
                            $var2 = $row['NOMBRE'];
                            $var3 = $row['DESCRIPCION'];
                            $var4 = $row['ESTADO'];
                            $var5 = $row['CODIGO_ESTADO'];
                        ?>
                        <tr>
                          <td>
                            <div class="text-center" >
                              <div class="btn-group">
                              <?php
                            include "conexionpdo.php";
                            $usuario=$_SESSION['vario'];
                            //Evaluo si existe el tipo de Rol
                            $evaluar_usuario = $db->prepare("SELECT CODIGO_TIPO_ROL FROM tbl_usuario WHERE NOMBRE_USUARIO = (?);");
                            $evaluar_usuario->execute(array($usuario));
                            $row=$evaluar_usuario->fetchColumn();
                            if($row > 0){
                                $usuariomo = $row;//capturo el nombre del ROl en la variable para usarla en el Procedimiento almacenado
                                //llamar al procedimiento almacenado
                                $evaluar_permiso_actualizar = $db->prepare("CALL Sp_permiso_actualizar(?,?);");
                                $evaluar_permiso_actualizar->execute(array($usuariomo, '20'));
                                $row1=$evaluar_permiso_actualizar->fetchColumn();
                                $permiso_actualizar =$row1; 
                            }
                            ?> 
                            <?php
                            include "conexionpdo.php";
                            $usuario=$_SESSION['vario'];
                            //Evaluo si existe el tipo de Rol
                            $evaluar_usuario = $db->prepare("SELECT CODIGO_TIPO_ROL FROM tbl_usuario WHERE NOMBRE_USUARIO = (?);");
                            $evaluar_usuario->execute(array($usuario));
                            $row=$evaluar_usuario->fetchColumn();
                            if($row > 0){
                                $usuariomo = $row;//capturo el nombre del ROl en la variable para usarla en el Procedimiento almacenado
                                $evaluar_permiso_eliminar = $db->prepare("CALL Sp_permiso_eliminar(?,?);");
                                $evaluar_permiso_eliminar->execute(array($usuariomo, '20'));
                                $row1=$evaluar_permiso_eliminar->fetchColumn();
                                $permiso_eliminar =$row1; 
                            }
                            ?> 
                                <?php
                                if ($permiso_eliminar == 'SI'){
                                    
                                ?> 
                               <a href="#ELIMINAR<?php echo $var1;?>" data-toggle="modal">
                                <button id="ELIMINAR_AREA" name="ELIMINAR_AREA" type='button'   class="btn btn-danger" data-dismiss="modal"><i class="nav-icon fas fa-trash"></i>
                               </button>
                               </a>
                               <?php
                                }
                                ?>
                               <?php
                                if ($permiso_actualizar == 'SI'){    
                                ?> 

                                <a href="#EDITARAREA<?php echo $var1; ?>" data-toggle="modal">
                                <button type='button' id="btnGuardar"  style="color:white;"class="btn btn-warning"><span> <i class="nav-icon fas fa-edit mx-1"></i></span></button>
                                </a>
                                <?php
                                }
                                ?>
                              </div>
                            </div><!-- final del text-center -->
                          </td>
                          <?php
                            if($var4 == 'ACTIVO'){
                          ?>
                          <td class="text-center"><?php echo $var1; ?></td>
                          <td class="text-center"><?php echo $var2; ?></td>
                          <td class="text-center"><?php echo $var3; ?></td>
                          <td class="text-center "style="color: green; font-weight: bold;"><?php echo $var4; ?></td>
                          <?php
                             }else{ //si no e; texto de los datos de la tabla no cambian
                          ?>
                          <td class="text-center"><?php echo $var1; ?></td>
                          <td class="text-center"><?php echo $var2; ?></td>
                          <td class="text-center"><?php echo $var3; ?></td>
                          <td class="text-center" style="color: red; font-weight: bold;"><?php echo $var4; ?></td>
                          
                          <?php
                            }
                          ?>
                        <!--INICIO DEL MODAL DE EDITAR AREA -->
                          <div id="EDITARAREA<?php echo $var1 ?>" class="modal fade" role="dialog">
                            <div class="modal-dialog modal-md">
                              <div class="modal-content"><!-- Modal content-->
                                <div class="modal-header" style="background-color: #0CCDE3">
                                  <h4 class="text-center">Editar Área </h4>
                                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                <form id="FORMEDITRAPERSONAS" method="POST">
                                  <div class="modal-body"><!--CUERPO DEL MODAL -->
                                    <div class="row"><!-- INICIO PRIMERA ROW -->  
                                      <input type="text" value ="<?php echo $var1; ?>" hidden class="form-control" name="id_area" id="id_area">
                                      <div class="col-sm-12">
                                        <div class="form-group">
                                          <label for="txtcodigo_persona">Nombre Área</label>
                                          <input  type="text"  value ="<?php echo $var2; ?>" class="form-control"  maxlength="20" minlength="5" required   autocomplete = "off" type="text" onkeypress="return soloLetras(event);" onkeyup="mayus(this);"  name="editar_nombre" id="editar_nombre">
                                        </div>
                                      </div>
                                      <div class="col-sm-12">
                                        <div class="form-group">
                                          <label for="txtcodigo_persona">Descripción</label>
                                          <input  type="text"  value ="<?php echo $var3; ?>" onkeypress="return soloLetrasComa(event);" class="form-control"  maxlength="150"  required   autocomplete = "off" type="text" onkeypress="return soloLetras(event);" onkeyup="mayus(this);"  name="editar_descripcion" id="editar_descripcion">
                                        </div>
                                      </div>
                                      <!--INICIO DE ESTADO-->
                                      <div class="col-sm-12">
                                        <label for="cbx_persona" class="control-label">Estado</label>  
                                        <div class="form-group">
                                          <select class="form-control select2 select2-primary" required  style="width: 100%;" name="ESTADOUSUARIO" id="ESTADOUSUARIO" required="">
                                            <option value="<?php echo $var5?>"><?php echo $var4;?></option>
                                            <option value="2">ACTIVO</option>
                                            <option value="3">INACTIVO</option>
                                          </select> 
                                        </div>  
                                      </div> <!--FIN DE ESTADO-->
                                    </div> <!-- FIN DE EL PRIMER ROW --> 
                                  </div><!--FINAL DEL CARD BODY --> 
                                  <div class="modal-footer ">
                                    <button type="button" name="ELI" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                                    <button type="submit" id="editar_area" name="editar_area" class="btn btn-success"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>      
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
                                    <input type="text" value ="<?php echo $var1; ?>" hidden class="form-control" name="area_eli" id="area_eli">
                                    <h4 class="text-center">¿Está seguro de eliminar el área <?php echo $var2; ?>?</h4>
                                </div> <!--fin el card body -->
                                    <div class="modal-footer ">
                                      <button type="button" name="cerrar" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                                      <button type="submit"  name="ELIMINAR_AREA" id="ELIMINAR_AREA"  class="btn btn-primary">Si,eliminar</button>      
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

  <!--INICIO DEL MODAL DE AGREGAR UN NUEVO ESTADO -->
  <div id="agregar_area" class="modal fade" role="dialog">
       <div class="modal-dialog modal-md">
           <div class="modal-content"><!-- Modal content-->
                <form id="FORMEDITRAPERSONAS" method="POST" class="needs-validation" novalidate>
                    <div class="modal-header" style="background-color: #0CCDE3">
                        <h4 class="text-center">Agregar Área</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body"><!--CUERPO DEL MODAL -->
                        <div class="row"><!-- INICIO PRIMERA ROW -->  
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="txtcodigo_persona">Nombre Área</label>

                                    <input  type="text"  class="form-control"  maxlength="20" minlength="5"  onKeyDown="sinespacio(this);" onkeyup="mayus(this);" autocomplete = "off" type="text" onkeyup="mayus(this);" onkeypress="return soloLetras(event);" placeholder="Ingrese un nombre de la area" name="nombre_area" id="nombre_area" required="">
                                    <div class="invalid-feedback">
                                     Campo obligatorio.
                                    </div>
                                  </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="txtcodigo_persona">Descripción</label>
                                    <textarea  type="text"  class="form-control"  maxlength="150"  onkeypress="return soloLetrasComa(event);" onkeyup="mayus(this);" autocomplete = "off" type="text"  placeholder="Ingrese una descripción de la area" name="descripcion_area" id="descripcion_area" required="" onkeypress="return soloLetras(event);" ></textarea>
                                    <div class="invalid-feedback">
                                     Campo obligatorio.
                                    </div>
                                  </div>
                            </div>
                        </div> <!-- FIN DE EL PRIMER ROW --> 
                    </div><!--FINAL DEL CARD BODY -->                       
                    <div class="modal-footer ">
                        <button type="button" name="ELI" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                        <button type="submit" id="agregar_area" name="agregar_area" class="btn btn-success"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>      
                    </div><!--FIN DEL DIV DE BOTONES DE GUARDAR -->
                </div>
            </form>
      </div>
   </div><!-- FIN DEL MODAL AGREGAR NUEVO --> 

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
        "search": "Buscar Área:",
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
      window.open('Reportes_Prosecar/reporteArea.php','_blank');
      window.open(this.href,'_self');
    } 

    //funcion para poner mayusculas
  function mayus(e) {
    e.value = e.value.toUpperCase();
  }

  </script>

  <script>
      function soloLetrasComa(e){
       key = e.keyCode || e.which;
       tecla = String.fromCharCode(key).toLowerCase();
       letras = " áéíóúabcdefghijklmnñopqrstuvwxyz ,.";
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

 