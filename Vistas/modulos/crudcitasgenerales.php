<!-- 
-----------------------------------------------------------------------
Universidad Nacional Autonoma de Honduras (UNAH)
		Facultad de Ciencias Economicas
Departamento de Informatica administrativa
Analisis, Programacion y Evaluacion de Sistemas
           Primer Periodo 2016

Equipo:


Catedratico:
Lic. Claudia Nuñez (Analisis)
Lic. Giancarlo Martini Scalici Aguilar (Implementación)
Lic. Karla Melisa Garcia Pineda (Evaluación)

---------------------------------------------------------------------

Programa:         Pantalla de Ingreso a mantenimiento de citas generales
Fecha:             
Programador:       GISELLA DIAS Y ANY HERNANDEZ
descripcion:       Pantalla que contrala las citas generales permitiendolo editarlas

-----------------------------------------------------------------------
                      Historial de Cambio
-----------------------------------------------------------------------

Programador               Fecha                      Descripcion
ANY HERNANDEZ         		11-06-2022                 revision de ortografia 
Diana Rut Garcia            30/06/2022                 Cambi en el titulo
----------------------------------------------------------------------->


<?php
//session_start();
include_once "conexion.php";
include_once "conexion3.php";

include "conexionpdo.php";

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
              <h4>Citas Generales Prosecar </h4>
    </div>
    <section class="content">
       <div class="card"> 
       <div class="card-header" style="background-color:#B3F2FF;">
          <ul class="nav nav-tabs card-header-tabs">
            <li class="nav-item">
            <a class=" nav-link active" style="color:#000000;" href="crudcitasgenerales">Citas Generales</a>
            </li>
            <li class="nav-item">
            <a class=" nav-link" style="color:#000000;" href="crudinscripcioncita">Citas Hoy</a>
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
                            $evaluar_usuario = $db->prepare("SELECT CODIGO_TIPO_ROL FROM tbl_usuario WHERE NOMBRE_USUARIO = (?);");
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
                    <a href="ediusuariosestudiantes">
                      <button  data-toggle="modal"  href="" type='button' id="btnGuardar"  style="color:white;"class="btn btn-primary mb-3"><span> <i class="nav-icon fa fa-plus-square mx-1"></i></span>Agregar</button>
                    </a>
                    <button  onclick="Descargar()" data-toggle="modal"  href="" type='button' id="btnGuardar"  style="color:white; background-color:#FA0079" class="btn btn-danger mb-3"> <span><i class="nav-icon fa fa-file-pdf mx-1"></i></span>Generar</button>
                   </br></br>
                    <!-- Codigo de permiso de insertar -->
                    <?php 
                      }
                     ?>
                     <div class="row"><!--Codigo para filtrar el reporte como la informacion de la datatable -->
                         <label class=" col-sm-1 control-label" style="text-align: right; width: 150px;">Filtrar por:</label>
                          <div class="col-sm-3">
                              <?php 
                              $query = "SELECT CODIGO_AREA ,NOMBRE  FROM tbl_area  where CODIGO_AREA <> 1";
                              $resul=$conn->query($query);                
                              ?>
                             <form method="POST" >
                                <select class="form-control" name="BUSCAR" required>
                                   <option selected disabled value="" >--Seleccione--</option>
                                   <?php 
                                    if ($resul->num_rows > 0) {
                                        while($row = $resul->fetch_assoc()) { 
                                        $codigo = $row['CODIGO_AREA'];
                                        $nombre = $row['NOMBRE'];
                                    ?>  
                                    <option value="<?php echo $codigo?>" ><?php echo $nombre;?></option>
                                    <?php 
                                    } 
                                    }
                                    ?>
                                </select>
                         </div>
                         <div class="col-md-1 mb-2">
                             <button type="submit"  name="MANDAR" class=" form-control btn btn-info "> Generar</button>
                        </div>
                        </form>
                        <div class="col-md-3 mb-2">
                          
                        </div>
                     </div>
                     <?php
                        if(isset($_POST['BUSCAR'])){ 
                        $area = $_POST['BUSCAR']; 
                        $_SESSION['area'] = $area;
                         
                    ?>
                    <button  onclick="Descargar2()" data-toggle="modal"  href="" type='button' id="btnGuardar"  style="color:white; background-color:#FA0079" class="btn btn-danger mb-3"> <span><i class="nav-icon fa fa-file-pdf mx-1"></i></span>Generar Reporte</button>
                    <div class="card">
                        <div class="modal-header">
                            <!-- TITULO ENCABEZADO DATOS PERSONALES -->
                        </div>
                        <!-- form start -->
                            <div class="card-body">
                                
                                <div class="table-responsive">
                                <table id="tabla_citas" class="table table-bordered table-striped">
                                    <thead>
                                        <tr>
                                            <th class="text-center">Acción</th>
                                            <th class="text-center">Fecha cita</th>
                                            <th class="text-center">Hora</th>
                                            <th class="text-center">Beneficiario</th>
                                            <th class="text-center">Encargado de la cita</th>
                                            <th class="text-center">Especialidad</th>
                                            <th class="text-center">Área</th>
                                            <th class="text-center">Estado cita</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <?php 
                                    $area = $_POST['BUSCAR'];

                                    $query1 ="SELECT  IC.CODIGO_CITA,IC.FECHA_CITA,IC.HORARIO , IC.CODIGO_PERSONA ,IC.CODIGO_ESPECIALISTA , CONCAT_WS(' ',P.PRIMER_NOMBRE, P.SEGUNDO_NOMBRE, P.PRIMER_APELLIDO,P.SEGUNDO_APELLIDO) AS 
                                    MEDICO , CONCAT_WS(' ',OT.PRIMER_NOMBRE, OT.SEGUNDO_NOMBRE, OT.PRIMER_APELLIDO,OT.SEGUNDO_APELLIDO) AS PACIENTE, IC.CODIGO_ESTADO ,est.NOMBRE as nombre_estado, ar.NOMBRE as nombre_area, espe.NOMBRE as nombre_especialidad
                                    FROM tbl_inscripcion_cita IC ,tbl_persona P ,tbl_persona_especialidad E ,tbl_persona OT, tbl_area a, tbl_estado est, tbl_area ar, tbl_especialidad espe                                   WHERE E.CODIGO_PERSONA = P.CODIGO_PERSONA 
                                    AND ic.AREA_CITA = ar.CODIGO_AREA
                                    AND ic.CODIGO_ESTADO = est.CODIGO_ESTADO
                                    AND IC.AREA_CITA = a.CODIGO_AREA
                                    AND IC.CODIGO_ESPECIALISTA = E.CODIGO_PERSONA_ESPECIALIDAD 
                                    AND E.CODIGO_ESPECIALIDAD = espe.CODIGO_ESPECIALIDAD
                                    AND  OT.CODIGO_PERSONA = IC.CODIGO_PERSONA  
                                    AND ic.AREA_CITA = '$area';";
                                    $result = $conn->query($query1);
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
                


                                                                     <?php 
                                                                        }
                                                                        ?>

                                                            </div>
                                                        </div><!-- final del text-center -->
                                                    </td> 
                                                    <td class="text-center"><?php echo $var2; ?></td>
                                                    <td class="text-center"><?php echo $var3; ?></td>
                                                    <td class="text-center"><?php echo ucwords(strtolower($var4)); ?></td>
                                                    <td class="text-center"><?php echo ucwords(strtolower($var5));?></td>
                                                    <td class="text-center"><?php echo $var8; ?></td>
                                                    <td class="text-center"><?php echo $var7; ?></td>
                                                    <td class="text-center"><?php echo $var6; ?></td>
                                                    <!-- editar cita editar -->
                                                    <div  class="modal fade"id="editar_cita<?php echo $var1 ?>" role="dialog"  >
                                                        <div class="modal-dialog modal-lg">
                                                            <div class="modal-content">
                                                                <!-- Modal content  editar-->
                                                            <form method="POST">
                                                                <div class="modal-header" style="background-color: #0CCDE3">
                                                                    <h4 class="text-center">Editar Cita  
                                                                    </h4>
                                                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                </div>
                                                                <!-------------CUERPO DEL MODAL  editar--------------> 
                                                                <div class="modal-body"> 
                                                                <?php  
                                                                    date_default_timezone_set("America/Guatemala"); /* Establece una zona horaria para la fecha actual  */
                                                                    $Fechaactual=  date("$valor" ); /* Asigno la variable valor del parametro que contiene la fecha actual*/
                                                                    $fechamaxima= date("$valor",strtotime($Fechaactual."+ 2 month"));/* para la fecha maxima le sumo dos meses a la fecha actual */
                                                                ?>
                                                                <div class="row"> <!-------- INICIO PRIMERA ROW editar -----------> 
                                                                <input type="text" value="<?php echo $var1; ?>" 
                                                                        hidden class="form-control"
                                                                        name="cod_edit_cita2" id="cod_edit_cita2" >
                                                                    <div class="col-sm-6">
                                                                        <div class="form-group">
                                                                            <label for="fecha" class="form-label">Fecha de la cita: </label>
                                                                            <input type="date"autocomplete = "off" value="<?php echo $var2; ?>" 
                                                                            min= "<?= date ($valor)?>" max="<?= date($fechamaxima)?>" 
                                                                            class="form-control" 
                                                                            name="edit_fecha_cita1"  id="edit_fecha_cita1">
                                                                        </div>
                                                                        <div class="invalid-feedback">
                                                                                campo obligatorio
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-sm-6">
                                                                    <div class="form-group">
                                                                            <label for="txtcodigo_persona"> Hora: </label>
                                                                            <input type="time"  value = "<?php echo $var3; ?>" 
                                                                            required min= "<?= ($valor1)?>"   max= "<?=( $valor2)?>" 
                                                                            class="form-control" 
                                                                            name="edit_hora1" id="edit_hora1">
                                                                        </div>
                                                                        <div class="invalid-feedback">
                                                                            Horario valido de 9:00 a.m. a 17:00 p.m.
                                                                        </div>
                                                                    </div>
                                                                </div> 
                                                                <?php
                                                                        include "conexion1.php";
                                                                        $queryr = " SELECT es.CODIGO_ESTADO ,es.NOMBRE AS Nombre_estado
                                                                        FROM tbl_estado es  WHERE es.CODIGO_ESTADO = 5 or  es.CODIGO_ESTADO = 7
                                                                        ;";
                                                                        $resultador=$conn->query($queryr);
                                                                        ?>  
                                                                <div class="row">
                                                                    <div class="col-sm-6">
                                                                        <div class="form-group">
                                                                          <label for="txtcodigo_persona">Estado cita:</label>
                                                                            <select class="form-control" name="estado_edit1" id="estado_edit1" required="">
                                                                             <option selected disabled autocomplete = "off" value=""><?php echo $var6; ?>--Seleccione...</option>
                                                                                <?php 
                                                                                 if ($resultador->num_rows > 0) {
                                                                                    while($rowr = $resultador->fetch_assoc()) { ?>
                                                                                <option value="<?php echo $rowr['CODIGO_ESTADO'];?>"><?php echo $rowr['Nombre_estado']; ?></option>
                                                                                 <?php } 
                                                                                }?>
                                                                            </select>
                                                                            <div class="invalid-feedback">
                                                                              Seleccione una opción.
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            <div class="modal-footer ">
                                                                <button type="button" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                                                                <button type="submit" name="edit_cita1"  id = "edit_cita1" class="btn btn-success"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>
                                                            </div>
                                                            </div><!--FIN CUERPO DEL MODAL editar --> 
                                                        </form>
                                                        </div>
                                                        </div>
                                                    </div><!-- FIN DEL MODAL editar -->

                                                    <!--Modal para ver y enviar una cita -->
                                                    <div  class="modal fade" id="ver_cita<?php echo $var1 ?>" role="dialog"  >
                                                        <div class="modal-dialog modal-lg">
                                                            <div class="modal-content">
                                                                <!-- Modal content  editar-->
                                                                <form method="POST">
                                                                <div class="modal-header" style="background-color: #0CCDE3">
                                                                    <h4 class="text-center">Ver Cita  </h4>
                                                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                </div>
                                                                <!-------------CUERPO DEL MODAL  editar--------------> 
                                                                <div class="modal-body"> 
                                                                    <input type="text" value="<?php echo $var1; ?>" hidden class="form-control"name="cod_enviar_cita1" id="cod_enviar_cita1" >
                                                                    <input type="text" value="<?php echo $var6; ?>" hidden class="form-contro" name="estado_cita1" id="estado_cita1" >
                                                                    <h2 class="text-center">Información de cita</h2>
                                                                    <br>
                                                                    <div class="row"> 
                                                                        <div class="col-sm-6">
                                                                            <div class="form-group">
                                                                                <p><b class="p-1">Fecha de la cita:</b> <?php echo $var2; ?></p>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-sm-6">
                                                                            <div class="form-group">
                                                                                <p><b class="p-1">Hora de la cita:</b> <?php echo $var3; ?></p>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="dropdown-divider"></div><!--SE HAN ORDENADOS EN SU CODIGO!!!!! -->
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
                                                            <!-- ------------------ FIN del modal body---------------------- -->
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                                                                <button type="submit" name="enviar_cita1"  id = "enviar_cita1" class="btn btn-success"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Enviar cita</button>
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
                            <?php
                            }else{// este else es lo que se muestra al inicio ,osea el reporte general de todas las citas si :)
                             ?>
                            <div class="table-responsive">
                                <table id="tabla_citas" class="table table-bordered table-striped">
                                    <thead>
                                        <tr>
                                            <th class="text-center">Acción</th>
                                            <th class="text-center">Fecha cita</th>
                                            <th class="text-center">Hora</th>
                                            <th class="text-center">Beneficiario</th>
                                            <th class="text-center">Encargado cita</th>
                                            <th class="text-center">Especialidad</th>
                                            <th class="text-center">Área</th>
                                            <th class="text-center">Estado cita</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php
                                        $query = "SELECT  IC.CODIGO_CITA,IC.FECHA_CITA,IC.HORARIO , IC.CODIGO_PERSONA ,IC.CODIGO_ESPECIALISTA , CONCAT_WS(' ',P.PRIMER_NOMBRE, P.SEGUNDO_NOMBRE, P.PRIMER_APELLIDO,P.SEGUNDO_APELLIDO) AS 
                                        MEDICO , CONCAT_WS(' ',OT.PRIMER_NOMBRE, OT.SEGUNDO_NOMBRE, OT.PRIMER_APELLIDO,OT.SEGUNDO_APELLIDO) AS PACIENTE, IC.CODIGO_ESTADO ,est.NOMBRE as nombre_estado, ar.NOMBRE as nombre_area, espe.NOMBRE as nombre_especialidad
                                        FROM tbl_inscripcion_cita IC ,tbl_persona P ,tbl_persona_especialidad E ,tbl_persona OT, tbl_area a, tbl_estado est, tbl_area ar, tbl_especialidad espe
                                        WHERE E.CODIGO_PERSONA = P.CODIGO_PERSONA 
                                        AND ic.AREA_CITA = ar.CODIGO_AREA
                                        AND ic.CODIGO_ESTADO = est.CODIGO_ESTADO
                                        AND IC.AREA_CITA = a.CODIGO_AREA
                                        AND IC.CODIGO_ESPECIALISTA = E.CODIGO_PERSONA_ESPECIALIDAD 
                                        AND E.CODIGO_ESPECIALIDAD = espe.CODIGO_ESPECIALIDAD
                                        AND  OT.CODIGO_PERSONA = IC.CODIGO_PERSONA ;";
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
                                                                    $evaluar_usuario = $db->prepare("SELECT CODIGO_TIPO_ROL FROM tbl_usuario WHERE NOMBRE_USUARIO = (?);");
                                                                    $evaluar_usuario->execute(array($usuario));
                                                                    $row=$evaluar_usuario->fetchColumn();
                                                                    if($row > 0){
                                                                        $usuariomo = $row;//capturo el nombre del ROl en la variable para usarla en el Procedimiento almacenado
                                                                        //llamar al procedimiento almacenado
                                                                        $evaluar_permiso_actualizar = $db->prepare("CALL Sp_permiso_actualizar(?,?);");
                                                                        $evaluar_permiso_actualizar->execute(array($usuariomo, '48'));
                                                                        $row1=$evaluar_permiso_actualizar->fetchColumn();
                                                                        $permiso_actualizar =$row1; 
                                                                    }
                                                                    ?>  <!-- fin del codigo para sustraer el permiso de actualizar-->
                                                                     <?php 
                                                                    if($permiso_actualizar == 'SI' and $var6 == 'PENDIENTE'){
                                                                    ?>
                                                                <a href="#editar_cita<?php echo $var1; ?>" data-toggle="modal">
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
                                                    <td class="text-center"><?php echo ucwords(strtolower($var4)); ?></td>
                                                    <td class="text-center"><?php echo ucwords(strtolower($var5));?></td>
                                                    <td class="text-center"><?php echo $var8; ?></td>
                                                    <td class="text-center"><?php echo $var7; ?></td>
                                                    <td class="text-center"><?php echo $var6; ?></td>
                                                    <!-- editar cita editar -->
                                                    <div  class="modal fade"id="editar_cita<?php echo $var1 ?>" role="dialog"  >
                                                        <div class="modal-dialog modal-lg">
                                                            <div class="modal-content">
                                                                <!-- Modal content  editar-->
                                                            <form method="POST" class="was-validated" >
                                                                <div class="modal-header" style="background-color: #0CCDE3">
                                                                    <h4 class="text-center">Editar Cita  
                                                                    </h4>
                                                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                </div>
                                                                <!-------------CUERPO DEL MODAL  editar--------------> 
                                                                <div class="modal-body"> 
                                                                <?php  
                                                                    date_default_timezone_set("America/Guatemala"); /* Establece una zona horaria para la fecha actual  */
                                                                    $Fechaactual=  date("$valor" ); /* Asigno la variable valor del parametro que contiene la fecha actual*/
                                                                    $fechamaxima= date("$valor",strtotime($Fechaactual."+ 2 month"));/* para la fecha maxima le sumo dos meses a la fecha actual */
                                                                ?>
                                                                <div class="row"> <!-------- INICIO PRIMERA ROW editar -----------> 
                                                                    <input type="text" value="<?php echo $var1; ?>" hidden class="form-control" name="cod_edit_cita2" id="cod_edit_cita2" >
                                                                    <div class="col-sm-6">

                                                                        <div class="form-group">
                                                                            <label for="fecha" class="form-label">Fecha de la cita: </label>
                                                                            <input type="date" value="<?php echo $var2; ?>"  min= "<?= date ($valor)?>" max="<?= date($fechamaxima)?>" 
                                                                            class="form-control" name="edit_fecha_cita1"  id="edit_fecha_cita1" required ="">
                                                                        </div>
                                                                        <div class="invalid-feedback">
                                                                        Campo obligatorio, completelo con una fecha valida.
                                                                        </div>

                                                                    </div>
                                                                    <div class="col-sm-6">
                                                                        <div class="form-group">
                                                                            <label for="txtcodigo_persona"> Hora: </label>
                                                                            <input type="time"  value="<?php echo $var3; ?>" required min= "<?= ($valor1)?>"   max= "<?= ($valor2)?>" class="form-control"  name="edit_hora1" id="edit_hora1">
                                                                        </div>
                                                                        <div class="invalid-feedback">
                                                                        Campo obligatorio, completelo con una hora valida.
                                                                        </div>
                                                                    </div>
                                                                </div> 
                                                                <?php
                                                                        include "conexion1.php";
                                                                        $queryr = "SELECT es.CODIGO_ESTADO ,es.NOMBRE AS Nombre_estado
                                                                        FROM tbl_estado es  WHERE es.CODIGO_ESTADO = 5 or  es.CODIGO_ESTADO = 7 
                                                                        ;";
                                                                        $resultador=$conn->query($queryr);
                                                                        ?>  
                                                                <div class="row">
                                                                    <div class="col-sm-6">
                                                                        <div class="form-group">
                                                                          <label for="txtcodigo_persona">Estado cita:</label>
                                                                            <select class="form-control" name="estado_edit1" id="estado_edit1" required="">
                                                                             <option selected disabled autocomplete = "off" value=""><?php echo $var6; ?></option>
                                                                                <?php 
                                                                                 if ($resultador->num_rows > 0) {
                                                                                    while($rowr = $resultador->fetch_assoc()) { ?>
                                                                                <option value="<?php echo $rowr['CODIGO_ESTADO'];?>"><?php echo $rowr['Nombre_estado']; ?></option>
                                                                                 <?php } 
                                                                                }?>
                                                                            </select>
                                                                            <div class="invalid-feedback">
                                                                              Campo obligatorio seleccione una opción
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            <div class="modal-footer ">
                                                                <button type="button" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                                                                <button type="submit" name="edit_cita1"  id = "edit_cita1" class="btn btn-success"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>
                                                            </div>
                                                            </div><!--FIN CUERPO DEL MODAL editar --> 
                                                        </form>
                                                        </div>
                                                        </div>
                                                    </div><!-- FIN DEL MODAL editar -->

                                                    <!--Modal para ver y enviar una cita -->
                                                    <div  class="modal fade" id="ver_cita<?php echo $var1 ?>" role="dialog"  >
                                                        <div class="modal-dialog modal-lg">
                                                            <div class="modal-content">
                                                                <!-- Modal content  editar-->
                                                                <form method="POST" class="was-validated">
                                                                <div class="modal-header" style="background-color: #0CCDE3">
                                                                    <h4 class="text-center">Ver Cita  </h4>
                                                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                </div>
                                                                <!-------------CUERPO DEL MODAL  editar--------------> 
                                                                <div class="modal-body"> 
                                                                    <input type="text" value="<?php echo $var1; ?>" hidden class="form-control"
                                                                    name="cod_enviar_cita1" id="cod_enviar_cita1" >
                                                                    <input type="text" value="<?php echo $var6; ?>" hidden class="form-contro" 
                                                                    name="estado_cita1" id="estado_cita1" >
                                                                    <h2 class="text-center">Información de cita</h2>
                                                                    <br>
                                                                    <div class="row"> 
                                                                        <div class="col-sm-6">
                                                                            <div class="form-group">
                                                                                <p><b class="p-1">Fecha de la cita:</b> <?php echo $var2; ?></p>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-sm-6">
                                                                            <div class="form-group">
                                                                                <p><b class="p-1">Hora de la cita:</b> <?php echo $var3; ?></p>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="dropdown-divider"></div><!--SE HAN ORDENADOS EN SU CODIGO!!!!! -->
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
                                                            <!-- ------------------ FIN del modal body---------------------- -->
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                                                                <button type="submit" name="enviar_cita1"  id = "enviar_cita1" class="btn btn-success"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Enviar cita</button>
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
                        <?php
                         }
                        ?>
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
      window.open('Reportes_Prosecar/reportecitasgenerales.php','_blank');
      window.open(this.href,'_self');
    }
  </script>

  <script>
    function Descargar2() {
      window.open('Reportes_Prosecar/reporte_porArea.php','_blank');
      window.open(this.href,'_self');
    }
  </script>


<script type="text/javascript"> 
   //funcion de mostrar el estilo de la datatable
  $(document).ready( function () {
      $('#tabla_citas').DataTable({
        language: {
        "decimal": "",
        "emptyTable": "No hay información,no existe ",
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

