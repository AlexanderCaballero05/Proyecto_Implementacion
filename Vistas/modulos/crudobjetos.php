
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
    Programa:          Mantenimiento de objetos
    Fecha:             
    Programador:      
    descripcion:       Permite llevar un mantenimiento de objetos  ,editar,eliminar nuevo
-----------------------------------------------------------------------
  Historial de Cambio
-----------------------------------------------------------------------
    Programador               Fecha                      Descripcion
  ANY HERNANDEZ         		11-06-2022                 revision de ortagrafia 
----------------------------------------------------------------------->


<?php
include_once "conexion.php";
include_once "conexion3.php";


$codigoObjeto = 6;
$accion = 'Ingreso a la pantalla de mantenimiento objetos';
$descripcion = 'Ver los registros de los objetos';
bitacora($codigoObjeto, $accion, $descripcion);
?>

<head>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="../vistas/assets/plugins/jquery/jquery.min.js"></script>
</head>

<!--INICIO DEL MODAL DE Agregar -->
<body oncopy="return false" onpaste="return false" >


<body oncopy="return false" onpaste="return false" >
<div class="content-wrapper">
    <div class="content-header">
        <div class="container-fluid">
        </div><!-- /.container-fluid -->
    </div>
    <div class="content-header text-xl-center mb-3 ">
        <h4>Objetos</h4>
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
                     <span> <i class="nav-icon fa fa-plus-square mx-1"></i></span>Agregar Objeto
                    </button>
                   
                       <button  onclick="Descargar()" data-toggle="modal"  href="" type='button' id="btnGuardar"
                         style="color:white; background-color:#FA0079"class="btn btn-danger mb-3"> 
                         <span><i class="nav-icon fa fa-file-pdf mx-1"></i></span>Generar Reporte</button>
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
                        <form method ="POST">
                        <div class="card-body">
                            <div class="table-responsive">
                                <table id="tabla_objetos" class="table table-bordered table-striped">
                                    <thead>
                                        <tr>
                                        <th class="text-center">Acción</th>
                                        <th class="text-center">Código</th>
                                        <th class="text-center">Nombre</th>
                                        <th class="text-center">Descripción</th>
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
                                                        <div class="modal-dialog modal-md">
                                                            <div class="modal-content">
                                                                <!-- Modal content-->
                                                                <div class="modal-header" style="background-color: #0CCDE3">
                                                                    <h4 class="text-center">Editar información objeto </h4>
                                                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                </div>
                                                                <form method="POST">
                                                                    <div class="modal-body">
                                                                        <!--CUERPO DEL MODAL -->
                                                                        <div class="row">
                                                                            <!-- INICIO PRIMERA ROW -->
                                                                            <input type="text" value="<?php echo $var1; ?>" hidden class="form-control"
                                                                                 name="cod_objetoedit" id="cod_objetoedit">
                                                                                 
                                                                            <div class="col-sm-12">
                                                                                <div class="form-group">
                                                                                    <label>Nombre</label>
                                                                                    <input type="text" value="<?php echo $var3; ?>" class="form-control" maxlength="40" minlength="5" onkeyup="mayus(this);" autocomplete="off" type="text" onkeypress="return soloLetras(event);"
                                                                                    name="editnombre" autocomplete = "off" id="editnombre" required>
                                                                                    <div class="invalid-feedback">
                                                                                    Complete este campo.
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-sm-12">
                                                                                <div class="form-group">
                                                                                    <label>Descripción</label>
                                                                                    <textarea type="text"  onkeyup="mayus(this);"  class="form-control" required pattern="[A-Z]{5,100}" maxlength="100" minlength="5"  onkeyup="mayus(this);" autocomplete="off" type="text" onkeypress="return soloLetras(event);" name="editdescripcion" autocomplete = "off" id="editdescripcion" ><?php echo $var4;?></textarea>
                                                                                     <div class="invalid-feedback">
                                                                                      Complete este campo.
                                                                                    </div>
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
                                                            <h4 class="text-center">¿Está seguro de eliminar este objeto <?php echo $var3; ?>?</h4>
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

</div><!-- /.content-wrapper -->

<div  id="ADDOBJETO" class="modal fade"   role="dialog" >
    <div class="modal-dialog modal-md">
        <div class="modal-content"><!-- Modal content-->
            <div class="modal-header" style="background-color: #0CCDE3">
                <h4 class="text-center">Agregar Objetos</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
           <form method="POST" class="needs-validation" novalidate>
                <div class="modal-body">
                    <!--CUERPO DEL MODAL -->
                    <div class="row">
                        <!-- INICIO PRIMERA ROW -->
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label>Nombre</label>
                                <input type="text" class="form-control" required minlength="10" maxlength="40"   onkeyup="mayus(this);" autocomplete="off"  onkeypress="return soloLetras(event);"
                                 name="nombre" id="nombre" >
                                <div class="invalid-feedback">
                                  Campo obligatorio.
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label >Descripción</label>
                                <textarea type="text" class="form-control" required pattern="[A-Z,]{5,100}" minlength="5" maxlength="100" onkeyup="mayus(this);"  onkeypress="return soloLetras(event);"      name="descripcion"  ></textarea>
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
                    <button type="submit" name="ADD_OBJETO" class="btn btn-success"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>
                </div>
                <!--FIN DEL DIV DE BOTONES DE GUARDAR -->
            </form>
        </div>
    </div>
</div><!-- FIN DEL MODAL AGREGAR -->







<script>
  (function () {
    'use strict'
    var forms = document.querySelectorAll('.was-validated')
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