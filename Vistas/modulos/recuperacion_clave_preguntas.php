<!--Elaborado por Diana Rut Garcia 
-----------------------------------------------------------------------
	           Universidad Nacional Autonoma de Honduras (UNAH)
		           Facultad de Ciencias Economicas
	        Departamento de Informatica administrativa
         Analisis, Programacion y Evaluacion de Sistemas
                    Segundo Periodo 2022
Equipo:

Catedratico:
Lic. Karla Melisa Garcia Pineda 
---------------------------------------------------------------------
Programa:          Verificacion de preguntas de seguridad
Fecha:             10-Febrero-2022
Programador:       Diana Rut Garcia 
Descripcion:       Pantalla de recuperacion por preguntas de seguridad
-----------------------------------------------------------------------
 Historial de Cambio
-----------------------------------------------------------------------
Programador            Fecha                Descripcion
Diana Rut Garcia	 	27-may-2021       Cambio apariencia pantalla con validaciones de parametos 
ANY HERNANDEZ       01-JUN-2022       PARAMETROS DE MAXIMO Y MINIMO DE LA RESPUESTA -->

<?php
 session_start();
 include "conexionpdo.php";
 include_once 'conexion2.php';
 include_once 'conexion3.php';
?>

<?php
  //Parametro de maximo nombre usuario
  $max = "MAX_RESPUESTA_PREGUNTAS";
  $sentencia1 = $db->prepare("SELECT VALOR FROM tbl_parametros WHERE PARAMETRO =(?);");
  $sentencia1->execute(array($max));
  $row1=$sentencia1->fetchColumn();
  if($row1>0){
    $valor2 = $row1;
  }
?>

<?php
  //Parametro de maximo nombre usuario
  $min = "MIN_RESPUESTA_PREGUNTAS";
  $sentencia1 = $db->prepare("SELECT VALOR FROM tbl_parametros WHERE PARAMETRO =(?);");
  $sentencia1->execute(array($min));
  $row=$sentencia1->fetchColumn();
  if($row>0){
    $valor1 = $row;
  }
?>

<!DOCTYPE html>
<html lang="en">
 <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
     <!-- Bootstrap CSS -->
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="./fontawesome-free/css/all.min.css">

    <title>Restablecer la contraseña usuario</title>
  </head>

  <body class="login-page" _c_t_common="1"  >
      <div class="container-fluid">
         <div class="row justify-content-center mt-5">
            <div class="col-md-6">
                <div  class="card card-outline card-primary">
                    <div class="card-header text-white  mb-3" style="background-color:#2F2F2F;">
                    <h4 class=" text-center ">Verificar preguntas de seguridad</h4>
                    </div>
                    <div class="card-body">
                        <form class="needs-validation" novalidate method="POST" action="../../modelos/recu_contrasena_preguntas.php">
                           <div  class="col-md-12 mb-3">
                             <div class="form-group"><!--Muesrta el nombre del usuario que esta registrado en el sistema,pra cambiar contraseña -->
                                 <input type="text"   name="user" id="user" class="form-control" value="USUARIO: <?php echo ($_SESSION['vario']);?>" readonly required >
                             </div>
                           </div>
                           <div class="col-md-12 mb-3"> 
                             <div class="form-group">
                             <select class="form-control"  aria-label="Default select example"  name="pregunta_usuario" id="pregunta_usuario" required>
                                <?php
                                  $query = "SELECT  CODIGO_PREGUNTAS, PREGUNTA FROM tbl_preguntas p 
                                  where CODIGO_ESTADO = 2";
                                  $resultado=$conn->query($query);
                                ?>
                                   <option selected enable value="">--Selecione--</option>
                                    <?php //Muestra los datos de la tabla de preguntas en el select
                                    if($resultado->num_rows > 0) {
                                      while($pregunta = $resultado->fetch_assoc()) { 
                                        $valuep =$pregunta['CODIGO_PREGUNTAS'];
                                        $pre =  $pregunta['PREGUNTA'];
                                    ?>
                                    <option value="<?php echo $valuep?>"><?php echo $pre;?></option>
                                    <?php
                                        } }
                                    ?>
                                </select>
                                <div class="invalid-feedback">
                                    Debe selecionar una pregunta.
                                </div> 
                              </div>                                      
                            </div>
                            <div class="col-md-12 mb-3" >
                               <div class="form-group">
                                 <input type="text" maxlength="<?php echo $valor2;?>"  minlength="<?php echo $valor1;?>" name="respuesta" id="respuesta" class="form-control" id="" onkeyup="mayus(this);" autocomplete = "off"
                                  placeholder="Respuesta de seguridad" onkeypress="return soloLetras(event);" required pattern="[A-Z]{<?php echo $valor1;?>,<?php echo $valor2;?>}">
                                  <div class="invalid-feedback">
                                    Debe contestar este campo.
                                  </div> 
                               </div>
                            </div>
                            <div class="d-grid gap-2"><!--Botones  -->
                              <button type="submit" class="btn btn-block btn btn-flat" style="background-color:#4FCF87; color:white;" name="verificar_res" id="verificar_res">VERIFICAR</button>
                              <button type="reset" onclick="location.href='../../index.php'" class="btn btn-block btn-warning btn-flat" >CANCELAR</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
         </div>
      </div>
  </body>
  <!--Elaborado por Diana Rut -->

  <!--Funciones js -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
  <script>
      function mayus(e) {//Funcion mayuscula
        e.value = e.value.toUpperCase();
     }
      (function () {'use strict' //funcion de validacion de campos con js
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
  <script>
      function soloLetras(e){
       key = e.keyCode || e.which;
       tecla = String.fromCharCode(key).toLowerCase();
       letras = " áéíóúabcdefghijklmnñopqrstuvwxyz";
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


</html>