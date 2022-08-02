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
    Programa:          Proceso receta medica
    Fecha:             09-Junio-2022
    Programador:       Diana Rut Garcia 
    descripcion:       Permite llevar un mantenimiento de las alergias del area media ,editar,eliminar nuevo
-----------------------------------------------------------------------
  Historial de Cambio
-----------------------------------------------------------------------
    Programador               Fecha                      Descripcion
D'aniel Martinez        8-01-2022                        verificar las validaciones
D'aniel Martinez        8-01-2022                        Agregar tablas de los examenes y medicamentos agregados
D'aniel Martinez        8-01-2022                        Permitir numeros, letras, puntos y comas

----------------------------------------------------------------------->
<?php
 include_once "conexion.php";
 include_once "conexion3.php";
 include_once 'conexionpdo.php';
 include "conexionpdo.php";
 
?>

<head>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
</head>




    <div id="AGREGAR_EXAMEN" class="modal fade" role="dialog">
       <div class="modal-dialog modal-md">
           <div class="modal-content"><!-- Modal content-->
                <form  method="POST"  class="needs-validation" novalidate>
                    <div class="modal-header" style="background-color: #0CCDE3">
                        <h4 class="text-center">Agregar Examen</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body"><!--CUERPO DEL MODAL -->
                        <div class="row"><!-- INICIO PRIMERA ROW -->  
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="txtcodigo_persona">Nombre del Examen</label>
                                    <input id="bloquear"  type="text"  class="form-control"  maxlength="40" minlength="5"   onkeyup="mayus(this);" autocomplete = "off" type="text" onkeypress="return soloLetras(event);" placeholder="Ingrese un nombre al examen" name="nombre_examen"  required="">
                                    <div class="invalid-feedback">
                                     campo obligatorio.
                                   </div>
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="txtcodigo_persona">Descripción del Examen</label>
                                    <textarea  type="text"   class="form-control"  maxlength="100"  autocomplete = "off" type="text" onkeypress="return soloLetrasComa(event);" placeholder="Ingrese una descripción al examen" name="descripcion_examen"  required=""></textarea>
                                    <div class="invalid-feedback">
                                      campo obligatorio.
                                   </div>
                                </div>
                            </div>
                        </div> <!-- FIN DE EL PRIMER ROW --> 
                    </div><!--FINAL DEL CARD BODY -->                       
                    <div class="modal-footer ">
                        <button type="button" name="ELI" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                        <button type="submit" name="agregar_examen_medico" class="btn btn-success"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>      
                    </div><!--FIN DEL DIV DE BOTONES DE GUARDAR -->
                </div>
            </form>
      </div>
   </div><!-- FIN DEL MODAL AGREGAR UN EXAMEN --> 

   <div id="AGREGAR_RECETA" class="modal fade" role="dialog">
       <div class="modal-dialog modal-md">
           <div class="modal-content"><!-- Modal content-->
                <form  method="POST"  class="needs-validation" novalidate>
                    <div class="modal-header" style="background-color: #0CCDE3">
                        <h4 class="text-center">Agregar Medicamento</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body"><!--CUERPO DEL MODAL -->
                        <div class="row"><!-- INICIO PRIMERA ROW --> 
                             <div class="col-sm-12">
                                  <div class="form-group">
                                   <label for="txtcodigo_persona"> Código del Medicamento</label>
                                    <input type="text" required pattern="[A-Z,0-9]{2,10}"  maxlength="10" minlength="2"  class="form-control" onkeyup="mayus(this);" autocomplete="off" type="text" onkeypress="return soloLetrasnumeros(event)" onKeyDown="sinespacio(this);" name="agregar_cod_medi" required>
                                    <div class="invalid-feedback">
                                      Campo obligatorio.
                                    </div>
                                  </div>
                              </div>
                            <div class="col-sm-12">
                              <div class="form-group">
                                <label for="txtcodigo_persona">Nombre del Medicamento</label>
                                <input type="text" class="form-control" maxlength="50" minlength="5"  onkeyup="mayus(this);" autocomplete="off" type="text" onkeypress="return soloLetras(event);"
                                 name="agregar_medicamento" required >
                                 <div class="invalid-feedback">
                                      Campo obligatorio.
                                   </div>
                              </div>
                            </div>
                            <div class="col-sm-12">
                               <div class="form-group">
                                  <label for="txtcodigo_persona">Descripción</label>
                                  <input type="text" class="form-control" maxlength="100" minlength="5" onkeyup="mayus(this);" autocomplete="off" type="text" onkeypress="return soloLetrasComa(event);"
                                   name="agregar_med_desc" required >
                                   <div class="invalid-feedback">
                                      Campo obligatorio.
                                    </div>
                                </div>
                            </div>  
                        </div> <!-- FIN DE EL PRIMER ROW --> 
                    </div><!--FINAL DEL CARD BODY -->                       
                    <div class="modal-footer ">
                        <button type="button" name="ELI" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                        <button type="submit" name="AGREGAR_MEDICAMENTO" class="btn btn-success"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>      
                    </div><!--FIN DEL DIV DE BOTONES DE GUARDAR -->
                </div>
            </form>
      </div>
   </div><!-- FIN DEL MODAL AGREGAR UN MEDICAMENTO --> 
   
   <body oncopy="return false" onpaste="return false">
