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
     Programa:          Mantenimiento de carga espiritual  
    Fecha:           
    Programador:      
    descripcion:        Permite llevar un mantenimiento de la carga espiritual ,editar,eliminar nuevo     
-----------------------------------------------------------------------
  Historial de Cambio
-----------------------------------------------------------------------
    Programador               Fecha                      Descripcion
  ANY HERNANDEZ         		11-06-2022                 revision de ortagrfia 
----------------------------------------------------------------------->

<?php 
$fecha_actual = date("Y-m-d");
  $_SESSION["bdesde"] = date("Y-m-d",strtotime($fecha_actual."- 1 month"));
  $_SESSION["bhasta"] = date("Y-m-d",strtotime($fecha_actual."+ 1 day"));
?>
<?php 
if(isset($_POST["bdesde"]) && isset($_POST["bhasta"])){
  $_SESSION["bdesde"] = $_POST["bdesde"];
  $_SESSION["bhasta"] = $_POST["bhasta"];
}
?>

<?php
 include_once "conexion.php";
 include_once "conexion3.php";
 include "conexionpdo.php";
 
 $codigoObjeto=2;
 $accion='Ingreso a la tabla de roles';
 $descripcion= 'Usuario se autentifico ';
 bitacora($codigoObjeto, $accion,$descripcion);
 
?>

<!-- Trae los parametros de la hora inicial y final -->
<?php
  $hora ="HORA_INICIO_CARGAACADEMICA";
  $sentencia = $db->prepare("SELECT VALOR FROM tbl_parametros WHERE PARAMETRO =(?);");
  $sentencia->execute(array($hora));
  $row=$sentencia->fetchColumn();
  if($row>0){
    $horainicial2 = $row;
  }
?>
<?php
  $hora1 ="HORA_FINAL_CARGAACADEMICA";
  $sentencia = $db->prepare("SELECT VALOR FROM tbl_parametros WHERE PARAMETRO =(?);");
  $sentencia->execute(array($hora1));
  $row=$sentencia->fetchColumn();
  if($row>0){
    $horafinal2= $row;
  }
