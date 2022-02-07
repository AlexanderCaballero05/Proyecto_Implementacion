<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="../fontawesome-free/css/all.min.css">
    <title>Recuperar Contraseña</title>
  </head>
  <body>
  <style>
       body{
           background-color:#E8E8E1;
           background: linear-gradient(to right,#F9DD94);
       }
       .bg{
        background-size: cover;
         background-image:url(../assets/imagenes/fondo2.png);
         background-position: center center;
         max-width: 70%;
         display: inline-block;
       }
  </style>

    <div class="container w-50  mt-5 rounded ">
         <div class="row align-items-stretch">
            <div  class="col bg  d-none d-lg-block col-md-5 col-lg-6 col-xl-6 rounded-end">
                <!--ESPACIO DONDE ESTA COLOCADA LA IMAGEN -->
            </div>
            <div class="col bg-white  p-4 rounded-end">
                <div class="card-header ">
                   <h3  class="fw-bold text-center py-1">Olvido de contrase&ntilde;a </h3>
               </div></br>
               <form>
                     <div class="input-group mb-3">
                        <p><strong>¿Olvidaste tu contraseña?</strong>  </br>
                          <p > Ingresa tu nombre de usuario para restablecer mediante 2 formas</p>
                        </p>
                    </div>
                    <div class="input-group mb-3">
                        <span class="input-group-text" id=""><i class="fas fa-user"></i></span>
                        <input type="text" class="form-control" placeholder="Ingresa el usuario" aria-label="Username" aria-describedby="basic-addon1">
                    </div>

                    <div class="d-grid gap-2">
                       <button class="btn btn-light border-secondary" type="button">
                          <a style=" text-decoration:none" href="./recuperacion_clave_preguntas.php">
                           Enviar contrase&ntilde;a por correo
                       </button>
                       <button class="btn btn-light border-secondary" type="button">
                         <a style=" text-decoration:none" href="./recuperacion_clave_preguntas.php">
                         Recuperar via preguntas secretas
                       </button>
                   </div>
               </form>
            </div>

         </div>
    </div>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    -->
  </body>
</html>