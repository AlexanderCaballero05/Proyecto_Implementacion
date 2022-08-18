<?php
include_once "conexion.php";
include_once "conexion3.php";
include_once 'conexionpdo.php';
 include "conexionpdo.php";
?>
<head>
 
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script><!--Para que funcione el selecrt2 -->
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script> 
</head>

<body >
<div class="content-wrapper">
  <div class="content-header">
    <div class="container-fluid">
    </div><!-- /.container-fluid -->
  </div>
  <section class="content">
    <div class="container-fluid">
        <div class="content-header text-xl-center mb-3"> 
          <h4>Registrar Expediente </h4>
       </div>
        <div class="card">
          <div class="card-header" style="background-color:#B3F2FF;">
          <ul class="nav nav-tabs card-header-tabs">
            <li class="nav-item">
            <a class=" nav-link" style="color:#000000;" href="#">Citas pendientes</a>
            </li>
            <li class="nav-item">
            <a class=" nav-link" style="color:#000000;" href="#">Consultas en Espera</a>
            </li>
            <li class="nav-item">
            <a class=" nav-link active" style="color:#000000;" href="#">Registrar Expediente</a>
            </li>
            <li class="nav-item">
            <a class="nav-link" style="color:#000000;" href="#">Consulta Psicológica</a>
            </li>
            <li class="nav-item">
            <a class="nav-link" style="color:#000000;" href="#">Informe de Consulta</a>
            </li>
            <li class="nav-item">
            <a class="nav-link" style="color:#000000;" href="#">Plan Terapéutico</a>
            </li>
            <li class="nav-item">
            <a class="nav-link" style="color:#000000;" href="#">Lista de Pacientes</a>
            </li>
          </ul>
          </div><!--FIN DEL CARD HEADER -->
           <div class="card-body"><!--Cuerpo del card body principal -->
             <form method="POST" class="needs-validation" novalidate id="form">
             <div class="alert alert" style="border-color:blue">
              <h3 class="text-center"> Paso <i class="bi bi-2-circle"></i><svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-2-circle" viewBox="0 0 16 16">
                <path d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8Zm15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0ZM6.646 6.24v.07H5.375v-.064c0-1.213.879-2.402 2.637-2.402 1.582 0 2.613.949 2.613 2.215 0 1.002-.6 1.667-1.287 2.43l-.096.107-1.974 2.22v.077h3.498V12H5.422v-.832l2.97-3.293c.434-.475.903-1.008.903-1.705 0-.744-.557-1.236-1.313-1.236-.843 0-1.336.615-1.336 1.306Z"/>
              </svg>
              </h3>
            </div>
                    <h5>Datos Generales Expediente</h5>
                    <hr color="blue">
                    <div class= "row"> 
                        <div  class="col-sm-8">
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

                        // AND i.FECHA_CITA = CURDATE();";

                        $query2 = "SELECT i.CODIGO_CITA, i.CODIGO_PERSONA, CONCAT_WS (' ',DNI,pe.PRIMER_NOMBRE,pe.SEGUNDO_NOMBRE,pe.PRIMER_APELLIDO,pe.SEGUNDO_APELLIDO) AS PACIENTE, i.FECHA_CITA, i.HORARIO, est.NOMBRE as nombre_estado
                        FROM tbl_inscripcion_cita i, tbl_persona pe , tbl_persona_especialidad es, tbl_estado est
                                                                WHERE i.CODIGO_PERSONA = pe.CODIGO_PERSONA
                                                                AND i.CODIGO_ESPECIALISTA = es.CODIGO_PERSONA_ESPECIALIDAD
                                                                AND i.CODIGO_ESTADO = est.CODIGO_ESTADO
                                                                AND es.CODIGO_PERSONA = '$cod_usuario'
                                                                AND i.CODIGO_ESTADO = '11' 
                                                                and  i.AREA_CITA = '3'
                                                                AND i.FECHA_CITA = CURDATE()
                      
                        ;";
                       
                        $resul2=$conn->query($query2);                
                        ?>
                        
                                <?php 
                                    if ($resul2->num_rows > 0) {
                                    while($row2 = $resul2->fetch_assoc()) { 
                                    $codigo2 = $row2['CODIGO_PERSONA'];
                                    $nombre2 = $row2['PACIENTE'];
                                    ?>
                                     <label for="" class="control-label">Nombre del Paciente</label> 
                          <div class="form-group">
                            <input  readonly class="form-control" value="<?php echo $nombre2;?>">
                            <input  hidden name="codigo_paciente_expediente_psicologico" value="<?php echo $codigo2;?>">
                          </div>
                                <?php 
                                } 
                                }
                                ?>
                               
                        </div><!--fin del paciente -->

                       

                        <div class="col-sm-4">
                         <label for="antecedentes_familiares" class="control-label">Antecedentes Psicológicos Familiares</label> 
                            <div class="form-group">
                            <textarea class="form-control" type="text" name="antecedentes_familiares" onkeyup="mayus(this);" id="antecedentes_familiares" autocomplete = "off" required></textarea>
                            <div class="invalid-feedback">
                                  Campo obligatorio.
                              </div>
                            </div>
                        </div><!--fin del peso -->

                    </div> <!--fin del row -->

                    <hr>
                    <div class="row">
                     
                    <div class="col-sm-4">
                         <label for="antecedentes_personales" class="control-label">Antecedentes Psicológicos Personales</label> 
                            <div class="form-group">
                            <textarea class="form-control" type="text" name="antecedentes_personales" id="antecedentes_personales" onkeyup="mayus(this);" autocomplete = "off" required></textarea>
                            <div class="invalid-feedback">
                                  campo obligatorio.
                              </div>
                            </div>
                        </div><!--fin del peso -->
                      <!-- End: checkbox -->
                      <div class="col-sm-4">
                         <label for="antecedentes_clinicos" class="control-label">Antecedentes Clínicos</label> 
                            <div class="form-group">
                            <textarea class="form-control" type="text" name="antecedentes_clinicos" id="antecedentes_clinicos" onkeyup="mayus(this);" autocomplete= "off" required></textarea>
                             <div class="invalid-feedback">
                                  Campo obligatorio.
                              </div>
                            </div>
                        </div><!--fin del peso -->

                      <div class="col-md-4">
                        <div class="card">
                            <div class="card-header" style="background-color:#DFD4FE;">
                              <strong>Síntomas Neuróticos </strong><button  data-toggle="modal"  href="#AGREGARSINTOMAS" type='button' id="btnGuardar"  style="color:white;"class="btn btn-primary mx-2 "><span> <i class="nav-icon fa fa-plus-square mx-1"></i></span></button>
                            </div>
                        <div class="card-body">
                        
                            <?php 
                                $query1 = "SELECT CODIGO_SINTOMA_NEUROTICO ,TIPO from tbl_sintomas_neuroticos  ";
                                $resultadod1=$conn->query($query1);                
                                ?>
                                <?php 
                                if ($resultadod1->num_rows > 0) {
                                while($row1 = $resultadod1->fetch_assoc()) { 
                                $codigo1 = $row1['CODIGO_SINTOMA_NEUROTICO'];
                                $nombre1= $row1['TIPO'];
                                ?>
                            <div  class="form-check icheck-pink" >
                                <input class="form-check-input" type="checkbox" name="neuroticos[]" id="neuroticos<?php echo $codigo1;?>" value="<?php echo $codigo1;?>">
                                <label class="form-check-label" for="neuroticos<?php echo $codigo1;?>">
                                    <?php echo $nombre1;?>
                                </label>
                                </br>
                                </div>
                                <?php 
                                } 
                                }
                                ?>
                                
                      </div><!--fin otros antecedentes--> 
                      </div>
                      </div>
                     
                    </div><!--div del row -->  

                 
                <button type="submit"  id="" name="expediente_medico" class="btn btn-success btn mx-1"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Registrar Expediente </button>
             </form><!-- FIN DEL FORM-->
          </div><!--FIN DEL CARD BODY -->
        </div><!--fIN DEL CARD GENERAL -->
   </div><!-- CIerre del container fluid--> 
  </section>