<div class="content-wrapper">
    <div class="content-header">
    <div class="container-fluid">
    </div><!-- /.container-fluid -->
  </div>
  <section class="content">     
  <div class="container-fluid">
   <section class="content">
    <div class="container-fluid">
        <section class="content-header text-xl-center mb-3 "> 
          <h4> Recetas Médicas   <i class="nav-icon fas fa-stethoscope"></i></h4>
        </section>
        <div class="card">
          <div class="card-header" style="background-color:#B3F2FF;">
          <ul class="nav nav-tabs card-header-tabs">
            <li class="nav-item">
            <a class=" nav-link" style="color:#000000;" href="#">Personas Consulta Médica</a>
            </li>
            <li class="nav-item">
            <a class=" nav-link" style="color:#000000;" href="#">Registrar Expediente</a>
            </li>

            <li class="nav-item">
            <a class="nav-link" style="color:#000000;" href="#">Consulta Médica</a>
            </li>
            <li class="nav-item">
            <a class="nav-link active" style="color:#000000;" href="#">Recetas Médicas</a>
            </li>
            </li>
            <li class="nav-item">
            <a class="nav-link" style="color:#000000;" href="#">Informe de Consulta</a>
            </li>
            <li class="nav-item">
            <a class="nav-link" style="color:#000000;" href="#">Lista de Pacientes</a>
            </li>
          </ul>
          </div>
          <div class="card-body"><!--Cuerpo del card body principal -->
            

         <form method="POST" class="needs-validation" novalidate >
         
         <div class="row pl-3 ">
         <?php
          $usuario= $_SESSION['vario'];
          $sentencia1 = $db->prepare("SELECT p.CODIGO_PERSONA
          FROM tbl_usuario u, tbl_persona p 
          WHERE u.CODIGO_PERSONA = p.CODIGO_PERSONA
          AND NOMBRE_USUARIO = (?);");
          $sentencia1->execute(array($usuario));
          $cod_usuario=$sentencia1->fetchColumn();
          ?>
        <?php   
            $query = "SELECT con.CODIGO_CONSULTA, con.CODIGO_CITA, CONCAT_WS(' ',pe.DNI,pe.PRIMER_NOMBRE,pe.SEGUNDO_NOMBRE,pe.PRIMER_APELLIDO,pe.SEGUNDO_APELLIDO) as PACIENTE  , i.FECHA_CITA
            FROM tbl_consulta_medica con, tbl_inscripcion_cita i, tbl_persona pe ,tbl_persona_especialidad es, tbl_estado esta
            WHERE con.CODIGO_CITA = i.CODIGO_CITA
            AND i.CODIGO_PERSONA = pe.CODIGO_PERSONA
            AND i.CODIGO_ESTADO = esta.CODIGO_ESTADO
            AND I.CODIGO_ESPECIALISTA = es.CODIGO_PERSONA_ESPECIALIDAD
            AND es.CODIGO_PERSONA = '$cod_usuario'
            AND esta.CODIGO_ESTADO = '8';";
            $resultadocon=$conn->query($query); 
            ?>
            <?php
            if ($resultadocon->num_rows >0) {
              while($row = $resultadocon->fetch_assoc()) { 
              $codigocon = $row['CODIGO_CONSULTA'];
              $codigocita = $row['CODIGO_CITA'];
              $nombrecon = $row['PACIENTE'];   
              $fecha_cita = $row['FECHA_CITA'];   
              
              





            ?>
            <div class="col-sm-12 mb-3">
             <h5> </h5><hr color="blue">
            </div>
            
          
         <div class="col-sm-3 mb-3">
          <label for="" class="form-label">Fecha de receta</label>
          <input class="form-control" type="text" hidden value="<?php echo $fecha_cita?>" name="fecha_receta" id="" onKeyDown="sinespacio(this);"  autocomplete = "off" onblur="quitarespacios(this);" onkeypress="return solonumeros(event);">
          <input class="form-control" type="text" readonly value="<?php echo $fecha_cita?>" onKeyDown="sinespacio(this);"  autocomplete = "off" onblur="quitarespacios(this);" onkeypress="return solonumeros(event);">
      </div>
<!--Inicio del paciente -->
<div class="col-sm-6  mb-3">

    <label for="" class="control-label">Nombre del Paciente</label> 
    <div class="form-group">
       <input  readonly class="form-control" value="<?php echo $nombrecon;?>">
       <input type="text" name="codigo_consulta" hidden  value="<?php echo $codigocon?>" > 
       <input type="text" hidden value="<?php echo $codigocita ?>" name="codigo_cita">    
    </div>
    <?php 
      } 
      }
     ?>
   </div><!--fin del paciente -->
       <div class="col-sm-3 mb-3">
            <div class="form-group">
              <label for="" class="control-label">Tipo de Receta</label>
              <select class="form-control select2 " required id="recetas" name="recetas" required> 
                <option selected disabled value="">--Seleccione--</option>
                <option  value="1">Receta Médica</option>
                <option  value="2">Examen Médico</option>
                
              </select>
              <div class="invalid-feedback">
                Llene este campo.
              </div>
            </div>
       </div>  
    </div><!--fin row para no perderse -->
        <!--select  para agregar el medicamento-->
        <div style ="display:none;"  id="medicamentos"> 
               <?php
                $query1 = "SELECT me.CODIGO_MEDICAMENTO , me.NOMBRE_MEDICAMENTO
                FROM tbl_medicamento me; ";
                $resultado2=$conn->query($query1);
                ?>
                <div class="row pl-4 mb-3 " >
                 <button  data-toggle="modal"  href="#AGREGAR_RECETA" type='button'   style="color:white;"class="btn btn-primary mb-3"><span> <i class="nav-icon fa fa-plus-square mx-1"></i></span>Agregar Medicamento</button>
                  <div class="col-sm-10">
                   <!-- <label for="identidad" class="control-label">Medicamento</label> -->
                      <select id="agregarmedicamento"  style="width: 100%;"  class="form-control select2" name="codigo_medicamento" required type="text">
                      <option selected disabled value="">--Seleccione--</option>
                          <?php 
                            if ($resultado2->num_rows > 0) {
                            while($row1 = $resultado2->fetch_assoc()) { 
                            $codigo1 = $row1['CODIGO_MEDICAMENTO'];
                            $nombre1 = $row1['NOMBRE_MEDICAMENTO'];
                            ?>
                          <option value="<?php echo $codigo1?>" ><?php echo $nombre1;?></option>
                          <?php 
                          } 
                          }
                          ?>
                      </select>
                      <div class="invalid-feedback">
                         Seleccione un Medicamento.
                      </div>
                  </div>  
                </div> <!--fin de Datalist para agregar el medicamento-->
              </div>
              <div style ="display:none;"  id="examenes"> 
                  <?php
                  $query3 = "SELECT * FROM `tbl_examenes_medicos`; ";
                  $resultado3=$conn->query($query3);
                  ?>
                <div class="row pl-4 mb-3 "  >
                 <button  data-toggle="modal"  href="#AGREGAR_EXAMEN" type='button'   style="color:white;"class="btn btn-primary mb-3"><span> <i class="nav-icon fa fa-plus-square mx-1"></i></span>Agregar Examen</button>
                  <div class="col-sm-10">
                   <!-- <label for="identidad" class="control-label">Medicamento</label> -->
                      <select id="agregarexamen" style="width: 100%;"  class="form-control select2" name="codigo_examen" required type="text">
                      <option selected disabled value="">--Seleccione--</option>
                          <?php 
                            if ($resultado3->num_rows > 0) {
                            while($row1 = $resultado3->fetch_assoc()) { 
                            $codigo2 = $row1['CODIGO_EXAMEN_MEDICO'];
                            $nombre2 = $row1['EXAMEN_MEDICO'];
                            ?>
                          <option value="<?php echo $codigo2?>" ><?php echo $nombre2;?></option>
                          <?php 
                          } 
                          }
                          ?>
                      </select>
                      <div class="invalid-feedback">
                         Seleccione un examen.
                      </div>
                  </div>  
                </div> <!--fin de Datalist para agregar el examen-->
              </div>
              <div class="modal fade" id="AGREGAR_RECETA" class="modal fade" role="dialog">
              
              </div><!-- FIN DEL MODAL AGREGAR -->
                  <div class="row pl-3">
                        <div class="col-md-6"> <!--INICIO INDICE ACADEMICO-->
                          <label  class="control-label">Indicación de Receta</label> 
                          <div class="form-group">
                            
                          <textarea required class="form-control" type="textarea" pattern=".{5,100}"  maxlength="100" name="indicaciones" id="indicaciones" onkeyup="mayus(this);"onkeypress="return soloLetrasComa(event);" autocomplete = "off" onkeypress=""></textarea>
                            <div class="invalid-feedback">
                                  Campo obligatorio.
                              </div>
                          </div>
                        </div>
                        <div class="col-md-6"> <!--INICIO PASATIEMPOS-->
                          <label class="control-label">Observaciones</label> 
                          <div class="form-group">
                          <textarea required class="form-control" type="textarea" pattern=".{5,100}"  maxlength="100" name="observaciones" id="observaciones" onkeyup="mayus(this);"onkeypress="return soloLetrasComa(event);" autocomplete = "off" onkeypress=""></textarea>
                               <div class="invalid-feedback">
                                  Campo obligatorio.
                              </div>
                          </div>
                        </div>
                  </div>
                      <br>
                      <div class="modal-footer justify-content-start">
                           <button type="submit"  id="receta_medica" name="receta_medica" class="btn btn-success btn mx-1" onclick="mostrar(this)"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar Receta</button>
                           <a href="#FINALIZAR<?php echo $codigocita;?>" data-toggle="modal">
                              <button  type='button'   class="btn btn-warning" data-dismiss="modal"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Finalizar Consulta</button>
                            </a>
                      </div>
                  </form>
                  
          </div>
        </div>
        <!-- --------------------------------------------------------------------  recetas--------------------------------------------------------------------------------------------------------->    
        <div class="card "  >

<div class="card-header text-center" >
    <!-- TITULO ENCABEZADO DATOS PERSONALES -->
    <h1 class=" card-title text-center" style="color:black;">Recetas Médicas</></h1>
</div>

<!-- form start -->
<div class="card-body">
    <div class="table-responsive">
        <table id="tbl_medicamentos" class="table table-bordered table-striped">
            <thead class="text-center">
                <tr>
                    <th class="text-center">Acción</th>
                    <th class="text-center">Nombre Receta Médica</th>
                    <th class="text-center">Indicación</th>
                    <th class="text-center">Observaciones</th>

                </tr>
            </thead>
            <tbody>
                <?php
                $query = "SELECT RM.CODIGO_RECETA_MEDICA, M.NOMBRE_MEDICAMENTO,RM.INDICACIONES_RECETA,RM.OBSERVACIONES FROM tbl_receta_medica RM, tbl_medicamento M WHERE RM.CODIGO_CONSULTA='$codigocon'
                AND RM.CODIGO_MEDICAMENTO=M.CODIGO_MEDICAMENTO;";
                $result = $conn->query($query);
                if ($result->num_rows > 0) {
                    while ($row = $result->fetch_assoc()) {
                        $var1 = $row['CODIGO_RECETA_MEDICA'];
                        $var2 = $row['NOMBRE_MEDICAMENTO'];
                        $var3 = $row['INDICACIONES_RECETA'];
                        $var4 = $row['OBSERVACIONES'];
                        
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
                                            $evaluar_permiso_eliminar->execute(array($usuariomo, '30'));
                                            $row1=$evaluar_permiso_eliminar->fetchColumn();
                                            $permiso_eliminar =$row1; 
                                        }
                                        ?>  <!-- fin del codigo para sustraer el permiso de eliminar-->
                                        <?php 
                                        if($permiso_eliminar == 'SI'){
                                        ?>
                                        <a href="#ELIMINAR_MEDICAMENTO<?php echo $var1; ?>" data-toggle="modal">
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
                                                $evaluar_permiso_actualizar->execute(array($usuariomo, '30'));
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
                            <td class="text-center"><?php echo $var2; ?></td>
                            <td class="text-center"><?php echo $var3; ?></td>
                            <td class="text-center"><?php echo $var4; ?></td>
                            <!--INICIO DEL MODAL DE EDITAR -->
                            <div id="editar_medicamento<?php echo $var1; ?>" class="modal fade" role="dialog">
                                <div class="modal-dialog modal-Mg">
                                    <div class="modal-content">
                                        <!-- Modal content-->
                                        <div class="modal-header" style="background-color: #0CCDE3">
                                           <h4 class="text-center">Editar Exámenes</h4>
                                           <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        </div>
                                        <form method="POST" >
                                            <div class="modal-body">
                                                <!--CUERPO DEL MODAL -->
                                                <div class="row">
                                                    <!-- INICIO PRIMERA ROW -->
                                                    <input type="text" value="<?php echo $var1; ?>" hidden class="form-control" 
                                                         name="cod_edit_Medicamento" id="cod_edit_Medicamento" >
                                                         <div class="col-sm-6">
                                                        <div class="form-group">
                                                            <label for="txtcodigo_persona">
                                                            Exámen</label>
                                                            <input type="text" value="<?php echo $var2; ?>" class="form-control" maxlength="10"  autocomplete="off" type="text" onkeyup="mayus(this);" onkeypress="return solonumero(event)" ; 
                                                            name="nom_Medic" id="nom_Medic" disabled="">
                                                            <div class="invalid-feedback">
                                                                Campo obligatorio.
                                                            </div>
                                                        </div>
                                                    </div>     
                                                    
                                                    <div class="col-sm-12">
                                                        <div class="form-group">
                                                            <label for="txtcodigo_persona">
                                                            Indicación</label>
                                                            <input type="text" value="<?php echo $var3; ?>" class="form-control" pattern=".{5,100}"  maxlength="100"onkeyup="mayus(this);" onkeypress="return soloLetrasComa(event);" onkeyup="this.value=this.value.replace(/^\s+/,'');"  autocomplete="off" type="text"  
                                                            name="edit_indicacion_Medic" id="edit_indicacion_Medic"onblur="quitarespacios(this);" required>
                                                            <div class="invalid-feedback">
                                                                Campo obligatorio.
                                                            </div>
                                                        </div>
                                                    </div>
                                                
                                                  <div class="col-sm-12">
                                                        <div class="form-group">
                                                            <label for="txtcodigo_persona">
                                                                Observaciones</label>
                                                            <input type="text" value="<?php echo $var4; ?>"class="form-control" pattern=".{5,100}" maxlength="100" onkeyup="mayus(this);" onkeypress="return soloLetrasComa(event);" onkeyup="this.value=this.value.replace(/^\s+/,'');"  autocomplete="off" type="text"
                                                             name="edit_obs_Medic" id="edit_obs_Medic"onblur="quitarespacios(this);" required></textarea>
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
                                                <button type="submit"  name="guardar_Medicamento"  id="guardar_Medicamento" class="btn btn-success"><span><i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>
                                            </div>
                                            <!--FIN DEL DIV DE BOTONES DE GUARDAR -->
                                        </form>
                                    </div>
                                </div>
                            </div><!-- FIN DEL MODAL EDITAR -->

                            <!-- inicio modal eliminar  -->   
                            <div id="ELIMINAR_MEDICAMENTO<?php echo $var1 ?>"  
                            name="eliminar_Medic" id="eliminar_Medic"class="modal fade" role="dialog">
                            <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel"></h5>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                <form id="formEliminarExam" method="POST">
                                <div class="modal-body">
                                    <input type="text" value ="<?php echo $var1; ?>" hidden class="form-control" name="eliminar_Medic" id="eliminar_Medic">
                                    <h4 class="text-center">¿Está seguro de eliminar el exámen <?php echo $var2; ?>?</h4>
                                </div> <!--fin el card body -->
                                    <div class="modal-footer ">

                                    <button type="button" name="cerrar" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                                    <button type="submit"  
                                    name="eliminar_Medicamento" id="eliminar_Medicamento"  class="btn btn-primary">Si, eliminar</button>      
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
 <!-- /.card-body -->

</div><!-- fINAL DEL card PRIMARY -->

        <div class="card " id="OcultarExamen" >

                        <div class="card-header text-center" >
                            <!-- TITULO ENCABEZADO DATOS PERSONALES -->
                            <h1 class=" card-title text-center" style="color:black;">Exámenes Médicos</></h1>
                        </div>

                        <!-- form start -->
                        <div class="card-body">
                            <div class="table-responsive">
                                <table id="tbl_medicamentos" class="table table-bordered table-striped">
                                    <thead class="text-center">
                                        <tr>
                                            <th class="text-center">Acción</th>
                                            <th class="text-center">Nombre del Examen</th>
                                            <th class="text-center">Indicación</th>
                                            <th class="text-center">Observaciones</th>

                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php
                                        $query = "SELECT EP.CODIGO_EXAMEN_PACIENTE,EM.EXAMEN_MEDICO,EP.INDICACIONES,EP.OBSERVACIONES FROM tbl_examenes_pacientes EP, tbl_examenes_medicos EM WHERE EP.CODIGO_CONSULTA='$codigocon'
                                        AND EP.CODIGO_EXAMEN_MEDICO= EM.CODIGO_EXAMEN_MEDICO";
                                        $result = $conn->query($query);
                                        if ($result->num_rows > 0) {
                                            while ($row = $result->fetch_assoc()) {
                                                $var1 = $row['CODIGO_EXAMEN_PACIENTE'];
                                                $var2 = $row['EXAMEN_MEDICO'];
                                                $var3 = $row['INDICACIONES'];
                                                $var4 = $row['OBSERVACIONES'];
                                                
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
                                                                    $evaluar_permiso_eliminar->execute(array($usuariomo, '30'));
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
                                                                        $evaluar_permiso_actualizar->execute(array($usuariomo, '30'));
                                                                        $row1=$evaluar_permiso_actualizar->fetchColumn();
                                                                        $permiso_actualizar =$row1; 
                                                                    
                                                                    }
                                                                    ?>  <!-- fin del codigo para sustraer el permiso de actualizar-->
                                                                     <?php 
                                                                    if($permiso_actualizar == 'SI'){
                                                                    ?>
                                                                <a href="#editar_Examen<?php echo $var1; ?>" data-toggle="modal">
                                                                    <button type='button' style="color:white;" class="btn btn-warning"><span>
                                                                            <i class="nav-icon fas fa-edit mx-1"></i></span></button>
                                                                </a>
                                                                    <?php 
                                                                        }
                                                                        ?>
                                                            </div>
                                                        </div><!-- final del text-center -->
                                                    </td>
                                                    <td class="text-center"><?php echo $var2; ?></td>
                                                    <td class="text-center"><?php echo $var3; ?></td>
                                                    <td class="text-center"><?php echo $var4; ?></td>
                                                    <!--INICIO DEL MODAL DE EDITAR -->
                                                    <div id="editar_Examen<?php echo $var1; ?>" class="modal fade" role="dialog">
                                                        <div class="modal-dialog modal-Mg">
                                                            <div class="modal-content">
                                                                <!-- Modal content-->
                                                                <div class="modal-header" style="background-color: #0CCDE3">
                                                                   <h4 class="text-center">Editar Exámenes</h4>
                                                                   <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                </div>
                                                                <form method="POST" >
                                                                    <div class="modal-body">
                                                                        <!--CUERPO DEL MODAL -->
                                                                        <div class="row">
                                                                            <!-- INICIO PRIMERA ROW -->
                                                                            <input type="text" value="<?php echo $var1; ?>" hidden class="form-control" 
                                                                                 name="cod_edit_examenes" id="cod_edit_examenes" >
                                                                                 <div class="col-sm-6">
                                                                                <div class="form-group">
                                                                                    <label for="txtcodigo_persona">
                                                                                    Exámen</label>
                                                                                    <input type="text" value="<?php echo $var2; ?>" class="form-control" maxlength="10"  autocomplete="off" type="text" onkeyup="mayus(this);" onkeypress="return solonumero(event)" ; 
                                                                                    name="nom_exam" id="nom_exam" disabled="">
                                                                                    <div class="invalid-feedback">
                                                                                        Campo obligatorio.
                                                                                    </div>
                                                                                </div>
                                                                            </div>     
                                                                            
                                                                            <div class="col-sm-12">
                                                                                <div class="form-group">
                                                                                    <label for="txtcodigo_persona">
                                                                                    Indicación</label>
                                                                                    <input type="text" value="<?php echo $var3; ?>" class="form-control" pattern=".{5,100}"  maxlength="100"onkeyup="mayus(this);" onkeypress="return soloLetrasComa(event);" onkeyup="this.value=this.value.replace(/^\s+/,'');"  autocomplete="off" type="text"  
                                                                                    name="edit_indicacion" id="edit_indicacion"onblur="quitarespacios(this);" required>
                                                                                    <div class="invalid-feedback">
                                                                                        Campo obligatorio.
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        
                                                                          <div class="col-sm-12">
                                                                                <div class="form-group">
                                                                                    <label for="txtcodigo_persona">
                                                                                        Observaciones</label>
                                                                                    <input type="text" value="<?php echo $var4; ?>"class="form-control" pattern=".{5,100}" maxlength="100" onkeyup="mayus(this);" onkeypress="return soloLetrasComa(event);" onkeyup="this.value=this.value.replace(/^\s+/,'');"  autocomplete="off" type="text"
                                                                                     name="edit_obs" id="edit_obs"onblur="quitarespacios(this);" required></textarea>
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
                                                                        <button type="submit"  name="guardar_examenes"  id="guardar_examenes" class="btn btn-success"><span><i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>
                                                                    </div>
                                                                    <!--FIN DEL DIV DE BOTONES DE GUARDAR -->
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div><!-- FIN DEL MODAL EDITAR -->

                                                    <!-- inicio modal eliminar  -->   
                                                    <div id="ELIMINAR<?php echo $var1 ?>"  
                                                    name="eliminar_ex" id="eliminar_ex"class="modal fade" role="dialog">
                                                    <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalLabel"></h5>
                                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                        </div>
                                                        <form id="formEliminarExam" method="POST">
                                                        <div class="modal-body">
                                                            <input type="text" value ="<?php echo $var1; ?>" hidden class="form-control" name="eliminar_ex" id="eliminar_ex">
                                                            <h4 class="text-center">¿Está seguro de eliminar el exámen <?php echo $var2; ?>?</h4>
                                                        </div> <!--fin el card body -->
                                                            <div class="modal-footer ">

                                                            <button type="button" name="cerrar" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                                                            <button type="submit"  
                                                            name="eliminar_exm" id="eliminar_exm"  class="btn btn-primary">Si, eliminar</button>      
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
                
                    
   </div><!-- CIerre del container fluid--> 
 
</div><!-- Cierre del div wraper -->



<!--Modal de confirmar finalización de consulta-->
    <div id="FINALIZAR<?php echo $codigocita ?>"  name="div_eliminar" id="div_eliminar"class="modal fade" role="dialog">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
          </div>
          <form id="FORMEeliminar" method="POST">
            <div class="modal-body">
            <input type="text" hidden value="<?php echo $codigocita ?>" name="codigo_finalizar"> 
              <input type="text" value ="<?php echo $var1; ?>" hidden class="form-control" name="rol_eliminar" id="rol_eliminar">
                <h4 class="text-center">¿Desea finalizar las Recetas?</h4>
            </div> 
             <div class="modal-footer ">
               <button type="button" name="cerrar" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
               <button type="submit" name="finalizar_consulta"  class="btn btn-primary">Si,Finalizar</button>      
             </div>
          </form>
        </div>
      </div>
    </div><!--fin del modal -->

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
 <!--funcion que advierte al usuario antes de salir de un proceso con cambios no guardados-->
 <script>
 var isSubmitting = false
$(document).ready(function () {
    $('#form').submit(function(){
        isSubmitting = true
    })
    $('#form').data('initial-state', $('#form').serialize());
    $(window).on('beforeunload', function() {
        if (!isSubmitting && $('#form').serialize() != $('#form').data('initial-state')){
            return 'You have unsaved changes which will not be saved.'
        }
    });
})


function window_mouseout( obj, evt, fn ) {
if ( obj.addEventListener ) {
    obj.addEventListener( evt, fn, false );
}
else if ( obj.attachEvent ) {
    obj.attachEvent( 'on' + evt, fn );
}
}
window_mouseout( document, 'mouseout', event => {
event = event ? event : window.event;
var from         = event.relatedTarget || event.toElement;
} );
  </script>
  <!--fin de la funcion que advierte al usuario antes de salir de un proceso con cambios no guardados-->
</body>



<!--Para el que vea este archivo perdon tando desmadre :'v  -->

<script>//codigo del select
    $( function() {
        $("#recetas").change( function() {
        if ($(this).val() === "1") {//
          document.getElementById('examenes').style.display = "none";
          document.getElementById('medicamentos').style.display = "block";
          document.getElementById('agregarmedicamento').required = true;
          document.getElementById('agregarexamen').required = false;
          

        }else if($(this).val() === "2"){//
          document.getElementById('medicamentos').style.display = "none";
          document.getElementById('examenes').style.display = "block";
          document.getElementById('agregarmedicamento').required = false;
          document.getElementById('agregarexamen').required = true;
        }
    });
  }); // 
</script>

<script type="text/javascript">
(function() {
    'use strict'
    var forms = document.querySelectorAll('.needs-validation')
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
<script type="text/javascript">
        function ocultar(){
        document.getElementById('OcultarExamen').style.display = 'none';
        }
</script>
<script type="text/javascript">
        function mostrar(){
document.getElementById('OcultarExamen').style.display = 'block';
}
</script>
<script>
      function soloLetrasComa(e){
       key = e.keyCode || e.which;
       tecla = String.fromCharCode(key).toLowerCase();
       letras = " áéíóúabcdefghijklmnñopqrstuvwxyz1234567890 ,.";
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