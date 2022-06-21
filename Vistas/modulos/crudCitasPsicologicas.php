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
    Programa:          Mantenimiento de cita psicologicas 
    Fecha:           
    Programador:      
    descripcion:        Permite llevar un mantenimiento de citas psicologicas ,editar
-----------------------------------------------------------------------
  Historial de Cambio
-----------------------------------------------------------------------
    Programador               Fecha                      Descripcion
  ANY HERNANDEZ         		11-06-2022                 revision de ortografia 
----------------------------------------------------------------------->


<?php
 include_once "conexion.php";
 include_once "conexion3.php";
 include "conexionpdo.php";
?>

<div class="content-wrapper">
  <div class="content-header">
    <div class="container-fluid">
  </div>
  <section class="content">
     <div class="card">
         <div class="card-header" style="background-color:#B3F2FF;">
            <ul class="nav nav-tabs card-header-tabs">
                <li class="nav-item">
                <a class=" nav-link active" style="color:#000000;" href="#">Citas Psicologicas</a>
                </li>
                <li class="nav-item">
                <a class="nav-link" style="color:#000000;" href="procesoCitasPsicologicas">Registrar Cita</a>
                </li>
            </ul>
         </div>
         <div class="card-body">
              <div class="row">
                 <div class="col-md-12">
                    <a href="procesoCitasPsicologicas" >
                      <button  data-toggle="modal"  href="" type='button' id="btnGuardar"  style="color:white;"class="btn btn-info mb-3"><span> <i class="nav-icon fa fa-plus-square mx-1"></i></span>Registrar Cita</button>
                    </a>
                    <button  onclick="Descargar()" data-toggle="modal"  href="" type='button' id="btnGuardar"  style="color:white; background-color:#FA0079"class="btn btn-danger mb-3"> <span><i class="nav-icon fa fa-file-pdf mx-1"></i></span>Descargar Reporte</button>
                    </br></br>
                     <form method="POST">
                         <div class= "card">
                            <div class="card-header text-center" style="background-color: #F7F8F9;">
                              <h5 class=" card-title text-center"><strong style="color:black;">Listado de Citas Psicologicas</strong></h5>
                            </div> 
                            <div class="card-body">
                              <div class="table-responsive">
                                 <table id="tabla_citapsicologica" class="table table-bordered table-striped">
                                    <thead>
                                     <tr>
                                        <th class="text-center">Acción</th>
                                        <th class="text-center">Código</th>
                                        <th class="text-center">Paciente</th>
                                        <th class="text-center">Especialista</th>
                                        <th class="text-center">Fecha Cita</th>
                                        <th class="text-center">Especialidad</th>
                                        <th class="text-center">Horario</th>
                                        
                                      </tr>
                                    </thead>
                                    <tbody>
                                       <?php
                                        $query =" SELECT  IC.CODIGO_CITA,IC.FECHA_CITA,IC.HORARIO , IC.CODIGO_PERSONA ,IC.CODIGO_ESPECIALISTA , CONCAT_WS(' ',P.PRIMER_NOMBRE, P.SEGUNDO_NOMBRE, P.PRIMER_APELLIDO,P.SEGUNDO_APELLIDO) AS 
                                        MEDICO , CONCAT_WS(' ',OT.PRIMER_NOMBRE, OT.SEGUNDO_NOMBRE, OT.PRIMER_APELLIDO,OT.SEGUNDO_APELLIDO) AS PACIENTE ,ES.NOMBRE AS ESPECIALIDAD
                                        FROM tbl_inscripcion_cita_psicologica IC ,tbl_persona P ,tbl_persona_especialidad E ,tbl_persona OT ,tbl_especialidad ES
                                          WHERE E.CODIGO_PERSONA = P.CODIGO_PERSONA AND IC.CODIGO_ESPECIALISTA = E.CODIGO_PERSONA_ESPECIALIDAD AND
                                         OT.CODIGO_PERSONA = IC.CODIGO_PERSONA AND  ES.CODIGO_ESPECIALIDAD = E.CODIGO_ESPECIALIDAD";
                                        $result = $conn->query($query);
                                        if ($result->num_rows > 0) {
                                            while($row = $result->fetch_assoc()) {
                                            $var1 = $row['CODIGO_CITA'];
                                            $var2 = $row['PACIENTE'];
                                            $var3 = $row['MEDICO'];
                                            $var4 = $row['FECHA_CITA'];
                                            $var5 = $row['ESPECIALIDAD'];
                                            $var6 = $row['HORARIO'];
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
                                                        $evaluar_permiso_eliminar->execute(array($usuariomo, '2'));
                                                        $row1=$evaluar_permiso_eliminar->fetchColumn();
                                                        $permiso_eliminar =$row1; 
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
                                                        $evaluar_permiso_actualizar->execute(array($usuariomo, '2'));
                                                        $row2=$evaluar_permiso_actualizar->fetchColumn();
                                                        $permiso_actualizar =$row2; 
                                                    }
                                                    ?>
                                                    <?php
                                                    if($permiso_eliminar == 'SI'){
                                                    ?> 
                                                    <?php
                                                    }
                                                    ?><!--Fin del boton de eliminar -->
                                                    <a href="#ELIMINAR<?php echo $var1;?>" data-toggle="modal">
                                                    <button id="ELIMINAR" name="ELIMINAR" type='button'   class="btn btn-danger" data-dismiss="modal"><i class="nav-icon fas fa-trash"></i></button>
                                                    </a>
                                                    <?php
                                                    if($permiso_actualizar == 'SI'){
                                                    ?>
                                                    <?php
                                                        }
                                                    ?>
                                                    <a href="#EDITARPRECLINICA<?php echo $var1; ?>" data-toggle="modal">
                                                        <button type='button' id="btnGuardar"  style="color:white;"class="btn btn-warning"><span> <i class="nav-icon fas fa-edit mx-1"></i></span></button>
                                                    </a>
                                                 </div>
                                             </div><!--fin del group de buttons -->
                                          </td>
                                          <td class="text-center"><?php echo $var1; ?></td>
                                          <td class="text-center"><?php echo $var2; ?></td>
                                          <td class="text-center"><?php echo $var3; ?></td>
                                          <td class="text-center"><?php echo $var4; ?></td>
                                          <td class="text-center"><?php echo $var5; ?></td>
                                          <td class="text-center"><?php echo $var6; ?></td>

                                          <div id="EDITARPRECLINICA<?php echo $var1 ?>" class="modal fade" role="dialog">
                                            <div class="modal-dialog modal-lg">
                                                <div class="modal-content"><!-- Modal content-->
                                                <form  method="POST">
                                                    <div class="modal-header" style="background-color: #0CCDE3">
                                                    <h4 class="text-center">Editar Cita Psicologica </h4>
                                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                    </div>
                                                    <div class="modal-body"><!--CUERPO DEL MODAL -->
                                                    <div class="row"><!-- INICIO PRIMERA ROW --> 
                                                        <input type="text" value ="<?php echo $var1; ?>" hidden  class="form-control" name="id_cita_psico">
                                                        <div class="col-md-6 mb-3"> <!--paciente-->
                                                           <?php
                                                             $consulta = "SELECT  CODIGO_PERSONA, CONCAT_WS(' ',PRIMER_NOMBRE, SEGUNDO_NOMBRE, PRIMER_APELLIDO,SEGUNDO_APELLIDO) 
                                                             as NOMBRE  from tbl_persona where CODIGO_TIPO_PERSONA <> 6 AND CODIGO_PERSONA <>1";
                                                             $filas=$conn->query($consulta);   
                                                           ?>
                                                            <label for="validationCustom03"  class="control-label">Paciente</label> 
                                                                <div class="form-group">
                                                                 <select  class="form-control " style="width: 100%;"  name="editar_paciente"  required >
                                                                 <option value="<?php echo $var2?>" ><?php echo $var2;?></option>
                                                                        <?php 
                                                                        if ($filas->num_rows > 0) {
                                                                        while($row = $filas->fetch_assoc()) { 
                                                                        $codigo = $row['CODIGO_PERSONA'];
                                                                        $nombre_p = $row['NOMBRE'];
                                                                        
                                                                        ?>
                                                                 <option value="<?php echo $codigo;?>" ><?php echo $nombre_p;?></option>
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
                                                        <div class="col-md-6 mb-3"> <!--paciente-->
                                                            <?php 
                                                            $consulti = "SELECT  pe.CODIGO_PERSONA_ESPECIALIDAD, pe.CODIGO_PERSONA  ,pe.CODIGO_ESPECIALIDAD as ESPECIALISTA ,CONCAT_WS(' ',p.PRIMER_NOMBRE,p.SEGUNDO_NOMBRE,p.PRIMER_APELLIDO,p.SEGUNDO_APELLIDO) 
                                                            as NOMBRE
                                                            FROM tbl_persona_especialidad pe, tbl_especialidad e ,tbl_persona p
                                                            WHERE pe.CODIGO_ESPECIALIDAD = e.CODIGO_ESPECIALIDAD and e.codigo_area =3
                                                            and pe.CODIGO_PERSONA = p.CODIGO_PERSONA";
                                                            $filas=$conn->query($consulti);
                                                            ?>
                                                            <label for="validationCustom03"  class="control-label">Medico Especialista</label> 
                                                            <div class="form-group">
                                                                <select  class="form-control select2" style="width: 100%;"  name="editar_especialista"  required >
                                                                <option value="<?php echo $var3?>" ><?php echo $var3;?></option>
                                                                <?php 
                                                                if ($filas->num_rows > 0) {
                                                                while($row = $filas->fetch_assoc()) { 
                                                                $codigo_medico = $row['CODIGO_PERSONA_ESPECIALIDAD'];
                                                                $nombre = $row['NOMBRE'];
                                                                ?>
                                                                 <option value="<?php echo $codigo?>" ><?php echo $nombre;?></option>
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
                                                        <div class="col-md-3 mb-3">
                                                            <label for="validationCustom03"  class="control-label">Hora Cita</label>
                                                            <div class="form-group">
                                                                <input class="form-control" type="time"  value="<?php echo $var6;?>" name="editar_hora" required>
                                                                <div class="invalid-feedback">
                                                                      Campo Obligatorio.
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-3 mb-3">
                                                            <label for="validationCustom03"  class="control-label">Fecha Cita</label>
                                                            <div class="form-group">
                                                                <input class="form-control" type="date" value="<?php echo $var4;?>"  name="editar_fecha" required>
                                                                <div class="invalid-feedback">
                                                                      Campo Obligatorio.
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                
                                                    </div><!--fin modal body -->
                                                    <div class="modal-footer ">
                                                       <button type="button" name="ELI" class="btn btn-danger" data-dismiss="modal"><span> <i class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
                                                        <button type="submit" name="EDITAR_CITA_PSICO" class="btn btn-warning btn mx-1"><span> <i class="nav-icon fas fa-edit mx-1"></i></span>Editar Cita</button>
                                                    </div><!--FIN DEL DIV DE BOTONES DE GUARDAR -->
                                                </form>
                                                </div>
                                            </div>
                                            </div><!--fin modal editar -->

                                            <div id="ELIMINAR<?php echo $var1 ?>"  name="div_eliminar" id="div_eliminar"class="modal fade" role="dialog">
                                               <div class="modal-dialog">
                                                <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel"></h5>
                                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                </div>
                                                <form  method="POST">
                                                    <div class="modal-body">
                                                    <input type="text" value ="<?php echo $var1; ?>" hidden class="form-control" name="citapsico_eliminar" >
                                                    <h4 class="text-center">¿Esta seguro que desea eliminar una cita?</h4>
                                                    </div> <!--fin el card body -->
                                                    <div class="modal-footer ">
                                                    <button type="button" name="cerrar" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                                                    <button type="submit"   name="ELIMINAR_CITAPSICO" id="ELIMINAR_CITAPSICO"   class="btn btn-primary">Si,eliminar</button>      
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
                              </div><!-- fin table responsi-->
                            </div> 
                         </div><!--fin card table-->
                     </form>
                 </div>
              </div>
         </div>
     </div><!--fin card general -->
  </section>

</div>

<script type="text/javascript"> 
   //funcion de mostrar el estilo de la datatable
  $(document).ready( function () {
      $('#tabla_citapsicologica').DataTable({

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