</div>
</div>

</body>

<!--INICIO DEL MODAL DE AGREGAR UN NUEVo SINTOMA-->
<div id="AGREGARSINTOMAs" class="modal fade" role="dialog">
       <div class="modal-dialog modal-md">
           <div class="modal-content"><!-- Modal content-->
                <form method="POST" class="needs-validation" novalidate>
                    <div class="modal-header" style="background-color: #0CCDE3">
                        <h4 class="text-center">Agregar Síntoma Neurótico</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body"><!--CUERPO DEL MODAL -->
                        <div class="row"><!-- INICIO PRIMERA ROW -->  
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="txtcodigo_sintoma">Nombre Síntoma</label>
                                    <input  type="text"   class="form-control" onkeyup="mayus(this);" onkeypress="return soloLetras(event);" maxlength="100"    autocomplete = "off" type="text"  name="sintomaN"  required>
                                    <div class="invalid-feedback">
                                       campo obligatorio.
                                   </div>
                                </div>
                            </div>
                          
                        </div> <!-- FIN DE EL PRIMER ROW --> 
                    </div><!--FINAL DEL CARD BODY -->                       
                    <div class="modal-footer ">
                        <button type="button" name="ELI" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                        <button type="submit" name="AGREGAR_SINTOMAN" class="btn btn-success"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>      
                    </div><!--FIN DEL DIV DE BOTONES DE GUARDAR -->
                </div>
            </form>
      </div>
    </div><!-- FIN DEL MODAL AGREGAR NUEVO SINTOMA --> 
  <script>
(function() {
    'use strict'
    // Fetch all the forms we want to apply custom Bootstrap validation styles to
    var forms = document.querySelectorAll('.needs-validation')
    // Loop over them and prevent submission
    Array.prototype.slice.call(forms)
        .forEach(function(form) {
            form.addEventListener('submit', function(event) {
                if (!form.checkValidity()) {
                    event.preventDefault()
                    event.stopPropagation()
                }
                form.classList.add('was-validated')
            }, false)
        })
})()
</script>

