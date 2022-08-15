<?php
include_once "conexion.php";
include_once "conexion3.php";
include "conexionpdo.php";

?>
<?php 
date_default_timezone_set("America/Guatemala");
$fecha_actual = date("Y-m-d");
  $_SESSION["bdesde"] = date("Y-m-d",strtotime($fecha_actual."- 1 month"));
  $_SESSION["bhasta"] = date("Y-m-d",strtotime($fecha_actual."+ 1 day"));

?>

<?php 
if(isset($_POST["bdesde"]) && isset($_POST["bhasta"])){
  $_SESSION["bdesde"] = $_POST["bdesde"];
  $_SESSION["bhasta"] = $_POST["bhasta"];

}
?>
<?php
  $Fechaactual ="FECHAINICIAL";
  $sentencia = $db->prepare("SELECT VALOR FROM tbl_parametros WHERE PARAMETRO =(?);");
  $sentencia->execute(array($Fechaactual));
  $row=$sentencia->fetchColumn();
  if($row>0){
    $valor = $row;
  }
?>
<?php
  $hora ="HORA_INICIO_ATENCIONCITA";
  $sentencia = $db->prepare("SELECT VALOR FROM tbl_parametros WHERE PARAMETRO =(?);");
  $sentencia->execute(array($hora));
  $row=$sentencia->fetchColumn();
  if($row>0){
    $valor1 = $row;
  }
