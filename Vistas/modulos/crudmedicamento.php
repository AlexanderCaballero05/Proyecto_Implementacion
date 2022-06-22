<!-- 
-----------------------------------------------------------------------
Universidad Nacional Autonoma de Honduras (UNAH)
		Facultad de Ciencias Economicas
Departamento de Informatica administrativa
Analisis, Programacion y Evaluacion de Sistemas
           Primer Periodo 2016

Equipo:


Catedratico:
Lic. Claudia Nuñez (Analisis)
Lic. Giancarlo Martini Scalici Aguilar (Implementación)
Lic. Karla Melisa Garcia Pineda (Evaluación)

---------------------------------------------------------------------

Programa:         Pantalla de Ingreso a mantenimiento modalidad
Fecha:             01-jan-2016
Programador:       
descripcion:       Pantalla que contrala la modalidad de las tutorias 

-----------------------------------------------------------------------
                      Historial de Cambio
-----------------------------------------------------------------------

Programador               Fecha                      Descripcion
Gissela Diaz              08/06/2022                cambios de nombres de variables y nombre objeto 
                                                    y descripción
----------------------------------------------------------------------->
<?php
include_once "conexion.php";
include_once "conexion3.php";


$codigoObjeto = 35;
$accion = 'INGRESO A LA PANTALLA MANTENIMIENTO DE MEDICAMENTO  ';
$descripcion = 'MANTENIMIENTO A LOS MEDICAMENTOS REGISTRADOS';
bitacora($codigoObjeto, $accion, $descripcion);
?>

<body oncopy="return false" onpaste="return false" >
<head>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="../vistas/assets/plugins/jquery/jquery.min.js"></script>
</head>
<!--INICIO DEL MODAL DE Agregar -->
<div class="modal fade" id="ADDOBJETO" class="modal fade" role="dialog">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <form method="POST" class="needs-validation" novalidate>
                <div class="modal-header" style="background-color: #0CCDE3">
                    <h4 class="text-center">Registrar Medicamento</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <!--CUERPO DEL MODAL -->
                    <div class="row">
                        <!-- INICIO PRIMERA ROW -->
                        <div class="col-sm-6">
                          <div class="form-group">
                              <label for="txtcodigo_persona">
                              Código del Medicamento</label>
                              <input type="text"  class="form-control" required pattern="[A-Z]{2,10}"  maxlength="10" minlength="2" onkeyup="mayus(this);" autocomplete="off"   onkeypress="return soloLetrasnumeros(event)" onKeyDown="sinespacio(this);" ; 
                              name="agregar_cod_medi" id="agregar_codd_medi" required>
                              <div class="invalid-feedback">
                                       campo obligatorio.
                             </div>
                          </div>
                      </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="txtcodigo_persona">
                                    Nombre del Medicamento</label>
                                <input type="text" class="form-control" maxlength="50" minlength="5"  onkeyup="mayus(this);" autocomplete="off" type="text" onkeypress="return soloLetras(event);"
                                 name="agregar_medicamento" id="agregar_medicamento" required >
                                 <div class="invalid-feedback">
                                       campo obligatorio.
                                   </div>
                            </div>
                        </div>
                    
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label for="txtcodigo_persona">
                                    Descripción</label>
                                <textarea type="text" class="form-control" maxlength="100" minlength="5"  autocomplete="off" type="text" onkeypress="return soloLetrasnumeros(event)" ; 
                                 name="agregar_med_desc" id="agregar_med_desc" required></textarea>
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
                    <button type="submit" name="agregar_medicame"  id = "agregar_medicame" class="btn btn-success"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>
                </div>
                <!--FIN DEL DIV DE BOTONES DE GUARDAR -->
            </form>
        </div>
    </div>
