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
    Fecha:             09-Junio-2022
    Programador:       Diana Rut Garcia 
    descripcion:       Muestra el expediente del estudiante en modo de consulta ,com opcion de descarga del mismo
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
  if (isset($_POST['codigo_estu'])) {
       $persona =($_POST['codigo_estu']);
       $codigo_persona =($_POST['codigo_persona']);
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
          <div class="card ">
              
              <div class="modal-footer">
                <button onclick="location.href='ediusuariosestudiantes'"  type="button"  style="color:white;"class="btn btn- lg btn-success"><span><i class="nav-icon fa fa-arrow-left mx-2"></i></span>Regresar</button>
                <form method="post"  action="Reportes_Prosecar/reporteEstudiante.php" target="_blank">
                 <input type="text" hidden name="reporte_codigo"  value="<?php echo $codigo_persona; ?>"> 
                  <input type="text" hidden name="reporte_estudiante"  value="<?php echo $persona; ?>">
                  <button type='submit'  style="color:white; background-color:#FA0079" class="btn btn-danger "><span><i class="nav-icon fa fa-file-pdf mx-1"></i></span>Reporte</button> 
                </form>
              </div>
             <hr>
            <form  method="POST"class="needs-validation" novalidate><!-- form start -->
              <div class="card-body">
                <h5>Datos Personales Estudiante</h5>
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
                    where  est.CODIGO_ESTUDIANTE = '$persona';";
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
                            <label >Correo</label>
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
                <h5>Datos Escolares</h5>
                <hr color="blue">
                <?php
                $consulta = "SELECT  es.GRADO_ACTUAL, es.REPITENTE, es.INDICE_ACADEMICO, es.MATE_BAJO_RENDI, es.PASATIEMPOS,
                es.DISTRACTORES_ESCOLARES, es.METAS
                FROM tbl_estudiante es
                WHERE es.CODIGO_ESTUDIANTE = '$persona'";
                $resul=$conn->query($consulta);
                if ($resul->num_rows > 0) {
                  while($row = $resul->fetch_assoc()) { 
                    $var1 = $row['GRADO_ACTUAL'];
                    $var2 = $row['REPITENTE'];
                    $var3 = $row['INDICE_ACADEMICO'];
                    $var4 = $row['MATE_BAJO_RENDI'];
                    $var5 = $row['PASATIEMPOS'];
                    $var6 = $row['DISTRACTORES_ESCOLARES'];
                    $var7 = $row['METAS'];
                  }
                }
                  ?>
                <div class="row">
                   <div class="col-sm-4">
                        <div class="form-group">
                            <label >Grado Actual</label>
                            <input  type="text"  value ="<?php echo $var1;  ?>" class="form-control"  maxlength="15" minlength="1" onkeyup="mayus(this);" autocomplete = "off" type="text"  name="editGRADOACTUAL" id="editar_estudiante" 
                            autocomplete ="off" required ="">
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="form-group">
                            <label >Repitente</label>
                            <input  type="text"  value ="<?php echo $var2;  ?>" class="form-control"  maxlength="15" minlength="1" onkeyup="mayus(this);" autocomplete = "off" type="text"  name="editGRADOACTUAL" id="editar_estudiante" 
                            autocomplete ="off" required ="">
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="form-group">
                            <label >Indíce Académico</label>
                            <input  type="text"  value ="<?php echo $var3; ?>" class="form-control"  maxlength="15" minlength="1" onkeyup="mayus(this);" autocomplete = "off" type="text"  name="editGRADOACTUAL" id="editar_estudiante" 
                            autocomplete ="off" required ="">
                        </div>
                    </div>
                </div>
                <div class="row">
                   <div class="col-sm-4">
                        <div class="form-group">
                            <label >Pasatiempos</label>
                            <textarea  type="text" class="form-control"><?php echo $var5;  ?></textarea>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="form-group">
                            <label >Distractores Escolares</label>
                            <textarea  type="text"   class="form-control"><?php echo $var6;  ?></textarea>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="form-group">
                            <label >Metas</label>
                            <textarea  type="text"  value ="" class="form-control"><?php echo $var7;  ?></textarea>
                        </div>
                    </div>
                </div>
                <hr><br>
                <!--espacio para la informacion de parientes -->
                <h5>Situacion familiar (Personas con quienes vive)</h5>
                <hr color="blue">
                <table  class="table table-bordered table-striped">
                <thead style=" background-color:#73E8FD;">
                  <tr>
                  <th>Nombre</th>
                    <th>Edad</th>
                    <th>Estado civil</th>
                    <th>Parentesco</th>
                    <th>Nivel educativo</th>
                    <th>Ingresos Mensuales</th>
                    <th>Iglesia asiste</th>
                  </tr>
                </thead>
                <tbody>
                <tr>
                <?php
                $consulta = "SELECT fest.CODIGO_FAMILIAR_ESTUDIANTE, fam.CODIGO_FAMILIAR,  concat_ws(' ', per.PRIMER_NOMBRE, per.PRIMER_APELLIDO) as FAMILIAR,
                per.FECHA_NACIMIENTO ,fam.ESTADO_CIVIL, fam.NIVEL_EDUCATIVO, fam.INGRESOS_DE_FAMILIAR, fam.NOMBRE_IGLESIA, par.NOMBRE as PARENTESCO
                from tbl_persona per, tbl_familiar fam, tbl_estudiante est, tbl_familiares_estudiante fest, tbl_parentesco par
                WHERE per.CODIGO_PERSONA = fam.CODIGO_PERSONA
                AND fest.CODIGO_ESTUDIANTE = est.CODIGO_ESTUDIANTE
                AND fest.CODIGO_FAMILIAR = fam.CODIGO_FAMILIAR
                AND fest.CODIGO_PARENTESCO = par.CODIGO_PARENTESCO
                AND fest.CODIGO_ESTUDIANTE = '$persona'
                GROUP by fam.CODIGO_FAMILIAR;";
                $resul=$conn->query($consulta);
                if ($resul->num_rows > 0) {
                  while($row = $resul->fetch_assoc()) { 
                    $nombre = $row['FAMILIAR'];
                    $estadocivil = $row['ESTADO_CIVIL'];
                    $Parentesco = $row['PARENTESCO'];
                    $Nivel = $row['NIVEL_EDUCATIVO'];
                    $Ingresos = $row['INGRESOS_DE_FAMILIAR'];
                    $Iglesia = $row['NOMBRE_IGLESIA'];
                    $fecha = $row['FECHA_NACIMIENTO'];

                    $fechaEntera = strtotime($fecha);
                    $f = date("Y");
                    $anio = date("Y", $fechaEntera);
                    $edad = $f - $anio;
                  ?>
                <td style="text-align: center"><?php echo ucwords(strtolower($nombre)); ?></td>
                <td style="text-align: center"><?php echo ucwords(strtolower($edad)); ?></td>
                <td style="text-align: center"><?php echo ucwords(strtolower($estadocivil)); ?></td>
                <td style="text-align: center" ><?php echo ucwords(strtolower($Parentesco)); ?></td>
                <td style="text-align: center"><?php echo ucwords(strtolower($Nivel)); ?></td>
                <td style="text-align: center"><?php echo ucwords(strtolower($Ingresos)); ?></td>
                <td style="text-align: center"><?php echo ucwords(strtolower($Iglesia)); ?></td>
                
                </tr>
                <?php
                  }
                  }
                ?>
              </tbody>
              </table>
              <hr><br>
              
                <h5>Tutorias Matriculadas</h5>
                <hr color="blue">
                <div class="table-responsive text-center">
                <table  id="tabla_roles" class="table table-bordered table-striped" >
                        <thead style=" background-color:#73E8FD;">
                        <th class="text-center">Acción</th>
                          <th class="text-center">Nombre Tutoría</th>
                          <th class="text-center">Grado</th>
                          <th class="text-center">Año</th>
                          <th class="text-center">Período</th>
                          <th class="text-center">Año</th>
                        </thead>
                    <tbody>
                        <tr>
                        <?php
                      $query = "SELECT   mat.CODIGO_MATRICULA, concat_ws(' ',per.PRIMER_NOMBRE, per.SEGUNDO_NOMBRE, per.PRIMER_APELLIDO) as ALUMNO ,t.NOMBRE as NOMBRE_TUTORIA ,s.NOMBRE AS SECCION, c.HORA, C.ANIO, c.PERIODO, esta.NOMBRE AS ESTADO_MATRICULA
                      FROM tbl_carga_academica c ,tbl_tutoria t, tbl_persona p, tbl_modalidad m , tbl_seccion s, tbl_matricula_academica mat, tbl_estudiante est, tbl_persona per, tbl_estado esta
                      WHERE c.CODIGO_PERSONA= p.CODIGO_PERSONA 
                      AND c.CODIGO_TUTORIA= t.CODIGO_TUTORIA
                      AND c.CODIGO_MODALIDAD= m.CODIGO_MODALIDA 
                      AND c.CODIGO_SECCION = s.CODIGO_SECCION
                      AND c.CODIGO_CARGA = mat.CODIGO_CARGA
                      AND mat.CODIGO_ESTUDIANTE = est.CODIGO_ESTUDIANTE
                      AND mat.OBSERVACION = esta.CODIGO_ESTADO
                      AND est.CODIGO_PERSONA = per.CODIGO_PERSONA
                      AND mat.CODIGO_ESTUDIANTE = '$persona'; ";
                      
                      $result = $conn->query($query);
                      if ($result->num_rows > 0) {
                          $contador=0;
                        while($row = $result->fetch_assoc()) {
                          $contador=$contador+1;
                          $var2 = $row['NOMBRE_TUTORIA'];
                          $var3 = $row['SECCION'];
                          $var4 = $row['ANIO'];
                          $var5 = $row['PERIODO'];
                          $var6 = $row['ESTADO_MATRICULA'];
                          
                      ?>
                   <tr>
                        <td style="text-align: center"><?php echo $contador; ?></td>
                        <td style="text-align: center"><?php echo  ucwords(strtolower($var2)); ?></td>                      
                        <td style="text-align: center"><?php echo  ucwords(strtolower($var3)); ?></td>
                        <td style="text-align: center"><?php echo  ucwords(strtolower($var4)); ?></td>
                        <td style="text-align: center"><?php echo  ucwords(strtolower($var5)); ?></td>
                        <td style="text-align: center"><?php echo  ucwords(strtolower($var6)); ?></td>
                   </tr>
                    <?php
                        }
                        }
                      ?>
                        </tr>
                    </tbody>
                </table>
                </div>
                <hr><br>
                <h5>Citas Medicas</h5>
                <hr color="blue">
                
            <table class="table table-bordered table-striped">
              <thead style=" background-color:#73E8FD;">
                    <tr>
                     <th class="text-center">Fecha Cita</th>
                     <th class="text-center">Medico</th>
                     <th class="text-center">Hora</th>
                    </tr>
              </thead>
          <tbody>
            
          <?php
            $consulta = "SELECT con.FECHA_CREACION, con.CODIGO_CONSULTA, pe.CODIGO_PERSONA, con.CODIGO_CITA,
            CONCAT_WS(' ',pee.PRIMER_NOMBRE,pee.SEGUNDO_NOMBRE,pee.PRIMER_APELLIDO,pee.SEGUNDO_APELLIDO) as  MEDICO,
            i.HORARIO AS HORA
              FROM tbl_inscripcion_cita i, tbl_persona pe , tbl_estado est, tbl_consulta_medica con, tbl_preclinica pre,
             tbl_examenes_pacientes exap, tbl_examenes_medicos exa, tbl_receta_medica recp, tbl_medicamento med ,tbl_persona_especialidad pes, tbl_persona pee
              WHERE i.CODIGO_PERSONA = pe.CODIGO_PERSONA
              AND pes.CODIGO_PERSONA_ESPECIALIDAD = i.CODIGO_ESPECIALISTA
              AND pee.CODIGO_PERSONA = pes.CODIGO_PERSONA
              AND i.CODIGO_CITA = pre.CODIGO_CITA
              AND con.CODIGO_CITA = i.CODIGO_CITA
              AND con.CODIGO_CONSULTA = recp.CODIGO_CONSULTA
              AND exap.CODIGO_CONSULTA = con.CODIGO_CONSULTA
              AND  i.AREA_CITA = '2'
              AND pe.CODIGO_PERSONA= '$codigo_persona'
              GROUP BY con.CODIGO_CONSULTA;";
            $resul=$conn->query($consulta);
            if ($resul->num_rows > 0) {
              while($row = $resul->fetch_assoc()) { 
                $Hora_medi = $row['HORA'];
                $creacion = $row['FECHA_CREACION'];
                $medico = $row['MEDICO'];

              ?>
                  <tr>
                  <td style="text-align: center"><?php echo ucwords(strtolower($creacion)); ?></td>
                  <td style="text-align: center"><?php echo ucwords(strtolower($medico)); ?></td>
                  <td style="text-align: center"><?php echo ucwords(strtolower($Hora_medi)); ?></td>
                  </tr>
                </tbody>
                <?php
                  }
                  }
                ?>
            </table>
              <hr><br>
                <h5>Citas Psicológicas</h5>
                <hr color="blue">
                <table class="table table-bordered table-striped">
              <thead style=" background-color:#73E8FD;">
                <tr>
                  <th class="text-center">Fecha Cita</th>
                  <th class="text-center">Psicólogo</th>
                  <th class="text-center">Hora</th>
                </tr>
                </thead>
                <tbody>
                <?php
                 $consulti = "SELECT con.FECHA_CREACION, cit.HORARIO AS HORA,
                  CONCAT_WS(' ',pee.PRIMER_NOMBRE,pee.SEGUNDO_NOMBRE,pee.PRIMER_APELLIDO,pee.SEGUNDO_APELLIDO) as  MEDICO
                 FROM tbl_expediente_psicologico_consulta con , tbl_inscripcion_cita cit, tbl_persona per, tbl_plan_terapeutico pla,tbl_persona pee, tbl_persona_especialidad pes
                 WHERE con.CODIGO_CITA = cit.CODIGO_CITA
                 AND pee.CODIGO_PERSONA = pes.CODIGO_PERSONA
                 AND pes.CODIGO_PERSONA_ESPECIALIDAD = cit.CODIGO_ESPECIALISTA
                 AND cit.CODIGO_PERSONA = per.CODIGO_PERSONA
                 AND pla.CODIGO_CONSULTA = con.CODIGO_EXPEDIENTE_PSICO
                 AND cit.AREA_CITA = '3'
                 AND cit.CODIGO_PERSONA = '$codigo_persona'";
                  $resul=$conn->query($consulti);
                  if ($resul->num_rows > 0) {
                    while($row = $resul->fetch_assoc()) { 
                    $fecha_psico= $row['FECHA_CREACION'];
                    $hora_psico = $row['HORA'];
                    $psicologo = $row['MEDICO'];
                    ?>
                  <tr>
                  <td style="text-align: center"><?php echo ucwords(strtolower($fecha_psico)); ?></td>
                  <td style="text-align: center"><?php echo ucwords(strtolower($psicologo)); ?></td>
                  <td style="text-align: center"><?php echo ucwords(strtolower($hora_psico)); ?></td>
                  </tr>
                </tbody>
                <?php
                  }
                  }
                ?>
            </table>
               
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
      $('#tabla_roles').DataTable({
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
        "search": "Buscar Alergia:",
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

<script>
     $(document).ready( function () {
      $("input").on("keypress", function () {
       $input=$(this);
       setTimeout(function () {
        $input.val($input.val().toUpperCase());
       },50);
      })
     })
</script>


    </script>