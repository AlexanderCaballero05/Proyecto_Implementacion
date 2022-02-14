<?php
  session_start();
  include_once 'conexion2.php';
  $_SESSION['usua'] ;
  $db = new Conexion();
  $con = $db->conectar();
  $comando = $con->query("SELECT  CODIGO_PREGUNTAS, PREGUNTA FROM tbl_preguntas;");
  $comando->execute();
  $resultado = $comando->fetchall(PDO::FETCH_ASSOC);
?>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <title>Recuperacion contrase&ntilde;a mediante preguntas</title>
  </head>
  <body >
      <style>
       .cabeza{
            background-color:#2F2F2F;
        }
        .verde{
          background-color:#4FCF87;
        }
     </style>
      <div class="container-fluid w-50  mt-5" >
          <div class="card   md-12 lg-5 xl-6 rounded-end" style="width: 45rem;" >
              <div class="card-header text-white  mb-3 cabeza">
                <h4 class=" text-center ">Verificar preguntas de seguridad</h4>
              </div>
              <!-- INCIO FOMULARIO-->
              <form class="form-horizontal" action="../../../validaciones/recu_contrasena_preguntas.php" method="POST">
                <div class="card-body" >
                    <div class="form-group row mb-3">
                       <label  class="col-md-4 col-form-label">Usuario:</label>
                       <div class="col-md-8"> <!--Muesrta el nombre del usuario que esta registrado en el sistema,pra cambiar contraseña -->
                          <input type="text"   name="user" id="user" class="form-control" value="<?php echo ($_SESSION['usua']);?>" readonly required="" >
                      </div>
                    </div>
                   <div class="form-group row mb-3">
                     <label  class="col-md-4 col-form-label ">Seleccione la pregunta:</label>
                        <div class="col-md-8">
                            <select class="form-select" aria-label="Default select example" name="pregunta_usuario" id="pregunta_usuario">
                              <Option class="custom-selected">Selecione una pregunta</option>
                              <?php //Muestra los datos de la tabla de preguntas en el select
                              foreach($resultado as $pregunta){
                              $valuep =$pregunta['CODIGO_PREGUNTAS'];
                              $pre =  $pregunta['PREGUNTA'];
                              ?>
                              <option value="<?php echo $valuep?>"><?php echo $pre;?></option>
                              <?php
                                }
                              ?>
                            </select>
                        </div>
                   </div>
                   <div class="form-group row mb-3">
                      <label  class="col-md-4 col-form-label">Respuesta:</label>
                      <div class="col-md-8"> <!-- -->
                      <input type="text" name="respuesta" id="respuesta" class="form-control" id="" onkeyup="mayus(this);" autocomplete = "off"
                         placeholder="RESPUESTA DE SEGURIDAD" required="">
                       </div>
                    </div>
                </div>
                   <div class="d-grid gap-2 d-md-block text-center">
                     <button type="reset" onclick="location.href='login.php'" class="btn btn-block btn-warning btn-flat col-5 mx-auto">
                         Cancelar
                      </button>
                       <button type="submit" class="btn btn-success col-5 mx-auto verde" name="verificar_res" id="verificar_res">
                          Verificar
                       </button>
                   </div></br> 
              </form>
          </div>
      </div>
      <script type="text/javascript">
        function mayus(e) {
        e.value = e.value.toUpperCase();
        }
      </script>

 
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
     <!-- Option 2: Separate Popper and Bootstrap JS -->
     <!--
     <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
     -->
  </body>
</html>