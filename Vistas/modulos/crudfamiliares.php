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
    Programa:          Mantenimiento de familiares
    Fecha:             03-Marzo-2022
    Programador:       Arnold Caballero
    descripcion:       Permite llevar un mantenimiento de los datos de los familiares registrados
                       en el sistema,editar,eliminar nuevo
-----------------------------------------------------------------------
  Historial de Cambio
-----------------------------------------------------------------------
    Programador               Fecha                      Descripcion
 Diana Rut Garcia           30/06/2022                Cambios en el titulo
 Diana Rut Garcia           23/07/2022                Cambios en el menu,pasarlo a tipo oracion
 Diana Rut                  27/07/2022                Cambios en el menu,se quito los datos escolares
----------------------------------------------------------------------->





<body oncopy="return false" onpaste="return false">
 
<div class="content-wrapper">
  <div class="content-header">
    <div class="container-fluid">
    </div><!-- /.container-fluid -->
  </div>
  
  <section class="content">
    <div class="container-fluid">
      <div class="row">
        <div class="col-md-12">
  <section class="content">
    <div class="container-fluid">
    <section class="content-header text-xl-center mb-3 ">
          <h4>Familiares</h4>     
      </section>
        <div class="card">
          <div class="card-header" style="background-color:#B3F2FF;">
          <ul class="nav nav-tabs card-header-tabs">
          <li class="nav-item">
              <a class=" nav-link" style="color:#000000;" href="ediusuariosestudiantes">Ver Datos Generales</a>
            </li>
              <li class="nav-item ">
                <a class="nav-link "  style="color:#000000;"href="crudContenidoEconoEstudiante">Ver Datos Socioeconómicos</a>
              </li>
              <li class="nav-item ">
                <a class="nav-link active"  style="color:#000000;"href="crudfamiliares">Ver Familiares</a>
              </li>
          </ul>
 
        </div>
        <div class="card-body">
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
            $evaluar_permiso->execute(array($usuariomo, '25'));
            $row1=$evaluar_permiso->fetchColumn();
            $permiso_registrar =$row1;             
          }
        ?> <!-- fin del codigo para sustraer el permiso de insertar.-->
        <?php 
          if($permiso_registrar == 'SI'){
        ?> 
        <a href="categoria"> 
            <button  data-toggle="modal"  href="" type='button' id="btnGuardar"  style="color:white;"class="btn btn-primary mb-3"><span> <i class="nav-icon fa fa-plus-square mx-1"></i></span>Agregar</button>
        </a>
         <button onclick="Descargar()" data-toggle="modal"  href="" type='button' id="btnGuardar"  style="color:white; background-color:#FA0079"class="btn btn-danger mb-3"> <span><i class="nav-icon fa fa-file-pdf mx-1"></i></span>Reporte</button>
         <?php 
         }
        ?>
          <div class="card ">
            <div class="card-header text-center" ><!-- TITULO ENCABEZADO DATOS PERSONALES -->
            </div>
            <form  method="POST" ><!-- form start -->
              <div class="card-body">
                <div class="table-responsive">
                  <table id="tabla_usuarios" class="table table-bordered table-striped">
                      <thead >
                        <tr>
                          <th class="text-center">Acción</th>
                          <th class="text-center">Código</th>
                          <th class="text-center">DNI</th>
                          <th class="text-center">Primer Nombre</th>
                          <th class="text-center">Segundo Nombre</th>
                          <th class="text-center">Primer Apellido</th>
                          <th class="text-center">Segundo Apellido</th>
                          <th class="text-center">Teléfono</th>
                          <th class="text-center">Correo Electrónico</th>
                          <th class="text-center">Dirección</th>
                          <th class="text-center">Estado Civil</th>
                          <th class="text-center">Nivel Educativo</th>
                          <th class="text-center">Ingresos</th>
                          <th class="text-center">Nombre Iglesia</th>
                          <th class="text-center">Familiar del Estudiante</th>
                          
                        </tr>
                      </thead>
                      <tbody class="text-center">
                        <?php
                          $query = "SELECT tp.CODIGO_PERSONA, tf.CODIGO_FAMILIAR, fe.CODIGO_ESTUDIANTE, tp.DNI, tp.PRIMER_NOMBRE,tp.SEGUNDO_NOMBRE, tp.PRIMER_APELLIDO, tp.SEGUNDO_APELLIDO, 
                          tel.NUMERO_TELEFONO ,cor.CORREO_PERSONA, tp.DIRECCION, tf.ESTADO_CIVIL, tf.NIVEL_EDUCATIVO, tF.INGRESOS_DE_FAMILIAR,tf.NOMBRE_IGLESIA,
                          CONCAT(' ',p.PRIMER_NOMBRE, ' ',p.SEGUNDO_NOMBRE,' ',p.PRIMER_APELLIDO,' ',p.SEGUNDO_APELLIDO) AS ESTUDIANTE_FAMILIAR
                          from tbl_persona tp, tbl_familiar tf , tbl_telefono tel ,tbl_correo_electronico cor, tbl_familiares_estudiante fe, tbl_estudiante es, tbl_persona p
                          where tp.CODIGO_PERSONA = tf.CODIGO_PERSONA
                          AND tp.CODIGO_PERSONA = tel.CODIGO_PERSONA
                          AND tp.CODIGO_PERSONA = cor.CODIGO_PERSONA
                          AND tf.CODIGO_FAMILIAR = fe.CODIGO_FAMILIAR
                          AND fe.CODIGO_ESTUDIANTE = es.CODIGO_ESTUDIANTE
                          and es.CODIGO_PERSONA = p.CODIGO_PERSONA
                          AND tp.CODIGO_TIPO_PERSONA = 7;";
                          $result = $conn->query($query);
                          if ($result->num_rows > 0) {
                            while($row = $result->fetch_assoc()) {
                              $var1 = $row['CODIGO_PERSONA'];
                              $var15 = $row['DNI'];
                                                $var8 = $row['PRIMER_NOMBRE'];
                                                $var9 = $row['SEGUNDO_NOMBRE'];
                                                $var10 = $row['PRIMER_APELLIDO'];
                                                $var11 = $row['SEGUNDO_APELLIDO'];
                                                $var12 = $row['NUMERO_TELEFONO'];
                                                $var13 = $row['CORREO_PERSONA'];
                                                $var14 = $row['DIRECCION'];

                                                $var3 = $row['ESTADO_CIVIL'];
                                                $var4 = $row['NIVEL_EDUCATIVO'];
                                                $var5 = $row['INGRESOS_DE_FAMILIAR'];
                                                $var6 = $row['NOMBRE_IGLESIA'];
                                                $var7 = $row['CODIGO_FAMILIAR'];
                                                $var16 = $row['ESTUDIANTE_FAMILIAR'];
                                                
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
                              //llamar al procedimiento almacenado
                              $evaluar_permiso_actualizar = $db->prepare("CALL Sp_permiso_actualizar(?,?);");
                              $evaluar_permiso_actualizar->execute(array($usuariomo, '25'));
                              $row1=$evaluar_permiso_actualizar->fetchColumn();
                              $permiso_actualizar =$row1; 
                            }
                          ?> 
                          <?php
                            include "conexionpdo.php";
                            $usuario=$_SESSION['vario'];
                            //Evaluo si existe el tipo de Rol
                            $evaluar_usuario = $db->prepare("SELECT CODIGO_TIPO_ROL  FROM tbl_usuario  WHERE NOMBRE_USUARIO = (?);");
                            $evaluar_usuario->execute(array($usuario));
                            $row=$evaluar_usuario->fetchColumn();
                            if($row > 0){
                              $usuariomo = $row;//capturo el nombre del ROl en la variable para usarla en el Procedimiento almacenado
                              $evaluar_permiso_eliminar = $db->prepare("CALL Sp_permiso_eliminar(?,?);");
                              $evaluar_permiso_eliminar->execute(array($usuariomo, '25'));
                              $row1=$evaluar_permiso_eliminar->fetchColumn();
                              $permiso_eliminar =$row1; 
                            }
                          ?> 
                        <tr>
                          <td>
                            <div class="text-center" >
                              <div class="btn-group">
                              <?php 
                                if($permiso_eliminar == 'SI'){ //PERMISO DE ELIMINAR
                              ?>                     
                               <a href="#ELIMINAR<?php echo $var1;?>" data-toggle="modal">
                                  <button id="ELIMINAR_FAMILIAR" name="ELIMINAR_FAMILIAR" type='button'   class="form-control btn btn-danger" data-dismiss="modal"><i class="nav-icon fas fa-trash"></i></button>
                               </a>
                               <?php
                                  }
                                 ?>
                                <?php 
                                  if ($permiso_actualizar == 'SI'){//PERMISO DE ACTUALIZAR
                                 ?>
                                 <a href="#EDITARFAMILIAR<?php echo $var1; ?>" data-toggle="modal">
                                <button type='button' id="btnGuardar"  style="color:white;"class="form-control btn btn-warning"><span> <i class="nav-icon fas fa-edit mx-1"></i></span></button>
                                 </a>

                                <?php
                                  }
                                 ?>
                              </div>
                            </div><!-- final del text-center -->
                          </td>
                          <td><?php echo $var7; ?></td> <!--CODIGO PERSONA-->
                          <td><?php echo $var15; ?></td> <!--DNI-->
                          <td><?php echo $var8; ?></td> <!-- Nombre1-->
                          <td><?php echo $var9; ?></td> <!-- Nombre2-->
                          <td><?php echo $var10; ?></td> <!-- Apellido1-->
                          <td><?php echo $var11; ?></td> <!-- Apellido2-->
                          <td><?php echo $var12; ?></td> <!--Telefono-->
                          <td><?php echo $var13; ?></td> <!--corre-->
                          <td><?php echo $var14; ?></td> <!--Direccion-->
                          <td><?php echo $var3; ?></td><!--grado-->
                          <td><?php echo $var4; ?></td> <!--Nombre usuario-->
                          <td><?php echo $var5; ?></td> <!--Estado-->
                          <td><?php echo $var6; ?></td><!--Fecha creacion-->
                          <td><?php echo $var16; ?></td><!--Fecha creacion-->
                        <!--INICIO DEL MODAL DE EDITAR -->
                          <div id="EDITARFAMILIAR<?php echo $var1 ?>" class="modal fade" role="dialog">
                            <div class="modal-dialog modal-lg">
                              <div class="modal-content"><!-- Modal content-->
                                <div class="modal-header" style="background-color: #0CCDE3">
                                    <h4 class="text-center"> Editar Familiar</h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                  </div>
                                <form id="FORMEDITRAPERSONAS" method="POST" >
                                  <div class="modal-body"><!--CUERPO DEL MODAL -->
                                    <div class="row"><!-- INICIO PRIMERA ROW -->  
                                      <input type="text" value ="<?php echo $var1; ?>" hidden class="form-control" name="EDITARFAMILIAR" id="EDITARFAMILIAR">
                                      <input type="text" value ="<?php echo $var6; ?>" hidden class="form-control" name="NOMUSUARIO" id="CODUSUARIO">
                                      <div class="col-sm-3">
                                        <div class="form-group">
                                          <label>Primer Nombre</label>
                                          <input  type="text"  value ="<?php echo $var8; ?>" required   class="form-control"  maxlength="20" minlength="5"  onKeyDown="sinespacio(this);"  onkeyup="mayus(this);" autocomplete = "off" type="text"  onkeypress="return soloLetras(event);" placeholder="Ingrese Nombre" name="nombre1" >
                                        </div>
                                      </div>
                                      <div class="col-sm-3">
                                        <div class="form-group">
                                          <label>Segundo Nombre</label>
                                          <input  type="text"  value ="<?php echo $var9; ?>" required   class="form-control"  maxlength="20" minlength="5"  onKeyDown="sinespacio(this);"  onkeyup="mayus(this);" autocomplete = "off" type="text"  onkeypress="return soloLetras(event);" placeholder="Ingrese Nombre" name="nombre2" >
                                        </div>
                                      </div>
                                      <div class="col-sm-3">
                                        <div class="form-group">
                                          <label>Primer Apellido</label>
                                          <input  type="text"  value ="<?php echo $var10; ?>" class="form-control" required  maxlength="20" minlength="5"  onKeyDown="sinespacio(this);" onkeyup="mayus(this);" autocomplete = "off" type="text" onkeypress="return soloLetras(event);" placeholder="Ingrese Nombre" name="apellido1" id="apellido1">
                                        </div>
                                      </div>
                                      <div class="col-sm-3">
                                        <div class="form-group">
                                          <label>Segundo Apellido</label>
                                          <input  type="text"  value ="<?php echo $var11; ?>" class="form-control" required  maxlength="20" minlength="5"  onKeyDown="sinespacio(this);" onkeyup="mayus(this);" autocomplete = "off" type="text" onkeypress="return soloLetras(event);" placeholder="Ingrese Nombre" name="apellido2" id="apellido2">
                                        </div>
                                      </div>
                                      
                                      
                                    </div> <!-- FIN DE EL PRIMER ROW --> 

                                    <div class="row">
                                      <div class="col-sm-6">
                                        <div class="form-group">
                                          <label>Correo Electrónico</label>
                                          <input  type="text"  value ="<?php echo $var13; ?>" required class="form-control"  maxlength="50" minlength="5"  onKeyDown="sinespacio(this);"  autocomplete = "off" type="text"   name="correo_modi" id="correo_modi">
                                        </div>
                                      </div>

                                      <div class="col-sm-3">
                                        <div class="form-group">
                                          <label>DNI</label>
                                          <input  type="text"  value ="<?php echo $var15; ?>" required class="form-control"  maxlength="15" minlength="5"  onkeyup="noespacio(this, event);" onkeypress="return solonumeros(event);" onKeyDown="sinespacio(this);"  autocomplete = "off" type="text"   name="DNIFAMILIAR" id="DNI">
                                        </div>
                                      </div>
                                      <div class="col-sm-3">
                                        <div class="form-group">
                                          <label>Teléfono</label>
                                          <input  type="text"  value ="<?php echo $var12; ?>" required class="form-control"  maxlength="8" minlength="8" onkeyup="noespacio(this, event);" onkeypress="return solonumeros(event);" onKeyDown="sinespacio(this);"  autocomplete = "off" type="text"   name="telefono" id="telefono">
                                        </div>
                                      </div>

                                  </div>
                                    <div class="row"> <!-- INICIO SEGUNDO ROW -->
                                    
                                    <div class="col-sm-12">
                                        <div class="form-group">
                                          <label>Dirección</label>
                                          <input  type="text"  value ="<?php echo $var14; ?>" required class="form-control"  maxlength="400" minlength="5"   onkeypress="return soloLetras(event);" autocomplete = "off" type="text"   name="direccion" id="direccion">
                                        </div>
                                      </div>
                                       
                                    </div> <!-- FIN ROW --> 
                                    <div class="row"> 
                        <input type="text" value="<?php echo $var1; ?>" hidden class="form-control" name="EDITARFAMILIAR" id="EDITARFAMILIAR" >
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="txtcodigo_persona">Estado Civil</label>
                                <input  type="text"  value ="<?php echo $var3; ?>" class="form-control" maxlength="20" minlength="5" autocomplete = "off" type="text" onkeyup="mayus(this);" 
                                onkeypress="return soloLetras(event);" onkeyup="mayus(this);"  name="editar_estado" id="edifa" required="">
                                <div class="invalid-feedback">
                                       campo obligatorio.
                                </div>
                              </div>
                        </div>
                    
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="txtcodigo_persona">Nivel Educativo</label>
                                <input  type="text"  value ="<?php echo $var4; ?>" class="form-control" minlength="5" maxlength="15"  autocomplete = "off" type="text"  onkeyup="mayus(this);" onkeypress="return soloLetras(event);" 
                                onKeyDown="sinespacio(this);"   onkeyup="mayus(this);" name="editar_nivele" id="edini" required="">
                                <div class="invalid-feedback">
                                       campo obligatorio.
                                </div>
                              </div>
                        </div>
                      </div>  
                    <div class="row"> 
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="txtcodigo_persona">Ingresos</label>
                                <input  type="text"  value ="<?php echo $var5; ?>" class="form-control" autocomplete = "off" type="text"  onkeypress="return solonumeros(event);" 
                                 name="editar_ingresos" id="ediingre" minlength="2" maxlength="6" onKeyDown="sinespacio(this);" required="">
                                <div class="invalid-feedback">
                                       campo obligatorio.
                                </div>
                              </div>
                        </div>

                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="txtcodigo_persona">Iglesia</label>
                                <input  type="text"  value ="<?php echo $var6; ?>" minlength="2" maxlength="50"class="form-control" autocomplete = "off" type="text"    
                                autocomplete = "off" type="text" onkeyup="mayus(this);" 
                                onkeypress="return soloLetras(event);"  onkeyup="mayus(this);"   name="editar_iglesia" id="ediglesia" required="">
                                <div class="invalid-feedback">
                                       campo obligatorio.
                                </div>
                              </div>
                        </div>
                    </div> 
                                    
                                  </div><!--FINAL DEL CARD BODY -->                       
                                  <div class="modal-footer ">
                                    <button type="button" name="ELI" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                                    <button type="submit" id="edit_familiar" name="edit_familiar" class="btn btn-success"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>  
                                  </div><!--FIN DEL DIV DE BOTONES DE GUARDAR -->
                                </div>
                              </form>
                            </div>
                          </div><!-- FIN DEL MODAL EDITAR -->  

                          <div id="ELIMINAR<?php echo $var1 ?>"  name="ELIMINARFAMILIAR" id="ELIMINARFAMILIAR"class="modal fade" role="dialog">
                            <div class="modal-dialog">
                              <div class="modal-content">
                                <div class="modal-header">
                                  <h5 class="modal-title" id="exampleModalLabel"></h5>
                                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                <form id="FORMEeliminar" method="POST" >
                                  <div class="modal-body">
                                    <input type="text" value ="<?php echo $var1; ?>" hidden class="form-control" name="usuario_eliminar" id="usuario_eliminar">
                                    <h4 class="text-center">¿Está seguro de eliminar los datos de <?php echo $var8; ?>?</h4>
                                </div> <!--fin el card body -->
                                  <div class="modal-footer ">
                                    <button type="button" name="cerrar" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                                    <button type="submit"  name="eliminar_fami" id="eliminar_fami"  class="btn btn-primary">Si,eliminar</button>      
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
    </div>
  </div>
  </section><!-- FINAL SECTION -->
</div><!-- /.content-wrapper -->
  <aside class="control-sidebar control-sidebar-dark"><!-- Control Sidebar -->
  </aside>
  <!-- /.control-sidebar -->
</div>
  </div><!-- /.content-wrapper -->
  <aside class="control-sidebar control-sidebar-dark"><!-- Control Sidebar -->
  </aside>
</div><!--  -->
</body>


<script type="text/javascript"> 
   //funcion de mostrar el estilo de la datatable
  $(document).ready( function () {
      $('#tabla_usuarios').DataTable({
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
        "search": "Buscar Familiar:",
        "zeroRecords": "El usuario no existe",
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
      window.open('Reportes_Prosecar/reportefamiliar.php','_blank');
      window.open(this.href,'_self');
    }
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

<!--Ordenado y comentado para su mejor compresion ,psdt si lo toca ,ordenelo :) -->
<!-- Elaborado  y modificado  unicamente por ♠Diana Rut con ayuda de terceros(algunas cosas :v)  -->