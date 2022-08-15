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
    Programa:          Consulta del Estudiante
    Fecha:             30-julio-2022
    Programador:       Diana Rut Garcia 
    descripcion:       Muestra el expediente psicologico del estudiante en modo de consulta ,com opcion de descarga del mismo
-----------------------------------------------------------------------
  Historial de Cambio
-----------------------------------------------------------------------
    Programador               Fecha                      Descripcion
----------------------------------------------------------------------->
<?php
 include_once "conexion.php";
 include_once "conexion3.php";
 include "conexionpdo.php";
?>
<?php
  if (isset($_POST['personita'])) {
       $codigo_persona =($_POST['personita']);
    }  
 ?>
<head>
</head>
<body ></body>
<div class="content-wrapper">
  <div class="content-header">
    <div class="container-fluid">
    </div><!-- /.container-fluid -->
  </div>
  <section class="content">
    <div class="container-fluid">
    <div class="content-header text-xl-center mb-3 ">

    </div>
      <div class="row">
        <div class="col-md-12">
        <?php
         include "conexionpdo.php";
         $usuario=$_SESSION['vario'];
          //Evaluo si existe el tipo de Rol
          $evaluar_usuario = $db->prepare("SELECT CODIGO_TIPO_ROL FROM tbl_usuario WHERE NOMBRE_USUARIO = (?);");
          $evaluar_usuario->execute(array($usuario));
          $row=$evaluar_usuario->fetchColumn();
          if($row > 0){
           $usuariomo = $row;//capturo el nombre del ROl en la variable para usarla en el Procedimiento almacenado
           $evaluar_permiso = $db->prepare("CALL Sp_permiso_insertar(?,?);");
           $evaluar_permiso->execute(array($usuariomo, '30'));
           $row1=$evaluar_permiso->fetchColumn();
            $permiso_registrar =$row1;             
           }
          ?> <!-- fin del codigo para sustraer el permiso de insertar.-->       
          <?php
          if($permiso_registrar == 'SI'){
          ?>
            
          <!-- Inicios del card -->
          <?php
           }
          ?>
          <div class="card">
              <div class="modal-footer">
                <button onclick="location.href='crudPacientesPsicologicos'"  type="button"  style="color:white;"class="btn btn- lg btn-success"><span><i class="nav-icon fa fa-arrow-left mx-2"></i></span>Regresar</button>
                <form method="post"  action="Reportes_Prosecar/reporteHistorialPsicologia.php" target="_blank">
                  <input type="hidden" name="reporteHistoricoPsicologico" value="<?php echo $codigo_persona?>">
                  <button type='submit' style="color:white; background-color:#FA0079" class=" form-control btn btn "><span><i class="nav-icon fa fa-file-pdf mx-1"></i></span>Reporte</button> 
                </form>
              </div>
             <hr>
            <form  method="POST"class="needs-validation" novalidate><!-- form start -->
              <div class="card-body">
                <h5>Datos Personales Paciente</h5>
                <hr color="blue">
                <div class="row">
                    <?php
                    $query = "SELECT CONCAT_WS(' ', p.PRIMER_NOMBRE, p.SEGUNDO_NOMBRE,p.PRIMER_APELLIDO, p.SEGUNDO_APELLIDO) AS NOMBRE, u.CODIGO_USUARIO, est.CODIGO_ESTUDIANTE, p.CODIGO_PERSONA, p.DNI,
                     t.NUMERO_TELEFONO, c.correo_persona, p.DIRECCION,p.FECHA_NACIMIENTO,p.LUGAR_NACIMIENTO,se.SEXO
                    FROM tbl_usuario u
                    left join tbl_roles r on r.CODIGO_TIPO_ROL = u.CODIGO_TIPO_ROL
                    left join tbl_estado e on e.CODIGO_ESTADO = u.CODIGO_ESTADO
                    left join tbl_persona p on p.CODIGO_PERSONA = u.CODIGO_PERSONA
                    left join tbl_correo_electronico c on c.CODIGO_PERSONA = p.CODIGO_PERSONA
                    left join tbl_telefono t on t.CODIGO_PERSONA = p.CODIGO_PERSONA
                    left join tbl_estudiante est on est.CODIGO_PERSONA = p.CODIGO_PERSONA
                    left join  tbl_sexo se on p.SEXO = se.CODIGO_SEXO
                    where  p.CODIGO_PERSONA = '$codigo_persona';";
                    $resul=$conn->query($query);  
                    if($resul->num_rows > 0){
                    while($row = $resul->fetch_assoc()){
                        $nombre = $row['NOMBRE'];
                        $dni = $row['DNI'];
                        $sexo = $row['SEXO'];
                        $fecha = $row['FECHA_NACIMIENTO'];
                        $lugar = $row['LUGAR_NACIMIENTO'];
                        $telefono = $row['NUMERO_TELEFONO'];
                        $direccion = $row['DIRECCION'];
                        $correo = $row['correo_persona'];

                        $fechaEntera = strtotime($fecha);
                        $f = date("Y");
                        $anio = date("Y", $fechaEntera);
                        $edad = $f - $anio;
                    }
                    }
                   ?>
                   <div class="col-sm-8">
                        <div class="form-group">
                            <label >Nombre del Estudiante</label>
                            <input  type="text"  value ="<?php echo $nombre; ?>" class="form-control"  maxlength="15" minlength="1" onkeyup="mayus(this);" autocomplete = "off" type="text"  name="editGRADOACTUAL" id="editar_estudiante" 
                            autocomplete ="off" required ="">
                        </div>
                    </div>
                    <div class="col-sm-2">
                        <div class="form-group">
                            <label >DNI</label>
                            <input  type="text"  value ="<?php echo $dni;  ?>" class="form-control"  maxlength="15" minlength="1" onkeyup="mayus(this);" autocomplete = "off" type="text"  name="editGRADOACTUAL" id="editar_estudiante" 
                            autocomplete ="off" required ="">
                        </div>
                    </div>
                    <div class="col-sm-2">
                        <div class="form-group">
                            <label >Teléfono</label>
                            <input  type="text"  value ="<?php echo $telefono; ?>" class="form-control"  maxlength="15" minlength="1" onkeyup="mayus(this);" autocomplete = "off" type="text"  name="editGRADOACTUAL" id="editar_estudiante" 
                            autocomplete ="off" required ="">
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="form-group">
                            <label >Correo Electrónico</label>
                            <input  type="text"  value ="<?php echo $correo;  ?>" class="form-control"  maxlength="15" minlength="1" onkeyup="mayus(this);" autocomplete = "off" type="text"  name="editGRADOACTUAL" id="editar_estudiante" 
                            autocomplete ="off" required ="">
                        </div>
                    </div>
                    <div class="col-sm-2">
                        <div class="form-group">
                            <label >Sexo</label>
                            <input  type="text"  value ="<?php echo $sexo;  ?>" class="form-control"  maxlength="15" minlength="1" onkeyup="mayus(this);" autocomplete = "off" type="text"  name="editGRADOACTUAL" id="editar_estudiante" 
                            autocomplete ="off" required ="">
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="form-group">
                            <label >Lugar Nacimiento</label>
                            <input  type="text"  value ="<?php echo $lugar; ?>" class="form-control"  maxlength="15" minlength="1" onkeyup="mayus(this);" autocomplete = "off" type="text"  name="editGRADOACTUAL" id="editar_estudiante" 
                            autocomplete ="off" required ="">
                        </div>
                    </div>
                    <div class="col-sm-2">
                        <div class="form-group">
                            <label >Fecha Nacimiento</label>
                            <input  type="text"  value ="<?php echo $fecha ?>" class="form-control"  maxlength="15" minlength="1" onkeyup="mayus(this);" autocomplete = "off" type="text"  name="editGRADOACTUAL" id="editar_estudiante" 
                            autocomplete ="off" required ="">
                        </div>
                    </div>
                    <div class="col-sm-2">
                        <div class="form-group">
                            <label >Edad</label>
                            <input  type="text"  value ="<?php echo $edad ." años";?>" class="form-control"  maxlength="15" minlength="1" onkeyup="mayus(this);" autocomplete = "off" type="text"  name="editGRADOACTUAL" id="editar_estudiante" 
                            autocomplete ="off" required ="">
                        </div>
                    </div>
                </div> 
            <br>
              <hr>
              <h5>Expediente Psicológico</h5>
              <hr color="blue">
              <?php
                $consulta = "SELECT exp.CODIGO_EXPEDIENTE, CONCAT_WS(' ',per.PRIMER_NOMBRE,per.SEGUNDO_NOMBRE,per.PRIMER_APELLIDO,per.SEGUNDO_APELLIDO) as nombr, exp.ANTECEDENTES_FAMILIARES, 
                exp.ANTECEDENTES_PERSONALES, exp.ANTECEDENTES_CLINICOS, GROUP_CONCAT(sin.TIPO) as TIPO
                FROM tbl_expediente_psicologico_unico exp, tbl_persona per, tbl_personas_sintomas psin, tbl_sintomas_neuroticos sin            			       
                WHERE exp.CODIGO_PERSONA = per.CODIGO_PERSONA
                AND exp.CODIGO_EXPEDIENTE = psin.CODIGO_EXPEDIENTE
                AND psin.CODIGO_SINTOMA_NEUROTICO = sin.CODIGO_SINTOMA_NEUROTICO
                AND exp.CODIGO_PERSONA = '$codigo_persona'";
                $resul=$conn->query($consulta);
                if ($resul->num_rows > 0) {
                    while($row = $resul->fetch_assoc()) { 
                    $var1 = $row['ANTECEDENTES_FAMILIARES'];
                    $var2 = $row['ANTECEDENTES_PERSONALES'];
                    $var3 = $row['ANTECEDENTES_CLINICOS'];
                    $var4 = $row['TIPO'];
                    ?>
              <div class="row">
                <div class="col-sm-3">
                 <div class="form-group">
                    <label>Antecedentes Personales</label>
                    <textarea class="form-control"><?php echo $var2; ?></textarea>
                 </div>
                </div>
                <div class="col-sm-3">
                 <div class="form-group">
                    <label>Antecedentes Familiares</label>
                    <textarea class="form-control"><?php echo $var1; ?></textarea>
                 </div>
                </div>
                <div class="col-sm-3">
                 <div class="form-group">
                    <label>Antecedentes Clínicos</label>
                    <textarea class="form-control"><?php echo $var3; ?></textarea>
                 </div>
                </div>
                <div class="col-sm-3">
                 <div class="form-group">
                    <label>Síntomas Neuróticos</label>
                    <textarea class="form-control"><?php echo $var4; ?></textarea>
                 </div>
                </div>
              </div>
              <?php
             }
             }
            ?>
            <hr>
            <ul class="nav nav-tabs" id="myTab" role="tablist">
              <li class="nav-item" role="presentation">
                <button class="nav-link active" id="home-tab" data-toggle="tab" data-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true">Citas Finalizadas</button>
              </li>
              <li class="nav-item" role="presentation">
                <button class="nav-link" id="profile-tab" data-toggle="tab" data-target="#profile" type="button" role="tab" aria-controls="profile" aria-selected="false">Citas Pendientes</button>
              </li>

            </ul>
            <div class="tab-content" id="myTabContent">
              <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab"><!--INICIO DEL TAB DE CITAS  -->
              <br>
              <h5>Citas Psicológicas</h5>
            <hr color="blue">
            <table id="tabla_citas" class="table table-bordered table-striped">
              <thead style=" background-color:#73E8FD;">
                <tr>
                  <th class="text-center">Acción</th>
                  <th class="text-center">Fecha Cita</th>
                  <th class="text-center">Psicólogo</th>
                  <th class="text-center">Hora</th>
                </tr>
                </thead>
                <tbody>
                <?php
                $consulti = "SELECT con.FECHA_CREACION, con.SINTOMAS, con.DIAGNOSTICO_INGRESO, con.DIAGNOSTICO_EGRESO, con.OBSEVARCIONES,
                pla.ACTIVIDAD, pla.TECNICA, pla.MATERIALES, pla.TAREAS, pla.RESULTADOS, cit.HORARIO AS HORA,
                CONCAT_WS(' ',pee.PRIMER_NOMBRE,pee.SEGUNDO_NOMBRE,pee.PRIMER_APELLIDO,pee.SEGUNDO_APELLIDO) as  MEDICO
                FROM tbl_expediente_psicologico_consulta con 
                LEFT JOIN  tbl_inscripcion_cita cit ON con.CODIGO_CITA = cit.CODIGO_CITA
                LEFT JOIN tbl_persona_especialidad pes ON  pes.CODIGO_PERSONA_ESPECIALIDAD = cit.CODIGO_ESPECIALISTA
                LEFT JOIN tbl_persona pee ON  pee.CODIGO_PERSONA = pes.CODIGO_PERSONA
                LEFT JOIN tbl_persona per ON  cit.CODIGO_PERSONA = per.CODIGO_PERSONA
                LEFT JOIN  tbl_persona_especialidad espe ON espe.CODIGO_PERSONA_ESPECIALIDAD = cit.CODIGO_ESPECIALISTA
                LEFT JOIN  tbl_plan_terapeutico pla ON pla.CODIGO_CONSULTA = con.CODIGO_EXPEDIENTE_PSICO
                WHERE  cit.AREA_CITA = '3' AND cit.CODIGO_PERSONA = '$codigo_persona'
                ORDER BY con.FECHA_CREACION DESC;";
                    $resul=$conn->query($consulti);
                ?>
                <?php
                    if ($resul->num_rows > 0) {
                    while($row = $resul->fetch_assoc()) { 
                    $sintomas = $row['SINTOMAS'];
                    $diagnostico_ingreso = $row['DIAGNOSTICO_INGRESO'];
                    $diagnostico_egreso = $row['DIAGNOSTICO_EGRESO'];
                    $observaciones = $row['OBSEVARCIONES'];
                    $fecha = $row['FECHA_CREACION'];
                    $hora = $row['HORA'];
                    $psicologo = $row['MEDICO'];
                    $actividades = $row['ACTIVIDAD'];
                    $tecnicas = $row['TECNICA'];
                    $materiales = $row['MATERIALES'];
                    $tareas = $row['TAREAS'];
                    $resultados = $row['RESULTADOS'];
                ?>
                  <tr>
                  <td>
                    <div class="text-center">
                        <div class="btn-group">
                          <a href="#CITA<?php echo $fecha; ?>" data-toggle="modal">
                            <button type='button' id="btnGuardar"  style="color:white;"class="btn btn-success"><span> <i></i></span>Ver Detalles</button>
                          </a>
                        </div>
                    </div>
                  </td>
                  <td style="text-align: center"><?php echo ucwords(strtolower($fecha)); ?></td>
                  <td style="text-align: center"><?php echo ucwords(strtolower($psicologo)); ?></td>
                  <td style="text-align: center"><?php echo ucwords(strtolower($hora)); ?></td>

                       <div id="CITA<?php echo $fecha; ?>" class="modal fade" role="dialog" >
                            <div class="modal-dialog modal-lg">
                              <div class="modal-content"><!-- Modal content-->
                                <div class="modal-header" >
                                    <h4 class="text-center">Información de la Cita</h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                <form  method="POST" >
                                  <div class="modal-body"><!--CUERPO DEL MODAL -->
                                  <h5>Datos Consulta</h5>
                                   <hr color="blue">
                                    <div class="row"><!-- INICIO PRIMERA ROW -->  
                                      <div class="col-sm-6">
                                        <div class="form-group">
                                          <label for="txtcodigo_persona">Síntomas</label>
                                          <textarea readonly type="text" class="form-control"type="text"  ><?php echo $sintomas; ?></textarea>
                                        </div>
                                      </div>
                                      <div class="col-sm-6">
                                        <div class="form-group">
                                          <label for="txtcodigo_persona">Diagnóstico Ingreso</label>
                                          <textarea readonly type="text" class="form-control"type="text"  ><?php echo $diagnostico_ingreso; ?></textarea>
                                          <div class="invalid-feedback">
                                            Campo obligatorio.
                                          </div>
                                        </div>
                                      </div>
                                    </div> <!-- FIN DE EL PRIMER ROW -->
                                    <div class="row"><!-- INICIO PRIMERA ROW -->  
                                      <div class="col-sm-6">
                                        <div class="form-group">
                                          <label for="txtcodigo_persona">Evolución</label>
                                          <textarea  type="text" readonly class="form-control"type="text"  ><?php echo $observaciones; ?></textarea>
                                        </div>
                                      </div>
                                      <div class="col-sm-6">
                                        <div class="form-group">
                                          <label for="txtcodigo_persona">Diagnóstico Egreso</label>
                                          <textarea  type="text"  readonly class="form-control"type="text"  ><?php echo $diagnostico_egreso; ?></textarea>
                                          <div class="invalid-feedback">
                                            Campo obligatorio.
                                          </div>
                                        </div>
                                      </div>
                                    </div> <!-- FIN DE EL PRIMER ROW --> 
                                    <H5>Datos del Plan Terapéutico</H5>
                                    <hr color="blue">
                                    <?php 
                                     if($actividades == '' and $tecnicas == '' and $materiales == '' and $tareas == '' and $resultados == ''){
                                        $plan = 'No hay plan Terapéutico para esta cita.';  
                                    ?>
                                    <p > <?php  echo $plan; ?></p>
                                    <?php
                                     }else{ 
                                    ?>
                                    <div class="row">
                                      <div class="col-sm-6">
                                        <div class="form-group">
                                          <label for="txtcodigo_persona">Actividades a realizar</label>
                                          <textarea  type="text" readonly class="form-control"type="text"  ><?php echo $actividades; ?></textarea>
                                          <div class="invalid-feedback">
                                            Campo obligatorio.
                                          </div>
                                        </div>
                                      </div>
                                      <div class="col-sm-6">
                                        <div class="form-group">
                                          <label for="txtcodigo_persona">Tecnicas</label>
                                          <textarea  type="text" readonly class="form-control"type="text"  ><?php echo $tecnicas; ?></textarea>
                                          <div class="invalid-feedback">
                                            Campo obligatorio.
                                          </div>
                                        </div>
                                      </div>
                                      <div class="col-sm-6">
                                        <div class="form-group">
                                          <label for="txtcodigo_persona">Tareas</label>
                                          <textarea  type="text" readonly class="form-control"type="text"  ><?php echo $tareas; ?></textarea>
                                          <div class="invalid-feedback">
                                            Campo obligatorio.
                                          </div>
                                        </div>
                                      </div>
                                      <div class="col-sm-6">
                                        <div class="form-group">
                                          <label for="txtcodigo_persona">Materiales</label>
                                          <textarea  type="text" readonly class="form-control"type="text"  ><?php echo $materiales; ?></textarea>
                                          <div class="invalid-feedback">
                                            Campo obligatorio.
                                          </div>
                                        </div>
                                      </div>
                                      <div class="col-sm-12">
                                        <div class="form-group">
                                          <label for="txtcodigo_persona">Resultados</label>
                                          <textarea  type="text" readonly class="form-control"type="text"  ><?php echo $resultados; ?></textarea>
                                          <div class="invalid-feedback">
                                            Campo obligatorio.
                                          </div>
                                        </div>
                                      </div>

                                    </div><!--Fin del row del plan terapeutico -->
                                    <?php
                                      } 
                                      ?>
                                    
                                  </div><!--FINAL DEL CARD BODY -->                       
                                  <div class="modal-footer ">
                                    <button type="button" name="ELI" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>     
                                  </div><!--FIN DEL DIV DE BOTONES DE GUARDAR -->
                                </div>
                              </form>
                            </div>
                          </div><!-- FIN DEL MODAL EDITAR --> 
                  </tr>
                  <?php
                   }
                   }
                 ?>
                </tbody>
            </table>
              </div><!--FINAL DEL TAB DE CITAS FINALIZADAS -->
              <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                <br>
                <H5>Citas Psicológicas Pendientes</H5>
                <hr color="blue">
                <table id="citas"class="table table-bordered table-striped">
                  <thead style=" background-color:#73E8FD;">
                   <tr>
                    <th class="text-center">#</th>
                     <th class="text-center">Fecha Cita</th>
                     <th class="text-center">Hora</th>
                     <th class="text-center">Psicólogo</th>
                     <th class="text-center">Estado</th>
                   </tr>
                  </thead>
                  <tbody>
                  <?php
                  $query = "SELECT  IC.CODIGO_CITA,IC.FECHA_CITA,IC.HORARIO , IC.CODIGO_PERSONA ,IC.CODIGO_ESPECIALISTA , CONCAT_WS(' ',P.PRIMER_NOMBRE, P.SEGUNDO_NOMBRE, P.PRIMER_APELLIDO,P.SEGUNDO_APELLIDO) AS 
                  MEDICO , CONCAT_WS(' ',OT.PRIMER_NOMBRE, OT.SEGUNDO_NOMBRE, OT.PRIMER_APELLIDO,OT.SEGUNDO_APELLIDO) AS PACIENTE, IC.CODIGO_ESTADO ,est.NOMBRE as nombre_estado, ar.NOMBRE as nombre_area, espe.NOMBRE as nombre_especialidad
                  FROM tbl_inscripcion_cita IC 
                  left join tbl_persona_especialidad E   on IC.CODIGO_ESPECIALISTA = E.CODIGO_PERSONA_ESPECIALIDAD 
                  left join  tbl_persona P               on P.CODIGO_PERSONA = E.CODIGO_PERSONA
                  left join tbl_persona OT               on OT.CODIGO_PERSONA = IC.CODIGO_PERSONA 
                  left join tbl_area a                   on IC.AREA_CITA = a.CODIGO_AREA 
                  left join tbl_estado est               on IC.CODIGO_ESTADO = est.CODIGO_ESTADO
                  left join tbl_area ar                  on IC.AREA_CITA = ar.CODIGO_AREA 
                  left join tbl_especialidad espe        on E.CODIGO_ESPECIALIDAD = espe.CODIGO_ESPECIALIDAD   
                  where   IC.CODIGO_PERSONA = '$codigo_persona' AND  IC.CODIGO_ESTADO =5 and IC.AREA_CITA =3;";
                  $result = $conn->query($query);
                  if ($result->num_rows > 0) {
                    $contador = 0;
                    while ($row = $result->fetch_assoc()) {
                        $contador = ($contador+1);
                        $var1 = $row['CODIGO_CITA'];
                        $var2 = $row['FECHA_CITA'];
                        $var3 = $row['HORARIO'];
                        $var4 = $row['PACIENTE'];
                        $var5 = $row['MEDICO'];
                        $var6 = $row['nombre_estado'];
                  ?>
                  <tr>
                  <td class="text-center"><?php echo $contador; ?></td>
                  <td class="text-center"><?php echo $var2; ?></td>
                  <td class="text-center"><?php echo $var3; ?></td>
                  <td class="text-center"><?php echo ucwords(strtolower($var5));?></td>
                  <td class="text-center"><?php echo $var6; ?></td>

                  </tr>
                  <?php
                   }
                   }
                   ?>
                  </tbody>
                </table>

              </div><!--FIN DEL TAB DE CITAS PENDIENTES -->
              
            </div>
             <br>
              </div> <!-- /.card-body -->
            </form>
          </div><!-- fINAL DEL card PRIMARY -->
        </div><!--FINAL DE COL-M12-->
      </div><!-- FINAL ROW PADRE -->
    </div><!-- FINAL CONTAINER FLUID --> 
  </section><!-- FINAL SECTION -->

  
   <script>
    function Descargar() {
      window.open('Reportes_Prosecar/reporteAlergia.php','_blank');
      window.open(this.href,'_self');
    }

  </script>

<script type="text/javascript"> 
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
        "zeroRecords": "No encontrado",
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
<script type="text/javascript"> 
  $(document).ready( function () {
      $('#citas').DataTable({
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
        "zeroRecords": "No encontrado",
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




    </script>