?>
<div class="content-wrapper">
  <div class="content-header">
    <div class="container-fluid">
    </div>
    <section class="content-header text-xl-center mb-3 btn-light">
      <h1>
          <h4> Lista de Carga Espiritual <i class=" nav-icon fas  fa-graduation-cap"></i></h4>
      </h1>
    </section>
      <section class="content">
      <div class="card"> <!--card del menu-->
        <div class="card-header" style="background-color:#B3F2FF;">
          <ul class="nav nav-tabs card-header-tabs">
            <li class="nav-item">
            <a class="nav-link" style="color:#000000;" href="crudCargaAcademica">Ver carga academica</a>
            </li>
            <li class="nav-item">
            <a class="nav-link active" style="color:#000000;" href="crudCargaEspiritual">Ver carga espiritual</a>
            </li>
            <li class="nav-item">
            <a class="nav-link" style="color:#000000;" href="procesoCargaAcademica">Agregar Carga</a>
            </li>
          </ul>
        </div>
        <div class="card-body">
          <div class="row">
            <div class="col-md-12">
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
                                $evaluar_permiso = $db->prepare("CALL Sp_permiso_insertar(?,?);");
                                $evaluar_permiso->execute(array($usuariomo, '20'));
                                $row1=$evaluar_permiso->fetchColumn();
                                $permiso_registrar =$row1;             
                            }
                            ?> <!-- fin del codigo para sustraer el permiso de insertar.-->

                    <?php 
                    if ($permiso_registrar == 'SI') // Aqui valida que si permiso esta en ON se mostrara el botton de agregar
                    {
                    ?>  
                <a href="procesoCargaAcademica" >
                   <button  data-toggle="modal"  href="" type='button' id="btnGuardar"  style="color:white;"class="btn btn-info mb-3"><span> <i class="nav-icon fa fa-plus-square mx-1"></i></span>Agregar Carga</button>
                </a>
                <button  onclick="Descargar()" data-toggle="modal"  href="" type='button' id="btnGuardar"  style="color:white; background-color:#FA0079"class="btn btn-danger mb-3"> <span><i class="nav-icon fa fa-file-pdf mx-1"></i></span>Descargar Reporte</button>
    
                  <?php
                    }
                    ?>
          <!--
            <div class="row">
                   <label class=" col-sm-1 control-label" style=" text-align: right; width: 150px">Desde:</label>
                    <div class="col-sm-2">
                      <input class="form-control" type="date" max="<?= date("Y-m-d") ?>" id="bd-desde" id="bd-desde" name="bdesde" value="<?php echo $_SESSION['bdesde']?>" />
                    </div>
                    <label class=" col-sm-1 control-label" style=" text-align: right; width: 150px">Hasta:</label>
                    <div class="col-sm-2">
                      <input class="form-control" type="date" max="<?= date("Y-m-d") ?>"  id="bd-hasta" name="bhasta" value="<?php echo $_SESSION['bhasta']?>" />
                    </div>
                    <button type="submit" class="btn btn-primary"  name="filtrartutor" class="col-sm-1 col-form"><span> <i class="nav-icon fa fa-search mx-1"></i></span>Filtrar por Fecha</button>  
                </div>
                  -->
                </br></br>
                <?php 
                    if(isset($_POST['excel'])){
                      $desde = date("Y-m-d", strtotime($_POST['bdesde']));
                    $hasta = date("Y-m-d", strtotime($_POST['bhasta']));
                    $conexion =@mysqli_connect('localhost','root', '','db_Proyecto_Prosecar') or die ("Problema en la conexion");
                    $sql = "SELECT COUNT(*) FROM `tbl_bitacora_sistema`
                    WHERE  `FECHA`  BETWEEN '$desde' AND '$hasta'";

                    $result = mysqli_query($conexion, $sql);
                    while($fila = mysqli_fetch_assoc($result)){
                      $_SESSION['bcontador2'] = $fila["COUNT(*)"];} 
                      echo "<script>
                      window.open('/ProyectoFinal/vistas/modulos/ReportesBitacoraex.php','_blank');
                      window.open(this.href,'_self');
                      </script>";
                    } 
                  ?>
                  <?php 
                    if(isset($_POST["guardarCambiosb"]) && !Empty($_POST["bdesde"]) && !Empty($_POST["bhasta"])
                    &&($_POST["bdesde"])>($_POST["bhasta"])){

                    echo '<script>
                      Swal.fire({
                      type: "error",
                      title: "¡La fecha de entrada no debe ser menor al la fecha actual! ",
                      showConfirmButton: "true",
                      confirmButtonText: "Ok",
                      closeOnConfirm: "false",
                      background:"rgb(0,0,0,0.95)"
                      }).then((result)=>{
                    if (result.value){
                    window.location = "Formbitacora";
                    }
                    });
                    </script>';
                    } 
                    if(isset($_POST["tipo"]) && !Empty($_POST["tipo"]) && $_POST["tipo"] == "Venta")
                  ?>
                
            <form  method="POST">
              <div class= "card">
                <div class="card-header text-center" style="background-color: #F7F8F9;">
                  <h5 class=" card-title text-center"><strong style="color:black;"></strong></h5>
                </div>
               <div class="card-body"> 
              <div class="table-responsive">
                <table id="tabla_carga" class="table table-bordered table-striped">
                    <thead >
                      <tr>
                        <th class="text-center">Acción</th>
                        <th class="text-center">Número</th>
                        <th class="text-center">Modalidad</th>
                        <th class="text-center">Tutoría</th>
                        <th class="text-center">Tutor</th>
                        <th class="text-center">Sección</th>
                        <th class="text-center">Hora inicio</th>
                        <th class="text-center">Hora final</th>
                        <th class="text-center">Fecha inicio</th>
                        <th class="text-center">Fecha final</th>
                        <th class="text-center">Período</th>
                      </tr>
                    </thead>
                    <tbody>
                    <?php
                      $query = "SELECT c.CODIGO_CARGA, c.CODIGO_PERSONA, c.CODIGO_MODALIDAD, c.CODIGO_TUTORIA, t.NOMBRE as TUTORIA,  CONCAT_WS(' ',p.PRIMER_NOMBRE,p.SEGUNDO_NOMBRE,p.PRIMER_APELLIDO,p.SEGUNDO_APELLIDO) 
                      as NOMBRE_COMPLETO  ,m.TIPO as MODALIDAD, c.CODIGO_SECCION, s.NOMBRE AS SECCION, c.HORA , c.HORA_FINAL, c.FECHA_INICIO, c.FECHA_FINAL, c.CREADO_POR_USUARIO, c.FECHA_CREACION, c.MODIFICADO_POR, c.FECHA_MODIFICACION, c.PERIODO
                                          FROM tbl_carga_academica c ,tbl_tutoria t, tbl_persona p, tbl_modalidad m , tbl_seccion s
                                          WHERE c.CODIGO_PERSONA= p.CODIGO_PERSONA 
                                          AND c.CODIGO_TUTORIA= t.CODIGO_TUTORIA
                                          AND c.CODIGO_MODALIDAD= m.CODIGO_MODALIDA 
                                          AND c.CODIGO_SECCION = s.CODIGO_SECCION
                                          AND t.CODIGO_AREA  = 4; ";
                      $result = $conn->query($query);
                      if ($result->num_rows > 0) {
                        $contador=0;
                        while($row = $result->fetch_assoc()) {
                        $contador=$contador+1;
                        $var1 = $row['CODIGO_CARGA'];
                        $var2 = $row['MODALIDAD'];
                        $var3 = $row['TUTORIA'];
                        $var4 = $row['NOMBRE_COMPLETO'];
                        $var5 = $row['SECCION'];
                        $var6 = $row['HORA'];
                        $var7 = $row['FECHA_INICIO'];
                        $var8 = $row['FECHA_FINAL'];
                        $var9 = $row['CODIGO_TUTORIA'];
                        $var10 = $row['CODIGO_MODALIDAD'];
                        $var11 = $row['CODIGO_PERSONA'];
                        $var12 = $row['HORA_FINAL'];
                        $var13 = $row['CODIGO_SECCION'];
                        $var14 = $row['PERIODO'];

                      ?>
                      <tr>
                        <td>
                          <div class="text-center">
                            <div class="btn-group">
                              <?php
                                $usuario=$_SESSION['vario'];
                                $evaluar_usuario = $db->prepare("SELECT CODIGO_TIPO_ROL  FROM tbl_usuario WHERE NOMBRE_USUARIO = (?);");
                                $evaluar_usuario->execute(array($usuario));
                                $row=$evaluar_usuario->fetchColumn();
                                if($row > 0){
                                $usuariomo = $row;//capturo el nombre del ROl en la variable para usarla en el Procedimiento almacenado
                                $evaluar_permiso_eliminar = $db->prepare("CALL Sp_permiso_eliminar(?,?);");
                                $evaluar_permiso_eliminar->execute(array($usuariomo, '20'));
                                $row1=$evaluar_permiso_eliminar->fetchColumn();
                                $permiso_eliminar =$row1; 
                                }
                                ?>
                                <?php
                                    if($permiso_eliminar == 'SI'){
                                ?> 
                               <!--Fin del boton de eliminar -->
                                <a href="#ELIMINAR<?php echo $var1;?>" data-toggle="modal">
                                  <button id="ELIMINAR_ROL" name="ELIMINAR_ROL" type='button'   class=" form-control btn btn-danger" data-dismiss="modal"><i class="nav-icon fas fa-trash"></i></button>
                                </a>
                                <!--Codigo para asignar permiso del boton de editar -->
                                <?php
                                  }
                                ?>
                                <?php
                                  $usuario=$_SESSION['vario'];
                                  //Evaluo si existe el tipo de Rol
                                  $evaluar_usuario = $db->prepare("SELECT CODIGO_TIPO_ROL FROM tbl_usuario WHERE NOMBRE_USUARIO = (?);");
                                  $evaluar_usuario->execute(array($usuario));
                                  $row=$evaluar_usuario->fetchColumn();
                                  if($row > 0){
                                      $usuariomo = $row;//capturo el nombre del ROl en la variable para usarla en el Procedimiento almacenado
                                      //llamar al procedimiento almacenado
                                      $evaluar_permiso_actualizar = $db->prepare("CALL Sp_permiso_actualizar(?,?);");
                                      $evaluar_permiso_actualizar->execute(array($usuariomo, '20'));
                                      $row2=$evaluar_permiso_actualizar->fetchColumn();
                                      $permiso_actualizar =$row2; 
                                  }
                                  ?>
                                  <?php
                                    if($permiso_actualizar == 'SI')
                                    {
                                  ?>
                                  
                               
                                  <a href="#EDITACARGA<?php echo $var1; ?>" data-toggle="modal">
                                    <button type='button' id="btnGuardar"  style="color:white;"class=" form-control btn btn-warning"><span> <i class="nav-icon fas fa-edit mx-1"></i></span></button>
                                    </a>
                                 <a>
                               
                                   <form method="post"  class="form-horizontal" role="form" action="Reportes_Prosecar/reporteIndividualCarga.php" target="_blank"> 
                                    <input type="hidden" name="imprimir" value="<?php echo $var1 ?>">
                                    <button type='submit' title='Imprimir'  style="color:white; "class=" form-control btn btn-info mb-3"><span><i class="nav-icon fa fa-file-pdf mx-1"></i></span></button> </form>
                                </a>
                                <?php
                                    }
                                  ?>
                            </div>
                          </div><!--fin del text-center -->
                        </td>
                        <td class="text-center"><?php echo $contador; ?></td>
                        <td class="text-center"><?php echo $var2; ?></td>
                        <td class="text-center"><?php echo $var3; ?></td>
                        <td class="text-center"><?php echo $var4; ?></td>
                        <td class="text-center"><?php echo $var5; ?></td>
                        <td class="text-center"><?php echo $var6; ?></td>
                        <td class="text-center"><?php echo $var12; ?></td>
                        <td class="text-center"><?php echo $var7; ?></td>
                        <td class="text-center"><?php echo $var8; ?></td>
                        <td class="text-center"><?php echo $var14; ?></td>
                        

                        <div id="EDITACARGA<?php echo $var1 ?>" class="modal fade" role="dialog">
                          <div class="modal-dialog modal-lg">
                            <div class="modal-content"><!-- Modal content-->
                              <form  method="POST">
                                <div class="modal-header" style="background-color: #0CCDE3">
                                  <h4 class="card-title">Editar Carga Espiritual</h4>
                                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                <div class="modal-body"><!--CUERPO DEL MODAL -->
                                  <div class="row"><!-- INICIO PRIMERA ROW --> 
                                    <input type="text" value ="<?php echo $var1; ?>" hidden  class="form-control" name="IDCARGA">
                                    <div class="col-sm-4">
                                      <div class="form-group">
                                        <label for="txtcodigo_persona">Hora Inicio:</label>
                                        <input  type="time" min= "<?= ($horainicial2)?>" step="1800"   max= "<?= ($horafinal2)?>" value ="<?php echo $var6;?>" class="form-control" name="hora1">
                                        <div class="invalid-feedback">
                                        Horario no valido, sobrepasa la hora limite establecida
                                       </div>
                                      </div>
                                    </div>
                                    <div class="col-sm-4">
                                      <div class="form-group">
                                        <label for="txtcodigo_persona">Hora Final:</label>
                                        <input  type="time" mmin= "<?= ($horainicial2)?>" step="1800"   max= "<?= ($horafinal2)?>" value ="<?php echo $var12; ?>" class="form-control" name="hora_final1" >
                                        <div class="invalid-feedback">
                                        Horario no valido, sobrepasa la hora limite establecida
                                       </div>
                                      </div>
                                    </div>
                                    <?php
                                    date_default_timezone_set("America/Guatemala");
                                    $Fechaactual=  date('Y-m-d'); 
                                    $fechamaxima= date("Y-m-d",strtotime($Fechaactual."+ 3 month"));
                                    ?>
                                    <div class="col-sm-4">
                                      <div class="form-group">
                                        <label for="txtcodigo_persona">Fecha Inicio:</label>
                                        <input  type="date"  value ="<?php echo $var7; ?>"  min= "<?= $Fechaactual?>"   max= "<?=  $fechamaxima?>" class="form-control" name="fecha_inicio1" >
                                      </div>
                                    </div>
                                  </div><!--fin row -->
                                  <div class="row">
                                    <div class="col-sm-4">
                                      <div class="form-group">
                                        <label for="txtcodigo_persona">Fecha Final:</label>
                                        <input  type="date"  value ="<?php echo $var8; ?>" class="form-control" name="fecha_final1" >
                                      </div>
                                    </div>
                                    <div class="col-sm-4">
                                      <?php //
                                      $query = "SELECT * FROM tbl_tutoria";
                                      $resultadod=$conn->query($query);                
                                      ?>
                                      <label  class="control-label">Tutoría:</label> 
                                      <div class="form-group">
                                        <select style="width: 100%" class="form-control select2"   style="width: 100%;" name="tutoria1"  disabled = "disabled">
                                          <option value="<?php echo $var9; ?>" ><?php echo $var3; ?></option> 
                                          <?php 
                                          if ($resultadod->num_rows > 0) {
                                          while($row = $resultadod->fetch_assoc()) { 
                                            $codigo_tutoria = $row['CODIGO_TUTORIA'];
                                            $nombre = $row['NOMBRE'];
                                          ?>
                                          <option value="<?php echo $codigo_tutoria?>" ><?php echo $nombre;?></option>
                                          <?php 
                                          } 
                                          }
                                          ?>
                                        </select> 
                                      </div>
                                    </div> 
                                    <div class="col-md-4"><!--seccion-->
                                     <?php //
                                      $query = "SELECT * FROM tbl_seccion";
                                      $resultadod=$conn->query($query);                
                                      ?>
                                      <label for="identidad" class="control-label">Sección:</label> 
                                      <div class="form-group">
                                      <select style="width: 100%"   class="form-control select2" required name="seccion1" >
                                      <option value="<?php echo $var13; ?>" ><?php echo $var5; ?></option> 
                                        <?php 
                                          if ($resultadod->num_rows > 0) {
                                            while($row = $resultadod->fetch_assoc()) { 
                                            $codigo = $row['CODIGO_SECCION'];
                                            $nombre = $row['NOMBRE'];
                                          ?>
                                        <option value="<?php echo $codigo?>" ><?php echo $nombre;?></option>
                                        <?php 
                                        } 
                                        }
                                        ?>
                                      </select>
                                      </div>
                                    </div>
                                    <div class="col-sm-4"> 
                                      <?php //
                                        $query = "SELECT * FROM tbl_modalidad";
                                        $resultadod=$conn->query($query);                
                                      ?>
                                      <label for="identidad" class="control-label">Modalidad:</label> 
                                      <div class="form-group">
                                        <select class="form-control select2 "  style="width: 100%;"  name="modalidad1"  required>
                                          <option value="<?php echo $var10; ?>" ><?php echo $var2; ?></option><!--La misama forma que lo de encargado -->
                                          <?php 
                                            if($resultadod->num_rows > 0) {
                                              while($row = $resultadod->fetch_assoc()) { 
                                              $codigo_modalidad = $row['CODIGO_MODALIDA'];
                                              $nombre = $row['TIPO'];
                                        ?>
                                          <option  value="<?php echo $codigo_modalidad?>" ><?php echo $nombre;?></option>
                                          <?php 
                                          } 
                                          }
                                          ?>
                                        </select> 
                                      </div>
                                    </div><!--cierre de modalidad-->
                                    <div class="col-sm-8"> 
                                      <?php //
                                      $query = "SELECT CODIGO_PERSONA, CONCAT_WS(' ',PRIMER_NOMBRE, SEGUNDO_NOMBRE, PRIMER_APELLIDO,SEGUNDO_APELLIDO) as NOMBRE
                                      FROM `tbl_persona` WHERE CODIGO_TIPO_PERSONA = 8;";
                                      $resultadod=$conn->query($query);                
                                      ?>
                                      <div class="form-group">
                                        <label  class="control-label">Catequista/ Asesor Espiritual:</label>
                                        <select class="form-control select2"  style="width: 100%;"  name="tutor1" required>
                                          <option value="<?php echo $var11;?>"> <?php echo $var4; ?></option><!--Se muestra el nombre completo y se trae al value el codigo de la persona de la tabla carga -->
                                          <?php 
                                          if ($resultadod->num_rows > 0) {
                                            while($row = $resultadod->fetch_assoc()) { 
                                            $codigo_tutor = $row['CODIGO_PERSONA'];
                                            $nombre = $row['NOMBRE'];
                                          ?>
                                          <option value="<?php echo $codigo_tutor?>" ><?php echo $nombre;?></option><!--Trae el nombre de las personas que son tutores de la tabla de personas -->
                                          <?php 
                                          } 
                                          }
                                          ?>
                                        </select> 
                                      </div>
                                    </div><!--CIERRE DEL ENCARAGADO -->
                                  </div><!--fin row -->
                                </div><!--fin modal body -->
                                <div class="modal-footer ">
                                  <button type="button" name="ELI" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                                  <button type="submit" name="EDITAR_CARGA" class="btn btn-warning btn mx-1"><span> <i class="nav-icon fas fa-edit mx-1"></i></span>Editar</button>
                                </div><!--FIN DEL DIV DE BOTONES DE GUARDAR -->
                              </form>
                            </div>
                          </div>
                        </div><!--fin modal editar -->
                        <!--INICIO DEL MODAL ELIMINAR   -->
                        <div id="ELIMINAR<?php echo $var1 ?>"  name="div_eliminar" id="div_eliminar"class="modal fade" role="dialog">
                          <div class="modal-dialog">
                            <div class="modal-content">
                              <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel"></h5>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                              </div>
                              <form  method="POST">
                                <div class="modal-body">
                                  <input type="text" value ="<?php echo $var1; ?>" hidden class="form-control" name="eliminar_carga" id="eliminar_carga">
                                  <h4 class="text-center">¿Esta seguro de eliminar la carga?</h4>
                                </div> <!--fin el card body -->
                                <div class="modal-footer ">
                                  <button type="button" name="cerrar" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                                  <button type="submit"  name="ELIMINAR_CARGA" id="ELIMINAR_CARGA"   class="btn btn-primary">Si,eliminar</button>      
                                </div><!--FIN DEL DIV DE BOTONES DE GUARDAR -->
                              </form>
                            </div><!--fin del modal contener -->
                          </div><!--fin del modal dialog -->
                        </div><!--fin del modal de eliminar -->

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


  <script>
    function Descargar() {
      window.open('Reportes_Prosecar/reporteCargaEspiritual.php','_blank');
      window.open(this.href,'_self');
    }
  </script>

<script>
    function Descargar1() {
      window.open('Vistas/modulos/reporteEstudiante.php','_blank');
      window.open(this.href,'_self');
    }
  </script>

<script type="text/javascript"> 
   //funcion de mostrar el estilo de la datatable
  $(document).ready( function () {
      $('#tabla_carga').DataTable({
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
        "search": "Buscar carga:",
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



