
<?php
 include_once "conexion.php";
 include_once "conexion3.php";
 $codigoObjeto=4;
 $accion='Ingreso a mantenimiento de Familiar';
 $descripcion='Aqui se visualiza los familiares que se han registrado';
bitacora($codigoObjeto,$accion,$descripcion);
?>
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
<head>

</head>

<div class="content-wrapper">
  <div class="content-header">
    <div class="container-fluid">
    </div><!-- /.container-fluid -->
  </div>
  
  <section class="content">
    <div class="container-fluid">
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
                                $evaluar_permiso->execute(array($usuariomo, '1'));
                                $row1=$evaluar_permiso->fetchColumn();
                                $permiso_registrar =$row1;             
                            }
                          ?> <!-- fin del codigo para sustraer el permiso de insertar.-->
                          <php
                             if ($permiso_registrar= 'ON'){

                          ?>
            <!-- <button  data-toggle="modal"  href="Vistas/modulos/procesoMatricula.php" type='button' id="btnGuardar"  style="color:white;"class="btn btn-primary mb-3">Agregar Matricula</button> -->
                          <php
                              }
                          ?>


          
  <section class="content">
    <div class="container-fluid">
        <div class="card">
          <div class="card-header"  style="background-color: #A8D2D0 ">
            <ul class="nav nav-tabs card-header-tabs">
              <li class="nav-item">
                <a class="nav-link active" aria-current="true" href="#"> Ver Familiares </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="procesoRegistrarFamiliares"> Registrar Familiar </a>
              </li>
            </ul>
          </div><!--FIN DEL CARD HEADER -->
          <div class="card-body">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <a href="procesofamiliares" >
                    <div class="row">
                        <label class=" col-sm-1 control-label" style=" text-align: right; width: 150px">Desde:</label>
                        <div class="col-sm-2">
                        <input class="form-control" type="date" id="bd-desde" name="desde" value="" />
                        </div>
                        <label class=" col-sm-1 control-label" style=" text-align: right; width: 150px">Hasta:</label>
                        <div class="col-sm-2">
                        <input class="form-control" type="date" id="bd-desde" name="desde" value="" />
                        </div>
                        <button type="submit" class="btn btn-primary"  name="filtrarfamiliar" class="col-sm-1 col-form"><span> <i class="nav-icon fa fa-search mx-1"></i></span>Generar</button>  
                   </div><!--fin de row -->



          <div class="card-body">
          <div class="row">
            <div class="col-md-12">
                <a href="procesofamiliares">
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
                                $evaluar_permiso->execute(array($usuariomo, '1'));
                                $row1=$evaluar_permiso->fetchColumn();
                                $permiso_registrar =$row1;             
                            }
                            ?> <!-- fin del codigo para sustraer el permiso de insertar.-->

                 
                     <?php 
                      if($permiso_registrar = 'SI'){
                     ?>
              
                <a href="procesoRegistrarFamiliares">

                <button  data-toggle="modal"  href="" type='button' id="btnGuardar"  style="color:white;"class="btn btn-primary mb-3" ><span> <i class="nav-icon fa fa-plus-square mx-1"></i></span>Registrar Familiar</button>
                </a>
                <?php 
                      }
                     ?>
                 <button  onclick="Descargar()" data-toggle="modal"  href="" type='button' id="btnGuardar"  style="color:white; background-color:#FA0079"class="btn btn-danger mb-3"> <span><i class="nav-icon fa fa-file-pdf mx-1"></i></span>Descargar Reporte</button>
                <button hidden  onclick="Descargar1()" data-toggle="modal"  href="" type='button' id="btnGuardar"  style="color:white;"class="btn btn-danger mb-3" > <span><i class="nav-icon fa fa-file-pdf mx-1"></i></span>PDF Familiar</button>
              
                </a>
          <!-- jquery validation -->
          <div class="card card-primary">
            <div class="card-header text-center" style="background-color: #FEFEFE "><!-- TITULO ENCABEZADO DATOS PERSONALES -->
               <h1 class=" card-title text-center"><strong style="color:black;">FAMILIARES REGISTRADOS </strong></h1>
            </div>
            <form  method="POST"><!-- form start -->
              <div class="card-body">
                  
                <div class="table-responsive">
                  <table id="tabla_familiar" class="table table-bordered table-striped">
                      <thead>
                        <tr>
                        <th class="text-center">Acción</th>
                                            <th class="text-center">Codigo</th>
                                            <th class="text-center">Familiar</th>
                                            <th class="text-center">Estado Civil</th>
                                            <th class="text-center">Nivel Educativo</th>
                                            <th class="text-center">Ingresos </th>
                                            <th class="text-center">Nombre Iglesia</th>
                        </tr>
                      </thead>
                      <tbody>
                      <?php
                                        $query = "SELECT tf.CODIGO_PERSONA,  concat_ws(' ', tp.PRIMER_NOMBRE,tp.SEGUNDO_NOMBRE, tp.PRIMER_APELLIDO, tp.SEGUNDO_APELLIDO) as FAMILIAR, tf.ESTADO_CIVIL, tf.NIVEL_EDUCATIVO, tF.INGRESOS_DE_FAMILIAR,tf.NOMBRE_IGLESIA, tf.CODIGO_FAMILIAR 
                                        from tbl_persona tp, tbl_familiar tf
                                        where tp.CODIGO_PERSONA = tf.CODIGO_PERSONA;";
                                        $result = $conn->query($query);
                                        if ($result->num_rows > 0) {
                                            while ($row = $result->fetch_assoc()) {
                                                $var1 = $row['CODIGO_PERSONA'];
                                                $var2 = $row['FAMILIAR'];
                                                $var3 = $row['ESTADO_CIVIL'];
                                                $var4 = $row['NIVEL_EDUCATIVO'];
                                                $var5 = $row['INGRESOS_DE_FAMILIAR'];
                                                $var6 = $row['NOMBRE_IGLESIA'];
                                                $var7 = $row['CODIGO_FAMILIAR'];
                                        ?>
                        <tr>
                          <td>
                            <div class="text-center" >
                              <div class="btn-group">
                                
                               <a href="#ELIMINAR<?php echo $var1;?>" data-toggle="modal">
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
                                      $evaluar_permiso_eliminar->execute(array($usuariomo, '1'));
                                      $row1=$evaluar_permiso_eliminar->fetchColumn();
                                      $permiso_eliminar =$row1; 
                                  }
                                ?>  
                                <php
                                    if ($permiso_registrar= 'ON'){

                                ?>
                                <button id="ELIMINAR_FAMILIAR" name="ELIMINAR_FAMILIAR" type='button'   class="btn btn-danger" data-dismiss="modal"><i class="nav-icon fas fa-trash"></i>
                               </button>
                               <php
                                  }
                                ?>
                               </a>
                                <a href="#EDITARFAMILIAR<?php echo $var1; ?>" data-toggle="modal">
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
                                  $evaluar_permiso_actualizar->execute(array($usuariomo, '1'));
                                  $row1=$evaluar_permiso_actualizar->fetchColumn();
                                  $permiso_actualizar =$row1; 
                                    
                                  }
                                ?>
                                <php
                                    if ($permiso_registrar= 'ON'){

                                ?>
                                <button type='button' id="btnGuardar"  style="color:white;"class="btn btn-warning"><span> <i class="nav-icon fas fa-edit mx-1"></i></span></button>
                                <php
                                  }
                                 ?> 
                              </a>
                              </div>
                            </div><!-- final del text-center -->
                          </td>
                          
                          <td class="text-center"><?php echo $var7; ?></td>
                                                    <td class="text-center"><?php echo $var2; ?></td>
                                                    <td class="text-center"><?php echo $var3; ?></td>
                                                    <td class="text-center"><?php echo $var4; ?></td>
                                                    <td class="text-center"><?php echo $var5; ?></td>
                                                    <td class="text-center"><?php echo $var6; ?></td>
                         <!-- editar cita editar -->
                                                    
        <div  class="modal fade"id="EDITARFAMILIAR<?php echo $var1 ?>" role="dialog"  >
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <!-- Modal content  editar-->
                    <form method="POST">
                    <div class="modal-header" style="background-color: #0CCDE3">
                        <h4 class="text-center">Editar Familiar
                        </h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <!-------------CUERPO DEL MODAL  editar--------------> 
                    <div class="modal-body"> 
                    <!-------- INICIO PRIMERA ROW editar ----------->         
                    <div class="row"> 
                        <input type="text" value="<?php echo $var1; ?>" hidden class="form-control" name="EDITARFAMILIAR" id="EDITARFAMILIAR" >
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="txtcodigo_persona">Estado Civil</label>
                                <input  type="text"  value ="<?php echo $var3; ?>" class="form-control" autocomplete = "off" type="text" onkeypress="return soloLetras(event);"  name="editar_estado" id="editar_estado">
                            </div>
                        </div>
                    
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="txtcodigo_persona">Nivel Educativo</label>
                                <input  type="text"  value ="<?php echo $var4; ?>" class="form-control" autocomplete = "off" type="text" onkeypress="return soloLetras(event);"  name="editar_nivele" id="editar_nivele">
                            </div>
                        </div>
                      </div>  
                    <div class="row"> 
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="txtcodigo_persona">Ingresos</label>
                                <input  type="text"  value ="<?php echo $var5; ?>" class="form-control" autocomplete = "off" type="text" onkeypress="return solonumeros(event);"  name="editar_ingresos" id="editar_ingresos">
                            </div>
                        </div>

                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="txtcodigo_persona">Iglesia</label>
                                <input  type="text"  value ="<?php echo $var6; ?>" class="form-control" autocomplete = "off" type="text" onkeypress="return sololetras(event);"  name="editar_iglesia" id="editar_iglesia">
                            </div>
                        </div>
                    </div> 
            <!-- ------------------ FIN PRIMERA ROW editar---------------------- -->
                <div class="modal-footer ">
                    <button type="button" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                    <button type="submit" name="edit_familiar"  id = "edit_familiar" class="btn btn-success"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>
                </div>
                        </div><!--FIN CUERPO DEL MODAL editar --> 
                    </form>
                </div>
            </div>
        </div><!-- FIN DEL MODAL editar -->
                           <!-- inicio modal eliminar  -->   
        <div id="ELIMINAR<?php echo $var1 ?>"   name="ELIMINARFAMILIAR" id="ELIMINARFAMILIAR" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel"></h5>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                        <form id="FORMEeliminar" method="POST">
                            <div class="modal-body">
                                <input type="text" value="<?php echo $var1; ?>" hidden class="form-control" name="eliminarfami" id="eliminarfami">
                                <h4 class="text-center">¿Esta seguro de eliminar estos campos?</h4>
                            </div> <!--fin el card body eliminar -->
                            <div class="modal-footer ">
                                <button type="button" name="cerrar" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                                <button type="submit" name="eliminar_fami" id="eliminar_fami"  class="btn btn-primary">Si,eliminar</button>      
                            </div><!--FIN DEL DIV DE BOTONES DE GUARDAR eliminar -->
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

 

  </section>
<!-- Modal -->
                
<script>
    function Descargar() {
      window.open('Vistas/modulos/reportefamiliar.php','_blank');
      window.open(this.href,'_self');
    }
  </script>


<script type="text/javascript"> 
   //funcion de mostrar el estilo de la datatable
  $(document).ready( function () {
      $('#tabla_familiar').DataTable({

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
        "search": "Buscar Familiar:",
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

