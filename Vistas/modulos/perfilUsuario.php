
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

          



<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="m-4 text-center bg-cyan text-bold">
            <h1>Perfil Usuario</h1>
         </div>
        
          <form class="center-wrap">
          <div class="row mb-2">
             <div class="col-sm-8 pl-4 ">
                    <div class="mb-3">
                      <div class="">
                        <h3>Informacion Usuario</h3>
                      </div>
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
          <div class="row mb-2">
             <div class="col-sm-8 pl-4 ">
                    <div class="mb-3">
                      <div class="">
                        <h3>Informacion de Personal</h3>
                      </div>
                        <label for="" class="form-label">Primer nombre</label>
                        <input type="text" class="form-control">
                    </div>
                    <div class="mb-3">
                        <label for="exampleInputPassword1" class="form-label">Apellido(s)</label>
                        <input type="text" class="form-control" id="exampleInputPassword1">
                    </div>
                    <div class="mb-3">
                        <label for="" class="form-label">Direccion de correo</label>
                        <?php 
                                        if ($resultador->num_rows>0) {
                                        while($rowt = $resultador->fetch_assoc()) { ?>
                        <input type="email" value="<?php echo $rowt['CORREO_PERSONA'];?>" class="form-control" id="" disabled>
                        <?php
                                        }
                                      }
                        ?>
                    </div>
                   
                   



          
          </div><!-- /.col -->
        </div><!-- /.row -->
        <div class="panel-footer text-center">
                    
                    <button type="submit" class="btn btn-sm btn-warning"> Actualizar perfil</button>
    
                           
                           
                        </div>
         </form>
      </div><!-- /.container-fluid -->
    </div>
  </div>