</div><!-- FIN DEL MODAL AGREGAR -->


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
            <h4>Mantenimiento Medicamentos</h4>
        </h1>     
    </section>
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
                                $evaluar_permiso->execute(array($usuariomo, '35'));
                                $row1=$evaluar_permiso->fetchColumn();
                                $permiso_registrar =$row1;             
                            }
                            ?> <!-- fin del codigo para sustraer el permiso de insertar.-->

                 
                     <?php 
                      if($permiso_registrar == 'SI'){
                     ?>
                     <button  data-toggle="modal"  href="#ADDOBJETO" type='button' id="btnGuardar"  style="color:white;"class="btn btn-primary mb-3"><span> <i class="nav-icon fa fa-plus-square mx-1"></i></span>Agregar Medicamento</button>
                    <button  onclick="Descargar()" data-toggle="modal"  href="" type='button' id="btnGuardar"  style="color:white; background-color:#FA0079"class="btn btn-danger mb-3"> <span><i class="nav-icon fa fa-file-pdf mx-1"></i></span>Descargar Reporte</button>
                   <?php 
                      }
                     ?>
                   
                    <!-- jquery validation -->
                    
                    <div class="card card-primary">
                        <div class="card-header text-center" style="background-color: #0CCDE3">
                            <!-- TITULO ENCABEZADO DATOS PERSONALES -->
                            <h1 class=" card-title text-center"><strong style="color:black;"></strong></h1>
                        </div>

                        <!-- form start -->
                        <div class="card-body">
                            <div class="table-responsive">
                                <table id="tbl_medicamentos" class="table table-bordered table-striped">
                                    <thead class="text-center">
                                        <tr>
                                            <th>Acción</th>
                                            <th>Código</th>
                                            <th>Nombre del Medicamento</th>
                                            <th>Descripción</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php
                                        $query = "SELECT  tm.CODIGO_MEDICAMENTO , tm.NOMBRE_MEDICAMENTO ,tm.DESCRIPCION  from tbl_medicamento tm ;";
                                        $result = $conn->query($query);
                                        if ($result->num_rows > 0) {
                                            while ($row = $result->fetch_assoc()) {
                                                $var1 = $row['CODIGO_MEDICAMENTO'];
                                                $var2 = $row['NOMBRE_MEDICAMENTO'];
                                                $var3 = $row['DESCRIPCION'];
                                                
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
                                                                    $evaluar_permiso_eliminar->execute(array($usuariomo, '35'));
                                                                    $row1=$evaluar_permiso_eliminar->fetchColumn();
                                                                    $permiso_eliminar =$row1; 
                                                                }
                                                                ?>  <!-- fin del codigo para sustraer el permiso de eliminar-->
                                                                <?php 
                                                                if($permiso_eliminar == 'SI'){
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
                                                                        $evaluar_permiso_actualizar->execute(array($usuariomo, '35'));
                                                                        $row1=$evaluar_permiso_actualizar->fetchColumn();
                                                                        $permiso_actualizar =$row1; 
                                                                    
                                                                    }
                                                                    ?>  <!-- fin del codigo para sustraer el permiso de actualizar-->
                                                                     <?php 
                                                                    if($permiso_actualizar == 'SI'){
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
                          
                                                    <!--INICIO DEL MODAL DE EDITAR -->
                                                    <div id="editar_medicamento<?php echo $var1; ?>" class="modal fade" role="dialog">
                                                        <div class="modal-dialog modal-lg">
                                                            <div class="modal-content">
                                                                <!-- Modal content-->
                                                                <div class="modal-header" style="background-color: #0CCDE3">
                                                                   <h4 class="text-center">Editar Información del Medicamento</h4>
                                                                   <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                </div>
                                                                <form method="POST" >
                                                                    <div class="modal-body">
                                                                        <!--CUERPO DEL MODAL -->
                                                                        <div class="row">
                                                                            <!-- INICIO PRIMERA ROW -->
                                                                            <input type="text" value="<?php echo $var1; ?>" hidden class="form-control" 
                                                                                 name="cod_edit_med" id="cod_edit_med" >
                                                                                 
                                                                            <div class="col-sm-6">
                                                                                <div class="form-group">
                                                                                    <label for="txtcodigo_persona">
                                                                                    Código del Medicamento</label>
                                                                                    <input type="text" value="<?php echo $var1; ?>" class="form-control" maxlength="10"  autocomplete="off" type="text" onkeyup="mayus(this);" onkeypress="return solonumero(event)" ; 
                                                                                    name="edit_cod_medi" id="edit_codd_medi" disabled="">
                                                                                    <div class="invalid-feedback">
                                                                                        Campo obligatorio.
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-sm-6">
                                                                                <div class="form-group">
                                                                                    <label for="txtcodigo_persona">
                                                                                    Nombre del Medicamento</label>
                                                                                    <input type="text" value="<?php echo $var2; ?>" class="form-control" maxlength="50" minlength="5"  onkeyup="mayus(this);" autocomplete="off" type="text" onkeypress="return soloLetras(event);" 
                                                                                    name="edit_nom_medi" id="edit_nom_medi" required>
                                                                                    <div class="invalid-feedback">
                                                                                        Campo obligatorio.
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        
                                                                          <div class="col-sm-12">
                                                                                <div class="form-group">
                                                                                    <label for="txtcodigo_persona">
                                                                                        Descripción del Medicamento</label>
                                                                                    <textarea type="text" class="form-control" maxlength="100" minlength="5"   autocomplete="off" type="text" onkeypress="return soloLetrasnumeros(event)" ; 
                                                                                     name="edit_desc_medi" id="edit_desc_medi" required><?php echo $var3; ?></textarea>
                                                                                     <div class="invalid-feedback">
                                                                                        campo obligatorio.
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div> <!-- FIN DE EL PRIMER ROW -->
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
                                                            <input type="text" value ="<?php echo $var1; ?>" hidden class="form-control" name="eliminar_medicamentos" id="eliminar_medicamento">
                                                            <h4 class="text-center">¿Está seguro de eliminar este medicamento <?php echo $var2; ?>?</h4>
                                                        </div> <!--fin el card body -->
                                                            <div class="modal-footer ">

                                                            <button type="button" name="cerrar" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                                                            <button type="submit"  
                                                            name="eliminar_medica" id="eliminar_medica"  class="btn btn-primary">Si, eliminar</button>      
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
                            </body>
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



<script>
     function quitarespacios(e) {
    var cadena =  e.value;
    cadena = cadena.trim();
    e.value = cadena;
  };
  //funcion para poner mayusculas
  function mayus(e) {
    e.value = e.value.toUpperCase();
  }
 </script>
 <script>
 function soloLetrasnumeros(e){
   key = e.keyCode || e.which;
   tecla = String.fromCharCode(key).toLowerCase();
   letras = "áéíóúabcdefghijklmnñopqrstuvwxyz 0123456789";
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
        "search": "Buscar Medicamento:",
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
    function Descargar() {
      window.open('Reportes_Prosecar/reporteMedicamento.php','_blank');
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