

<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="../fontawesome-free/css/all.min.css">
    <title>Login Usuario</title>
  </head>
  <style>
       body{
           background-color:#E8E8E1;
          
          
       }
       .bg{
        background-size: cover;
         background-image:url(assets/imagenes/prosecar.PNG);
         background-position: center center;
       }
  </style>
  <body oncopy="return false" onpaste="return false">
    <div class="container w-50   rounded shadow">
        <div class="row align-items-stretch">
            <div class="col bg d-none d-lg-block col-md-5 col-lg-5 col-xl-6 rounded-end">
              <!--ESPACIO DONDE ESTA COLOCADA LA IMAGEN -->
            </div>
            <div class="col bg-white p-4 rounded-end">
                 <h3 class="fw-bold text-center py-4">INICIAR SESIÓN</h3>
                 </br>
                <!--LOGIN USUARIO -->
                <form method="POST" class="needs-validation" novalidate>
          

                  <div class="input-group mb-4">
                      <span class="input-group-text" id=""><i class="fas fa-user"></i></span>
                      <input type="text" name="ingUsuario" id="ingUsuario" class="form-control" placeholder="Ingresa tu nombre de usuario" autocomplete = "off"  onkeypress="return soloLetras(event);" minlength="3" maxlength="20" onkeyup="mayus(this);" required onblur="quitarespacios(this);" onkeydown="sinespacio(this);">
                      <div class="invalid-tooltip">
                         Llene este campo
                      </div>
                  </div>
                  <div class="input-group mb-4">
                      <span    class="input-group-text" id=""><i class="fas fa-lock"></i></span> 
                      <input type="password" name="ingPassword" id="ingPassword" class="form-control" placeholder="Ingresa tu contrase&ntilde;a" aria-label="Username" aria-describedby="basic-addon1"   minlength="8" maxlength="30" required onblur="quitarespacios(this);" onkeyup="sinespacio(this);">
                      <div class="invalid-tooltip">
                        Llene este campo
                      </div>
                  </div>
                 </br>
                  <div class="d-grid">
                      <button style="border-radius: 20px;" name = "btningresar" type="submit" class="btn btn-danger btn-block">INGRESAR</button>
                  </div>
                  <div class=" text-center my-3"> 
                     <span><a style="color:black; text-decoration:none" href="vistas/modulos/metodos_recuperar_clave.php">¿Olvidaste tu usuario o contrase&ntilde;a? </a></span>
                     </br>
                     <span><a style=" text-decoration:none" href="vistas/modulos/auto_registro.php">Registrate </a></span>
                   </div>
                   <?php

     $login = new ControladorUsuarios();
     $login -> ctrIngresoUsuario();

            ?>


              </form>
            </div>
        </div>
    <div>

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


    <script type="text/javascript">
  
        function mayus(e) {
          e.value = e.value.toUpperCase();
         }
    </script>


    <script type="text/javascript">

        function sinespacio(e) {

        var cadena =  e.value;
        var limpia = "";
        var parts = cadena.split(" ");
        var length = parts.length;

          for (var i = 0; i < length; i++) {
              nuevacadena = parts[i];
              subcadena = nuevacadena.trim();

          if(subcadena != "") {
             limpia += subcadena + " ";
                }
          }
        limpia = limpia.trim();
        e.value = limpia;

         };
     </script>

 <script type="text/javascript">

    function quitarespacios(e) {

      var cadena =  e.value;
      cadena = cadena.trim();

      e.value = cadena;

    };

  </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    -->
  </body>
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
</html>