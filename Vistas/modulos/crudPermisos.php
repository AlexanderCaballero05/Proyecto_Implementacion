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

    Programa:          Pantalla de registro de permisos a los objetos o pantallas del sistema
    Fecha:             04-Marzo-2022
    Programador:       Arnold Caballero 
    descripcion:       Valida agregar a los roles de usuario permisos sobre objetos o modulos del sistema

-----------------------------------------------------------------------
                      Historial de Cambio
-----------------------------------------------------------------------

    Programador               Fecha                      Descripcion

    Arnold Caballero     		07-06-2022                 cambio en presentar mensaje de confirmacion  al guardar
    Diana Garcia         		08-06-2022                 Cambio en el modal de editar con el titulo de la pagina


----------------------------------------------------------------------->


<?php 
 include_once "conexion1.php";
 include_once "conexion3.php";
 $codigoObjeto = 5;
$accion = 'INGRESO AL MANTENIMIENTO DE PERMISOS';
$descripcion = 'VIZUALIZAR LOS REGISTROS DE LOS PERMISOS';
bitacora($codigoObjeto, $accion, $descripcion);
?>
<head>

</head>

<div class="content-wrapper">
  <div class="content-header">
    <div class="text-center">
    </div>
    <div class="container-fluid">
    </div><!-- /.container-fluid -->
  </div>
  
  <section class="content">
  <section class="content-header text-xl-center mb-3 ">
        <h1>
            <h3>Permisos de Usuarios</h3>
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
                                $evaluar_permiso->execute(array($usuariomo, '5'));
                                $row1=$evaluar_permiso->fetchColumn();
                                $permiso_registrar =$row1;             
                            }
                            ?> <!-- fin del codigo para sustraer el permiso de insertar.-->

                    <?php 
                    if ($permiso_registrar == 'SI') // Aqui valida que si permiso esta en ON se mostrara el botton de agregar
                    {
                    ?>                

                       <button  data-toggle="modal"  href="#agregar_permisos" type='button' id="btnGuardar"  style="color:white;"class="btn btn-primary mb-3"><span> <i class="nav-icon fa fa-plus-square mx-1"></i></span>Agregar permiso</button>
                       <button  onclick="Descargar()" data-toggle="modal"  href="" type='button' id="btnGuardar"  style="color:white; background-color:#FA0079"  class="btn  mb-3"> <span><i class="nav-icon fa fa-file-pdf mx-1"></i></span>Generar reporte</button>
                    
                    <?php
                    }
                    ?>
          
          <!-- jquery validation -->
          <div class="card card-primary">
            <div class="card-header text-center" style="background-color: #0CCDE3"><!-- TITULO ENCABEZADO DATOS PERSONALES -->
               <h1 class=" card-title text-center"></h1>
            </div>
            <form  method="POST"><!-- form start -->
              <div class="card-body">
                  
                <div class="table-responsive">
                  <table id="tabla_permisos" class="table table-bordered table-striped table-hover">
                      <thead class="table" >
                        <tr><!--fila del encabezado de la tabla -->
                          <th class="text-center">Acción</th> 
                          <th class="text-center">ID</th> <!--encabezados de la tabla -->
                          <th class="text-center">Rol Usuario</th>
                          <th class="text-center">Permiso Objeto</th>
                          <th class="text-center">Permiso Insertar</th>
                          <th class="text-center">Permiso Eliminar</th>
                          <th class="text-center">Permiso Actualizar</th>
                          <th class="text-center">Permiso Mostrar</th>
                                                   

                        </tr>
                      </thead>
                      <tbody>
                        <?php
                        $query = "CALL Sp_mostrar_permisos()";//Procedimiento para traer los datos de la tabla permisos
                        $result = $conn->query($query);
                        if ($result->num_rows > 0) {// if que valida que si es mayor a 0 se encontro un registro
                          while($row = $result->fetch_assoc()) {//while para capturar cada dato del registro en una variable
                            $var1 = $row['CODIGO_PERMISO'];// variable que almacena el dato capturado
                            $var2 = $row['CODIGO_TIPO_ROL'];
                            $var3 = $row['CODIGO_OBJETO'];
                            $var4 = $row['ROL'];
                            $var5 = $row['NOMBRE'];
                            $var6 = $row['INSERTAR'];
                            $var7 = $row['ELIMINAR'];
                            $var8 = $row['ACTUALIZAR'];
                            $var9 = $row['MOSTRAR'];
                           
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
                                $evaluar_permiso_actualizar->execute(array($usuariomo, '5'));
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
                                $evaluar_permiso_eliminar->execute(array($usuariomo, '5'));
                                $row1=$evaluar_permiso_eliminar->fetchColumn();
                                $permiso_eliminar =$row1; 
                            }
                            ?> 



                    <tr> <!-- INICIO DE LINEA DE LOS DATOS DE LA TABLA-->
                          <td> <!-- TABLE DATA en donde estan los botones de eliminar e modificar -->
                            <div class="text-center" >
                              <div class="btn-group">

                                <?php
                                  if($permiso_eliminar == 'SI')
                                   {
                                ?>
                                
                               <a href="#ELIMINAR<?php echo $var1;?>" data-toggle="modal">
                                <button id="ELIMINAR_ROL" name="ELIMINAR_ROL" type='button'   class="btn btn-danger" data-dismiss="modal"><i class="nav-icon fas fa-trash"></i>
                               </button>
                               </a>

                               <?php
                                  }
                                ?>


                                <?php 
                                if ($permiso_actualizar == 'SI')
                                {
                                ?>

                                <a href="#EditarPermiso<?php echo $var1; ?>" data-toggle="modal">
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
                          <td class="text-center"><?php echo $var5; ?></td>
                          <td class="text-center"><?php echo $var6; ?></td>
                          <td class="text-center"><?php echo $var7; ?></td>
                          <td class="text-center"><?php echo $var8; ?></td>
                          <td class="text-center"><?php echo $var9; ?></td>
                          
                          


              <!--------------------------------------------------------------
                          INICIO DEL MODAL DE EDITAR PERMISO
               --------------------------------------------------------------->

                            <?php
                          include "conexion1.php";
                          $queryr = "SELECT o.CODIGO_OBJETO
                                      FROM tbl_objetos o;";
                          $resultador=$conn->query($queryr);
                          ?>  

                             
                          <div id="EditarPermiso<?php echo $var1 ?>" class="modal fade" role="dialog">
                            <div class="modal-dialog modal-md">
                              <div class="modal-content"><!-- Modal content-->
                                 <div class="modal-header" style="background-color: #0CCDE3">
                                    <h4 class="text-center">Editar permisos</h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                  </div>
                                <form id="FORMEDITRAPERSONAS" method="POST">
                                  <div class="modal-body"><!--CUERPO DEL MODAL -->
                                    <div class="row"><!-- INICIO PRIMERA ROW -->  
                                      <input hidden name="PERMISOU" value="<?php echo $var1 ?>"></input>
                                      <!--Inicio combobox tipo de rol -->
                                      <div class="col-sm-12">
                                        <div class="form-group">
                                          <label for="txtcodigo_persona">Rol Usuario</label>
                                             <input hidden name="EDITIPO" value="<?php echo $var2?>"> 
                                              <input class="form-control" readonly  required value="<?php echo $var4 ?>" >
                                        </div>
                                      </div>
                                            <!--Inicio combobox objeto -->

                                      <div class="col-sm-12">
                                        <div class="form-group">
                                          <label for="txtcodigo_persona">Objeto</label>
                                          <input  hidden value="<?php echo $var3?>"  name="EDIOBJETO" >
                                            <input required class="form-control"  readonly value="<?php echo $var5 ?>">
                                          </select>
                                        </div>
                                      </div>
                                                 
                                            <!--Inicio combobox insertar -->
                                      <div class="col-sm-12">
                                        <div class="form-group">
                                          <label for="txtcodigo_persona">Insertar</label>
                                            <select class="form-control" name="ediInsertar" id="editar_descripcion">
                                                 <option hidden value="<?php echo $var6?>"> <?php echo $var6 ?></option>
                                                 <option value="SI">SI</option>
                                                 <Option value="NO">NO</Option>
                                            </select>
                                        </div>
                                      </div>

                                         <!--Inicio combobox eliminar -->
                                        <div class="col-sm-12">
                                        <div class="form-group">
                                          <label for="txtcodigo_persona">Eliminar</label>
                                            <select class="form-control" name="ediEliminar" id="editar_descripcion">
                                                 <option hidden value="<?php echo $var7?>"> <?php echo $var7 ?></option>
                                                 <option value="SI">SI</option>
                                                 <Option value="NO">NO</Option>
                                            </select>
                                        </div>
                                      </div>
                                        <!--Inicio combobox Actualizar-->
                                      <div class="col-sm-12">
                                        <div class="form-group">
                                          <label for="txtcodigo_persona">Actualizar</label>
                                            <select class="form-control" name="ediActualizar" id="editar_descripcion">
                                                 <option hidden value="<?php echo $var8?>"> <?php echo $var8 ?></option>
                                                 <option value="SI">SI</option>
                                                 <Option value="NO">NO</Option>
                                            </select>
                                        </div>
                                      </div>

                                       <!--Inicio combobox Actualizar-->
                                       <div class="col-sm-12">
                                        <div class="form-group">
                                          <label for="txtcodigo_persona">Mostrar</label>
                                            <select class="form-control" name="ediMostrar" id="editar_descripcion">
                                                 <option hidden value="<?php echo $var8?>"> <?php echo $var8 ?></option>
                                                 <option value="SI">SI</option>
                                                 <Option value="NO">NO</Option>
                                            </select>
                                        </div>

                                    </div> <!-- FIN DE EL PRIMER ROW --> 

            
                                  </div><!--FINAL DEL CARD BODY -->
                                 

                                  <div class="modal-footer ">
                                    <button type="button" name="ELI" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                                    <button type="submit"  name="editarPermiso" class="btn btn-success"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>      
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
                                    <input type="text" value ="<?php echo $var1; ?>" hidden class="form-control" name="eliminarPermiso" id="rol_eliminar">
                                    <h4 class="text-center">¿Esta seguro de eliminar los permisos al rol <?php echo $var4; ?>?</h4>
                                </div> <!--fin el card body -->
                                    <div class="modal-footer ">
                                      <button type="button" name="cerrar" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                                      <button type="submit"  name="ELIMINAR_PERMISO" id="ELIMINAR_PERMISO"  class="btn btn-primary">Si,eliminar</button>      
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


  <!-------------------------------------------------------------------
                      ||  INICIO MODAL DIALOG INSERTAR PERMISOS ||
  --------------------------------------------------------------------->

  <!--INICIO DEL MODAL DE AGREGAR UN PERMISO -->
  <div id="agregar_permisos" class="modal fade" role="dialog">
       <div class="modal-dialog modal-md">

            <?php
            include "conexion1.php";
            $queryd = "CALL Sp_mostrar_roles_activos()";
            $resultadod=$conn->query($queryd);   

            ?>
            <?php
            include "conexion1.php";
            $queryr = "SELECT o.CODIGO_OBJETO , o.NOMBRE AS Nom_modulo
                        FROM tbl_objetos o;";
            $resultador=$conn->query($queryr);
            ?>  


           <div class="modal-content"><!-- Modal content-->
                <form id="FORMEDITRAPERSONAS" method="POST" class="needs-validation" novalidate>
                    <div class="modal-header" style="background-color: #0CCDE3">
                        <h4 class="text-center">Agregar Permisos</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body"><!--CUERPO DEL MODAL -->
                        <div class="row"><!-- INICIO PRIMERA ROW -->  
                            <div class="col-sm-12">
                                 <!--INICIO COMOBOX TIPO DE ROL-->
                                <div class="form-group">
                                    <label for="txtcodigo_persona">Rol:</label>
                                    <select class="form-control" name="PERUSUARIO" required="">
                                        <option selected disabled value="">Seleccionar rol...</option>
                                        <?php 
                                        if ($resultadod->num_rows > 0) {
                                        while($rowt = $resultadod->fetch_assoc()) { ?>
                                        <option value="<?php echo $rowt['CODIGO_TIPO_ROL'];?>"><?php echo $rowt['NOMBRE']; ?></option>
                                      <?php } 
                                              }?>
                                    </select>
                                             <div class="invalid-feedback">
                                                Eliga una opción.
                                             </div>
                                </div>
                            </div> <!--FIN DEL COMOBOX TIPO DE ROL-->

                                 <!--INICIO COMOBOX OBJETO-->
                                
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="txtcodigo_persona">Modulo:</label>
                                    <select class="form-control" name="MODUSUARIO" required="">
                                        <option selected disabled value="">Seleccionar modulo...</option>
                                                <?php 
                                                  if ($resultador->num_rows > 0) {
                                                    while($rowr = $resultador->fetch_assoc()) { ?>
                                        <option value="<?php echo $rowr['CODIGO_OBJETO'];?>"><?php echo $rowr['Nom_modulo']; ?></option>
                                                <?php } 
                                                      }?>
                                      </select>
                                             <div class="invalid-feedback">
                                                Eliga una opción.
                                             </div>
                                </div>
                            </div> <!--FINAL COMOBOX OBJETO-->
                            
                        
                            <div class="col-sm-12">
                                 <!--INICIO COMOBOX INSERTAR-->
                                <div class="form-group">
                                    <label for="txtcodigo_persona">Insertar:</label>
                                    <select class="form-control" name="INSERTAR" required>
                                        <option selected disabled value="">Seleccionar...</option>
                                        <option value="SI">SI</option>
                                        <option value="NO">NO</option>
                                    </select>
                                </div>
                            </div> <!--FIN DEL COMOBOX INSERTAR-->

                                 <!--INICIO COMBOBOX ELMIMIAR-->
                                
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="txtcodigo_persona">Eliminar:</label>
                                    <select class="form-control"name="ELIMINAR" required="">
                                    <option selected disabled value="">Seleccionar...</option>

                                        <option value="SI">SI</option>
                                        <option value="NO">NO</option>
                                    </select>
                                </div>
                            </div> <!--FINAL COMOBOX ELIMINAR-->

                            <!--INICIO COMBOBOX ACTUALIZAR -->
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="txtcodigo_persona">Modificar:</label>
                                    <select class="form-control"name="ACTUALIZAR" required="">
                                    <option selected disabled value="">Seleccionar...</option>
                                        <option value="SI">SI</option>
                                        <option value="NO">NO</option>
                                    </select>
                                </div>
                            </div> <!--FINAL COMOBOX MODIFICAR-->
                             <!--INICIO COMBOBOX MOSTRAR -->
                             <div class="col-sm-12">
                            <label>Mostrar</label>
                                <div class="input-group">
                                <span class="input-group-append"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></span>
                                  <select class="form-control" name="MOSTRAR" required="">
                                  <option selected disabled value="">Seleccionar...</option>
                                    <option value="SI">SI</option>
                                    <option value="NO">NO</option>
                                  </select>
                                </div>
                            </div><!--FINAL COMOBOX MOSTRAR-->
                         
                        </div> <!-- FIN DE LA PRIMERA ROW --> 
                    </div><!--FINAL DEL CARD BODY -->   
                        <div class="modal-footer ">
                            <button type="submit" name="guardarpermisos" class="btn btn-success"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button> 
                            <button type="button" name="ELI" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                        </div><!--FIN DEL DIV DE BOTONES DE GUARDAR -->
                   
                </div>
            </form>
      </div>
   </div><!-- FIN DEL MODAL AGREGAR NUEVO ROL --> 
</div>
  <!-- Button trigger modal -->


<!-- Modal -->

<script type="text/javascript"> 
   //funcion de mostrar el estilo de la datatable
  $(document).ready( function () {
      $('#tabla_permisos').DataTable({

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
        "search": "Buscar permiso:",
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


<script>
    function Descargar() {
      window.open('Reportes_Prosecar/reportePermisos.php','_blank');
      window.open(this.href,'_self');
    } 
  </script>

