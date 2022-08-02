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
    Fecha:             02/08/2022
    Programador:       Diana Rut Garcia 
    descripcion:       Muestra el expediente MEDICO del estudiante en modo de consulta ,coN opcion de descarga del mismo
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
  if (isset($_POST['persona'])) {
       $codigo_persona =($_POST['persona']);
    }  
 ?>
<head>
</head>
<body oncopy="return false" onpaste="return false"></body>
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
           <div class="card">
              <div class="modal-footer">
                <button onclick="location.href='crudPacientesMedicos'"  type="button"  style="color:white;"class="btn btn- lg btn-success"><span><i class="nav-icon fa fa-arrow-left mx-2"></i></span>Regresar</button>
                <form method="POST"  action="Vistas/REPORTE.php" target="_blank">
                  <input type="hidden" name="expediente" value="<?php echo $codigo_persona?>">
                  <button type='submit'  style="color:white; background-color:#FA0079;" class=" form-control btn "><span><i class="nav-icon fa fa-file-pdf mx-1"></i></span>Reporte</button> 
                </form>
              </div>
             <hr>
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
                            <label >Nombre del Paciente</label>
                            <input  type="text"  value ="<?php echo $nombre; ?>" class="form-control" >
                        </div>
                    </div>
                    <div class="col-sm-2">
                        <div class="form-group">
                            <label >DNI</label>
                            <input  type="text"  value ="<?php echo $dni;  ?>" class="form-control" >
                        </div>
                    </div>
                    <div class="col-sm-2">
                        <div class="form-group">
                            <label >Teléfono</label>
                            <input  type="text"  value ="<?php echo $telefono; ?>" class="form-control">
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="form-group">
                            <label >Correo Electrónico</label>
                            <input  type="text"  value ="<?php echo $correo;  ?>" class="form-control">
                        </div>
                    </div>
                    <div class="col-sm-2">
                        <div class="form-group">
                            <label >Sexo</label>
                            <input  type="text"  value ="<?php echo $sexo;  ?>" class="form-control" >
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="form-group">
                            <label >Lugar Nacimiento</label>
                            <input  type="text"  value ="<?php echo $lugar; ?>" class="form-control">
                        </div>
                    </div>
                    <div class="col-sm-2">
                        <div class="form-group">
                            <label >Fecha Nacimiento</label>
                            <input  type="text"  value ="<?php echo $fecha ?>" class="form-control">
                        </div>
                    </div>
                    <div class="col-sm-2">
                        <div class="form-group">
                            <label >Edad</label>
                            <input  type="text"  value ="<?php echo $edad ." años";?>" class="form-control">
                        </div>
                    </div>
                </div><!--Fin del row --> 
                <br>
                <h5>Datos Expediente Clínico</h5>
                <hr color="blue">
                <?php
                    $consulta = "SELECT exp.CODIGO_EXPEDIENTE, concat(per.PRIMER_NOMBRE,' ',per.PRIMER_APELLIDO) as nombre, san.TIPO as TIPO_SANGRE, exp.TRATAMIENTOS, exp.ENFERMEDADES, ale.NOMBRE as ALERGIAS, tra.TIPO as TRASTORNOS, apa.TIPO as APARIENCIA
                    FROM tbl_expediente_medico exp, tbl_persona per, tbl_personas_alergias alep, tbl_personas_transtornos trap, tbl_personas_apariencia apap, tbl_alergias ale, tbl_transtornos_corporales tra, tbl_apariencia_fisica apa, tbl_tipo_sangre san
                    WHERE exp.CODIGO_PERSONA = per.CODIGO_PERSONA
                    AND exp.CODIGO_EXPEDIENTE = alep.CODIGO_EXPEDIENTE_PERSONA
                    AND exp.CODIGO_EXPEDIENTE = trap.CODIGO_EXPEDIENTE
                    AND exp.CODIGO_EXPEDIENTE = apap.CODIGO_EXPEDIENTE
                    AND alep.CODIGO_ALERGIAS = ale.CODIGO_ALERGIAS
                    AND trap.CODIGO_TRANSTORNO = tra.CODIGO_TRANSTORNO
                    AND apap.CODIGO_APARIENCIA = apa.CODIGO_APARIENCIA
                    AND exp.CODIGO_TIPO_SANGRE = san.CODIGO_TIPO_SANGRE and exp.CODIGO_PERSONA = '$codigo_persona'
                    GROUP by exp.CODIGO_PERSONA ;";
                    $resul=$conn->query($consulta);
                    if ($resul->num_rows > 0) {
                        while($row = $resul->fetch_assoc()) { 
                        $sangre = $row['TIPO_SANGRE'];
                        $tratamientos = $row['TRATAMIENTOS'];
                        $enfermedades = $row['ENFERMEDADES'];
                        $alergias = $row['ALERGIAS'];
                        $trastornos = $row['TRASTORNOS'];
                        $apariencia = $row['APARIENCIA'];
                      } 
                    }
                    ?>
                <div class="row">
                    <div class="col-sm-3">
                        <div class="form-group">
                            <label >Tratamientos</label>
                            <textarea type="text" class="form-control" ><?php echo $tratamientos ?></textarea>
                        </div>
                    </div>
                    <div class="col-sm-2">
                        <div class="form-group">
                            <label >Enfermedades</label>
                            <textarea type="text" class="form-control" ><?php echo $enfermedades ?></textarea>
                        </div>
                    </div>
                    <div class="col-sm-2">
                        <div class="form-group">
                            <label >Alergias</label>
                            <textarea type="text" class="form-control"><?php echo $alergias ?></textarea>
                        </div>
                    </div>
                    <div class="col-sm-2">
                        <div class="form-group">
                            <label >Trastornos</label>
                            <textarea type="text" class="form-control" ><?php echo $trastornos ?></textarea>
                        </div>
                    </div>
                    <div class="col-sm-2">
                        <div class="form-group">
                            <label >Apariencia</label>
                            <textarea type="text" class="form-control" ><?php echo $apariencia ?></textarea>
                        </div>
                    </div>
                    <div class="col-sm-1">
                        <div class="form-group">
                            <label >Tipo Sangre</label>
                            <input  type="text"  value ="<?php echo $sangre;?>" class="form-control">
                        </div>
                    </div>
                    <?php
                    
                    ?>
                </div><!--Fin del row del expediente -->
                <hr>
                <br>
                <!--NAV DE CITAS MEDICAS -->
                <nav>
                  <div class="nav nav-tabs" id="nav-tab" role="tablist">
                    <button class="nav-link active" id="nav-home-tab" data-toggle="tab" data-target="#nav-home" type="button" role="tab" aria-controls="nav-home" aria-selected="true">Citas Finalizadas</button>
                    <button class="nav-link" id="nav-profile-tab" data-toggle="tab" data-target="#nav-profile" type="button" role="tab" aria-controls="nav-profile" aria-selected="false">Citas Pendientes</button>
                  </div>
                </nav>
                <div class="tab-content" id="nav-tabContent">
                    <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                    <br>
                    <h5>Citas Medicas Finalizadas</h5>
                    <hr color="blue">
                      <div class="table-responsive">
                       <table id="tabla_citas" class="table table-bordered table-striped">
                            <thead style=" background-color:#73E8FD;">
                                <tr>
                                    <th class="text-center">Acción</th>
                                    <th class="text-center">Fecha Cita</th>
                                    <th class="text-center">Hora</th>
                                    <th class="text-center">Medico</th>
                                </tr>
                            </thead>
                            <tbody>
                            <?php
                                $consulti = "SELECT con.FECHA_CREACION, con.CODIGO_CONSULTA, pe.CODIGO_PERSONA, con.CODIGO_CITA, con.SINTOMAS, 
                                con.DIAGNOSTICO_INGRESO, con.EVOLUCION, con.DIAGNOSTICO_EGRESO, pre.PESO, pre.MASA_CORPORAL, pre.ESTATURA, 
                                pre.TEMPERATURA, pre.PULSO, pre.FRECUENCIA_CARDIACA, pre.FRECUENCIA_RESPIRATORIA, pre.DESNUTRICION, 
                                GROUP_CONCAT(med.NOMBRE_MEDICAMENTO) AS NOMBRE_MEDICAMENTO, GROUP_CONCAT(exa.EXAMEN_MEDICO) as NOMBRE_EXAMEN,
                                CONCAT_WS(' ',pee.PRIMER_NOMBRE,pee.SEGUNDO_NOMBRE,pee.PRIMER_APELLIDO,pee.SEGUNDO_APELLIDO) as  MEDICO,
                                i.HORARIO AS HORA
                                FROM tbl_inscripcion_cita i, tbl_persona pe , tbl_estado est, tbl_consulta_medica con, tbl_preclinica pre,
                                tbl_examenes_pacientes exap, tbl_examenes_medicos exa, tbl_receta_medica recp, tbl_medicamento med ,tbl_persona_especialidad pes, tbl_persona pee
                                WHERE i.CODIGO_PERSONA = pe.CODIGO_PERSONA
                                AND pes.CODIGO_PERSONA_ESPECIALIDAD = i.CODIGO_ESPECIALISTA
                                AND pee.CODIGO_PERSONA = pes.CODIGO_PERSONA
                                AND i.CODIGO_ESTADO = est.CODIGO_ESTADO
                                AND i.CODIGO_CITA = pre.CODIGO_CITA
                                AND con.CODIGO_CITA = i.CODIGO_CITA
                                AND con.CODIGO_PRECLINICA = pre.CODIGO_PRECLINICA
                                AND con.CODIGO_CONSULTA = recp.CODIGO_CONSULTA
                                AND recp.CODIGO_MEDICAMENTO = med.CODIGO_MEDICAMENTO
                                AND exap.CODIGO_CONSULTA = con.CODIGO_CONSULTA
                                AND exap.CODIGO_EXAMEN_MEDICO = exa.CODIGO_EXAMEN_MEDICO
                                AND  i.AREA_CITA = '2'
                                AND pe.CODIGO_PERSONA= '$codigo_persona'
                                GROUP BY con.CODIGO_CONSULTA;";
                                $resul=$conn->query($consulti);
                                ?>
                                <?php
                                    if ($resul->num_rows > 0) {
                                    while($row = $resul->fetch_assoc()) { 
                                    $codigo_consulta = $row['CODIGO_CONSULTA'];
                                    $sintomas = $row['SINTOMAS'];
                                    $diagnostico_ingreso = $row['DIAGNOSTICO_INGRESO'];
                                    $evolucion = $row['EVOLUCION'];
                                    $diagnostico_egreso = $row['DIAGNOSTICO_EGRESO'];
                                    $fecha = $row['FECHA_CREACION'];
                                    $MEDICO = $row['MEDICO'];
                                    $HORA = $row['HORA'];
                                    $peso = $row['PESO'];
                                    $estatura = $row['ESTATURA'];
                                    $masa = $row['MASA_CORPORAL'];
                                    $pulso = $row['PULSO'];
                                    $tempe = $row['TEMPERATURA'];
                                    $fc = $row['FRECUENCIA_CARDIACA'];
                                    $fr = $row['FRECUENCIA_RESPIRATORIA'];
                                    $desnutricion = $row['DESNUTRICION'];
                                    $medicamentos = $row['NOMBRE_MEDICAMENTO'];
                                    $examenes = $row['NOMBRE_EXAMEN'];
                                ?>
                                <tr>
                                    <td>
                                    <div class="text-center">
                                        <div class="btn-group">
                                            <a href="#VER_CITA<?php echo $fecha; ?>" data-toggle="modal">
                                            <button type='button' id="btnGuardar"  style="color:white;"class="form-control btn btn-success"><span>Ver Detalles</span></button>
                                            </a>
                                        </div>
                                    </div>
                                    </td>
                                    <td class="text-center"><?php echo $fecha; ?></td>
                                    <td class="text-center"><?php echo $HORA; ?></td>
                                    <td class="text-center"><?php echo $MEDICO; ?></td>

                                <div id="VER_CITA<?php echo $fecha ?>" class="modal fade" role="dialog" >
                                  <div class="modal-dialog modal-xl">
                                     <div class="modal-content"><!-- Modal content-->
                                        <div class="modal-header" style="background-color: #0CCDE3">
                                            <h4 class="text-center">Información Consulta</h4>
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        </div>
                                       <form id="FORMEDITRAPERSONAS" method="POST" >
                                         <div class="modal-body"><!--CUERPO DEL MODAL -->
                                            <h5>Datos Preclínica</h5> 
                                            <hr COLOR="blue">
                                            <div class="row"><!-- INICIO PRIMERA ROW --> 
                                                <div class="col-sm-1">
                                                    <div class="form-group">
                                                        <label for="txtcodigo_persona">Peso</label>
                                                        <input value="<?php echo $peso; ?>" type="text" readonly class="form-control">
                                                    </div>
                                                </div>
                                                <div class="col-sm-2">
                                                    <div class="form-group">
                                                        <label for="txtcodigo_persona">Estatura</label>
                                                        <input  type="text" value="<?php echo $estatura; ?>" readonly class="form-control">
                                                    </div>
                                                </div>
                                                <div class="col-sm-2">
                                                    <div class="form-group">
                                                        <label for="txtcodigo_persona">Temperatura</label>
                                                        <input  type="text"  value="<?php echo $tempe; ?>" readonly class="form-control">
                                                    </div>
                                                </div>
                                                <div class="col-sm-2">
                                                    <div class="form-group">
                                                        <label for="txtcodigo_persona">Masa</label>
                                                        <input  type="text"  value="<?php echo $masa; ?>" readonly class="form-control">
                                                    </div>
                                                </div>
                                                <div class="col-sm-2">
                                                    <div class="form-group">
                                                        <label for="txtcodigo_persona">FC</label>
                                                        <input  type="text" value="<?php echo $fc; ?>"readonly class="form-control">
                                                    </div>
                                                </div>
                                                <div class="col-sm-1">
                                                    <div class="form-group">
                                                        <label for="txtcodigo_persona">FR</label>
                                                        <input  type="text" value="<?php echo $fr; ?>" readonly class="form-control">
                                                    </div>
                                                </div>
                                                <div class="col-sm-2">
                                                    <div class="form-group">
                                                        <label for="txtcodigo_persona">Pulso</label>
                                                        <input  type="text" value="<?php echo $pulso; ?>" readonly class="form-control">
                                                    </div>
                                                </div>
                                            </div> <!-- FIN DE EL PRIMER ROW --> 
                                            <hr>
                                            <h5>Datos de la Consulta</h5>
                                            <hr color="blue">
                                            <div class="row">
                                               <div class="col-sm-3">
                                                    <div class="form-group">
                                                        <label for="txtcodigo_persona">Síntomas</label>
                                                        <textarea  readonly type="text" class="form-control"><?php echo $sintomas; ?></textarea>
                                                    </div>
                                                </div>
                                                <div class="col-sm-3">
                                                    <div class="form-group">
                                                        <label for="txtcodigo_persona">Diagnóstico Ingreso</label>
                                                        <textarea readonly type="text" class="form-control"><?php echo $diagnostico_ingreso; ?></textarea>
                                                    </div>
                                                </div>
                                                <div class="col-sm-3">
                                                    <div class="form-group">
                                                        <label for="txtcodigo_persona">Evolución</label>
                                                        <textarea readonly type="text" class="form-control"><?php echo $evolucion; ?></textarea>
                                                    </div>
                                                </div>
                                                <div class="col-sm-3">
                                                    <div class="form-group">
                                                        <label for="txtcodigo_persona">Diagnóstico Egreso</label>
                                                        <textarea readonly type="text" class="form-control"><?php echo $diagnostico_egreso; ?></textarea>
                                                    </div>
                                                </div>
                                            </div><!--fin row-->
                                            <h5>Recetas/Medicamentos recetados</h5>
                                            <hr color="blue">
                                            <div class="row">
                                               <div class="col-sm-6">
                                                    <div class="form-group">
                                                        <label for="txtcodigo_persona">Medicamentos Recetados</label>
                                                        <textarea readonly type="text" class="form-control"><?php echo $medicamentos; ?></textarea>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6">
                                                    <div class="form-group">
                                                        <label for="txtcodigo_persona">Examenes Recetados</label>
                                                        <textarea readonly  type="text" class="form-control"><?php echo $examenes; ?></textarea>
                                                    </div>
                                                </div>
                                            </div>
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
                      </div>
                    </div><!--fin citas finalizadas -->
                    <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
                     <br><h5>Citas Medicas Pendientes</h5>
                     <hr color="blue">
                     <table id="citas" class="table table-bordered table-striped">
                        <thead style=" background-color:#73E8FD;">
                           <tr>
                             <th class="text-center">Fecha Cita</th>
                             <th class="text-center">Hora</th>
                             <th class="text-center">Medico</th>
                             <th class="text-center">Estado</th>
                            </tr>
                        </thead>
                        <tbody>
                          <?php
                            $query = " SELECT  IC.CODIGO_CITA,P.CODIGO_PERSONA,IC.FECHA_CITA,IC.HORARIO , IC.CODIGO_PERSONA ,IC.CODIGO_ESPECIALISTA , CONCAT_WS(' ',P.PRIMER_NOMBRE, P.SEGUNDO_NOMBRE, P.PRIMER_APELLIDO,P.SEGUNDO_APELLIDO) AS 
                            MEDICO , CONCAT_WS(' ',OT.PRIMER_NOMBRE, OT.SEGUNDO_NOMBRE, OT.PRIMER_APELLIDO,OT.SEGUNDO_APELLIDO) AS PACIENTE, IC.CODIGO_ESTADO ,est.NOMBRE as nombre_estado, ar.NOMBRE as nombre_area, espe.NOMBRE as nombre_especialidad
                            FROM tbl_inscripcion_cita IC 
                            left join tbl_persona_especialidad E   on IC.CODIGO_ESPECIALISTA = E.CODIGO_PERSONA_ESPECIALIDAD 
                            left join  tbl_persona P               on P.CODIGO_PERSONA = E.CODIGO_PERSONA
                            left join tbl_persona OT               on OT.CODIGO_PERSONA = IC.CODIGO_PERSONA 
                            left join tbl_area a                   on IC.AREA_CITA = a.CODIGO_AREA 
                            left join tbl_estado est               on IC.CODIGO_ESTADO = est.CODIGO_ESTADO
                            left join tbl_area ar                  on IC.AREA_CITA = ar.CODIGO_AREA 
                            left join tbl_especialidad espe        on E.CODIGO_ESPECIALIDAD = espe.CODIGO_ESPECIALIDAD   
                            where   IC.CODIGO_PERSONA = '$codigo_persona' AND  IC.CODIGO_ESTADO =5 and IC.AREA_CITA =2; ";
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
                               <td class="text-center"><?php echo $var2; ?></td>
                               <td class="text-center"><?php echo $var3; ?></td>
                               <td class="text-center"><?php echo $var5; ?></td>
                               <td class="text-center"><?php echo $var6; ?></td>
                            </tr>
                            <?php
                             }
                             }
                            ?>
                        </tbody>
                     </table>
                    </div><!--Fin citas pendientes -->
                </div>
              </div> <!--card-body -->
          </div><!-- card-->
        </div><!--FINAL DE COL-M12-->
      </div><!-- FINAL ROW PADRE -->
    </div><!-- FINAL CONTAINER FLUID --> 
  </section><!-- FINAL SECTION -->

  
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
