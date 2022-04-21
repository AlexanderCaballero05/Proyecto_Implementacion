<?php
 include_once "conexion.php";
 include_once "conexion3.php";
 include_once 'conexionpdo.php';
 include "conexionpdo.php";
 
?>
<head>

</head>
<div class="content-wrapper">
  <div class="content-header">
    <div class="container-fluid">
    </div>
      <section class="content">
        <section class="content-header text-xl-center mb-3 btn-light">
              <h4> LISTA DE TUTORIAS DEL TUTOR<i class="nav-icon fas fa-stethoscope"></i> </h4>
        </section>
      <div class="card"> <!--card del menu-->
        <div class="card-header" style="background-color:#B3F2FF;">
         <ul class="nav nav-tabs card-header-tabs">
            <li class="nav-item">
            <a class=" nav-link active" style="color:#000000;" href="crudTutoriasTutor">Lista de tutorias</a>
            </li>
            <li class="nav-item">
            <a class=" nav-link" style="color:#000000;" href="#">Lista de alumnos</a>
            </li>
          </ul>
        </div>
        <div class="card-body">
          <div class="row">
            <div class="col-md-12">
            <form  method="POST">
              <div class= "card">
                 <div class="card-header text-center" style="background-color: #F7F8F9;">
                    <h5 class=" card-title text-center"><strong style="color:black;"></strong></h5>
                 </div>
              <div class="card-body">
                <div class="table-responsive">
                  <table id="tabla_pacientes" class="table table-bordered table-striped">
                    <thead>
                      <tr>
                        <th class="text-center">Tutoria</th>
                        <th class="text-center">Grado</th>
                        <th class="text-center">Hora</th>
                        <th class="text-center">Periodo</th>
                        <th class="text-center">Año</th>
                        <th class="text-center">Notas alumnos</th>
                      </tr>
                    </thead>
                    <tbody>

                    <?php
                    $usuario= $_SESSION['vario'];

                    //Consulta que trae el codigo del usuario
                    $sentencia1 = $db->prepare("SELECT p.CODIGO_PERSONA
                    FROM tbl_usuario u, tbl_persona p 
                    WHERE u.CODIGO_PERSONA = p.CODIGO_PERSONA
                    AND NOMBRE_USUARIO = (?);");
                    $sentencia1->execute(array($usuario));
                    $cod_usuario=$sentencia1->fetchColumn();

                    ?>
                    <?php
                      $query = "SELECT c.CODIGO_CARGA, c.CODIGO_TUTORIA, t.NOMBRE as NOMBRE_TUTORIA , c.CODIGO_SECCION, s.NOMBRE AS SECCION, c.HORA, C.ANIO, c.PERIODO
                      FROM tbl_carga_academica c ,tbl_tutoria t, tbl_persona p, tbl_modalidad m , tbl_seccion s
                      WHERE c.CODIGO_PERSONA= p.CODIGO_PERSONA 
                      AND c.CODIGO_TUTORIA= t.CODIGO_TUTORIA
                      AND c.CODIGO_MODALIDAD= m.CODIGO_MODALIDA 
                      AND c.CODIGO_SECCION = s.CODIGO_SECCION
                      AND c.CODIGO_PERSONA = '$cod_usuario'; ";

                      $result = $conn->query($query);
                      if ($result->num_rows > 0) {
                        while($row = $result->fetch_assoc()) {
                          $var1 = $row['NOMBRE_TUTORIA'];
                          $var2 = $row['SECCION'];
                          $var3 = $row['HORA'];
                          $var4 = $row['PERIODO'];
                          $var5 = $row['ANIO'];
                          $codigo_carga = $row['CODIGO_CARGA'];
                          
                          
                      ?>
                      <tr>
                        <td class="text-center"><?php echo $var1; ?></td>
                        <td class="text-center"><?php echo $var2; ?></td>                      
                        <td class="text-center"><?php echo $var3; ?></td>
                        <td class="text-center"><?php echo $var4; ?></td>
                        <td class="text-center"><?php echo $var5; ?></td>

                        <td>
                          <div class="text-center">
                            <div class="btn-group">
                                <!--Codigo para asignar permiso del boton de editar -->
                                <?php
                                  $usuario=$_SESSION['vario'];
                                  //Evaluo si existe el tipo de Rol
                                  $evaluar_usuario = $db->prepare("SELECT CODIGO_TIPO_ROL FROM tbl_usuario WHERE NOMBRE_USUARIO = (?);");
                                  $evaluar_usuario->execute(array($usuario));
                                  $row=$evaluar_usuario->fetchColumn();
                                  if($row > 0){
                                      $usuariomo = $row;//capturo el nombre del ROl en la variable para usarla en el Procedimiento almacenado
                                      $evaluar_permiso_actualizar = $db->prepare("CALL Sp_permiso_actualizar(?,?);");
                                      $evaluar_permiso_actualizar->execute(array($usuariomo, '2'));
                                      $row2=$evaluar_permiso_actualizar->fetchColumn();
                                      $permiso_actualizar =$row2; 
                                  }
                                  ?>
                                  <?php
                                    if($permiso_actualizar == 'SI'){
                                  ?>
                                  <?php
                                    }
                                  ?>
                                  <form method="POST">
                                    <input type="text"  hidden value="<?php echo $codigo_carga; ?>" name="codigo_carga_matricula">
                                   <button type="submit" style="color:white;"class="form-control btn btn-success"><span>Lista alumnos</span></button>
                                  </form>
                                  

                                  <a><!--Para descargar el reporte individual uwu -->
                                     <form method="POST"  action="Vistas/REPORTE.php" target="_blank">
                                     <input type="hidden" name="expediente" value="<?php echo $var6?>">
                                     <button type='submit'  style="color:white; "class=" form-control btn btn-warning mb-3"><span><i class="nav-icon fa fa-file-pdf mx-1"></i></span></button> 
                                     </form>
                                 </a>
                            </div>
                          </div><!--fin del text-center -->
                        </td>
                       
                        
                        <div id="AGREGAR_CITA<?php echo $var1 ?>" class="modal fade" role="dialog">
                          <div class="modal-dialog modal-lg">
                            <div class="modal-content"><!-- Modal content-->
                              <form  method="POST"  class="needs-validation" novalidate>
                                <div class="modal-header" style="background-color: #0CCDE3">
                                  <h4 class="text-center">Programar cita </h4>
                                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                <div class="modal-body"><!--CUERPO DEL MODAL -->
                                  <div class="row"><!-- INICIO PRIMERA ROW --> 
                                        <input type="text" value ="<?php echo $var6; ?>" hidden  class="form-control" name="codigo_persona">
                                  </div><!--fin row -->
                                  <div class="row">
                                      <div class="col-sm-6">
                                        <div class="form-group">
                                          <label for="txtcodigo_persona">Nombre del paciente:</label>
                                          <input type="text"  readonly value ="<?php echo $var3; ?>" class="form-control" name="nombre_paciente">
                                        </div>
                                      </div>
                                      <div class="col-sm-3">
                                        <div class="form-group">
                                          <label for="txtcodigo_persona">DNI:</label>
                                          <input type="text"   class="form-control"readonly value ="<?php echo $var4; ?>" >
                                        </div>
                                      </div>
                                      <div class="col-sm-3">
                                        <div class="form-group">
                                          <label for="txtcodigo_persona">Hora cita:</label>
                                    <input type="time" required min="09:00:00"  step="1800" max= "19:00:00"  step="1800"class="form-control" name="hora_cita" id="agregar_hora">
                                        </div>
                                         <div class="invalid-feedback">
                                            Llene este campo.
                                         </div>
                                      </div>
                                  </div><!--fin row -->
                                  <div class="row">
                                      <div class="col-sm-9 mb-3">
                                       <?php
                                        $query= "SELECT concat_ws (' ',tp.PRIMER_NOMBRE,tp.PRIMER_APELLIDO, ' , ' 'Especialidad:', te.NOMBRE )  
                                        as ESPECIALISTA ,tpe.CODIGO_PERSONA_ESPECIALIDAD 
                                        from tbl_persona tp ,
                                        tbl_persona_especialidad tpe,
                                        tbl_especialidad  te 
                                        where  tp.CODIGO_PERSONA = tpe.CODIGO_PERSONA
                                        AND te.CODIGO_ESPECIALIDAD= tpe.CODIGO_ESPECIALIDAD and te.CODIGO_AREA = 2
                                        ";
                                        $result1= $conn->query($query);
                                        ?>
                                         <div class="form-group">
                                            <label for="txtcodigo_especialista">Medico</label>
                                            <select class="form-control select2" name="codigo_medico" required>
                                                <option selected disabled value= "">--Seleccione un Medico--</option>
                                                 <?php
                                                    if ($result1->num_rows > 0){
                                                    while($row = $result1->fetch_assoc()){ 
                                                    ?>
                                                    <option value="<?php echo $row['CODIGO_PERSONA_ESPECIALIDAD'];?>"><?php echo $row['ESPECIALISTA'];?></option>
                                                    <?php
                                                    }
                                                    }
                                                    ?>
                                            </select>
                                            <div class="invalid-feedback">
                                                Llene este campo.
                                            </div>
                                        </div>
                                       </div>
                                       <div class="col-sm-3">
                                       <?php
                                          date_default_timezone_set("America/Guatemala");
                                          $Fechaactual=  date('Y-m-d'); 
                                          $fechamaxima= date("Y-m-d",strtotime($Fechaactual."+ 2 month"));
                                          ?>
                                          <div class="form-group">
                                              <label for="fecha" class="form-label">Fecha de la cita </label>
                                                <input type="date" min= "<?= $Fechaactual?>" 
                                                max="<?= date("$fechamaxima")?>"
                                                class="form-control" 
                                                name="fecha_cita" required>
                                          </div>
                                          <div class="invalid-feedback">
                                                Llene este campo.
                                            </div>
                                        </div>
                                  </div><!--fin row -->
                                  
                                </div><!--fin modal body -->
                                <div class="modal-footer ">
                                  <button type="button" name="ELI" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                                  <button type="submit" name="REGISTRAR_CITA_PACIENTE"  id = "edit_cita" class="btn btn-success"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Registra cita</button>
                                </div><!--FIN DEL DIV DE BOTONES DE GUARDAR -->
                              </form>
                            </div>
                          </div>
                        </div><!--fin modal AGREGAR -->
                      </tr>
                      <?php
                        }
                        }
                      ?>
                    </tbody>
                 </table>
                </div>
               </div>
              </div>
            </form><!--fin del form -->
            </div>
          </div>
        </div> 
      </div><!-- card del menu-->
     </section>
  </div> 
</div>   
<div>
</div>



<script type="text/javascript"> 
   //funcion de mostrar el estilo de la datatable
  $(document).ready( function () {
      $('#tabla_pacientes').DataTable({
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
        "search": "Buscar Paciente:",
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
<!-- Elaborado por Diana Rut  -->
