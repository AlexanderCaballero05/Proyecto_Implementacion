<?php
include_once "conexion.php";
include_once "conexion3.php";


$codigoObjeto = 1;
$accion = 'Ingreso a la pantalla de mantenimiento usuarios';
$descripcion = 'Ver los registros de los usuarios';
bitacora($codigoObjeto, $accion, $descripcion);
?>


<head>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="../vistas/assets/plugins/jquery/jquery.min.js"></script>
</head>
<!--INICIO DEL MODAL DE Agregar -->
<div class="modal fade" id="ADDOBJETO" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <!-- Modal content-->
            <form method="POST">

                <div class="modal-header" style="background-color: #0CCDE3">
                    <h4 class="text-center">Crear informacion
                        objetos</h4>

                </div>
                <div class="modal-body">
                    <!--CUERPO DEL MODAL -->
                    <div class="row">
                        <!-- INICIO PRIMERA ROW -->
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="txtcodigo_persona">
                                    Nombre</label>
                                <input type="text" class="form-control" maxlength="20" minlength="5" onKeyDown="sinespacio(this);" onkeyup="mayus(this);" autocomplete="off" type="text" onkeypress="return soloLetras(event);" name="nombre" id="nombre">
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="txtcodigo_persona">
                                    Descripcion</label>
                                <input type="text" class="form-control" maxlength="20" minlength="5" onKeyDown="sinespacio(this);" onkeyup="mayus(this);" autocomplete="off" type="text" onkeypress="return soloLetras(event);" name="descripcion" id="descripcion">
                            </div>
                        </div>
                    </div> <!-- FIN DE EL PRIMER ROW -->


                </div>
                <!--FINAL DEL CARD BODY -->
                <div class="modal-footer ">
                    <button type="button" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                    <button type="submit" name="ADD_OBJETO" class="btn btn-success"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>
                </div>
                <!--FIN DEL DIV DE BOTONES DE GUARDAR -->

                <?php

                $nueva = new ControladorObjetos();
                $nueva->ctrIngresoObjeto();

                ?>
            </form>
        </div>
    </div>
</div><!-- FIN DEL MODAL AGREGAR -->


