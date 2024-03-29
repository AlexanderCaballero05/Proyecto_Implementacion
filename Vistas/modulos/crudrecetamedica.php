<?php
include_once "conexion.php";
include_once "conexion3.php";


$codigoObjeto = 25;
$accion = 'Ingreso a la pantalla de mantenimiento de especialidad  ';
$descripcion = 'Ver los registros de especialidad';
bitacora($codigoObjeto, $accion, $descripcion);
?>


<head>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="../vistas/assets/plugins/jquery/jquery.min.js"></script>
</head>



<div class="content-wrapper">
    <div class="content-header">
        <div class="container-fluid">
        </div><!-- /.container-fluid -->
    </div>

    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                   
                    <!-- jquery validation -->
                    <div class="card card-primary">
                        <div class="card-header text-center" style="background-color: #0CCDE3">
                            <!-- TITULO ENCABEZADO DATOS PERSONALES -->
                            <h1 class=" card-title text-center"><strong style="color:black;">Recetas Medicas </strong></h1>
                        </div>

                        <!-- form start -->
                        <div class="card-body">
                            <div class="table-responsive">
                                <table id="tbl_medicamentos" class="table table-bordered table-striped">
                                    <thead>
                                        <tr>
                                        <th>EDITAR</th>
                                        <th>NOMBRE PACIENTE</th>
                                        <th>NOMBRE MEDICAMENTO</th>
                                        <th>INDICACIONES RECETA</th>
                                        <th>OBSERVACIONES</th>
                                        <th>FECHA RECETA</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php
                                        $query = "SELECT CONCAT_WS (' ','DNI',DNI,PRIMER_NOMBRE, ' ',SEGUNDO_NOMBRE,' ',PRIMER_APELLIDO) AS NOMBRE, tm.NOMBRE_MEDICAMENTO, trm.INDICACIONES_RECETA, trm.OBSERVACIONES, trm.FECHA_RECETA from tbl_receta_medica trm 
                                        left join tbl_medicamento tm  on  trm.CODIGO_MEDICAMENTO  = tm.CODIGO_MEDICAMENTO 
                                        left join tbl_consulta_medica tcm  on tcm.CODIGO_CONSULTA = trm.CODIGO_CONSULTA
                                        left join tbl_inscripcion_cita tic on tcm.CODIGO_CITA = tic.CODIGO_CITA 
                                        left join tbl_persona tp  on tp.CODIGO_PERSONA  = tic.CODIGO_PERSONA";
                                        $result = $conn->query($query);
                                        if ($result->num_rows > 0) {
                                            while ($row = $result->fetch_assoc()) {
                                                $var1 = $row['NOMBRE'];
                                                $var2 = $row['NOMBRE_MEDICAMENTO'];
                                                $var3 = $row['INDICACIONES_RECETA'];
                                                $var4 = $row['OBSERVACIONES'];
                                                $var5 = $row['FECHA_RECETA']; 
                                                
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
                                                                    $evaluar_permiso_eliminar->execute(array($usuariomo, '1'));
                                                                    $row1=$evaluar_permiso_eliminar->fetchColumn();
                                                                    $permiso_eliminar =$row1; 
                                                                }
                                                                ?>  <!-- fin del codigo para sustraer el permiso de eliminar-->
                                                                <?php 
                                                                if($permiso_eliminar= 'ON'){
                                                                ?>
                                                                <a href="#ELIMINAR<?php echo $var1; ?>" data-toggle="modal">
                                                                    <button id="eliminar_medic" name="eliminar_medic" type='button' class="btn btn-danger" data-dismiss="modal"><i class="nav-icon fas fa-trash"></i>
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
                                                                        $evaluar_permiso_actualizar->execute(array($usuariomo, '1'));
                                                                        $row1=$evaluar_permiso_actualizar->fetchColumn();
                                                                        $permiso_actualizar =$row1; 
                                                                    
                                                                    }
                                                                    ?>  <!-- fin del codigo para sustraer el permiso de actualizar-->
                                                                     <?php 
                                                                    if($permiso_actualizar= 'ON'){
                                                                    ?>
                                                                <a href="#editar_medicamento<?php echo $var1; ?>" data-toggle="modal">
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
                                                    <td class="text-center"><?php echo $var2; ?></td>
                                                    <td class="text-center"><?php echo $var3; ?></td>
                                                    <td class="text-center"><?php echo $var4; ?></td>
                                                    <td class="text-center"><?php echo $var5; ?></td>
                                                  
                          
                                                    <!--INICIO DEL MODAL DE EDITAR -->
                                                    <div id="editar_medicamento<?php echo $var1; ?>" class="modal fade" role="dialog">
                                                        <div class="modal-dialog modal-lg">
                                                            <div class="modal-content">
                                                                <!-- Modal content-->
                                                                <form method="POST">
                                                                    <div class="modal-header" style="background-color: #0CCDE3">
                                                                        <h4 class="text-center">Editar informacion de Medicamentos
                                                                        </h4>
                                                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                    </div>
                                                                    <div class="modal-body">
                                                                        <!--CUERPO DEL MODAL -->
                                                                        <div class="row">
                                                                            <!-- INICIO PRIMERA ROW -->
                                                                            <input type="text" value="<?php echo $var1; ?>" hidden class="form-control"
                                                                                 name="cod_edit_med" id="cod_edit_med" >
                                                                                 
                                                                            <div class="col-sm-6">
                                                                                <div class="form-group">
                                                                                    <label for="txtcodigo_persona">
                                                                                    Codigo del Medicamento</label>
                                                                                    <input type="text" value="<?php echo $var1; ?>" class="form-control" maxlength="10"  autocomplete="off" type="text"  onkeypress="return solonumero(event)" ; 
                                                                                    name="edit_cod_medi" id="edit_codd_medi">
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-sm-6">
                                                                                <div class="form-group">
                                                                                    <label for="txtcodigo_persona">
                                                                                    Nombre del Medicamento</label>
                                                                                    <input type="text" value="<?php echo $var2; ?>" class="form-control" maxlength="50" minlength="5"  onkeyup="mayus(this);" autocomplete="off" type="text" onkeypress="return soloLetras(event);" 
                                                                                    name="edit_nom_medi" id="edit_nom_medi">
                                                                                </div>
                                                                            </div>
                                                                        </div> <!-- FIN DE EL PRIMER ROW -->
                                                                          <div class="col-sm-6">
                                                                                <div class="form-group">
                                                                                    <label for="txtcodigo_persona">
                                                                                        Descripcion del Medicamento</label>
                                                                                    <input type="text" value="<?php echo $var3; ?>" class="form-control" maxlength="100" minlength="5"  onkeyup="mayus(this);" autocomplete="off" type="text" onkeypress="return soloLetras(event);"
                                                                                     name="edit_desc_medi" id="edit_desc_medi">
                                                                                </div>
                                                                            </div>
                                                                    </div>
                                                                    <!--FINAL DEL CARD BODY -->
                                                                    <div class="modal-footer ">
                                                                        <button type="button" name="ELI" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                                                                        <button type="submit"  name="guardar_med"  id="guardar_med" class="btn btn-success"><span><i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>
                                                                    </div>
                                                                    <!--FIN DEL DIV DE BOTONES DE GUARDAR -->
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div><!-- FIN DEL MODAL EDITAR -->

                                                    <!-- inicio modal eliminar  -->   
                                                    <div id="ELIMINAR<?php echo $var1 ?>"  
                                                    name="eliminar_medicamento" id="eliminar_medicamento"class="modal fade" role="dialog">
                                                    <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalLabel"></h5>
                                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                        </div>
                                                        <form id="FORMEeliminar" method="POST">
                                                        <div class="modal-body">
                                                            <input type="text" value ="<?php echo $var1; ?>" hidden class="form-control" name="eliminar_medicamento" id="eliminar_medicamento">
                                                            <h4 class="text-center">¿Esta seguro de eliminar este campo? <?php echo $var2; ?>?</h4>
                                                        </div> <!--fin el card body -->
                                                            <div class="modal-footer ">

                                                            <button type="button" name="cerrar" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                                                            <button type="submit"  
                                                            name="eliminar_medica" id="eliminar_medica"  class="btn btn-primary">Si,eliminar</button>      
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
    </section><!-- FINAL SECTION -->

    <!-- Button trigger modal -->


    <!-- Modal -->






</div><!-- /.content-wrapper -->
<aside class="control-sidebar control-sidebar-dark">
    <!-- Control Sidebar -->
</aside>
<!-- /.control-sidebar -->
</div>
</div><!-- /.content-wrapper -->
<aside class="control-sidebar control-sidebar-dark">
    <!-- Control Sidebar -->
</aside>
</div><!-- ./wrapper -->













<script type="text/javascript">
    $(function() {
        $("#ESTADOUSUARIO").change(function() {
            if ($(this).val() === "4") {
                document.getElementById('CONUSUARIO').disable = true;

            } else {
                document.getElementById('CONUSUARIO').disable = false;

            }
        });
    }); //este codigo si me costo 
</script>



<script type="text/javascript">
    //funcion de mostrar el estilo de la datatable
    $(function() {
        $("#cbx_persona").change(function() {
            if ($(this).val() === "2") {
                document.getElementById("c").style.display = "block";
            } else {
                document.getElementById("c").style.display = "none";
            }
        });
    });
</script>


<!-- funciones del sistema -->
<script>
    function soloLetras(e) {
        key = e.keyCode || e.which;
        tecla = String.fromCharCode(key).toLowerCase();
        letras = " áéíóúabcdefghijklmnñopqrstuvwxyz";
        especiales = ["8-37-39-46"];
        tecla_especial = false
        for (var i in especiales) {
            if (key == especiales[i]) {
                tecla_especial = true;
                break;
            }
        }
        if (letras.indexOf(tecla) == -1 && !tecla_especial) {
            return false;
        }
    }
    //funcion para solu numeros ingresar en el campo
    function soloNumeros_tel(e) {
        var teclaPulsada = window.event ? window.event.keyCode : e.which;
        // capturamos el contenido del input
        var valor = document.getElementById("tele").value;
        if (valor.length < 9) {
            if (teclaPulsada == 9) {
                return true;
            }
            // devolvemos true o false dependiendo de si es numerico o no
            return /\d/.test(String.fromCharCode(teclaPulsada));
        } else {
            return false;
        }
    }
    
    
    //funcion para poner mayusculas
    function mayus(e) {
        e.value = e.value.toUpperCase();
    }
   
    
   
</script>

<script type="text/javascript"> 
   //funcion de mostrar el estilo de la datatable
  $(document).ready( function () {
      $('#tbl_medicamentos').DataTable({
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
        "search": "Buscar Receta Medica:",
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
