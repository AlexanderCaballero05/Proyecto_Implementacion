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
   
    Programa:          Pantalla de registro de citas espirituales
    Fecha:             04-abril-2022
    Programador:       Arnold Caballero 
    descripcion:       Pantalla  que muestra las citas que estan en espera y de aqui las envia a consulta

-----------------------------------------------------------------------
                      Historial de Cambio
-----------------------------------------------------------------------
    
    Programador               Fecha                      Descripcion
    
    Diana Garcia         		08-06-2022                 Cambio en el modal de editar con el titulo de la pagina
    


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
<div class="content-wrapper">
    <div class="content-header">
        <div class="container-fluid">
        </div><!-- /.container-fluid -->
    </div>

    <section class="content-header text-xl-center mb-3 "> 
          <h4> Citas Espirituales</h4>
        </section>
    <section class="content">
       <div class="card"> 
        <div class="card-header" style="background-color:#B3F2FF;">
        <ul class="nav nav-tabs card-header-tabs">
         <li class="nav-item">
            <a class=" nav-link active" style="color:#000000;" href="procesoCitasEspirituales">Citas en Espera</a>
            </li>
            <li class="nav-item">
            <a class=" nav-link" style="color:#000000;" href="#">Registrar Expediente</a>
            </li>
            <li class="nav-item">
            <a class="nav-link" style="color:#000000;" href="#">Consulta Espiritual</a>
            </li>
            <li class="nav-item">
            <a class="nav-link" style="color:#000000;" href="#">Informe de Consulta</a>
            </li>
            <li class="nav-item">
            <a class="nav-link" style="color:#000000;" href="crudPacientesEspirituales">Lista de Personas</a>
            </li>
          </ul>
        </div>
        <div class="card-body">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
            
                   
                    <!-- jquery validation -->
                    <div class="card card-primary">
                        <div class="card-header text-center" style="background-color: #F7F8F9";>
                            <!-- TITULO ENCABEZADO DATOS PERSONALES -->
                            <h1 class=" card-title text-center"><strong style="color:black;">Citas previas</strong></h1>
                        </div>
                        <!-- form start -->
                        <div class="card-body">
                            <div class="table-responsive">
                                <table id="tabla_citas" class="table table-bordered table-striped">
                                    <thead>
                                        <tr>
                                            <th class="text-center">Acción</th>
                                            <th class="text-center">Código</th>
                                            <th class="text-center">Fecha Cita</th>
                                            <th class="text-center">Hora</th>
                                            <th class="text-center">Beneficiario</th>
                                            <th class="text-center">Estado de Cita</th>
                                        </tr>
                                    </thead>
                                    <tbody>
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
                                    
                                        $query = "SELECT i.CODIGO_CITA, i.CODIGO_PERSONA , CONCAT_WS (' ',DNI,pe.PRIMER_NOMBRE, ' ',pe.SEGUNDO_NOMBRE,' ',pe.PRIMER_APELLIDO) AS PACIENTE, i.FECHA_CITA, i.HORARIO, est.NOMBRE as nombre_estado
                                        FROM tbl_inscripcion_cita i, tbl_persona pe , tbl_persona_especialidad es, tbl_estado est
                                                                                WHERE i.CODIGO_PERSONA = pe.CODIGO_PERSONA
                                                                                AND i.CODIGO_ESPECIALISTA = es.CODIGO_PERSONA_ESPECIALIDAD
                                                                                AND i.CODIGO_ESTADO = est.CODIGO_ESTADO
                                                                                AND es.CODIGO_PERSONA = '$cod_usuario'
                                                                                AND i.CODIGO_ESTADO = '9' 
                                                                                AND i.AREA_CITA = '4'
                                                                                AND I.FECHA_CITA = CURDATE();" ;
                                      
                                        $result = $conn->query($query);
                                        if ($result->num_rows > 0) {
                                            while ($row = $result->fetch_assoc()) {
                                                $var1 = $row['CODIGO_CITA'];
                                                $var2 = $row['PACIENTE'];
                                                $var3 = $row['FECHA_CITA'];
                                                $var4 = $row['HORARIO'];
                                                $var5 = $row['nombre_estado'];
                                                $var6 = $row['CODIGO_PERSONA'];
                                        ?>
                                                <tr>
                                                    <td>
                                                        <div class="text-center">
                                                            <div class="btn-group">
                                                              

                                                                  
                                                                <a href="#editar_cita<?php echo $var1; ?>" data-toggle="modal">
                                                                    <button type='button' style="color:white;" class="form-control btn btn-warning"><span>
                                                                     <i class="nav-icon fas fa-edit mx-1"></i></span></button>
                                                                </a>

                                                                   


                                                                <a href="#ver_cita<?php echo $var1; ?>" data-toggle="modal">
                                                                    <button type='button' style="color:white;" class=" form-control btn btn-success"><span>
                                                                     Atender</span></button>
                                                              </a>


                                                            </div>
                                                        </div><!-- final del text-center -->
                                                    </td>
                                                    <td class="text-center"><?php echo $var1; ?></td>
                                                    <td class="text-center"><?php echo $var3; ?></td>
                                                    <td class="text-center"><?php echo $var4; ?></td>
                                                    <td class="text-center"><?php echo $var2; ?></td>
                                                    <td class="text-center"><?php echo $var5; ?></td>
                                                 
                                                    
                                                    <!-- editar cita editar -->
                                                    
                                                    <div  class="modal fade"  
                                                    id="editar_cita<?php echo $var1 ?>" role="dialog"  >
                                                        <div class="modal-dialog modal-md">
                                                            <div class="modal-content">
                                                                <!-- Modal content  editar-->
                                                                
                                                                <div class="modal-header" style="background-color: #0CCDE3">
                                                                    <h4 class="text-center">Editar Cita  
                                                                    </h4>
                                                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                </div>
                                                                <form method="POST">
                                                                <!-------------CUERPO DEL MODAL  editar--------------> 
                                                                <div class="modal-body"> 
                                                                <!-------- INICIO PRIMERA ROW editar ----------->         
                                                           <div class="row"> 
                                                                    <input type="text" value="<?php echo $var1; ?>" 
                                                                    hidden class="form-control"
                                                                    name="cod_edit_cita" id="cod_edit_cita" >
                                                                   
                                                                
                                                              
                                                                   <?php
                                                                        include "conexion1.php";
                                                                        $queryr = "SELECT es.CODIGO_ESTADO ,es.NOMBRE AS Nombre_estado
                                                                        FROM tbl_estado es
                                                                        WHERE es.CODIGO_ESTADO = 7 or  es.CODIGO_ESTADO = 9;";
                                                                        $resultador=$conn->query($queryr);
                                                                        ?>  


                                                                    <div class="col-sm-12">
                                                                        <div class="form-group">
                                                                          <label for="txtcodigo_persona">Estado Cita:</label>
                                                                            <select class="form-control" name="MODUSUARIO" required="">
                                                                                <option selected disabled value="">Elegir...</option>
                                                                                            <?php 
                                                                                        if ($resultador->num_rows > 0) {
                                                                                            while($rowr = $resultador->fetch_assoc()) { ?>
                                                                                <option value="<?php echo $rowr['CODIGO_ESTADO'];?>"><?php echo $rowr['Nombre_estado']; ?></option>
                                                                                        <?php } 
                                                                                            }?>
                                                                            </select>
                                                                                    <div class="invalid-feedback">
                                                                                        Eliga una opción.
                                                                                    </div>
                                                                        </div>
                                                                    </div>

                                                                </div>
                                                        <!-- ------------------ FIN PRIMERA ROW editar---------------------- -->
                                                            <div class="modal-footer ">
                                                                <button type="button" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                                                                <button type="submit" name="enviar_cita_psicologica"  id = "enviar_cita_psicologica" class="btn btn-success"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>
                                                              
                                                            </div>
                                                                    </div><!--FIN CUERPO DEL MODAL editar --> 
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div><!-- FIN DEL MODAL editar -->




                                                    <div  class="modal fade"  
                                                    id="ver_cita<?php echo $var1 ?>" role="dialog"  >
                                                        <div class="modal-dialog modal-lg">
                                                            <div class="modal-content">
                                                                <!-- Modal content  editar-->
                                                                
                                                                <div class="modal-header" style="background-color: #0CCDE3">
                                                                    <h4 class="text-center">Ver Cita  
                                                                    </h4>
                                                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                </div>
                                                                <form method="POST">
                                                                <!-------------CUERPO DEL MODAL  editar--------------> 
                                                                <div class="modal-body"> 
                                                                <!-------- INICIO PRIMERA ROW editar ----------->  
                                                                <input type="text" value="<?php echo $var1; ?>" 
                                                                        hidden class="form-control"
                                                                        name="codigo_cita_espiritual" >

                                                                        <input type="text" value="<?php echo $var6; ?>" 
                                                                        hidden class="form-control"
                                                                        name="codigo_persona" id="codigo_persona" >

                                                                        

                                                                        <h2 class="text-center">Información de cita</h2>
                                                                        <br>
                                                                    <div class="row"> 
                                            
                                                                        <div class="col-sm-6">
                                                                                <div class="form-group">
                                                                                    <p><b class="p-1">Fecha de la cita:</b> <?php echo $var3; ?></p>
                                                                                </div>
                                                                        </div>


                                                                        <div class="col-sm-6">
                                                                                <div class="form-group">
                                                                                    <p><b class="p-1">Hora de la cita:</b> <?php echo $var4; ?></p>
                                                                                </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="dropdown-divider"></div>

                                                                    <div class="row"> 
                                                                            <div class="col-sm-12">
                                                                                        <div class="form-group">
                                                                                        <p><b class="p-1">Beneficiario:</b> <?php echo $var2; ?></p>
                                                                                        </div>
                                                                                </div>

                                                                        
                                                                    </div>


                                                                  


                                                                    <div class="row"> 
                                                                            <div class="col-sm-6">
                                                                                        <div class="form-group">
                                                                                        <p><b class="p-1">Estado: </b> <?php echo $var5; ?></p>

                                                                                        </div>
                                                                                </div>

                                                                        
                                                                    </div>
                                                             
                                                                </div> 
                                                        <!-- ------------------ FIN PRIMERA ROW editar---------------------- -->
                                                            <div class="modal-footer ">
                                                                <button type="button" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                                                                <button type="submit" name="enviar_cita_espiritual"  class="btn btn-success"><span> <i class="nav-icon fas fa-save mx-1"></i></span>Atender Consulta</button>

                                                              
                                                            </div>
                                                                    </div><!--FIN CUERPO DEL MODAL editar --> 
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div><!-- FIN DEL MODAL editar -->


                                                    <!-- inicio modal eliminar  -->   
                                                    <div id="ELIMINAR<?php echo $var1 ?>"   name="eliminar_cod_cita" id="eliminar_cod_cita"class="modal fade" role="dialog">
                                                    <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalLabel"></h5>
                                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                        </div>
                                                        <form id="FORMEeliminar" method="POST">
                                                        <div class="modal-body">
                                                            <input type="text" 
                                                            value ="<?php echo $var1; ?>" hidden class="form-control"
                                                             name="eliminar_nue_cita" id="eliminar_nue_cita">
                                                            <h4 class="text-center">¿Esta seguro de eliminar este campo? <?php echo $var4; ?>?</h4>
                                                        </div> <!--fin el card body eliminar -->
                                                            <div class="modal-footer ">

                                                            <button type="button" name="cerrar" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                                                            <button type="submit"  
                                                            name="eliminar_cita" id="eliminar_cita"  class="btn btn-primary">Si,eliminar</button>      
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
                            </div>
                            <!--fin del div de responsivi -->
                        </div> <!-- /.card-body -->

                    </div><!-- fINAL DEL card PRIMARY -->
                </div>


                <!--FINAL DE COL-M12-->
            </div><!-- FINAL ROW PADRE -->
        <!-- FINAL CONTAINER FLUID -->
        <div>
        <div>
    </section><!-- FINAL SECTION -->  
    <!-- Button trigger modal -->
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
      window.open('Reportes_Prosecar/reporteCita.php','_blank');
      window.open(this.href,'_self');
    }
  </script>


<script type="text/javascript"> 
   //funcion de mostrar el estilo de la datatable
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



  

<!--♠DianaRut *No me quiten los creditos modificado por Gissela y Any :( -->

