
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
    Programa:          Mantenimiento de las personas
    Fecha:             
    Programador:      
    descripcion:       Permite llevar un mantenimiento de las personas  ,editar,eliminar nuevo
-----------------------------------------------------------------------
  Historial de Cambio
-----------------------------------------------------------------------
    Programador               Fecha                      Descripcion
  ANY HERNANDEZ         		11-06-2022                 revision de ortagrafia 
  Diana Rut Garcia        		21-06-2022                 Validaciones de no permitir datos vacios y otras cosas

  ANY HERNANDEZ         		18-07-2022                 eliminacion de mayus en correo 
  Diana Rut                      13/07/2022                Se modifico el orden de la grilla

<------------------------------------------------------------------------------------------------------------------------>


<?php
include_once "conexion.php";
include_once "conexion3.php";
      
      ?>
<script>
    function Descargar() {
      window.open('Reportes_Prosecar/reportepersona.php','_blank');
      window.open(this.href,'_self');
     }
      function Descargar2() {
      window.open('Reportes_Prosecar/reporte_porPersona.php','_blank');
      window.open(this.href,'_self');
    }
</script>
<head>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="../vistas/assets/plugins/jquery/jquery.min.js"></script>
</head>

<div class="content-wrapper">
    <div class="content-header">
    <body oncopy="return false" onpaste="return false" >
        <div class="container-fluid">
        </div><!-- /.container-fluid -->
    </div>
    <div class="content-header text-xl-center mb-3">
      <h4>Ver Datos Personas</h4>
    </div>
    <section class="content">
     <div class="card"> 
        <div class="card-header" style="background-color:#B3F2FF;">
          <ul class="nav nav-tabs card-header-tabs">
          <li class="nav-item">
            <a class="nav-link" style="color:#000000;" href="categoria">Agregar Personas/Usuarios</a>
            </li>
            <li class="nav-item">
             <a class="nav-link active" style="color:#000000;" href="crudpersonas">Ver Datos Personas</a>
            </li>
          </ul>
        </div>
        <div class="card-body">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                   <!-- Codigo de permiso de insertar -->
                   
                     <div class="row">
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
                                $evaluar_permiso->execute(array($usuariomo, '25'));
                                $row1=$evaluar_permiso->fetchColumn();
                                $permiso_registrar =$row1;             
                            }
                            ?> <!-- fin del codigo para sustraer el permiso de insertar.-->
                          <?php 
                      if($permiso_registrar == 'SI'){
                     ?> 
                      <a href="categoria"> 
                      <button  data-toggle="modal"  href="" type='button' id="btnGuardar"  style="color:white;"class="btn btn-primary mb-3"><span> <i class="nav-icon fa fa-plus-square mx-1"></i></span>Agregar </button>
                    </a> 
                    <?php 
                      }
                     ?> 
                         <!--Inicio del codigo del filtrado de personas -->
                         <label class=" col-sm-1 control-label" style="text-align: right; width: 150px;">Filtrar Por</label>
                        <div class="col-sm-3">
                        <?php 
                            $query = "SELECT * FROM tbl_tipo_persona WHERE CODIGO_TIPO_PERSONA <> '3' and  CODIGO_TIPO_PERSONA BETWEEN 1 AND 8;";
                            $resul=$conn->query($query);                
                        ?>
                        <form method="POST" action="crudpersonas" >
                            <select class="form-control" name="BUSCAR" id="buscador" required>
                               <option  selected enable value="">Seleccione</option>
                               <?php 
                                if ($resul->num_rows > 0) {
                                    while($row = $resul->fetch_assoc()) { 
                                    $user = $row['CODIGO_TIPO_PERSONA'];
                                    $nombre = $row['NOMBRE'];
                                ?>  
                                <option value="<?php echo $user?>" ><?php echo $nombre;?></option>
                                <?php 
                                } 
                                }
                                ?>
                                <option  value="3" >TODOS</option>
                            </select>
                            <div class="invalid-feedback">
                                  Campo Obligatorio.
                             </div>  
                        </div>
                        <div class="col-mb-3">
                          <button type="submit"  name="generar" class=" form-control btn btn-info mb-3"  > Generar</button>
                        </div>
                     </form>
                     </div>  <!--final del codigo del filtrado de personas -->
                     <br>
                     
                     <?php
                        if(isset($_POST['BUSCAR'])){ 
                        $personita = $_POST['BUSCAR']; 
                        $_SESSION['persona'] = $personita;
                        $comsulti = "SELECT NOMBRE FROM tbl_tipo_persona WHERE CODIGO_TIPO_PERSONA = '$personita'";
                        $respuesta = $conn->query($comsulti);
                        if ($respuesta->num_rows > 0) {
                          while($row = $respuesta->fetch_assoc()) {
                            $nom = $row['NOMBRE'];
                         }
                        }
                        $tipo = $_POST['BUSCAR'];
                        if($tipo ==1 || $tipo ==2 ||$tipo ==4 ||$tipo ==5 ||$tipo ==6 ||$tipo ==7 ||$tipo ==8 ||$tipo ==9 ){

                        
                    ?>
                    <button  onclick="Descargar2()" data-toggle="modal"  href="" type='button' id="btnGuardar"  style="color:white; background-color:#FA0079" class="btn btn-danger mb-3"> <span><i class="nav-icon fa fa-file-pdf mx-1"></i></span>Reporte</button>
                    <div class="card">
                        <div class="card-header text-center" >
                            <!-- TITULO ENCABEZADO DATOS PERSONALES -->
                            <h1 class=" card-title text-center"><strong style="color:black;"></strong></h1>
                        </div>

                        <!-- form start -->
                        <div class="card-body">
                            <div class="table-responsive">
                                <table id="tabla_personas" class="table table-bordered table-striped">
                                    <thead>
                                        <tr>
                                            <th class="text-center">Acción</th>
                                            <th class="text-center">Código</th>
                                            <th class="text-center">Primer Nombre</th>
                                            <th class="text-center">Segundo Nombre</th>
                                            <th class="text-center">Primer Apellido</th>
                                            <th class="text-center">Segundo Apellido</th>
                                            <th class="text-center">DNI</th>
                                            <th class="text-center">Sexo</th>
                                            <th class="text-center">Fecha Nacimiento</th>
                                            <th class="text-center">Lugar Nacimiento</th>
                                            <th class="text-center">Dirección</th>
                                            <th class="text-center">Tipo Persona</th>
                                            <th class="text-center">Teléfono</th>
                                            <th class="text-center">Correo</th>                                            
                                        </tr>
                                    </thead>
                                    <tbody>
                        <?php
                        $tipo = $_POST['BUSCAR'];
                        $query = "SELECT p.CODIGO_PERSONA, p.PRIMER_NOMBRE, p.SEGUNDO_NOMBRE, p.PRIMER_APELLIDO, p.SEGUNDO_APELLIDO, p.DNI, p.FECHA_NACIMIENTO,
                        p.LUGAR_NACIMIENTO, p.DIRECCION, p.SEXO, tl.NUMERO_TELEFONO, t.NOMBRE, c.CORREO_PERSONA
                                            FROM TBL_PERSONA p
                                            left join tbl_telefono tl   on tl.CODIGO_PERSONA = p.CODIGO_PERSONA  
                                            left join tbl_tipo_persona t on  t.CODIGO_TIPO_PERSONA = p.CODIGO_TIPO_PERSONA
                                            left join tbl_correo_electronico c  on c.CODIGO_PERSONA = p.CODIGO_PERSONA
                                            where  t.CODIGO_TIPO_PERSONA = '$tipo' ORDER BY p.CODIGO_PERSONA desc ;";
                        $result = $conn->query($query);
                        if ($result->num_rows > 0) {
                          while($row = $result->fetch_assoc()) {
                            $var1 = $row['CODIGO_PERSONA'];
                            $var3 = $row['PRIMER_NOMBRE'];
                            $var4 = $row['SEGUNDO_NOMBRE'];
                            $var5 = $row['PRIMER_APELLIDO'];
                            $var6 = $row['SEGUNDO_APELLIDO'];
                            $var7 = $row['DNI'];
                            $var8 = $row['SEXO'];
                            $var9 = $row['FECHA_NACIMIENTO'];
                            $var10 = $row['LUGAR_NACIMIENTO'];
                            $var12 = $row['NOMBRE'];
                            $var13 = $row ['NUMERO_TELEFONO'];
                            $var14 = $row ['CORREO_PERSONA'];
                            $var18 = $row['DIRECCION'];
                            ?>
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
                                $evaluar_permiso_actualizar->execute(array($usuariomo, '25'));
                                $row1=$evaluar_permiso_actualizar->fetchColumn();
                                $permiso_actualizar =$row1; 
                            }
                            ?> 
                            <?php
                            include "conexionpdo.php";
                            $usuario=$_SESSION['vario'];
                            //Evaluo si existe el tipo de Rol
                            $evaluar_usuario = $db->prepare("SELECT CODIGO_TIPO_ROL FROM tbl_usuario WHERE NOMBRE_USUARIO = (?);");
                            $evaluar_usuario->execute(array($usuario));
                            $row=$evaluar_usuario->fetchColumn();
                            if($row > 0){
                                $usuariomo = $row;//capturo el nombre del ROl en la variable para usarla en el Procedimiento almacenado
                                $evaluar_permiso_eliminar = $db->prepare("CALL Sp_permiso_eliminar(?,?);");
                                $evaluar_permiso_eliminar->execute(array($usuariomo, '25'));
                                $row1=$evaluar_permiso_eliminar->fetchColumn();
                                $permiso_eliminar =$row1; 
                            }
                            ?> 
                                        <tr>
                                            <td>
                                                <div class="text-center">
                                                    <div class="btn-group">
                                                       <?php
                                                        if($permiso_eliminar == 'SI')
                                                        {
                                                        ?>
                                                        <a href="#ELIMINAR<?php echo $var1;?>" data-toggle="modal">
                                                            <button id="ELIMINAR_USUARIO" name="ELIMINAR_USUARIO"
                                                                type='button' class=" form-control btn btn-danger"data-dismiss="modal"><i class="nav-icon fas fa-trash"></i>
                                                            </button>
                                                        </a>
                                                        <?php
                                                        }
                                                            ?>
                                                            <?php 
                                                            if ($permiso_actualizar == 'SI')
                                                            {
                                                            ?>
                                                        <a href="#EDITARPERSONA<?php echo $var1; ?>"
                                                            data-toggle="modal">
                                                            <button type='button' style="color:white;" class=" form-control btn btn-warning"><span><i class="nav-icon fas fa-edit mx-1"></i></span></button>
                                                        </a>
                                                         <a>
                                                        <form method="post"  action="Reportes_Prosecar/reportePersonaIndividual.php" target="_blank" > 
                                                        <input type="hidden" name="persona_enviar" value="<?php echo $var1 ?>">
                                                        <button type='submit' title='Imprimir'  style="color:white; "class=" form-control btn btn-info mb-3"><span><i class="nav-icon fa fa-file-pdf mx-1"></i></span></button> 
                                                        </form>
                                                        </a>
                                                        <?php
                                                        }
                                                        ?>
                                                    </div>
                                                </div><!-- final del text-center -->
                                            </td>
                                            <td class="text-center"><?php echo $var1; ?></td>
                                            <td class="text-center"><?php echo $var3; ?></td>
                                            <td class="text-center"><?php echo $var4; ?></td>
                                            <td class="text-center"><?php echo $var5; ?></td>
                                            <td class="text-center"><?php echo $var6; ?></td>
                                            <td class="text-center"><?php echo $var7; ?></td>
                                            <td class="text-center"><?php echo $var8; ?></td>
                                            <td class="text-center"><?php echo $var9; ?></td>
                                            <td class="text-center"><?php echo $var10; ?></td>
                                            <td class="text-center"><?php echo $var18; ?></td>
                                            <td class="text-center"><?php echo $var12; ?></td>
                                            <td class="text-center"><?php echo $var13; ?></td>
                                            <td class="text-center"><?php echo $var14; ?></td>
                                            <!--INICIO DEL MODAL DE EDITAR -->
                                            <div id="EDITARPERSONA<?php echo $var1; ?>" class="modal fade"
                                                role="dialog">
                                                <div class="modal-dialog modal-lg">
                                                <div class="modal-content">
                                                   <div class="modal-header" style="background-color: #0CCDE3">
                                                     <h4 class="text-center">Editar información persona </h4><button type="button" class="close"data-dismiss="modal">&times;</button>
                                                    </div>
                                                        <!-- Modal content-->
                                                        <form method="POST" >
                                                            <div class="modal-body">
                                                                <!--CUERPO DEL MODAL -->
                                                                <div class="row">
                                                                    <!-- INICIO PRIMERA ROW -->

                                                                    <input type="text" value="<?php echo $var1; ?>"
                                                                        hidden class="form-control" name="cod_personaguardar"
                                                                        id="cod_personaguardar">

                                                                        <input type="text" value="<?php echo $var14; ?>"
                                                                        hidden class="form-control" name="VALORANTERIOR"
                                                                        id="cod_personaguardar">

                                                                    <div class="col-sm-6">
                                                                        <div class="form-group">
                                                                            <label >Primer Nombre</label>
                                                                            <input type="text"
                                                                                value="<?php echo $var3; ?>"
                                                                                class="form-control" maxlength="20"
                                                                                minlength="5"
                                                                                onKeyDown="sinespacio(this);"
                                                                                onkeyup="mayus(this);"
                                                                                autocomplete="off" type="text"
                                                                                onkeypress="return soloLetras(event);"
                                                                                name="p_nombre" id="p_nombre" required >
                                                                                <div class="invalid-feedback">
                                                                                 Campo Obligatorio.
                                                                                </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-sm-6">
                                                                        <div class="form-group">
                                                                            <label >Segundo Nombre</label>
                                                                            <input type="text"
                                                                                value="<?php echo $var4; ?>"
                                                                                class="form-control" maxlength="20"
                                                                                minlength="5"
                                                                                onKeyDown="sinespacio(this);"
                                                                                onkeyup="mayus(this);"
                                                                                autocomplete="off" type="text"
                                                                                onkeypress="return soloLetras(event);"
                                                                                name="s_nombre" id="s_nombre" required>
                                                                                <div class="invalid-feedback">
                                                                                 Campo Obligatorio.
                                                                                </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-sm-6">
                                                                        <div class="form-group">
                                                                            <label >Primer Apellido</label>
                                                                            <input type="text"
                                                                                value="<?php echo $var5; ?>"
                                                                                class="form-control" maxlength="20"
                                                                                minlength="5"
                                                                                onKeyDown="sinespacio(this);"
                                                                                onkeyup="mayus(this);"
                                                                                autocomplete="off" type="text"
                                                                                onkeypress="return soloLetras(event);"
                                                                                name="p_apellido" id="p_apellido" required>
                                                                                <div class="invalid-feedback">
                                                                                 Campo Obligatorio.
                                                                                </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-sm-6">
                                                                        <div class="form-group">
                                                                            <label >Segundo Apellido</label>
                                                                            <input type="text"
                                                                                value="<?php echo $var6; ?>"
                                                                                class="form-control" maxlength="20"
                                                                                minlength="5"
                                                                                onKeyDown="sinespacio(this);"
                                                                                onkeyup="mayus(this);"
                                                                                autocomplete="off" type="text"
                                                                                onkeypress="return soloLetras(event);"
                                                                                name="s_apellido" id="s_apellido" >
                                                                                <div class="invalid-feedback">
                                                                                 Campo Obligatorio.
                                                                                </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-sm-6">
                                                                        <div class="form-group">
                                                                            <label >DNI</label>
                                                                            <input type="text"
                                                                                value="<?php echo $var7; ?>"
                                                                                class="form-control" maxlength="15" 
                                                                                onkeypress="return solonumero(event)" 
                                                                                onKeyDown="sinespacio(this);"
                                                                                autocomplete="off" type="text"
                                                                                name="dni" id="dni" required >
                                                                                <div class="invalid-feedback">
                                                                                 Campo Obligatorio.
                                                                                </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-sm-6">
                                                                        <div class="form-group">
                                                                            <label >Dirección</label>
                                                                            <textarea type="textarea"
                                                                             class="form-control" maxlength="500"  minlength="20"  name="direccion" id="direccion"
                                                                              onkeyup="mayus(this);" autocomplete = "off"
                                                                                required><?php echo $var18; ?></textarea>
                                                                               <div class="invalid-feedback">
                                                                             Campo Obligatorio.
                                                                              </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-sm-6">
                                                                        <div class="form-group">
                                                                            <label >Correo</label>
                                                                            <input type="text"
                                                                                value="<?php echo $var14; ?>"
                                                                                class="form-control" maxlength="50"
                                                                                minlength="5"
                                                                                onKeyDown="sinespacio(this);"
                                                                                autocomplete="off" type="text"
                                                                                name="correo" id="correo"  required >
                                                                                <div class="invalid-feedback">
                                                                                Campo Obligatorio.
                                                                                </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-sm-6">
                                                                        <div class="form-group">
                                                                            <label>Teléfono</label>
                                                                            <input type="text"
                                                                             value="<?php echo $var13; ?>"
                                                                             class="form-control" 
                                                                                onkeyup="mayus(this);" maxlength="10" 
                                                                                minlength="8"
                                                                                onkeypress="return telfono(event,this);"
                                                                                 onblur="quitarespacios(this);" 
                                                                                 onkeydown="sinespacio(this);" required
                                                                                 autocomplete = "off"
                                                                                name="telefono" id="telefono">
                                                                            <div class="invalid-feedback">
                                                                                 Campo Obligatorio.
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-4"><!--INICIO TIPO PERSONA-->
                                                                    <?php 
                                                                    $query = "SELECT * FROM `tbl_tipo_persona` WHERE CODIGO_TIPO_PERSONA <> 3 AND NOMBRE <> 'no definido';";
                                                                    $resultadod=$conn->query($query);                
                                                                    ?>
                                                                    <label class="control-label">Tipo Persona:</label>
                                                                    <div class="form-group">
                                                                    <select class="form-control select2"   style="width: 100%;" name="tipo_persona" id="tipo_persona" required >
                                                                        <option selected enable  ><?php echo $var12?></option>
                                                                        <?php 
                                                                        if ($resultadod->num_rows > 0) {
                                                                            while($row = $resultadod->fetch_assoc()) { 
                                                                            $codigo = $row['CODIGO_TIPO_PERSONA'];
                                                                            $nombre= $row['NOMBRE'];
                                                                        ?>
                                                                        <option value="<?php echo $codigo?>" ><?php echo $nombre;?></option>
                                                                        <?php 
                                                                        } 
                                                                        }
                                                                        ?>
                                                                    </select>
                                                                    <div class="invalid-feedback">
                                                                            Eliga una opción.
                                                                        </div>
                                                                    </div>
                                                                </div>  <!-- FIN DE tipo de persona -->
                                                                </div> <!-- FIN DE EL PRIMER ROW -->
                                                            </div>
                                                            <!--FINAL DEL CARD BODY -->
                                                            <div class="modal-footer ">
                                                                <button type="button" name="ELI" class="btn btn-danger"
                                                                    data-dismiss="modal"><span> <i
                                                                            class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
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
                                                                        $evaluar_permiso_actualizar->execute(array($usuariomo, '25'));
                                                                        $row1=$evaluar_permiso_actualizar->fetchColumn();
                                                                        $permiso_actualizar =$row1; 
                                                                    }
                                                                    ?>
                                                                   <!-- fin del codigo para sustraer el permiso de actualizar-->
                                                                   <?php 
                                                                    if($permiso_actualizar = 'SI'){
                                                                    ?>
                                                                <button type="submit" id="EDIT_PERSONA"
                                                                    name="EDIT_PERSONA" class="btn btn-success"><span><i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>
                                                                <?php 
                                                                }
                                                                ?> 
                                                            </div>
                                                            <!--FIN DEL DIV DE BOTONES DE GUARDAR -->
                                                        </form>
                                                </div>
                                                </div>
                                            </div><!-- FIN DEL MODAL EDITAR -->

                                            <div id="ELIMINAR<?php echo $var1 ?>" name="div_eliminar" id="div_eliminar"
                                                class="modal fade" role="dialog">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="exampleModalLabel"></h5>
                                                            <button type="button" class="close"
                                                                data-dismiss="modal">&times;</button>
                                                        </div>
                                                        <form id="FORMEeliminar" method="POST">
                                                            <div class="modal-body">
                                                                <input type="text" value="<?php echo $var1; ?>" hidden
                                                                    class="form-control" name="cod_personaeliminar"
                                                                    id="cod_personaeliminar">
                                                                <h4 class="text-center">¿Está seguro de eliminar la persona <?php echo $var3; ?>?
                                                                </h4>
                                                            </div>
                                                            <!--fin el card body -->
                                                            <div class="modal-footer ">
                                                                <button type="button" name="cerrar"
                                                                    class="btn btn-danger"
                                                                    data-dismiss="modal">Cancelar</button>
                                                                <!-- Codigo de permiso para Eliminar -->
                                                                <?php
                                                                include "conexionpdo.php";
                                                                $usuario=$_SESSION['vario'];
                                                                //Evaluo si existe el tipo de Rol
                                                                $evaluar_usuario = $db->prepare("SELECT CODIGO_TIPO_ROL FROM tbl_usuario WHERE NOMBRE_USUARIO = (?);");
                                                                $evaluar_usuario->execute(array($usuario));
                                                                $row=$evaluar_usuario->fetchColumn();
                                                                if($row > 0){
                                                                    $usuariomo = $row;//capturo el nombre del ROl en la variable para usarla en el Procedimiento almacenado
                                                                    $evaluar_permiso_eliminar = $db->prepare("CALL Sp_permiso_eliminar(?,?);");
                                                                    $evaluar_permiso_eliminar->execute(array($usuariomo, '25'));
                                                                    $row1=$evaluar_permiso_eliminar->fetchColumn();
                                                                    $permiso_eliminar =$row1; 
                                                                }
                                                                ?> 
                                                               <!-- fin del codigo para sustraer el permiso de eliminar-->
                                                               <?php 
                                                                if($permiso_eliminar = 'SI'){
                                                                ?>
                                                                <button type="submit" name="ELIMINAR_PERSONA" id="ELIMINAR" class="btn btn-primary">Si,eliminar</button>
                                                                    <?php 
                                                                }
                                                                ?> 
                                                            </div>
                                                            <!--FIN DEL DIV DE BOTONES DE GUARDAR -->                                                        
                                                        </form>
                                                    </div>
                                                    <!--fin del modal contener -->
                                                </div>
                                                <!--fin del modal dialog -->
                                            </div>
                                            <!--fin del modal de eliminar -->
                                        </tr>
                                        <?php
                             }
                             }
                            ?>
                                    </tbody>
                                </table>
                            <?php
                             
                            }else if($tipo ==3){// este else es lo que se muestra al inicio ,osea el reporte general de todas las citas si :)
                             ?>
                             <button id="botoncito" onclick="Descargar()" data-toggle="modal"  href="" type='button' id="btnGuardar"  style="color:white; background-color:#FA0079" class="btn btn-danger mb-3"> <span><i class="nav-icon fa fa-file-pdf mx-1"></i></span>Reporte</button>
                            <div class="table-responsive">
                                <table id="tabla_personas" class="table table-bordered table-striped">
                                    <thead>
                                        <tr>
                                            <th class="text-center">Acción</th>
                                            <th class="text-center">Código</th>
                                            <th class="text-center">Primer Nombre</th>
                                            <th class="text-center">Segundo Nombre</th>
                                            <th class="text-center">Primer Apellido</th>
                                            <th class="text-center">Segundo Apellido</th>
                                            <th class="text-center">DNI</th>
                                            <th class="text-center">Sexo</th>
                                            <th class="text-center">Fecha Nacimiento</th>
                                            <th class="text-center">Lugar Nacimiento</th>
                                            <th class="text-center">Dirección</th>
                                            <th class="text-center">Tipo Persona</th>
                                            <th class="text-center">Teléfono</th>
                                            <th class="text-center">Correo</th>                                            
                                        </tr>
                                    </thead>
                                    <tbody>
                        <?php
                        $tipo = $_POST['BUSCAR'];
                        
                        $query = "SELECT p.CODIGO_PERSONA, p.PRIMER_NOMBRE, p.SEGUNDO_NOMBRE, p.PRIMER_APELLIDO, p.SEGUNDO_APELLIDO, p.DNI, p.FECHA_NACIMIENTO, p.LUGAR_NACIMIENTO, p.DIRECCION, p.SEXO, tl.NUMERO_TELEFONO, t.NOMBRE, c.CORREO_PERSONA
                        FROM TBL_PERSONA p
                        left join tbl_telefono tl     on tl.CODIGO_PERSONA = p.CODIGO_PERSONA
                        left join tbl_tipo_persona t  on t.CODIGO_TIPO_PERSONA = p.CODIGO_TIPO_PERSONA
                        left join tbl_correo_electronico c  on  c.CODIGO_PERSONA = p.CODIGO_PERSONA WHERE p.CODIGO_PERSONA >1;";
                        $result = $conn->query($query);
                        if ($result->num_rows > 0) {
                          while($row = $result->fetch_assoc()) {
                            $var1 = $row['CODIGO_PERSONA'];
                            $var3 = $row['PRIMER_NOMBRE'];
                            $var4 = $row['SEGUNDO_NOMBRE'];
                            $var5 = $row['PRIMER_APELLIDO'];
                            $var6 = $row['SEGUNDO_APELLIDO'];
                            $var7 = $row['DNI'];
                            $var8 = $row['SEXO'];
                            $var9 = $row['FECHA_NACIMIENTO'];
                            $var10 = $row['LUGAR_NACIMIENTO'];
                            $var12 = $row['NOMBRE'];
                            $var13 = $row ['NUMERO_TELEFONO'];
                            $var14 = $row ['CORREO_PERSONA'];
                            $var18 = $row['DIRECCION'];
                            ?>
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
                                $evaluar_permiso_actualizar->execute(array($usuariomo, '25'));
                                $row1=$evaluar_permiso_actualizar->fetchColumn();
                                $permiso_actualizar =$row1; 
                            }
                            ?> 
                            <?php
                            include "conexionpdo.php";
                            $usuario=$_SESSION['vario'];
                            //Evaluo si existe el tipo de Rol
                            $evaluar_usuario = $db->prepare("SELECT CODIGO_TIPO_ROL FROM tbl_usuario WHERE NOMBRE_USUARIO = (?);");
                            $evaluar_usuario->execute(array($usuario));
                            $row=$evaluar_usuario->fetchColumn();
                            if($row > 0){
                                $usuariomo = $row;//capturo el nombre del ROl en la variable para usarla en el Procedimiento almacenado
                                $evaluar_permiso_eliminar = $db->prepare("CALL Sp_permiso_eliminar(?,?);");
                                $evaluar_permiso_eliminar->execute(array($usuariomo, '25'));
                                $row1=$evaluar_permiso_eliminar->fetchColumn();
                                $permiso_eliminar =$row1; 
                            }
                            ?> 
                                        <tr>
                                            <td>
                                                <div class="text-center">
                                                    <div class="btn-group">
                                                       <?php
                                                        if($permiso_eliminar == 'SI')
                                                        {
                                                        ?>
                                                        <a href="#ELIMINAR<?php echo $var1;?>" data-toggle="modal">
                                                            <button id="ELIMINAR_USUARIO" name="ELIMINAR_USUARIO"
                                                                type='button' class=" form-control btn btn-danger"data-dismiss="modal"><i class="nav-icon fas fa-trash"></i>
                                                            </button>
                                                        </a>
                                                        <?php
                                                        }
                                                            ?>
                                                            <?php 
                                                            if ($permiso_actualizar == 'SI')
                                                            {
                                                            ?>
                                                        <a href="#EDITARPERSONA<?php echo $var1; ?>"
                                                            data-toggle="modal">
                                                            <button type='button' style="color:white;" class=" form-control btn btn-warning"><span><i class="nav-icon fas fa-edit mx-1"></i></span></button>
                                                        </a>
                                                         <a>
                                                        <form method="post"  
                                                        action="Reportes_Prosecar/reportePersonaIndividual.php" 
                                                        target="_blank"> 
                                                        <input type="hidden" name="persona_enviar"
                                                         value="<?php echo $var1 ?>">
                                                        <button type='submit' title='Imprimir'  style="color:white; "class=" form-control btn btn-info mb-3"><span><i class="nav-icon fa fa-file-pdf mx-1"></i></span></button> 
                                                        </form>
                                                        </a>
                                                        <?php
                                                        }
                                                        ?>
                                                    </div>
                                                </div><!-- final del text-center -->
                                            </td>
                                            <td class="text-center"><?php echo $var1; ?></td>
                                            <td class="text-center"><?php echo $var3; ?></td>
                                            <td class="text-center"><?php echo $var4; ?></td>
                                            <td class="text-center"><?php echo $var5; ?></td>
                                            <td class="text-center"><?php echo $var6; ?></td>
                                            <td class="text-center"><?php echo $var7; ?></td>
                                            <td class="text-center"><?php echo $var8; ?></td>
                                            <td class="text-center"><?php echo $var9; ?></td>
                                            <td class="text-center"><?php echo $var10; ?></td>
                                            <td class="text-center"><?php echo $var18; ?></td>
                                            <td class="text-center"><?php echo $var12; ?></td>
                                            <td class="text-center"><?php echo $var13; ?></td>
                                            <td class="text-center"><?php echo $var14; ?></td>
                                            <!--INICIO DEL MODAL DE EDITAR -->
                                            <div id="EDITARPERSONA<?php echo $var1; ?>" class="modal fade"
                                                role="dialog">
                                                <div class="modal-dialog modal-lg">
                                                <div class="modal-content">
                                                   <div class="modal-header" style="background-color: #0CCDE3">
                                                     <h4 class="text-center">Editar Información Persona</h4>
                                                     <button type="button" class="close"data-dismiss="modal">&times;</button>
                                                   </div>
                                                        <!-- Modal content-->
                                                        <form method="POST"  >
                                                            
                                                            <div class="modal-body">
                                                                <!--CUERPO DEL MODAL -->
                                                                <div class="row">
                                                                    <!-- INICIO PRIMERA ROW -->

                                                                    <input type="text" value="<?php echo $var1; ?>"
                                                                        hidden class="form-control" name="cod_personaguardar"
                                                                        id="cod_personaguardar">
                                                                    <div class="col-sm-6">
                                                                        <div class="form-group">
                                                                            <label >Primer Nombre</label>
                                                                            <input type="text"
                                                                                value="<?php echo $var3; ?>"
                                                                                class="form-control" maxlength="20"
                                                                                minlength="5"
                                                                                onKeyDown="sinespacio(this);"
                                                                                onkeyup="mayus(this);"
                                                                                autocomplete="off" type="text"
                                                                                onkeypress="return soloLetras(event);"
                                                                                name="p_nombre" id="p_nombre" required>
                                                                                <div class="invalid-feedback">
                                                                                 Campo Obligatorio.
                                                                                </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-sm-6">
                                                                        <div class="form-group">
                                                                            <label >Segundo Nombre</label>
                                                                            <input type="text"
                                                                                value="<?php echo $var4; ?>"
                                                                                class="form-control" maxlength="20"
                                                                                minlength="5"
                                                                                onKeyDown="sinespacio(this);"
                                                                                onkeyup="mayus(this);"
                                                                                autocomplete="off" type="text"
                                                                                onkeypress="return soloLetras(event);"
                                                                                name="s_nombre" id="s_nombre" required>
                                                                                <div class="invalid-feedback">
                                                                                 Campo Obligatorio.
                                                                                </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-sm-6">
                                                                        <div class="form-group">
                                                                            <label >Primer Apellido</label>
                                                                            <input type="text"
                                                                                value="<?php echo $var5; ?>"
                                                                                class="form-control" maxlength="20"
                                                                                minlength="5"
                                                                                onKeyDown="sinespacio(this);"
                                                                                onkeyup="mayus(this);"
                                                                                autocomplete="off" type="text"
                                                                                onkeypress="return soloLetras(event);"
                                                                                name="p_apellido" id="p_apellido" required>
                                                                                <div class="invalid-feedback">
                                                                                 Campo Obligatorio.
                                                                                </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-sm-6">
                                                                        <div class="form-group">
                                                                            <label>Segundo Apellido</label>
                                                                            <input type="text"
                                                                                value="<?php echo $var6; ?>"
                                                                                class="form-control" maxlength="20"
                                                                                minlength="5"
                                                                                onKeyDown="sinespacio(this);"
                                                                                onkeyup="mayus(this);"
                                                                                autocomplete="off" type="text"
                                                                                onkeypress="return soloLetras(event);"
                                                                                name="s_apellido" id="s_apellido" >
                                                                                <div class="invalid-feedback">
                                                                                 Campo Obligatorio.
                                                                                </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-sm-6">
                                                                        <div class="form-group">
                                                                            <label>DNI</label>
                                                                            <input type="text"
                                                                                value="<?php echo $var7; ?>"
                                                                                class="form-control" maxlength="15" 
                                                                                onkeypress="return solonumero(event)" 
                                                                                onKeyDown="sinespacio(this);"
                                                                                autocomplete="off" type="text"
                                                                                name="dni" id="dni" required >
                                                                                <div class="invalid-feedback">
                                                                                 Campo Obligatorio.
                                                                                </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-sm-6">
                                                                        <div class="form-group">
                                                                            <label >Dirección</label>
                                                                            <textarea type="textarea"
                                                                             class="form-control" maxlength="500"  minlength="20"  name="direccion" id="direccion"
                                                                              onkeyup="mayus(this);" autocomplete = "off"
                                                                                required><?php echo $var18; ?></textarea>
                                                                               <div class="invalid-feedback">
                                                                             Campo Obligatorio.
                                                                              </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-sm-6">
                                                                        <div class="form-group">
                                                                            <label>Correo</label>
                                                                            <input type="text"
                                                                                value="<?php echo $var14; ?>"
                                                                                class="form-control" maxlength="50"
                                                                                minlength="15"
                                                                                onKeyDown="sinespacio(this);"
                                                                                onkeyup="mayus(this);"
                                                                                autocomplete="off" type="text"
                                                                                name="correo" id="correo" required>
                                                                                <div class="invalid-feedback">
                                                                                Campo Obligatorio.
                                                                                </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-sm-6">
                                                                        <div class="form-group">
                                                                            <label >Teléfono</label>
                                                                            <input type="text"
                                                                             value="<?php echo $var13; ?>"
                                                                             class="form-control" 
                                                                                onkeyup="mayus(this);" maxlength="10" 
                                                                                minlength="8"
                                                                                onkeypress="return telfono(event,this);"
                                                                                 onblur="quitarespacios(this);" 
                                                                                 onkeydown="sinespacio(this);" 
                                                                                 required=""
                                                                                 autocomplete = "off"
                                                                                name="telefono" id="telefono" required>
                                                                             <div class="invalid-feedback">
                                                                                Campo Obligatorio.
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-4"><!--INICIO TIPO PERSONA-->
                                                                    <?php 
                                                                    $query = "SELECT * FROM `tbl_tipo_persona` WHERE CODIGO_TIPO_PERSONA <> 3 AND NOMBRE <> 'no definido';";
                                                                    $resultadod=$conn->query($query);                
                                                                    ?>
                                                                    <label class="control-label">Tipo Persona:</label>
                                                                    <div class="form-group">
                                                                    <select class="form-control select2"   style="width: 100%;" name="tipo_persona" id="tipo_persona" required >
                                                                        <option selected enable ><?php echo $var12?></option>
                                                                        <?php 
                                                                        if ($resultadod->num_rows > 0) {
                                                                            while($row = $resultadod->fetch_assoc()) { 
                                                                            $codigo = $row['CODIGO_TIPO_PERSONA'];
                                                                            $nombre= $row['NOMBRE'];
                                                                        ?>
                                                                        <option value="<?php echo $codigo?>" ><?php echo $nombre;?></option>
                                                                        <?php 
                                                                        } 
                                                                        }
                                                                        ?>
                                                                    </select>
                                                                    <div class="invalid-feedback">
                                                                            Eliga una opción.
                                                                        </div>
                                                                    </div>
                                                                </div>  <!-- FIN DE tipo de persona -->
                                                                </div> <!-- FIN DE EL PRIMER ROW -->
                                                            </div>
                                                            <!--FINAL DEL CARD BODY -->
                                                            <div class="modal-footer ">
                                                                <button type="button" name="ELI" class="btn btn-danger"
                                                                    data-dismiss="modal"><span> <i
                                                                            class="nav-icon fas fa-window-close mx-1"></i></span>Cerrar</button>
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
                                                                        $evaluar_permiso_actualizar->execute(array($usuariomo, '25'));
                                                                        $row1=$evaluar_permiso_actualizar->fetchColumn();
                                                                        $permiso_actualizar =$row1; 
                                                                    }
                                                                    ?>
                                                                   <!-- fin del codigo para sustraer el permiso de actualizar-->
                                                                   <?php 
                                                                    if($permiso_actualizar = 'SI'){
                                                                    ?>
                                                                <button type="submit" id="EDIT_PERSONA"
                                                                    name="EDIT_PERSONA" class="btn btn-success"><span><i class="nav-icon fas fa-save mx-1"></i></span>Guardar</button>
                                                                <?php 
                                                                }
                                                                ?> 
                                                            </div>
                                                            <!--FIN DEL DIV DE BOTONES DE GUARDAR -->
                                                        </form>
                                                </div>
                                                </div>
                                            </div><!-- FIN DEL MODAL EDITAR -->

                                            <div id="ELIMINAR<?php echo $var1 ?>" name="div_eliminar" id="div_eliminar"
                                                class="modal fade" role="dialog">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="exampleModalLabel"></h5>
                                                            <button type="button" class="close"
                                                                data-dismiss="modal">&times;</button>
                                                        </div>
                                                        <form id="FORMEeliminar" method="POST">
                                                            <div class="modal-body">
                                                                <input type="text" value="<?php echo $var1; ?>" hidden
                                                                    class="form-control" name="cod_personaeliminar"
                                                                    id="cod_personaeliminar">
                                                                <h4 class="text-center">¿Está seguro de eliminar la persona <?php echo $var3; ?>?
                                                                </h4>
                                                            </div>
                                                            <!--fin el card body -->
                                                            <div class="modal-footer ">
                                                                <button type="button" name="cerrar"
                                                                    class="btn btn-danger"
                                                                    data-dismiss="modal">Cancelar</button>
                                                                <!-- Codigo de permiso para Eliminar -->
                                                                <?php
                                                                include "conexionpdo.php";
                                                                $usuario=$_SESSION['vario'];
                                                                //Evaluo si existe el tipo de Rol
                                                                $evaluar_usuario = $db->prepare("SELECT CODIGO_TIPO_ROL FROM tbl_usuario WHERE NOMBRE_USUARIO = (?);");
                                                                $evaluar_usuario->execute(array($usuario));
                                                                $row=$evaluar_usuario->fetchColumn();
                                                                if($row > 0){
                                                                    $usuariomo = $row;//capturo el nombre del ROl en la variable para usarla en el Procedimiento almacenado
                                                                    $evaluar_permiso_eliminar = $db->prepare("CALL Sp_permiso_eliminar(?,?);");
                                                                    $evaluar_permiso_eliminar->execute(array($usuariomo, '25'));
                                                                    $row1=$evaluar_permiso_eliminar->fetchColumn();
                                                                    $permiso_eliminar =$row1; 
                                                                }
                                                                ?> 
                                                               <!-- fin del codigo para sustraer el permiso de eliminar-->
                                                               <?php 
                                                                if($permiso_eliminar = 'SI'){
                                                                ?>
                                                                <button type="submit" name="ELIMINAR_PERSONA" id="ELIMINAR" class="btn btn-primary">Si,eliminar</button>
                                                                    <?php 
                                                                }
                                                                ?> 
                                                            </div>
                                                            <!--FIN DEL DIV DE BOTONES DE GUARDAR -->                                                        
                                                        </form>
                                                    </div>
                                                    <!--fin del modal contener -->
                                                </div>
                                                <!--fin del modal dialog -->
                                            </div>
                                            <!--fin del modal de eliminar -->
                                        </tr>
                                        <?php
                             }
                             }
                             
                               
                            ?>
                             
                             </tbody>
                                </table>
                             <?php
                             }
                            } //cierre del if
                            ?>
                            </div>
                            <!--fin del div de responsivi -->
                        </div> <!-- /.card-body -->
                    </div><!-- fINAL DEL card PRIMARY -->
                </div>


                <!--FINAL DE COL-M12-->
            </div><!-- FINAL ROW PADRE -->
        </div><!-- FINAL CONTAINER FLUID -->
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


