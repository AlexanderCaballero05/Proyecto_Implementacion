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
   
    Programa:          Pantalla que muestra el reporte de la consulta realizadas
    Fecha:             24-abril-2022
    Programador:       Arnold Caballero 
    descripcion:       Pantalla que muestra el reporte de la consulta realizadas

-----------------------------------------------------------------------
                      Historial de Cambio
-----------------------------------------------------------------------
    
    Programador               Fecha                      Descripcion
    Diana Rut            09/08/2022                 cambio en apariencia dejando estandar
  ----------------------------------------------------------------------->

<?php
include_once "conexion.php";
include_once "conexion3.php";
include_once 'conexionpdo.php';
 include "conexionpdo.php";

?>

<head>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="../vistas/assets/plugins/jquery/jquery.min.js"></script>
</head>

<body >
<div class="content-wrapper">
    <div class="content-header">
        <div class="container-fluid">
        </div><!-- /.container-fluid -->
    </div>

    <section class="content-header text-xl-center mb-3 "> 
          <h4> Consulta Espiritual</h4>
        </section>
    <section class="content">
       <div class="card"> 
        <div class="card-header" style="background-color:#B3F2FF;">
        <ul class="nav nav-tabs card-header-tabs">
         <li class="nav-item">
            <a class=" nav-link" style="color:#000000;" href="#">Citas en Espera</a>
            </li>
            <li class="nav-item">
            <a class=" nav-link" style="color:#000000;" href="#">Registrar Expediente</a>
            </li>
            <li class="nav-item">
            <a class="nav-link active" style="color:#000000;" href="#">Consulta Espiritual</a>
            </li>
            <li class="nav-item">
            <a class="nav-link" style="color:#000000;" href="#">Informe de Consulta</a>
            </li>
            <li class="nav-item">
            <a class="nav-link" style="color:#000000;" href="#">Lista de Personas</a>
            </li>
          </ul>
        </div>
        <div class="card-body">
        <body oncopy="return false" onpaste="return false" >
        <form method="POST" class="needs-validation" novalidate id="form">
            
            <h5>Datos de la Persona</h5>
            <hr color="blue">
                      
            <div class="row mb-8">
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
                    <div class="col">
                    <?php 
                          $query = "SELECT i.CODIGO_CITA, i.CODIGO_PERSONA,  CONCAT_WS(' ',pe.PRIMER_NOMBRE,pe.SEGUNDO_NOMBRE,pe.PRIMER_APELLIDO,pe.SEGUNDO_APELLIDO) as PACIENTE ,  pe.DNI, i.FECHA_CITA, i.HORARIO, est.NOMBRE as nombre_estado
                          FROM tbl_inscripcion_cita i, tbl_persona pe , tbl_persona_especialidad es, tbl_estado est
                                                                  WHERE i.CODIGO_PERSONA = pe.CODIGO_PERSONA
                                                                  AND i.CODIGO_ESPECIALISTA = es.CODIGO_PERSONA_ESPECIALIDAD
                                                                  AND i.CODIGO_ESTADO = est.CODIGO_ESTADO
                                                                  AND es.CODIGO_PERSONA = '$cod_usuario'
                                                                  AND i.CODIGO_ESTADO = '11' 
                                                                  and  i.AREA_CITA = '4'
                                                                  AND i.FECHA_CITA = CURDATE();
                           ";
                          $resul=$conn->query($query); 
                          while($row = $resul->fetch_assoc()){
                            $var1 = $row['PACIENTE'];
                            $var2 = $row['DNI'];
                            $var3 = $row['CODIGO_CITA'];
                            $codigo_paciente = $row['CODIGO_PERSONA'];
                          
                          ?>
                      <input type="text" name="codigo_cita_espiritual" value="<?php echo $var3?>" hidden>
                       <label for="">Nombre de la Persona</label> 
                       <input type="text" name="nombre" disabled ="disabled"class="form-control"  aria-label="nombre" onkeyup="mayus(this);" value="<?php echo $var1?>" >
                    </div>
                     <div class="col">
                         <label for="">DNI</label>
                         <input type="text" name="dni" class="form-control"  aria-label="dni"  value="<?php echo $var2 ?>" disabled ="disabled">
                    </div>
                    </div>
                    <?php
                    }
                    ?>
                    <br></br>
                    <h5> Datos Expediente Espiritual</h5>
                    <hr color ="blue">
            <!--INICIO COMBOBOX -->
             <div class="form-group">
             <?php
              $query = "SELECT exp.CODIGO_EXPEDIENTE, exp.NOMBRE_IGLESIA, exp.GRUPO_IGLESIA, exp.TIEMPO_ASISTIR_IGLESIA, exp.MOTIVACION_IGLESIA
              FROM tbl_expediente_espiritual exp
              WHERE CODIGO_PERSONA = '$codigo_paciente';" ;
              $resul2=$conn->query($query); 
               
              while($row2 = $resul2->fetch_assoc()){
                $var6 = $row2['NOMBRE_IGLESIA'];
                $var7 = $row2['GRUPO_IGLESIA'];
                $var9 = $row2['TIEMPO_ASISTIR_IGLESIA'];
                $var8 = $row2['MOTIVACION_IGLESIA'];
                $var5 = $row2['CODIGO_EXPEDIENTE'];
              ?>
                   <div class= "row">                      
                        <div class="col-md-6">
                                <input type="text" name="codigoexpediente" value="<?php echo $var5?>" Hidden> <!--CODGIO DEL EXPEDIENTE PARA Q SALGA TODA INFO  --> 
                                <label for="" class="control-label">Nombre Iglesia</label> 
                                <div class="form-group">
                                <textarea required class="form-control" onkeypress="return soloLetrasComa(event);"   type="textarea" required value=""disabled ="disabled" 
                                name="sintomasneuraticos" id="sintomasneuraticos"><?php echo $var6?></textarea>
                                </div>
                        </div><!--fin del Sintomas Neuroticos-->
                        <div  class="col-md-6">
                                <label for="" class="control-label">Grupo de Iglesia</label> 
                                    <div class="form-group">
                                <textarea required class="form-control" onkeypress="return soloLetrasComa(event);"   type="textarea" required value="" disabled ="disabled"
                                 name="Familiares" id="Familiares"><?php echo $var7?></textarea>
                                    </div>
                        </div><!--fin del la Antecedentes Familiares -->   
                    </div> <!--fin del row primer de expediente  -->
                    <div class="row">
                        <div  class="col-md-6">
                            <label for="" class="control-label">Tiempo de Asistir a la Iglesia</label> 
                                <div class="form-group">
                            <textarea required class="form-control" onkeypress="return soloLetrasComa(event);"   type="textarea" required  disabled ="disabled" name="Personales" id="Personales"><?php echo $var9?></textarea>
                                </div>
                        </div><!--fin del la Antecedentes Personales -->    
                        <div  class="col-md-6">
                            <label for="" class="control-label">Motivación en la Iglesia</label> 
                                <div class="form-group">
                            <textarea required class="form-control" onkeypress="return soloLetrasComa(event);"  type="textarea" required value="" disabled ="disabled" name="Clinicos" id="Clinicos"><?php echo $var8?></textarea>
                                </div>
                        </div><!--fin del la Antecedentes Personales -->       
                    </div><!--fin del row segundo de expediente -->
                    <?php
                    }
                    ?> <!--METER EL CICLO TODO LOS TEXTOS Y DENTRO DEL ROW PRINCIPAL-->
             </div><!--fin del div de row DE EXPEDIENTE-->
                    
                    <h5>Datos de Consulta</h5>
                    <hr color="blue">
                    <div class="row">
                      <div class="col-md-6"> 
                        <label for="identidad" class="control-label">Motivo de Consulta</label> 
                        <div class="form-group">
                          <textarea class="form-control" type="text" onkeypress="return soloLetrasComa(event);"  minlength="5"  name="Motivo_consulta" id="Motivo_consulta" autocomplete = "off" required></textarea>
                          <div class="invalid-feedback">
                              Llene este campo.
                          </div>
                        </div>
                      </div>               
                
                      <div class="col-md-6">
                        <label for="identidad" class="control-label">Observaciónes</label> 
                        <div class="form-group">
                          <textarea class="form-control" type="text" onkeypress="return soloLetrasComa(event);"  minlength="3" name="observaciones_espiritual" id="observaciones_espiritual"  autocomplete = "off" required></textarea>
                          <div class="invalid-feedback">
                              Llene este campo.
                          </div>
                        </div>
                      </div>
                    </div><!--Fin de una fila -->
                    <br>
                    <a>
                    <button type="submit"  name="Consulta_espiritual" class="btn btn-success btn mx-1"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Registrar Consulta</button>
                    </a> 
                  </form>   
                </div><!--fin del div de responsivi -->
              </div> <!-- /.card-body -->
            </form>
          </div><!-- fINAL DEL card PRIMARY -->
        </div><!--FINAL DE COL-M12-->
      </div><!-- FINAL ROW PADRE -->
    </div><!-- FINAL CONTAINER FLUID --> 
                      </div>
                      </div>
  </section><!-- FINAL SECTION -->

   
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

