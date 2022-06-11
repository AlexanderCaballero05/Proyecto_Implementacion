<?php
include_once "conexion.php";
include_once "conexion3.php";


$codigoObjeto = 17;
$accion = 'INGRESO A LA PANTALLA MANTENIMIENTO TIPO SOCIOECONÓMICO';
$descripcion = 'SE AUTENTIFICO';
bitacora($codigoObjeto, $accion, $descripcion);
?>


<head>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="../vistas/assets/plugins/jquery/jquery.min.js"></script>
</head>
<!--INICIO DEL MODAL DE Agregar -->

<div class="modal fade" id="ADDOBJETO"  role="dialog" >
    <div class="modal-dialog modal-md">
    <body oncopy="return false" onpaste="return false" >
        <div class="modal-content">
          <div class="modal-header" style="background-color: #0CCDE3">
             <h4 class="text-center">Agregar Tipo Socioeconómico</h4>
             <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <form method="POST" class="needs-validation" novalidate>
                <div class="modal-body">
                    <!--CUERPO DEL MODAL -->
                    <div class="row">
                        <!-- INICIO PRIMERA ROW -->
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label>Nombre tipo Socioeconómico</label>
                                <input type="text" required class="form-control"  autocomplete = "off"maxlength="50" minlength="5"  onkeyup="mayus(this);" autocomplete="off" type="text"  onkeypress="return soloLetras(event);"
                                 name="guardar_tipo" id="guardar_tipo">
                                <div class="invalid-feedback">
                                    Campo obligatorio.
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label>Descripción</label>
                                <textarea type="text" required class="form-control" maxlength="100" minlength="5" onkeyup="mayus(this);" autocomplete="off" type="text" onkeypress="return soloLetras(event);"
                                 name="guardar_descripcion"autocomplete = "off" id="guardar_descripcion"></textarea>
                                <div class="invalid-feedback">
                                    Campo obligatorio.
                               </div>
                            </div>
                        </div>
                    </div> <!-- FIN DE EL PRIMER ROW -->


                </div>
                <!--FINAL DEL CARD BODY -->
                <div class="modal-footer ">
                    <button type="button" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                    <button type="submit" name="guardar_tipo_socio"  id = "guardar_tipo_socio" class="btn btn-success"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>
                </div>
                <!--FIN DEL DIV DE BOTONES DE GUARDAR -->
            </form>
        </div>
    </div>
</div><!-- FIN DEL MODAL AGREGAR -->

