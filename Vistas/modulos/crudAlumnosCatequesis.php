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
    Programa:          Mantenimiento de los alumnos de catequisis
    Fecha:             05-abril-2022
    Programador:        Arnold Caballero
    descripcion:       Permite llevar un mantenimiento de los alumnos de catequisis ,editar,eliminar nuevo
-----------------------------------------------------------------------
  Historial de Cambio
-----------------------------------------------------------------------
    Programador               Fecha                      Descripcion
  ANY HERNANDEZ         		11-06-2022                 revision de ortagrafia 
  Diana Rut              		09/07/2022                 Cambio en el titulo
----------------------------------------------------------------------->

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
        <section class="content-header text-xl-center mb-3 ">
              <h4> Lista de Jóvenes <i class="nav-icon fas fa-graduation-cap"></i><p style="font-style: italic; color:#3757FF"><?php echo "Catequesis de ".ucwords(strtolower($_SESSION['catequesis'])) ?></p> </h4>
        </section>
      <div class="card"> <!--card del menu-->
        <div class="card-header" style="background-color:#B3F2FF;">
        <ul class="nav nav-tabs card-header-tabs">
            <li class="nav-item">
            <a class=" nav-link" style="color:#000000;" href="crudTutorEspiritual">Lista de Catequesis</a>
            </li>
            <li class="nav-item">
            <a class=" nav-link active" style="color:#000000;" href="#">Lista de Jóvenes</a>
            </li>
          </ul>
        </div>
        <div class="card-body">
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
                          $codigo_carga_espiritual  = $_SESSION['carga_espiritual'];
                          $nombre_catquesis = $_SESSION['catequesis'];
                      ?>
      <form method="POST" action="Reportes_Prosecar/reporteAlumnosCatequesis.php" target="_blank">
         <input type="text"  hidden value="<?php echo $cod_usuario; ?>" name="codigo_tutor_espiritual">
         <input type="text"  hidden value="<?php echo $codigo_carga_espiritual; ?>" name="codigo_carga_espritual">

        <button  type="submit" title='Imprimir'  id="btnGuardar"  style="color:white; background-color:#FA0079" class="btn btn-danger mb-3"> <span><i class="nav-icon fa fa-file-pdf mx-1"></i></span>Reporte</button>
        </form>


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
                        <th class="text-center">Número</th>
                        <th class="text-center">Alumno</th>
                        <th class="text-center">Catequesis</th>
                        <th class="text-center">Grado</th>
                        <th class="text-center">Hora</th>
                        <th class="text-center">Año</th>
                        <th class="text-center">Período</th>
                        <th class="text-center">Estado Matrícula</th>
                        <th class="text-center">Acción</th>
                      </tr>
                    </thead>
                    <tbody>

                    

                      <?php
                          $codigo_carga  = $_SESSION['carga_espiritual'];
                      ?>
                    <?php
                      $query = "SELECT   mat.CODIGO_MATRICULA, concat_ws(' ',per.PRIMER_NOMBRE, per.SEGUNDO_NOMBRE, per.PRIMER_APELLIDO) as ALUMNO ,t.NOMBRE as NOMBRE_TUTORIA ,
                      s.NOMBRE AS SECCION, c.HORA, C.ANIO, c.PERIODO, esta.NOMBRE AS ESTADO_MATRICULA, 	mat.OBSERVACION_MATRICULA, mat.OBSERVACION
                      FROM tbl_carga_academica c ,tbl_tutoria t, tbl_persona p, tbl_modalidad m , tbl_seccion s, tbl_matricula_academica mat, tbl_estudiante est, tbl_persona per, tbl_estado esta
                      WHERE c.CODIGO_PERSONA= p.CODIGO_PERSONA 
                      AND c.CODIGO_TUTORIA= t.CODIGO_TUTORIA
                      AND c.CODIGO_MODALIDAD= m.CODIGO_MODALIDA 
                      AND c.CODIGO_SECCION = s.CODIGO_SECCION
                      AND c.CODIGO_CARGA = mat.CODIGO_CARGA
                      AND mat.CODIGO_ESTUDIANTE = est.CODIGO_ESTUDIANTE
                      AND mat.OBSERVACION = esta.CODIGO_ESTADO
                      AND est.CODIGO_PERSONA = per.CODIGO_PERSONA
                      AND mat.CODIGO_CARGA =  '$codigo_carga'
                      AND c.CODIGO_PERSONA = '$cod_usuario'; ";
                      
                      $result = $conn->query($query);
                      if ($result->num_rows > 0) {
                          $contador=0;
                        while($row = $result->fetch_assoc()) {
                          $contador=$contador+1;
                          $var1 = $row['ALUMNO'];
                          $var2 = $row['NOMBRE_TUTORIA'];
                          $var3 = $row['SECCION'];
                          $hora = $row['HORA'];
                          $var4 = $row['ANIO'];
                          $var5 = $row['PERIODO'];
                          $var6 = $row['ESTADO_MATRICULA'];
                          $codigo_estado_matricula = $row['OBSERVACION'];
                          $codigo_matricula = $row['CODIGO_MATRICULA'];
                          $observacion_matricula = $row['OBSERVACION_MATRICULA'];             
                      ?>
                       
                      <tr>
                      <?php
                            if($codigo_estado_matricula == 13){// si el codigo de estado de la matricula es igual a 13 que es ya finalizado el texto de los datos de la tabla cambian a rojo y tachado
                        ?>
                        <td class="text-center" style="color:#FA0079;text-decoration: line-through;"><?php echo $contador; ?></td>
                        <td class="text-center" style="color:#FA0079;text-decoration: line-through;"><?php echo $var1; ?></td>
                        <td class="text-center" style="color:#FA0079;text-decoration: line-through;"><?php echo $var2; ?></td>                      
                        <td class="text-center" style="color:#FA0079;text-decoration: line-through"><?php echo $var3; ?></td>
                        <td class="text-center" style="color:#FA0079;text-decoration: line-through"><?php echo $hora; ?></td>
                        <td class="text-center" style="color:#FA0079;text-decoration: line-through"><?php echo $var4; ?></td>
                        <td class="text-center" style="color:#FA0079;text-decoration: line-through"><?php echo $var5; ?></td>
                        <td class="text-center" style="color:#FA0079;text-decoration: line-through"><?php echo $var6; ?></td>

                        <?php
                            }else{ //si no e; texto de los datos de la tabla no cambian
                        ?>
                           
                        <td class="text-center"><?php echo $contador; ?></td>
                        <td class="text-center"><?php echo $var1; ?></td>
                        <td class="text-center"><?php echo $var2; ?></td>                      
                        <td class="text-center"><?php echo $var3; ?></td>
                        <td class="text-center"><?php echo $hora; ?></td>
                        <td class="text-center"><?php echo $var4; ?></td>
                        <td class="text-center"><?php echo $var5; ?></td>
                        <td class="text-center"><?php echo $var6; ?></td>
                        <?php
                            }
                        ?>
                        <td>
                          <div class="text-center">
                            <div class="btn-group">
                                <!--Codigo para asignar permiso del boton de editar -->
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
                                    $evaluar_permiso->execute(array($usuariomo, '52'));
                                    $row1=$evaluar_permiso->fetchColumn();
                                      $permiso_registrar =$row1;             
                                    }
                                    ?> <!-- fin del codigo para sustraer el permiso de insertar.-->       
                                    <?php
                                    if($permiso_registrar == 'SI'){
                                    ?>

                                <?php
                                   if($codigo_estado_matricula == 13){ //si el codigo de estado de la matricula es igual a 13 que es ya finalizado el color del boton a rojo y tachado
                                  ?>
                                 
                                  <a href="#CALIFICAR_CATEQUESIS<?php echo $codigo_matricula; ?>" data-toggle="modal">
                                   <button type='button' id="btnGuardar"  style="color:white;text-decoration: line-through"class="form-control btn btn-danger"><span>Observación</span></button>
                                  </a>

                                  <?php
                                    }else{ //sino el boton permanene en verde
                                  ?>
                                  <a href="#CALIFICAR_CATEQUESIS<?php echo $codigo_matricula; ?>" data-toggle="modal">
                                   <button type='button' id="btnGuardar"  style="color:white;"class="form-control btn btn-success"><span>Observación</span></button>
                                  </a>


                                  <?php
                                    }
                                  ?>

                                  <?php
                                    }
                                  ?>
                                  
                            </div>
                          </div><!--fin del text-center -->
                        </td>
                       
                        
                        <div id="CALIFICAR_CATEQUESIS<?php echo $codigo_matricula ?>" class="modal fade" role="dialog">
                          <div class="modal-dialog modal-lg">
                            <div class="modal-content"><!-- Modal content-->
                              
                                <div class="modal-header" style="background-color: #0CCDE3">
                                  <h4 class="text-center">Agregar Observación </h4>
                                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                <form  method="POST"  class="needs-validation" novalidate>
                                <div class="modal-body"><!--CUERPO DEL MODAL -->
                                  <div class="row"><!-- INICIO PRIMERA ROW --> 
                                        <input type="text" value ="<?php echo $codigo_matricula; ?>" hidden  class="form-control" name="codigo_matricula_alumno">
                                  </div><!--fin row -->
                                  <div class="row">
                                      <div class="col-sm-6">
                                        <div class="form-group">
                                          <label for="txtcodigo_persona">Nombre</label>
                                          <input type="text"  readonly value ="<?php echo $var1; ?>" class="form-control" name="nombre_paciente">
                                        </div>
                                      </div>
                                      <div class="col-sm-3">
                                        <div class="form-group">
                                          <label for="txtcodigo_persona">Catequesis</label>
                                          <input type="text"   class="form-control"readonly value ="<?php echo $var2; ?>" >
                                        </div>
                                      </div>
                                      <div class="col-sm-3">
                                        <div class="form-group">
                                          <label for="txtcodigo_persona">Grado</label>
                                          <input type="text"  readonly value ="<?php echo $var3; ?>" class="form-control">

                                        </div>
                                         <div class="invalid-feedback">
                                           Campo Obligatorio.
                                         </div>
                                      </div>
                                  </div><!--fin row -->
                                  <div class="row">
                                  <div class="col-sm-3">
                                       <div class="form-group">
                                           <label for="fecha" class="form-label">Hora</label>
                                           <input type="text"  readonly value ="<?php echo $hora; ?>" class="form-control">
                                       </div>
                                     </div>
                                     <div class="col-sm-3">
                                       <div class="form-group">
                                           <label for="fecha" class="form-label">Período</label>
                                           <input type="text"  readonly value ="<?php echo $var5; ?>" class="form-control">
                                       </div>
                                     </div>
                                      <div class="col-sm-6 mb-3">
                                       <?php
                                        $query= "SELECT es.CODIGO_ESTADO ,es.NOMBRE AS Nombre_estado
                                        FROM tbl_estado es  WHERE es.CODIGO_ESTADO = 7 or  es.CODIGO_ESTADO = 9 or  es.CODIGO_ESTADO = 13
                                        ;
                                        ";
                                        $result1= $conn->query($query);
                                        ?>
                                         <div class="form-group">
                                            <label for="txtcodigo_especialista">Estado de matrícula</label>
                                            <select class="form-control select2" name="codigo_estado" required>
                                                <option selected disabled autocomplete = "off" value=""><?php echo $var6; ?></option>
                                                 <?php
                                                    if ($result1->num_rows > 0){
                                                    while($row = $result1->fetch_assoc()){ 
                                                    ?>
                                                    <option value="<?php echo $row['CODIGO_ESTADO'];?>"><?php echo $row['Nombre_estado'];?></option>
                                                    <?php
                                                    }
                                                    }
                                                    ?>
                                            </select>
                                            <div class="invalid-feedback">
                                            Campo Obligatorio.
                                            </div>
                                        </div>
                                       </div>
                                      
                                  </div><!--fin row -->
                                  <div class="row">
                                      <div class="col-sm-12">
                                          <div class="form-group">
                                              <label for="observacion_catequesis" class="form-label">Observación del rendimiento del Jóven</label>
                                                <textarea type="textarea" onkeypress="return soloLetrasComa(event);" name="observacion_catequesis" class="form-control"> <?php echo $observacion_matricula;?> </textarea>

                                          </div>
                                      </div>
                                  </div>
                                  
                                </div><!--fin modal body -->
                                <div class="modal-footer ">
                                  <button type="button" name="ELI" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                                  <button type="submit" name="MODIFICAR_OBSERVACION_CATEQUESIS"  class="btn btn-success"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Modificar Observación</button>
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

<script>
      function soloLetrasComa(e){
       key = e.keyCode || e.which;
       tecla = String.fromCharCode(key).toLowerCase();
       letras = " áéíóúabcdefghijklmnñopqrstuvwxyz ,.";
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