</body>

 

 
  <script>
    (function () { 
        'use strict'
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



    var observaciones=document.getElementById("observaciones"); //el nombre del id del campo y cambiar la variable 
    observaciones.addEventListener('keydown', function(keyboardEvent) {///cambiar la variable 
    //Si se está repitiendo, ignorar
    if (keyboardEvent.repeat)
    keyboardEvent.preventDefault();
    });

    var Egreso=document.getElementById("Egreso"); //el nombre del id del campo y cambiar la variable 
    Egreso.addEventListener('keydown', function(keyboardEvent) {///cambiar la variable 
    //Si se está repitiendo, ignorar
    if (keyboardEvent.repeat)
    keyboardEvent.preventDefault();
    });

    var Ingreso=document.getElementById("Ingreso"); //el nombre del id del campo y cambiar la variable 
    Ingreso.addEventListener('keydown', function(keyboardEvent) {///cambiar la variable 
    //Si se está repitiendo, ignorar
    if (keyboardEvent.repeat)
    keyboardEvent.preventDefault();
    });

    var sintomas=document.getElementById("sintomas"); //el nombre del id del campo y cambiar la variable 
    sintomas.addEventListener('keydown', function(keyboardEvent) {///cambiar la variable 
    //Si se está repitiendo, ignorar
    if (keyboardEvent.repeat)
    keyboardEvent.preventDefault();
    });
</script>