<script type="text/javascript"> 
   //funcion de cambiar el idioma
  $(document).ready( function () {
      $('#tabla_personas').DataTable({
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
        "search": "Buscar personas:",
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

<!-- funciones del sistema -->
<script>
 
function telfono(evt,input){
        var key = window.Event ? evt.which : evt.keyCode;   
        var chark = String.fromCharCode(key);
        var tempValue = input.value+chark;
        var isNumber = (key >= 48 && key <= 57);
        var isSpecial = (key == 8 || key == 13 || key == 0 ||  key == 46);
        if(isNumber || isSpecial){
            return filter(tempValue);
        }        
        return false;    
    }
    function filter(__val__){
        var preg = /^([9,3,8]{1}[0-9]{0,7})$/; 
        return (preg.test(__val__) === true);
    }
</script>
<script>
    
    window.onload = function() {
        var direccion = document.getElementById('direccion'); /// la variable se puede poner con el mismo nombre del id 
        direccion.onpaste = function(e) { // cambiar la variable  y no se puede repetir las variables 
        e.preventDefault();
      }
      direccion.oncopy = function(e) {// cambiar la variable
        e.preventDefault();
      }
    }
    var direccion=document.getElementById("direccion"); //el nombre del id del campo y cambiar la variable 
    direccion.addEventListener('keydown', function(keyboardEvent) {///cambiar la variable 
    //Si se está repitiendo, ignorar
    if (keyboardEvent.repeat)
    keyboardEvent.preventDefault();
    });
    window.onload = function() {
        var p_nombre = document.getElementById('p_nombre'); /// la variable se puede poner con el mismo nombre del id 
        p_nombre.onpaste = function(e) { // cambiar la variable  y no se puede repetir las variables 
        e.preventDefault();
      }
      p_nombre.oncopy = function(e) {// cambiar la variable
        e.preventDefault();
      }
    }
    var p_nombre=document.getElementById("p_nombre"); //el nombre del id del campo y cambiar la variable 
    p_nombre.addEventListener('keydown', function(keyboardEvent) {///cambiar la variable 
    //Si se está repitiendo, ignorar
    if (keyboardEvent.repeat)
    keyboardEvent.preventDefault();
    });
    window.onload = function() {
        var s_nombre = document.getElementById('s_nombre'); /// la variable se puede poner con el mismo nombre del id 
        s_nombre.onpaste = function(e) { // cambiar la variable  y no se puede repetir las variables 
        e.preventDefault();
      }
      s_nombre.oncopy = function(e) {// cambiar la variable
        e.preventDefault();
      }
    }
    var s_nombre=document.getElementById("s_nombre"); //el nombre del id del campo y cambiar la variable 
    s_nombre.addEventListener('keydown', function(keyboardEvent) {///cambiar la variable 
    //Si se está repitiendo, ignorar
    if (keyboardEvent.repeat)
    keyboardEvent.preventDefault();
    });
    window.onload = function() {
        var p_apellido = document.getElementById('p_apellido'); /// la variable se puede poner con el mismo nombre del id 
        p_apellido.onpaste = function(e) { // cambiar la variable  y no se puede repetir las variables 
        e.preventDefault();
      }
      p_apellido.oncopy = function(e) {// cambiar la variable
        e.preventDefault();
      }
    }
    var p_apellido=document.getElementById("p_apellido"); //el nombre del id del campo y cambiar la variable 
    p_apellido.addEventListener('keydown', function(keyboardEvent) {///cambiar la variable 
    //Si se está repitiendo, ignorar
    if (keyboardEvent.repeat)
    keyboardEvent.preventDefault();
    });
    window.onload = function() {
        var s_apellido = document.getElementById('s_apellido'); /// la variable se puede poner con el mismo nombre del id 
        s_apellido.onpaste = function(e) { // cambiar la variable  y no se puede repetir las variables 
        e.preventDefault();
      }
      s_apellido.oncopy = function(e) {// cambiar la variable
        e.preventDefault();
      }
    }
    var s_apellido=document.getElementById("s_apellido"); //el nombre del id del campo y cambiar la variable 
    s_apellido.addEventListener('keydown', function(keyboardEvent) {///cambiar la variable 
    //Si se está repitiendo, ignorar
    if (keyboardEvent.repeat)
    keyboardEvent.preventDefault();
    });
    window.onload = function() {
        var dni = document.getElementById('dni'); /// la variable se puede poner con el mismo nombre del id 
        dni.onpaste = function(e) { // cambiar la variable  y no se puede repetir las variables 
        e.preventDefault();
      }
      dni.oncopy = function(e) {// cambiar la variable
        e.preventDefault();
      }
    }
    var dni=document.getElementById("dni"); //el nombre del id del campo y cambiar la variable 
    dni.addEventListener('keydown', function(keyboardEvent) {///cambiar la variable 
    //Si se está repitiendo, ignorar
    if (keyboardEvent.repeat)
    keyboardEvent.preventDefault();
    });
    window.onload = function() {
        var correo = document.getElementById('correo'); /// la variable se puede poner con el mismo nombre del id 
        correo.onpaste = function(e) { // cambiar la variable  y no se puede repetir las variables 
        e.preventDefault();
      }
      correo.oncopy = function(e) {// cambiar la variable
        e.preventDefault();
      }
    }
    var correo=document.getElementById("correo"); //el nombre del id del campo y cambiar la variable 
    correo.addEventListener('keydown', function(keyboardEvent) {///cambiar la variable 
    //Si se está repitiendo, ignorar
    if (keyboardEvent.repeat)
    keyboardEvent.preventDefault();
    });
    window.onload = function() {
        var telefono = document.getElementById('telefono'); /// la variable se puede poner con el mismo nombre del id 
        telefono.onpaste = function(e) { // cambiar la variable  y no se puede repetir las variables 
        e.preventDefault();
      }
      telefono.oncopy = function(e) {// cambiar la variable
        e.preventDefault();
      }
    }
    var telefono=document.getElementById("telefono"); //el nombre del id del campo y cambiar la variable 
    telefono.addEventListener('keydown', function(keyboardEvent) {///cambiar la variable 
    //Si se está repitiendo, ignorar
    if (keyboardEvent.repeat)
    keyboardEvent.preventDefault();
    });
  </script>
  <script type="text/javascript"> function solonumero(e) {
        tecla = (document.all) ? e.keyCode : e.which;
        if (tecla==8) return true;
        else if (tecla==0||tecla==9)  return true;
       // patron =/[0-9\s]/;// -> solo letras
        patron =/[0-9\s]/;// -> solo numeros
        te = String.fromCharCode(tecla);
        return patron.test(te);
    }
	</script>
  

<!--♠DianaRut *No me quiten los creditos  modificado por any :( -->