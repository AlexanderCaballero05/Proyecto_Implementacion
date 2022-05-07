<?php
include_once "conexion.php";
include_once "conexion3.php";


$codigoObjeto = 6;
$accion = 'Ingreso a la pantalla de mantenimiento objetos ';
$descripcion = 'Ver los registros de los objetos';
bitacora($codigoObjeto, $accion, $descripcion);
?>


<head>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="../vistas/assets/plugins/jquery/jquery.min.js"></script>
</head>

<!--INICIO DEL MODAL DE Agregar -->
<body oncopy="return false" onpaste="return false" >
<div class="modal fade" id="ADDOBJETO" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <!-- Modal content-->
            <form method="POST" class="needs-validation" novalidate>

                <div class="modal-header" style="background-color: #0CCDE3">
                    <h4 class="text-center">Agregar
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
                                <input type="text" class="form-control" maxlength="40" minlength="10"  onkeyup="mayus(this);" autocomplete="off" type="text"
                                 name="nombre" id="nombre" required="">
                                 <div class="invalid-feedback">
                                  campo obligatorio.
                                   </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="txtcodigo_persona">
                                    Descripcion</label>
                                <input type="text" class="form-control" onkeyup="mayus(this);"  type="text" 
                                 name="descripcion" id="descripcion" autocomplete = "off" maxlength="100" required="">
                                 <div class="invalid-feedback">
                                  campo obligatorio.
                                   </div>
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
    <div class="content-header text-xl-center mb-3 btn-light">
              <h4>MANTENIMIENTO OBJETOS</h4>
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
                                $evaluar_permiso->execute(array($usuariomo, '6'));
                                $row1=$evaluar_permiso->fetchColumn();
                                $permiso_registrar =$row1;             
                            }
                            ?> <!-- fin del codigo para sustraer el permiso de insertar.-->

                 
                     <?php 
                      if($permiso_registrar == 'SI'){
                     ?>
                     
                    <button type="button" class="btn btn-primary mb-3" style="color:white;" data-toggle="modal" data-target="#ADDOBJETO">
                     <span> <i class="nav-icon fa fa-plus-square mx-1"></i></span>Agregar objeto
                    </button>
                   
                       <button  onclick="Descargar()" data-toggle="modal"  href="" type='button' id="btnGuardar"  style="color:white; background-color:#FA0079"class="btn btn-danger mb-3"> <span><i class="nav-icon fa fa-file-pdf mx-1"></i></span>Generar Reporte</button>
                       <?php 
                      }
                     ?>
                    <!-- jquery validation -->
                    <div class="card card-primary">
                        <div class="card-header text-center" style="background-color: #0CCDE3">
                            <!-- TITULO ENCABEZADO DATOS PERSONALES -->
                           <!--  <h1 class=" card-title text-center"><strong style="color:black;">Objetos</strong></h1>-->
                        </div>

                        <!-- form start -->
                        <div class="card-body">
                            <div class="table-responsive">
                                <table id="tabla_objetos" class="table table-bordered table-striped">
                                    <thead>
                                        <tr>
                                        <th class="text-center">Acción</th>
                                        <th class="text-center">ID</th>
                                        <th class="text-center">Nombre</th>
                                        <th class="text-center">Descripcion</th>
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
                                                                    $evaluar_permiso_eliminar->execute(array($usuariomo, '6'));
                                                                    $row1=$evaluar_permiso_eliminar->fetchColumn();
                                                                    $permiso_eliminar =$row1; 
                                                                }
                                                                ?>  <!-- fin del codigo para sustraer el permiso de eliminar-->
                                                                <?php 
                                                                if($permiso_eliminar == 'SI'){
                                                                ?>
                                                                <a href="#ELIMINAR<?php echo $var1; ?>" data-toggle="modal">
                                                                    <button id="ELIMINAR_USUARIO" name="ELIMINAR_USUARIO" type='button' class="btn btn-danger" data-dismiss="modal"><i class="nav-icon fas fa-trash"></i>
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
                                                                        $evaluar_permiso_actualizar->execute(array($usuariomo, '6'));
                                                                        $row1=$evaluar_permiso_actualizar->fetchColumn();
                                                                        $permiso_actualizar =$row1; 
                                                                    
                                                                    }
                                                                    ?>  <!-- fin del codigo para sustraer el permiso de actualizar-->
                                                                     <?php 
                                                                    if($permiso_actualizar == 'SI'){
                                                                    ?>
                                                                <a href="#EDITAROBJETO<?php echo $var1; ?>" data-toggle="modal">
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
                                                                            <input type="text" value="<?php echo $var1; ?>" hidden class="form-control"
                                                                                 name="cod_objetoedit" id="cod_objetoedit">
                                                                                 
                                                                            <div class="col-sm-6">
                                                                                <div class="form-group">
                                                                                    <label for="txtcodigo_persona">
                                                                                        Nombre</label>
                                                                                    <input type="text" value="<?php echo $var3; ?>" class="form-control" maxlength="40" minlength="5" onkeyup="mayus(this);" autocomplete="off" type="text" onkeypress="return soloLetras(event);" 
                                                                                    name="editnombre" autocomplete = "off" id="editnombre">
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-sm-6">
                                                                                <div class="form-group">
                                                                                    <label for="txtcodigo_persona">
                                                                                        Descripcion</label>
                                                                                    <input type="text" value="<?php echo $var4; ?> "onkeyup="mayus(this);"  class="form-control" maxlength="100" minlength="5"  
                                                                                     name="editdescripcion"autocomplete = "off" id="editdescripcion">
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
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div><!-- FIN DEL MODAL EDITAR -->

                                                    <!-- inicio modal eliminar  -->   
                                                    <div id="ELIMINAR<?php echo $var1 ?>"  name="eliminar" id="eliminar"class="modal fade" role="dialog">
                                                    <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalLabel"></h5>
                                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                        </div>
                                                        <form id="FORMEeliminar" method="POST">
                                                        <div class="modal-body">
                                                            <input type="text" value ="<?php echo $var1; ?>" hidden class="form-control" name="cod_objeto_eliminar" id="cod_objeto_eliminar">
                                                            <h4 class="text-center">¿Esta seguro de eliminar este objeto <?php echo $var3; ?>?</h4>
                                                        </div> <!--fin el card body -->
                                                            <div class="modal-footer ">

                                                            <button type="button" name="cerrar" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                                                            <button type="submit"  name="objeto_eliminar" id="objeto_eliminar"  class="btn btn-primary">Si,eliminar</button>      
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


  //funcion de mostrar el estilo de la datatable
  $(document).ready( function () {
      $('#tabla_objetos').DataTable({

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
        "search": "Buscar Objeto:",
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


   /////copiar y pegar y eso 
  var nombre=document.getElementById("nombre"); //el nombre del id del campo y cambiar la variable 
  nombre.addEventListener('keydown', function(keyboardEvent) {///cambiar la variable 
    //Si se está repitiendo, ignorar
    if (keyboardEvent.repeat)
    keyboardEvent.preventDefault();
    });


     /////copiar y pegar y eso 
     var descripcion=document.getElementById("descripcion"); //el nombre del id del campo y cambiar la variable 
     descripcion.addEventListener('keydown', function(keyboardEvent) {///cambiar la variable 
    //Si se está repitiendo, ignorar
    if (keyboardEvent.repeat)
    keyboardEvent.preventDefault();
    });

    var editnombre=document.getElementById("editnombre"); //el nombre del id del campo y cambiar la variable 
    editnombre.addEventListener('keydown', function(keyboardEvent) {///cambiar la variable 
    //Si se está repitiendo, ignorar
    if (keyboardEvent.repeat)
    keyboardEvent.preventDefault();
    });

    var editdescripcion=document.getElementById("editdescripcion"); //el nombre del id del campo y cambiar la variable 
    editdescripcion.addEventListener('keydown', function(keyboardEvent) {///cambiar la variable 
    //Si se está repitiendo, ignorar
    if (keyboardEvent.repeat)
    keyboardEvent.preventDefault();
    });
    

    function Descargar() {
      window.open('Reportes_Prosecar/reporteobjetos.php','_blank');
      window.open(this.href,'_self');
    }

   

</script>

<!--♠DianaRut *No me quiten los creditos modificado por any :( -->