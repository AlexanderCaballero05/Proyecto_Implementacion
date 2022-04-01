<?php
include_once "conexion.php";
include_once "conexion3.php";


      $codigoObjeto=14;
      $accion='Ingreso a la pantalla de mantenimiento usuarios';
      $descripcion= 'Ver los registros de los usuarios';
      bitacora($codigoObjeto, $accion,$descripcion);
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
                                $evaluar_permiso->execute(array($usuariomo, '1'));
                                $row1=$evaluar_permiso->fetchColumn();
                                $permiso_registrar =$row1;             
                            }
                            ?> <!-- fin del codigo para sustraer el permiso de insertar.-->
                          <?php 
                      if($permiso_registrar = 'ON'){
                     ?>    
                      <a href="categorias"> 
                    <button type="button" class="btn btn-warning m-2" style="color:white;" >
                        Nueva
                        persona
                    </button>
                    </a>
                    <?php 
                      }
                     ?> 
                    <!-- jquery validation -->
                    <div class="card card-primary">
                        <div class="card-header text-center" style="background-color: #0CCDE3">
                            <!-- TITULO ENCABEZADO DATOS PERSONALES -->
                            <h1 class=" card-title text-center"><strong style="color:black;">Personas</strong></h1>
                        </div>

                        <!-- form start -->
                        <div class="card-body">
                            <div class="table-responsive">
                                <table id="tbl_persona" class="table table-bordered table-striped">
                                    <thead>
                                        <tr>
                                        <th class="text-center">Acción</th>
                                        <th class="text-center">ID</th>
                                        <th class="text-center">Primer nombre</th>
                                        <th class="text-center">Segundo nombre</th>
                                        <th class="text-center">Primer Apellido</th>
                                        <th class="text-center">Segundo Apellido</th>
                                        <th class="text-center">Dni</th>
                                        <th class="text-center">Sexo</th>
                                        <th class="text-center">Fecha nacimiento</th>
                                        <th class="text-center">Lugar nacimiento</th>
                                        <th class="text-center">Dirección</th>
                                        <th class="text-center">Tipo de Persona</th>
                                        <th class="text-center">Telefono</th>
                                        <th class="text-center">Correo</th>
                                    
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php
                        $query = "SELECT tp.CODIGO_PERSONA, 
                        tp.PRIMER_NOMBRE , 
                        tp.SEGUNDO_NOMBRE, 
                        tp.PRIMER_APELLIDO,
                        tp.SEGUNDO_APELLIDO,
                        tp.DNI,
                        tp.FECHA_NACIMIENTO , 
                        tp.LUGAR_NACIMIENTO,
                         tp.DIRECCION,
                         tp.SEXO ,
                         tt.NUMERO_TELEFONO ,
                         ttp.NOMBRE , 
                         tce.correo_persona 
                         from tbl_persona tp  
                         left join   tbl_telefono tt  on tt.CODIGO_PERSONA =  tp.CODIGO_PERSONA   
                         left  join  tbl_tipo_persona ttp  on ttp.CODIGO_TIPO_PERSONA  =  tp.CODIGO_PERSONA  
                         left  join  tbl_correo_electronico tce  on tce.CODIGO_PERSONA   =  tp.CODIGO_PERSONA  
                          where tp.CODIGO_PERSONA  > 1;                        ";
                        $result = $conn->query($query);
                        if ($result->num_rows > 0) {
                          while($row = $result->fetch_assoc()) {
                            $var1 = $row['CODIGO_PERSONA'];
                            $var3 = $row['PRIMER_NOMBRE'];
                            $var4 = $row['SEGUNDO_NOMBRE'];
                            $var5 = $row['PRIMER_APELLIDO'];
                            $var6 = $row['SEGUNDO_APELLIDO'];
                            $var7 = $row['DNI'];
                            $var8 = $row['SEXO'];
                            $var9 = $row['FECHA_NACIMIENTO'];
                            $var10 = $row['LUGAR_NACIMIENTO'];
                            $var11 = $row['NOMBRE'];
                            $var13 = $row ['NUMERO_TELEFONO'];
                            $var14 = $row ['correo_persona'];
                            $var18 = $row['DIRECCION'];
                        ?>
                                        <tr>
                                            <td>
                                                <div class="text-center">
                                                    <div class="btn-group">

                                                        <a href="#ELIMINAR<?php echo $var1;?>" data-toggle="modal">
                                                            <button id="ELIMINAR_USUARIO" name="ELIMINAR_USUARIO"
                                                                type='button' class="btn btn-danger"
                                                                data-dismiss="modal"><i
                                                                    class="nav-icon fas fa-trash"></i>
                                                            </button>
                                                        </a>
                                                        <a href="#EDITARPERSONA<?php echo $var1; ?>"
                                                            data-toggle="modal">
                                                            <button type='button' style="color:white;"
                                                                class="btn btn-warning"><span>
                                                                    <i
                                                                        class="nav-icon fas fa-edit mx-1"></i></span></button>
                                                        </a>
                                                    </div>
                                                </div><!-- final del text-center -->
                                            </td>
                                            <td class="text-center"><?php echo $var1; ?></td>
                                            <td class="text-center"><?php echo $var3; ?></td>
                                            <td class="text-center"><?php echo $var4; ?></td>
                                            <td class="text-center"><?php echo $var5; ?></td>
                                            <td class="text-center"><?php echo $var6; ?></td>
                                            <td class="text-center"><?php echo $var7; ?></td>
                                            <td class="text-center"><?php echo $var8; ?></td>
                                            <td class="text-center"><?php echo $var9; ?></td>
                                            <td class="text-center"><?php echo $var10; ?></td>
                                            <td class="text-center"><?php echo $var18; ?></td>
                                            <td class="text-center"><?php echo $var11; ?></td>
                                            <td class="text-center"><?php echo $var13; ?></td>
                                            <td class="text-center"><?php echo $var14; ?></td>

                                            <!--INICIO DEL MODAL DE EDITAR -->
                                            <div id="EDITARPERSONA<?php echo $var1; ?>" class="modal fade"
                                                role="dialog">
                                                <div class="modal-dialog modal-lg">
                                                <div class="modal-content">
                                                        <!-- Modal content-->
                                                        <form method="POST">
                                                            <div class="modal-header" style="background-color: #0CCDE3">
                                                                <h4 class="text-center">Editar informacion persona
                                                                </h4>
                                                                <button type="button" class="close"
                                                                    data-dismiss="modal">&times;</button>
                                                            </div>
                                                            <div class="modal-body">
                                                                <!--CUERPO DEL MODAL -->
                                                                <div class="row">
                                                                    <!-- INICIO PRIMERA ROW -->

                                                                    <input type="text" value="<?php echo $var1; ?>"
                                                                        hidden class="form-control" name="cod_personaguardar"
                                                                        id="cod_personaguardar">
                                                                    <div class="col-sm-6">
                                                                        <div class="form-group">
                                                                            <label for="txtcodigo_persona">Primer
                                                                                nombre</label>
                                                                            <input type="text"
                                                                                value="<?php echo $var3; ?>"
                                                                                class="form-control" maxlength="20"
                                                                                minlength="5"
                                                                                onKeyDown="sinespacio(this);"
                                                                                onkeyup="mayus(this);"
                                                                                autocomplete="off" type="text"
                                                                                onkeypress="return soloLetras(event);"
                                                                                name="p_nombre" id="p_nombre">
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-sm-6">
                                                                        <div class="form-group">
                                                                            <label for="txtcodigo_persona">Segundo
                                                                                nombre</label>
                                                                            <input type="text"
                                                                                value="<?php echo $var4; ?>"
                                                                                class="form-control" maxlength="20"
                                                                                minlength="5"
                                                                                onKeyDown="sinespacio(this);"
                                                                                onkeyup="mayus(this);"
                                                                                autocomplete="off" type="text"
                                                                                onkeypress="return soloLetras(event);"
                                                                                name="s_nombre" id="s_nombre">
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-sm-6">
                                                                        <div class="form-group">
                                                                            <label for="txtcodigo_persona">Primer
                                                                                apellido</label>
                                                                            <input type="text"
                                                                                value="<?php echo $var5; ?>"
                                                                                class="form-control" maxlength="20"
                                                                                minlength="5"
                                                                                onKeyDown="sinespacio(this);"
                                                                                onkeyup="mayus(this);"
                                                                                autocomplete="off" type="text"
                                                                                onkeypress="return soloLetras(event);"
                                                                                name="p_apellido" id="p_apellido">
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-sm-6">
                                                                        <div class="form-group">
                                                                            <label for="txtcodigo_persona">Segundo
                                                                                apellido</label>
                                                                            <input type="text"
                                                                                value="<?php echo $var6; ?>"
                                                                                class="form-control" maxlength="20"
                                                                                minlength="5"
                                                                                onKeyDown="sinespacio(this);"
                                                                                onkeyup="mayus(this);"
                                                                                autocomplete="off" type="text"
                                                                                onkeypress="return soloLetras(event);"
                                                                                name="s_apellido" id="s_apellido">
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-sm-6">
                                                                        <div class="form-group">
                                                                            <label for="txtcodigo_persona">Dni</label>
                                                                            <input type="text"
                                                                                value="<?php echo $var7; ?>"
                                                                                class="form-control" maxlength="20"
                                                                                minlength="5"
                                                                                onKeyDown="sinespacio(this);"
                                                                                autocomplete="off" type="text"
                                                                                name="dni" id="dni">
                                                                        </div>
                                                                    </div>
                                    
                                                                    <div class="col-sm-6">
                                                                        <div class="form-group">
                                                                            <label for="txtcodigo_persona">Dirección</label>
                                                                            <input type="text"
                                                                             value="<?php echo $var18; ?>"
                                                                             class="form-control"  name="direccion" id="direccion"
                                                                              onkeyup="mayus(this);" autocomplete = "off"
                                                                               onkeypress="" placeholder="Ingrese Direccion" 
                                                                               required="" >
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-sm-6">
                                                                        <div class="form-group">
                                                                            <label for="txtcodigo_persona">Correo</label>
                                                                            <input type="text"
                                                                                value="<?php echo $var14; ?>"
                                                                                class="form-control" maxlength="25"
                                                                                minlength="5"
                                                                                onKeyDown="sinespacio(this);"
                                                                                onkeyup="mayus(this);"
                                                                                autocomplete="off" type="text"
                                                                                name="correo" id="correo">
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-sm-6">
                                                                        <div class="form-group">
                                                                            <label for="txtcodigo_persona">Telefono</label>
                                                                            <input type="text"
                                                                             value="<?php echo $var13; ?>"
                                                                             class="form-control" placeholder="99001100"
                                                                                onkeyup="mayus(this);" maxlength="20" 
                                                                                minlength="8"
                                                                                 onkeypress="return solonumero(event)"  
                                                                                 required onblur="quitarespacios(this);" 
                                                                                 onkeydown="sinespacio(this);" 
                                                                                 required=""
                                                                                name="telefono" id="telefono">
                                                                        </div>
                                                                    </div>
                                                                </div> <!-- FIN DE EL PRIMER ROW -->
                                                            </div>
                                                            <!--FINAL DEL CARD BODY -->
                                                            <div class="modal-footer ">
                                                                <button type="button" name="ELI" class="btn btn-danger"
                                                                    data-dismiss="modal"><span> <i
                                                                            class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
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
                                                                    ?>
                                                                   <!-- fin del codigo para sustraer el permiso de actualizar-->
                                                                   <?php 
                                                                    if($permiso_actualizar = 'ON'){
                                                                    ?>
                                                                <button type="submit" id="EDIT_PERSONA"
                                                                    name="EDIT_PERSONA" class="btn btn-success"><span>
                                                                <i
                                                                class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>
                                                                <?php 
                                                                }
                                                                ?> 
                                                            </div>
                                                            <!--FIN DEL DIV DE BOTONES DE GUARDAR -->
                                                          
                                                        </form>
                                                </div>
                                                </div>
                                            </div><!-- FIN DEL MODAL EDITAR -->

                                           <!-- FIN DEL MODAL ELIMINAR -->
                                            <div id="ELIMINAR<?php echo $var1 ?>" name="div_eliminar" id="div_eliminar"
                                              class="modal fade" role="dialog">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="exampleModalLabel"></h5>
                                                            <button type="button" class="close"
                                                                data-dismiss="modal">&times;</button>
                                                        </div>
                                                        <form id="FORMEeliminar" method="POST">
                                                            <div class="modal-body">
                                                                <input type="text" value="<?php echo $var1; ?>" hidden
                                                                    class="form-control" name="cod_personaeliminar"
                                                                    id="cod_personaeliminar">
                                                                <h4 class="text-center">¿Esta seguro de eliminar la 
                                                                    persona <?php echo $var3; ?>?
                                                                </h4>
                                                            </div>
                                                            <!--fin el card body -->
                                                            <div class="modal-footer ">
                                                                <button type="button" name="cerrar"
                                                                    class="btn btn-danger"
                                                                    data-dismiss="modal">Cancelar</button>
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
                                                                ?> 
                                                               <!-- fin del codigo para sustraer el permiso de eliminar-->
                                                               <?php 
                                                                if($permiso_eliminar = 'ON'){
                                                                ?>
                                                                <button type="submit" name="ELIMINAR_PERSONA" id="ELIMINAR"
                                                                    class="btn btn-primary">Si,eliminar</button>
                                                                    <?php 
                                                                }
                                                                ?> 
                                                            </div>
                                                            <!--FIN DEL DIV DE BOTONES DE GUARDAR -->                                                        
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

</div><!-- /.content-wrapper -->



<aside class="control-sidebar control-sidebar-dark">
    <!-- Control Sidebar -->
</aside>
<!-- /.control-sidebar -->

<aside class="control-sidebar control-sidebar-dark">
    <!-- Control Sidebar -->
</aside>



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

<script type="text/javascript"> 
   //funcion de mostrar el estilo de la datatable
  $(document).ready( function () {
      $('#tbl_persona').DataTable({

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
        "search": "Buscar Persona:",
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

<!--♠DianaRut *No me quiten los creditos  modificado por any :( -->