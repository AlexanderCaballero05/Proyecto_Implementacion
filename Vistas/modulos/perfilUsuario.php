
           <?php
            include "conexion1.php";
            $usuario = $_SESSION['vario'];
            $queryr = "SELECT c.CORREO_PERSONA
            FROM tbl_usuario u, tbl_correo_electronico c, tbl_persona p
            WHERE p.CODIGO_PERSONA = u.CODIGO_PERSONA
            AND P.CODIGO_PERSONA = C.CODIGO_PERSONA
            AND u.NOMBRE_USUARIO = '$usuario';";
            $resultador=$conn->query($queryr);


            ?>  

       <?php
            include "conexion1.php";
            $usuario = $_SESSION['vario'];
            $queryr1 = "SELECT p.PRIMER_NOMBRE
            FROM tbl_usuario u, tbl_correo_electronico c, tbl_persona p
            WHERE p.CODIGO_PERSONA = u.CODIGO_PERSONA
            AND P.CODIGO_PERSONA = C.CODIGO_PERSONA
            AND u.NOMBRE_USUARIO = '$usuario';";
            $resultador1=$conn->query($queryr1);


            ?>  

         <?php
            include "conexion1.php";
            $usuario = $_SESSION['vario'];
            $queryr2 = "SELECT p.PRIMER_APELLIDO
            FROM tbl_usuario u, tbl_correo_electronico c, tbl_persona p
            WHERE p.CODIGO_PERSONA = u.CODIGO_PERSONA
            AND P.CODIGO_PERSONA = C.CODIGO_PERSONA
            AND u.NOMBRE_USUARIO = '$usuario';";
            $resultador2=$conn->query($queryr2);


            ?>  

            


          



<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="m-4 text-center">
            <h1>Perfil Usuario</h1>
         </div>
        
          <form class="center-wrap">
          <div class="pl-5 bg-gradient-blue mb-4">
                        <h3>Informacion Usuario</h3>
                      </div>
            <div class="row mb-2">
              <div class="col-sm-8 pl-4">
                    <div class="mb-4">
                     
                        <label for="" class="form-label">Nombre Usuario</label>
                        <input type="text" class="form-control"  value="<?php echo $usuario;?>">
                    </div>
                    <div class="mb-3">
                        <label for="exampleInputPassword1" class="form-label">Actual contraseña</label>
                        <input type="password" class="form-control" id="exampleInputPassword1">
                    </div>
                    <div class="mb-3">
                        <label for="" class="form-label">contraseña nueva</label>
                        <input type="password" class="form-control" id="">
                    </div>
                    <div class="mb-3">
                        <label for="" class="form-label">Confirmar contraseña</label>
                        <input type="password" class="form-control" id="">
                    </div>
                   
          </div><!-- /.col -->
        </div><!-- /.row -->
                     <div class="pl-5 mb-4 bg-gradient-blue">
                        <h3>Informacion Personal</h3>
                      </div>

        <div class="row mb-2 pl-3">
             <div class="col-sm-3">
                    <label for="" class="form-label">Primer nombre</label>
                    <?php 
                                        if ($resultador1->num_rows>0) {
                                        while($rowt1 = $resultador1->fetch_assoc()) { ?>
                  <input type="text" value="<?php echo $rowt1['PRIMER_NOMBRE'];?>" class="form-control">
                  <?php
                                        }
                                      }
                        ?>

             </div>

             <div class="col-sm-3">
                    <label for="exampleInputPassword1" class="form-label">Apellido(s)</label>
                    <?php 
                                        if ($resultador2->num_rows>0) {
                                        while($rowt2 = $resultador2->fetch_assoc()) { ?>
                  <input type="text" value="<?php echo $rowt2['PRIMER_APELLIDO'];?>" class="form-control" id="exampleInputPassword1">
                  <?php
                                        }
                                      }
                        ?>
            </div>       

            <div class="col-sm-3">
                   <label for="" class="form-label">Direccion de correo</label>
                        <?php 
                                        if ($resultador->num_rows>0) {
                                        while($rowt = $resultador->fetch_assoc()) { ?>
                   <input type="email" value="<?php echo $rowt['CORREO_PERSONA'];?>" class="form-control" id="">
                        <?php
                                        }
                                      }
                        ?>
             </div>
                   
     ,   </div><!-- /.row -->
                      <div class="panel-footer mt-5 PL-3">
                                  
                                <button  href="sbmit" type='submit' id="btnGuardar" class="btn btn-warning mb-3"><span> <i class="nav-icon fa fa-edit mx-1"></i></span>Actualizar perfil</button>
                                <a  onclick="location.href='index'">
                                <button  id="btnGuardar" class="btn btn-danger mb-3">Cancelar</button>
                                </a>    
              </div>
         </form>
      </div><!-- /.container-fluid -->
    </div>
  </div>