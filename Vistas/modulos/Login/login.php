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
         background-image:url(../assets/Vistas/modulos/imagenes/fondo_login.jpg);
         background-position: center center;

       }
  </style>
  <body>
    <div class="container w-50  mt-5 rounded shadow">
        <div class="row align-items-stretch">
            <div class="col bg d-none d-lg-block col-md-5 col-lg-5 col-xl-6 rounded-end">
              <!--ESPACIO DONDE ESTA COLOCADA LA IMAGEN -->
            </div>
            <div class="col bg-white p-4 rounded-end">
                 <h3 class="fw-bold text-center py-4">INICIAR SESIÓN</h3>
                 </br>
                <!--LOGIN USUARIO -->
              <form action="../login_validar.php" method="POST" CLASS="form-sesion">
                  <div class="input-group mb-4">
                      <span class="input-group-text" id=""><i class="fas fa-user"></i></span>
                      <input type="text" name="nombre_usuario" class="form-control" placeholder="Ingresa tu nombre de usuario" aria-label="Username" aria-describedby="basic-addon1">
                  </div>
                  <div class="input-group mb-4">
                      <span    class="input-group-text" id=""><i class="fas fa-lock"></i></span> 
                      <input type="password" name="contrasena" class="form-control" placeholder="Ingresa tu contrase&ntilde;a" aria-label="Username" aria-describedby="basic-addon1">
                  </div>
                  <div class="mb-4">
                     <input type="checkbox"class="form-check-input">
                     <label class="form-check-label">Recuerdame</label>
                  </div>
                  <div class="d-grid">
                      <button type="submit" class="btn btn-danger btn-block">INGRESAR</button>
                  </div>
                  <div class=" text-center my-3"> 
                     <span><a style="color:black; text-decoration:none" href="metodos_recuperar_clave.php">¿Olvidaste tu usuario o contrase&ntilde;a? </a></span>
                     </br>
                     <span><a style=" text-decoration:none" href="./creacion_cuenta_usuario.php">Registrate </a></span>
                   </div>
              </form>
            </div>
        </div>
    <div>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    -->
  </body>
</html>