<div class="content-wrapper">
    <div class="content-header">
        <div class="container-fluid">
        </div><!-- /.container-fluid -->
    </div>

    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">


                    <button type="button" class="btn btn-warning m-2" style="color:white;" data-toggle="modal" data-target="#ADDOBJETO">
                        Nueva
                        Objeto
                    </button>

                    <!-- jquery validation -->
                    <div class="card card-primary">
                        <div class="card-header text-center" style="background-color: #0CCDE3">
                            <!-- TITULO ENCABEZADO DATOS PERSONALES -->
                            <h1 class=" card-title text-center"><strong style="color:black;">Personas</strong></h1>
                        </div>

                        <!-- form start -->
                        <div class="card-body">
                            <div class="table-responsive">
                                <table id="example1" class="table table-bordered table-striped">
                                    <thead>
                                        <tr>
                                            <th>Acción</th>
                                            <th>ID</th>
                                            <th>Nombre</th>
                                            <th>Descripcion</th>
                                            <th>Creado por</th>
                                            <th>Fecha creacion</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php
                                        $query = "SELECT * FROM tbl_objetos";
                                        $result = $conn->query($query);
                                        if ($result->num_rows > 0) {
                                            while ($row = $result->fetch_assoc()) {
                                                $var1 = $row['CODIGO_OBJETO'];
                                                $var3 = $row['NOMBRE'];
                                                $var4 = $row['DESCRIPCION'];
                                                $var5 = $row['CREADO_POR_USUARIO'];
                                                $var6 = $row['FECHA_CREACION'];
                                                $var7 = $row['MODIFICADO_POR'];
                                                $var8 = $row['FECHA_MODIFICACION'];


                                        ?>
                                                <tr>
                                                    <td>
                                                        <div class="text-center">
                                                            <div class="btn-group">

                                                                <a href="#ELIMINAR<?php echo $var1; ?>" data-toggle="modal">
                                                                    <button id="ELIMINAR_USUARIO" name="ELIMINAR_USUARIO" type='button' class="btn btn-danger" data-dismiss="modal"><i class="nav-icon fas fa-trash"></i>
                                                                    </button>
                                                                </a>
                                                                <a href="#EDITAROBJETO<?php echo $var1; ?>" data-toggle="modal">
                                                                    <button type='button' style="color:white;" class="btn btn-warning"><span>
                                                                            <i class="nav-icon fas fa-edit mx-1"></i></span></button>
                                                                </a>
                                                            </div>
                                                        </div><!-- final del text-center -->
                                                    </td>
                                                    <td class="text-center"><?php echo $var1; ?></td>
                                                    <td class="text-center"><?php echo $var3; ?></td>
                                                    <td class="text-center"><?php echo $var4; ?></td>
                                                    <td class="text-center"><?php echo $var5; ?></td>
                                                    <td class="text-center"><?php echo $var6; ?></td>




                                                    <!--INICIO DEL MODAL DE EDITAR -->
                                                    <div id="EDITAROBJETO<?php echo $var1; ?>" class="modal fade" role="dialog">
                                                        <div class="modal-dialog modal-lg">
                                                            <div class="modal-content">
                                                                <!-- Modal content-->
                                                                <form method="POST">
                                                                    <div class="modal-header" style="background-color: #0CCDE3">
                                                                        <h4 class="text-center">Editar informacion objetos
                                                                        </h4>
                                                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                    </div>
                                                                    <div class="modal-body">
                                                                        <!--CUERPO DEL MODAL -->
                                                                        <div class="row">
                                                                            <!-- INICIO PRIMERA ROW -->
                                                                            <input type="text" value="<?php echo $var1; ?>" hidden class="form-control" name="cod_objeto" id="cod_objeto">
                                                                            <div class="col-sm-6">
                                                                                <div class="form-group">
                                                                                    <label for="txtcodigo_persona">
                                                                                        Nombre</label>
                                                                                    <input type="text" value="<?php echo $var3; ?>" class="form-control" maxlength="20" minlength="5" onKeyDown="sinespacio(this);" onkeyup="mayus(this);" autocomplete="off" type="text" onkeypress="return soloLetras(event);" name="nombre" id="nombre">
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-sm-6">
                                                                                <div class="form-group">
                                                                                    <label for="txtcodigo_persona">
                                                                                        Descripcion</label>
                                                                                    <input type="text" value="<?php echo $var4; ?>" class="form-control" maxlength="20" minlength="5" onKeyDown="sinespacio(this);" onkeyup="mayus(this);" autocomplete="off" type="text" onkeypress="return soloLetras(event);" name="descripcion" id="descripcion">
                                                                                </div>
                                                                            </div>


                                                                        </div> <!-- FIN DE EL PRIMER ROW -->



                                                                    </div>
                                                                    <!--FINAL DEL CARD BODY -->
                                                                    <div class="modal-footer ">
                                                                        <button type="button" name="ELI" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                                                                        <button type="submit"  name="EDIT_OBJETO" class="btn btn-success"><span>
                                                                                <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>
                                                                    </div>
                                                                    <!--FIN DEL DIV DE BOTONES DE GUARDAR -->
                                                                    <?php

                                                                    $edit = new ControladorObjetos();
                                                                    $edit->ctrEditarObjeto();

                                                                    ?>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div><!-- FIN DEL MODAL EDITAR -->


                                                    <div id="ELIMINAR<?php echo $var1 ?>" name="div_eliminar" id="div_eliminar" class="modal fade" role="dialog">
                                                        <div class="modal-dialog">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <h5 class="modal-title" id="exampleModalLabel"></h5>
                                                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                </div>
                                                                <form id="FORMEeliminar" method="POST">
                                                                    <div class="modal-body">
                                                                        <input type="text" value="<?php echo $var1; ?>" hidden class="form-control" name="cod_objeto">
                                                                        <h4 class="text-center">¿Esta seguro de eliminar el
                                                                            objeto <?php echo $var1; ?>?
                                                                        </h4>
                                                                    </div>
                                                                    <!--fin el card body -->
                                                                    <div class="modal-footer ">
                                                                        <button type="button" name="cerrar" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                                                                        <button type="submit" name="ELIMINAR_OBJETO" id="ELIMINAR" class="btn btn-primary">Si,eliminar</button>
                                                                    </div>
                                                                    <!--FIN DEL DIV DE BOTONES DE GUARDAR -->
                                                                    <?php

                                                                    $per_elimina = new ControladorObjetos();
                                                                    $per_elimina->ctrEliminarObjeto();

                                                                    ?>

                                                                </form>
                                                            </div>
                                                            <!--fin del modal contener -->
                                                        </div>
                                                        <!--fin del modal dialog -->
                                                    </div>
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
    //funcion para quitar espacios
    function quitarespacios(e) {
        var cadena = e.value;
        cadena = cadena.trim();
        e.value = cadena;
    };
    //funcion para poner mayusculas
    function mayus(e) {
        e.value = e.value.toUpperCase();
    }
    //funcion sin espacios 
    function sinespacio(e) {
        var cadena = e.value;
        var limpia = "";
        var parts = cadena.split(" ");
        var length = parts.length;
        for (var i = 0; i < length; i++) {
            nuevacadena = parts[i];
            subcadena = nuevacadena.trim();
            if (subcadena != "") {
                limpia += subcadena + " ";
            }
        }
        limpia = limpia.trim();
        e.value = limpia;
    };
    //otra funcion para quitar espacios :V
    function quitarespacios(e) {
        var cadena = e.value;
        cadena = cadena.trim();
        e.value = cadena;
    };
</script>

<!--♠DianaRut *No me quiten los creditos :( -->