<body oncopy="return false" onpaste="return false" >
<div class="content-wrapper">
    <div class="content-header">
        <div class="container-fluid">
        </div><!-- /.container-fluid -->
    </div>
    <div class="content-header text-xl-center mb-3">
      <h4>Mantenimiento Tipo Socioeconómico </h4>
    </div>
    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <!-- Codigo de permiso de insertar -->
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
                                $evaluar_permiso->execute(array($usuariomo, '17'));
                                $row1=$evaluar_permiso->fetchColumn();
                                $permiso_registrar =$row1;             
                            }
                            ?> <!-- fin del codigo para sustraer el permiso de insertar.-->

                 
                     <?php 
                      if($permiso_registrar == 'SI'){
                     ?>
                    <button type="button" style="color:white;"class="btn btn-primary mb-3" data-toggle="modal" data-target="#ADDOBJETO">
                    <span> <i class="nav-icon fa fa-plus-square mx-1"></i></span>Agregar
                        Tipo Socioeconomico
                    </button>
                    <?php 
                      }
                     ?>
                        <button  onclick="Descargar()" data-toggle="modal"  href="" type='button' id="btnGuardar"  style="color:white; background-color:#FA0079"class="btn btn-danger mb-3"> <span><i class="nav-icon fa fa-file-pdf mx-1"></i></span>Generar Reporte</button>
                   
                    <!-- jquery validation -->
                    <div class="card card-primary">
                        <div class="card-header text-center" style="background-color: #0CCDE3">
                            <!-- TITULO ENCABEZADO DATOS PERSONALES -->
                            <!-- <h1 class=" card-title text-center"><strong style="color:black;">Tipo Socio Economico</strong></h1> -->
                        </div>

                        <!-- form start -->
                        <div class="card-body">
                            <div class="table-responsive">
                                <table id="tabla_tiposocio" class="table table-bordered table-striped">
                                    <thead>
                                        <tr>
                                            <th class="text-center">Acción</th>
                                            <th class="text-center">ID</th>
                                            <th class="text-center"> Nombre Tipo Socioeconómico</th>
                                            <th class="text-center">Descripción</th>
                            
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php
                                        $query = "SELECT * from tbl_tipo_socioeconomico";
                                        $result = $conn->query($query);
                                        if ($result->num_rows > 0) {
                                            while ($row = $result->fetch_assoc()) {
                                                $var1 = $row['CODIGO_TIPOSOCIO'];
                                                $var3 = $row['TIPO'];
                                                $var4 = $row['DESCRIPCION'];
                                        ?>
                                                <tr>
                                                    <td>
                                                        <div class="text-center">
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
                                                                    $evaluar_permiso_eliminar->execute(array($usuariomo, '17'));
                                                                    $row1=$evaluar_permiso_eliminar->fetchColumn();
                                                                    $permiso_eliminar =$row1; 
                                                                }
                                                                ?>  <!-- fin del codigo para sustraer el permiso de eliminar-->
                                                                <?php 
                                                                if($permiso_eliminar == 'SI'){
                                                                ?>
                                                                <a href="#ELIMINAR<?php echo $var1; ?>" data-toggle="modal">
                                                                    <button id="eliminar_tipo" name="eliminar_tipo" type='button' class="btn btn-danger" data-dismiss="modal"><i class="nav-icon fas fa-trash"></i>
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
                                                                        $evaluar_permiso_actualizar->execute(array($usuariomo, '17'));
                                                                        $row1=$evaluar_permiso_actualizar->fetchColumn();
                                                                        $permiso_actualizar =$row1; 
                                                                    
                                                                    }
                                                                    ?>  <!-- fin del codigo para sustraer el permiso de actualizar-->
                                                                     <?php 
                                                                    if($permiso_actualizar == 'SI'){
                                                                    ?>
                                                                <a href="#editar_tipo<?php echo $var1; ?>" data-toggle="modal">
                                                                    <button type='button' style="color:white;" class="btn btn-warning"><span>
                                                                            <i class="nav-icon fas fa-edit mx-1"></i></span></button>
                                                                </a>
                                                                    <?php 
                                                                        }
                                                                        ?>
                                                            </div>
                                                        </div><!-- final del text-center -->
                                                    </td>
                                                    <td class="text-center"><?php echo $var1; ?></td>
                                                    <td class="text-center"><?php echo $var3; ?></td>
                                                    <td class="text-center"><?php echo $var4; ?></td>
                                

                                                    <!--INICIO DEL MODAL DE EDITAR -->
                                                    <div id="editar_tipo<?php echo $var1; ?>" class="modal fade" role="dialog">
                                                        <div class="modal-dialog modal-md">
                                                            <div class="modal-content">
                                                               <div class="modal-header" style="background-color: #0CCDE3">
                                                                  <h4 class="text-center">Editar Tipo Socioeconómico</h4>
                                                                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                </div>
                                                                <form method="POST">
                                                                    <div class="modal-body">
                                                                        <!--CUERPO DEL MODAL -->
                                                                        <div class="row">
                                                                            <!-- INICIO PRIMERA ROW -->
                                                                            <input type="text" value="<?php echo $var1; ?>" hidden class="form-control"
                                                                                 name="cod_edit_tipo" id="cod_edit_tipo" >
                                                                            <div class="col-sm-12">
                                                                                <div class="form-group">
                                                                                    <label for="txtcodigo_persona">
                                                                                     Nombre Tipo Socioeconómico </label>
                                                                                    <input type="text" value="<?php echo $var3; ?>" required autocomplete = "off" class="form-control" maxlength="50" minlength="5" onkeyup="mayus(this);" autocomplete="off" type="text" onkeypress="return soloLetras(event);" 
                                                                                    name="edit_tipo_socio" id="edit_tipo_socio">
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-sm-12">
                                                                                <div class="form-group">
                                                                                    <label for="txtcodigo_persona">
                                                                                        Descripción</label>
                                                                                    <textarea type="text" required autocomplete = "off"class="form-control" maxlength="100" minlength="5"  onkeyup="mayus(this);" autocomplete="off" type="text" 
                                                                                     name="edit_descripcion" id="edit_descripcion"><?php echo $var4; ?></textarea>
                                                                                </div>
                                                                            </div>
                                                                        </div> <!-- FIN DE EL PRIMER ROW -->
                                                                    </div>
                                                                    <!--FINAL DEL CARD BODY -->
                                                                    <div class="modal-footer ">
                                                                        <button type="button" name="ELI" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                                                                        <button type="submit"  name="edit_tipo"  id="edit_tipo" class="btn btn-success"><span>
                                                                                <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>
                                                                    </div>
                                                                    <!--FIN DEL DIV DE BOTONES DE GUARDAR -->
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div><!-- FIN DEL MODAL EDITAR -->

                                                    <!-- inicio modal eliminar  -->   
                                                    <div id="ELIMINAR<?php echo $var1 ?>"  
                                                    name="eliminar_tipo_socio" id="eliminar_tipo_socio"class="modal fade" role="dialog">
                                                    <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalLabel"></h5>
                                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                        </div>
                                                        <form id="FORMEeliminar" method="POST">
                                                        <div class="modal-body">
                                                            <input type="text" value ="<?php echo $var1; ?>" hidden class="form-control" name="eliminar_tipo_socio" id="eliminar_tipo_socio">
                                                            <h4 class="text-center">¿Esta seguro de eliminar este tipo socioeconomico <?php echo $var3; ?>?</h4>
                                                        </div> <!--fin el card body -->
                                                            <div class="modal-footer ">

                                                            <button type="button" name="cerrar" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                                                            <button type="submit"  
                                                            name="eliminar_tipo" id="eliminar_tipo"  class="btn btn-primary">Si,eliminar</button>      
                                                            </div><!--FIN DEL DIV DE BOTONES DE GUARDAR -->
                                                    </form>
                                                    </div><!--fin del modal contener -->
                                                    </div><!--fin del modal dialog -->
                                                </div><!--fin del modal de eliminar -->
                                                    <!--fin del modal de eliminar -->
                                                </tr>
                                        <?php
                                            }
                                        }
                                        ?>
                                    </tbody>
                                </table>
                            </div>
                            <!--fin del div de responsivi -->
                        </div> <!-- /.card-body -->

                    </div><!-- fINAL DEL card PRIMARY -->
                </div>
                <!--FINAL DE COL-M12-->
            </div><!-- FINAL ROW PADRE -->
        </div><!-- FINAL CONTAINER FLUID -->
    </section>

 <script>
    function Descargar() {
      window.open('Reportes_Prosecar/reportetiposocioeconomico.php','_blank');
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
   //funcion de mostrar el estilo de la datatable
  $(document).ready( function () {
      $('#tabla_tiposocio').DataTable({
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
        "search": "Buscar Tipo Socioeconomico:",
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
<!--*No me quiten los creditos modificado por any :( --> 