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
              <h4>Lista de Tutorías  <p style="font-style: italic; color:chocolate"><?php echo "Tutor Académico ".$_SESSION['vario'] ?></p><i class="nav-icon"></i> </h4>
        </section>
      <div class="card"> <!--card del menu-->
        <div class="card-header" style="background-color:#B3F2FF;">
         <ul class="nav nav-tabs card-header-tabs">
            <li class="nav-item">
            <a class=" nav-link active" style="color:#000000;" href="crudTutoriasTutor">Lista de Tutorías</a>
            </li>
            <li class="nav-item">
            <a class=" nav-link" style="color:#000000;" href="#">Lista de Alumnos</a>
            </li>
          </ul>
        </div>
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
        
        <div class="card-body">

        <form method="POST" action="Reportes_Prosecar/reporteTutoriasTutor.php" target="_blank">
         <input type="text"  hidden value="<?php echo $cod_usuario; ?>" name="codigo_tutor">
        <button  type="submit" title='Imprimir'  style="color:white;"   id="btnGuardar"  style="color:white; background-color:#FA0079" class="btn btn-danger mb-3"> <span><i class="nav-icon fa fa-file-pdf mx-1"></i></span>Generar Reporte</button>
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
                        <th class="text-center">Código</th>
                        <th class="text-center">Tutoría</th>
                        <th class="text-center">Grado</th>
                        <th class="text-center">Hora</th>
                        <th class="text-center">Período</th>
                        <th class="text-center">Año</th>
                        <th class="text-center">Notas Alumnos</th>
                      </tr>
                    </thead>
                    <tbody>

                   
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
                        $contador = 0;
                        while($row = $result->fetch_assoc()) {
                          $contador = $contador +1;
                          $var1 = $row['NOMBRE_TUTORIA'];
                          $var2 = $row['SECCION'];
                          $var3 = $row['HORA'];
                          $var4 = $row['PERIODO'];
                          $var5 = $row['ANIO'];
                          $codigo_carga = $row['CODIGO_CARGA'];
                          
                          
                      ?>
                      <tr>
                        <td class="text-center"><?php echo $contador; ?></td>
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
                                        include "conexionpdo.php";
                                        $usuario=$_SESSION['vario'];
                                          //Evaluo si existe el tipo de Rol
                                          $evaluar_usuario = $db->prepare("SELECT CODIGO_TIPO_ROL FROM tbl_usuario WHERE NOMBRE_USUARIO = (?);");
                                          $evaluar_usuario->execute(array($usuario));
                                          $row=$evaluar_usuario->fetchColumn();
                                          if($row > 0){
                                          $usuariomo = $row;//capturo el nombre del ROl en la variable para usarla en el Procedimiento almacenado
                                          $evaluar_permiso = $db->prepare("CALL Sp_permiso_insertar(?,?);");
                                          $evaluar_permiso->execute(array($usuariomo, '38'));
                                          $row1=$evaluar_permiso->fetchColumn();
                                            $permiso_registrar =$row1;             
                                          }
                                          ?> <!-- fin del codigo para sustraer el permiso de insertar.-->       
                                          <?php
                                          if($permiso_registrar == 'SI'){
                                          ?>
                                 
                                            
                                        
                                  <form method="POST">
                                    <input type="text"  hidden value="<?php echo $codigo_carga; ?>" name="codigo_carga_matricula">
                                    <input type="text"  hidden value="<?php echo $var1; ?>" name="name_matricula">
                                   <button type="submit" style="color:white;"class="form-control btn btn-success"><span>Lista Alumnos</span></button>
                                  </form>
                                  <?php
                                           }
                                        ?>
                            </div>
                          </div><!--fin del text-center -->
                        </td>
                       
                        
                        
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
        "search": "Buscar Tutoría:",
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

<script>
    function Descargar() {
      window.open('Reportes_Prosecar/reporteTutoriasTutor.php','_blank');
      window.open(this.href,'_self');
    } 
  </script>