?>
<?php
  $hora1 ="HORA_FINAL_ATENCIONCITA";
  $sentencia = $db->prepare("SELECT VALOR FROM tbl_parametros WHERE PARAMETRO =(?);");
  $sentencia->execute(array($hora1));
  $row=$sentencia->fetchColumn();
  if($row>0){
    $valor2 = $row;
  }
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
    <div class="content-header text-xl-center mb-3 ">
              <h4>Citas Hoy</h4>
    </div>
    <section class="content">
       <div class="card"> 
        <div class="card-header" style="background-color:#B3F2FF;">
        <ul class="nav nav-tabs card-header-tabs">
            <li class="nav-item">
            <a class=" nav-link" style="color:#000000;" href="crudcitasgenerales">Citas Generales</a>
            </li>
            <li class="nav-item">
            <a class=" nav-link active" style="color:#000000;" href="crudinscripcioncita">Citas Hoy</a>
            </li>
            <li class="nav-item">
            <a class="nav-link" style="color:#000000;" href="ediusuariosestudiantes">Agregar Cita</a>
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
                            $evaluar_usuario = $db->prepare("SELECT CODIGO_TIPO_ROL 
                                                            FROM tbl_usuario 
                                                            WHERE NOMBRE_USUARIO = (?);");
                            $evaluar_usuario->execute(array($usuario));
                            $row=$evaluar_usuario->fetchColumn();
                            if($row > 0){
                                $usuariomo = $row;//capturo el nombre del ROl en la variable para usarla en el Procedimiento almacenado

                                //llamar al procedimiento almacenado
                                $evaluar_permiso = $db->prepare("CALL Sp_permiso_insertar(?,?);");
                                $evaluar_permiso->execute(array($usuariomo, '32'));
                                $row1=$evaluar_permiso->fetchColumn();
                                $permiso_registrar =$row1;             
                            }
                            ?> <!-- fin del codigo para sustraer el permiso de insertar.-->       
                     <?php 
                      if($permiso_registrar == 'SI'){
                     ?>
                    <a href="ediusuariosestudiantes" >
                    <button  data-toggle="modal"  href="" type='button' id="btnGuardar"  style="color:white;"class="btn btn-primary mb-3"><span> <i class="nav-icon fa fa-plus-square mx-1"></i></span>Agregar</button>
                    </a>
                    <button  onclick="Descargar()" data-toggle="modal"  href="" type='button' id="btnGuardar"  style="color:white; background-color:#FA0079" class="btn btn-danger mb-3"> <span><i class="nav-icon fa fa-file-pdf mx-1"></i></span>Reporte</button>
                    </br></br>
                    <?php 
                      }
                     ?>
                     <!--
                    <div class="row">
                        <label class=" col-sm-1 control-label" style=" text-align: right; width: 150px">Desde:</label>
                        <div class="col-sm-2">
                        <input class="form-control" type="date" id="bd-desde" max="<?= date("Y-m-d") ?>"name="desde" value="<?php echo $_SESSION['bdesde']?>" />
                        </div>
                        <label class=" col-sm-1 control-label" style=" text-align: right; width: 150px">Hasta:</label>
                        <div class="col-sm-2">
                        <input class="form-control" type="date" id="bd-hasta"  max="<?= date("Y-m-d") ?>" name="hasta" value="<?php echo $_SESSION['bhasta']?>"/>
                        </div>
                        <button type="submit" class="btn btn-primary"  name="filtrartutor" class="col-sm-1 col-form"><span> <i class="nav-icon fa fa-search mx-1"></i></span>Generar</button>  
                    -->
                   </div><!--fin de row -->

                   </br></br>
                    <!-- Codigo de permiso de insertar -->
                    
                    
                   
                    <div class="card ">
                        <div class="card-header text-center" style="background-color: #F7F8F9";>
                            <!-- TITULO ENCABEZADO DATOS PERSONALES -->
                            <h1 class=" card-title text-center"><strong style="color:black;"></strong></h1>
                        </div>
                        <!-- form start -->
                        <div class="card-body">
                            <div class="table-responsive">
                                <table id="tabla_citas" class="table table-bordered table-striped">
                                    <thead>
                                        <tr>
                                            <th class="text-center">Acción</th>
                                            <th class="text-center">ID</th>
                                            <th class="text-center">Fecha cita</th>
                                            <th class="text-center">Hora</th>
                                            <th class="text-center">Beneficiario</th>
                                            <th class="text-center">Encargado de cita</th>
                                            <th class="text-center">Especialidad</th>
                                            <th class="text-center">Área</th>
                                            <th class="text-center">Estado de cita</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php
                                    
                                        $query = "SELECT  a.CODIGO_AREA, IC.CODIGO_CITA,IC.FECHA_CITA,IC.HORARIO , IC.CODIGO_PERSONA ,IC.CODIGO_ESPECIALISTA , CONCAT_WS(' ',P.PRIMER_NOMBRE,P.PRIMER_APELLIDO) AS 
                                        MEDICO , CONCAT_WS(' ',OT.PRIMER_NOMBRE, OT.SEGUNDO_NOMBRE, OT.PRIMER_APELLIDO,OT.SEGUNDO_APELLIDO) AS PACIENTE, IC.CODIGO_ESTADO ,est.NOMBRE as nombre_estado, ar.NOMBRE as nombre_area, espe.NOMBRE as nombre_especialidad
                                        FROM tbl_inscripcion_cita IC ,tbl_persona P ,tbl_persona_especialidad E ,tbl_persona OT, tbl_area a, tbl_estado est, tbl_area ar, tbl_especialidad espe
                                        WHERE E.CODIGO_PERSONA = P.CODIGO_PERSONA 
                                        AND ic.AREA_CITA = ar.CODIGO_AREA
                                        AND ic.CODIGO_ESTADO = est.CODIGO_ESTADO
                                        AND IC.AREA_CITA = a.CODIGO_AREA
                                        AND IC.CODIGO_ESPECIALISTA = E.CODIGO_PERSONA_ESPECIALIDAD 
                                        AND E.CODIGO_ESPECIALIDAD = espe.CODIGO_ESPECIALIDAD
                                        AND  OT.CODIGO_PERSONA = IC.CODIGO_PERSONA
                                        AND est.CODIGO_ESTADO = '5'
                                        AND IC.FECHA_CITA = CURDATE() ;
                                        ";
                                        $result = $conn->query($query);
                                        if ($result->num_rows > 0) {
                                            while ($row = $result->fetch_assoc()) {
                                                $var1 = $row['CODIGO_CITA'];
                                                $var2 = $row['FECHA_CITA'];
                                                $var3 = $row['HORARIO'];
                                                $var4 = $row['PACIENTE'];
                                                $var5 = $row['MEDICO'];
                                                $var6 = $row['nombre_estado'];
                                                $var7 = $row['nombre_area'];
                                                $var8 = $row['nombre_especialidad'];
                                                $area= $row['CODIGO_AREA'];
                                                $codigoestado=$row['CODIGO_ESTADO'];
                                                $Cod_especialista = $row['CODIGO_ESPECIALISTA'];
                                                $paciente = $row['CODIGO_PERSONA'];
                                        ?>      
                                                <tr>
                                                    <td>
                                                        <div class="text-center">
                                                            <div class="btn-group">
                                                               <!-- Codigo de permiso para Eliminar -->

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
                                                                        $evaluar_permiso_actualizar->execute(array($usuariomo, '32'));
                                                                        $row1=$evaluar_permiso_actualizar->fetchColumn();
                                                                        $permiso_actualizar =$row1; 
                                                                    
                                                                    }
                                                                    ?>  <!-- fin del codigo para sustraer el permiso de actualizar-->
                                                                     <?php 
                                                                    if($permiso_actualizar == 'SI'){
                                                                    ?>
                                                                <a href="#editar_cita<?php echo $var1; ?>" data-toggle="modal">
                                                                    <button type='button' style="color:white;" class="btn btn-warning"><span>
                                                                     <i class="nav-icon fas fa-edit mx-1"></i></span></button>
                                                                </a>

                                                                   


                                                              <a href="#ver_cita<?php echo $var1; ?>" data-toggle="modal">
                                                                    <button type='button' style="color:white; background-color:#3DC2F6;" class="btn "><span>
                                                                     <i class="nav-icon fas fa-eye mx-1"></i></span></button>
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
                                                    <td class="text-center"><?php echo $var8; ?></td>
                                                    <td class="text-center"><?php echo $var7; ?></td>
                                                    <td class="text-center"><?php echo $var6; ?></td>
                                                    
                                                    <!-- editar cita editar -->
                                                    
                                                    <div  class="modal fade"  
                                                    id="editar_cita<?php echo $var1 ?>" role="dialog"  >
                                                        <div class="modal-dialog modal-lg">
                                                            <div class="modal-content">
                                                                <!-- Modal content  editar-->
                                                                <div class="modal-header" style="background-color: #0CCDE3">
                                                                    <h4 class="text-center">Editar Cita</h4>
                                                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                </div>
                                                                <form method="POST"  class="needs-validation">
                                                                <?php  
                                                                    date_default_timezone_set("America/Guatemala");
                                                                    $fechaactual = date('Y-m-d');  /* Asigno la variable valor del parametro que contiene la fecha actual*/
                                                                    $fechamaxima= date('Y-m-d',strtotime($Fechaactual."+ 2 month"));/* para la fecha maxima le sumo dos meses a la fecha actual */
                                                                ?>

                                                                <!-------------CUERPO DEL MODAL  editar--------------> 
                                                                <div class="modal-body"> 
                                                                <!-------- INICIO PRIMERA ROW editar ----------->         
                                                            <div class="row"> 
                                                                    <input type="text" value="<?php echo $var1; ?>" 
                                                                    hidden class="form-control"
                                                                    name="cod_edit_cita" id="cod_edit_cita">
                                                                    <input type="text" value="<?php echo $paciente; ?>" 
                                                                    hidden class="form-control"
                                                                    name="paciente_editar" id="cod_edit_cita">
                                                                    <div class="col-sm-6">
                                                                    <div class="form-group">
                                                                        <label for="fecha" class="form-label">Fecha de la cita: </label>
                                                                        <input type="date"autocomplete = "off" value="<?php echo $var2;?>" 
                                                                        min= "<?= date ($fechaactual)?>"  
                                                                        class="form-control" 
                                                                        name="edit_fecha_cita"  id="edit_fecha_cita">
                                                                    </div>
                                                                    <div class="invalid-feedback">
                                                                    Campo obligatorio, completelo con una fecha valida.
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-6">
                                                                        <div class="form-group">
                                                                            <label for="txtcodigo_persona"> Hora: </label>
                                                                            <input type="time"  value = "<?php echo $var3; ?>" 
                                                                            required min= "<?= ($valor1)?>"   max= "<?= ( $valor2)?>" 
                                                                            class="form-control" 
                                                                            name="edit_hora" id="edit_hora1">
                                                                        </div>
                                                                        <div class="invalid-feedback">
                                                                        Campo obligatorio, completelo con una hora valida.
                                                                        </div>
                                                                        
                                                                </div>
                                                            </div> 
                                                                <?php
                                                                        include "conexion1.php";
                                                                        $queryr = "SELECT es.CODIGO_ESTADO ,es.NOMBRE AS Nombre_estado
                                                                        FROM tbl_estado es
                                                                        WHERE  es.CODIGO_ESTADO = 5 or  es.CODIGO_ESTADO = 7;";
                                                                        $resultador=$conn->query($queryr);
                                                                        ?> 
                                                                                   <?php
                                                                        include "conexion1.php";
                                                                        $queryr1 = "SELECT concat_ws (' ',tp.PRIMER_NOMBRE,tp.PRIMER_APELLIDO, ' , ' 'ESPECIALIDAD:', te.NOMBRE )  
                                                                        as ESPECIALISTA ,tpe.CODIGO_PERSONA_ESPECIALIDAD 
                                                                        from tbl_persona tp ,
                                                                        tbl_persona_especialidad tpe,
                                                                        tbl_especialidad  te 
                                                                        where  tp.CODIGO_PERSONA = tpe.CODIGO_PERSONA
                                                                        AND te.CODIGO_ESPECIALIDAD= tpe.CODIGO_ESPECIALIDAD and te.CODIGO_AREA <>1 AND TE.CODIGO_AREA=$area";
                                                                        $resultador2=$conn->query($queryr1);
                                                                        ?>  

                                                                <div class="row">
                                                                    <div class="col-sm-6">
                                                                        <div class="form-group">
                                                                          <label for="txtcodigo_persona">Estado cita:</label>
                                                                            <select class="form-control" name="estado_edit" required >
                                                                                <option selected disabled autocomplete = "off" value="">--Seleccione...</option>
                                                                                            <?php 
                                                                                        if ($resultador->num_rows > 0) {
                                                                                            while($rowr = $resultador->fetch_assoc()) { ?>
                                                                                <option value="<?php echo $rowr['CODIGO_ESTADO'];?>"
                                                                                <?php
                                                                                if ($rowr['CODIGO_ESTADO']==$codigoestado) {
                                                                                    ?>
                                                                                    selected
                                                                                    <?php
                                                                                }
                                                                                ?>
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                ><?php echo $rowr['Nombre_estado']; ?></option>
                                                                                        <?php } 
                                                                                            }?>
                                                                            </select>
                                                                                    <div class="invalid-feedback">
                                                                                    Campo obligatorio, seleccione una opción.
                                                                                    </div>
                                                                        </div>
                                                                    </div>
                                                                  
                                                                    <div class="col-sm-6">
                                                                        <div class="form-group">
                                                                          <label for="txtcodigo_encargado">Encargado Cita:</label>
                                                                            <select class="form-control" name="encargadocitados" id ="encargadocitados" required >
                                                                            <option value="<?php echo $Cod_especialista?>"><?php echo $var5?></option>
                                                                                            <?php 
                                                                                        if ($resultador2->num_rows > 0) {
                                                                                            while($rowr1 = $resultador2->fetch_assoc()) { ?>
                                                                                <option value="<?php echo $rowr1['CODIGO_PERSONA_ESPECIALIDAD'];?>"><?php echo $rowr1['ESPECIALISTA']; ?></option>
                                                                                        <?php } 
                                                                                            }?>
                                                                            </select>
                                                                                    <div class="invalid-feedback">
                                                                                    Campo obligatorio, seleccione una opción.
                                                                                    </div>
                                                                        </div>
                                                                    </div>

                                                                </div>
                                                        <!-- ------------------ FIN PRIMERA ROW editar---------------------- -->
                                                            <div class="modal-footer ">
                                                                <button type="button" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                                                                <button type="submit" name="edit_cita"  id = "edit_cita" class="btn btn-success"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>
                                                              
                                                            </div>
                                                                    </div><!--FIN CUERPO DEL MODAL editar --> 
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div><!-- FIN DEL MODAL editar -->




                                                    <div  class="modal fade"  
                                                    id="ver_cita<?php echo $var1 ?>" role="dialog"  >
                                                        <div class="modal-dialog modal-lg">
                                                            <div class="modal-content">
                                                                <!-- Modal content  editar-->
                                                                <div class="modal-header" style="background-color: #0CCDE3">
                                                                    <h4 class="text-center">Ver Cita </h4>
                                                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                </div>
                                                                <form method="POST">
                                                                <!-------------CUERPO DEL MODAL  editar--------------> 
                                                                <div class="modal-body"> 
                                                                <!-------- INICIO PRIMERA ROW editar ----------->  
                                                                <input type="text" value="<?php echo $var1; ?>" 
                                                                        hidden class="form-control"
                                                                        name="cod_enviar_cita" id="cod_edit_cita" >

                                                                        <input type="text" value="<?php echo $var6; ?>" 
                                                                        hidden class="form-control"
                                                                        name="estado_cita" id="cod_edit_cita" >

                                                                        <h2 class="text-center">Información de Cita</h2>
                                                                        <br>
                                                                    <div class="row"> 
                                            
                                                                        <div class="col-sm-6">
                                                                                <div class="form-group">
                                                                                    <p><b class="p-1">Fecha de la Cita:</b> <?php echo $var2; ?></p>
                                                                                </div>
                                                                        </div>


                                                                        <div class="col-sm-6">
                                                                                <div class="form-group">
                                                                                    <p><b class="p-1">Hora de la Cita:</b> <?php echo $var3; ?></p>
                                                                                </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="dropdown-divider"></div>

                                                                    <div class="row"> 
                                                                            <div class="col-sm-6">
                                                                                        <div class="form-group">
                                                                                        <p><b class="p-1">Beneficiario:</b> <?php echo $var4; ?></p>
                                                                                        </div>
                                                                                </div>

                                                                        
                                                                    </div>


                                                                    <div class="row"> 
                                                                            <div class="col-sm-6">
                                                                                        <div class="form-group">
                                                                                        <p><b class="p-1">Servicio:</b> <?php echo $var7; ?></p>

                                                                                        </div>
                                                                                </div>
                                                                                <div class="col-sm-6">
                                                                                        <div class="form-group">
                                                                                        <p><b class="p-1">Especialidad: </b> <?php echo $var8; ?></p>

                                                                                        </div>
                                                                                </div>
                                                                        
                                                                    </div>


                                                                    <div class="row"> 
                                                                            <div class="col-sm-6">
                                                                                        <div class="form-group">
                                                                                        <p><b class="p-1">Encargado: </b> <?php echo $var5; ?></p>

                                                                                        </div>
                                                                                </div>

                                                                        
                                                                    </div>
                                                             
                                                                </div> 
                                                        <!-- ------------------ FIN PRIMERA ROW editar---------------------- -->
                                                            <div class="modal-footer ">
                                                                <button type="button" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                                                                <button type="submit" name="enviar_cita"  id = "enviar_cita" class="btn btn-success"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Enviar cita</button>
                                                              
                                                            </div>
                                                                    </div><!--FIN CUERPO DEL MODAL editar --> 
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div><!-- FIN DEL MODAL editar -->

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
                    </div><!-- fINAL DEL card de la tabla-->
                </div>

                <!--FINAL DE COL-M12-->
            </div><!-- FINAL ROW PADRE -->
        <!-- FINAL CONTAINER FLUID -->
       </div>
     </div>
    </section><!-- FINAL SECTION -->  
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
    function Descargar() {
      window.open('Reportes_Prosecar/reporteCita.php','_blank');
      window.open(this.href,'_self');
    }
  </script>


<script type="text/javascript"> 
   //funcion de mostrar el estilo de la datatable
  $(document).ready( function () {
      $('#tabla_citas').DataTable({

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
        "search": "Buscar Cita:",
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


  

<!--♠DianaRut *No me quiten los creditos modificado por Gissela y Any :( -->

