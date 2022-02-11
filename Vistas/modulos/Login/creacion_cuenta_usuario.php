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
           background: linear-gradient(to right,#F9DD94);
       }
       .bg{
        background-size: cover;
         background-image:url(../assets/imagenes/fondo_login.jpg);
         background-position: center center;

       }
  </style>
  <body>
    <div class="container w-50  mt-5 rounded ">
        <div class="row align-items-stretch">
            <div class="col bg d-none d-lg-block col-md-5 col-lg-5 col-xl-6 rounded-end">
              <!--ESPACIO DONDE ESTA COLOCADA LA IMAGEN -->
            </div>
            <div class="col bg-white p-4 rounded-end">
                 <h3 class="fw-bold text-center py-4">REGISTRATE</h3>
                 </br>
                <!--LOGIN USUARIO -->
              <form>
                  <div class="input-group mb-4">
                      <span class="input-group-text" id=""><i class="fas fa-user"></i></span>
                      <input type="text" class="form-control" placeholder="Ingresa nombre de usuario" aria-label="Username" aria-describedby="basic-addon1">
                  </div>
                  <div class="input-group mb-4">
                      <span    class="input-group-text" id=""><i class="fas fa-lock"></i></span> 
                      <input type="password" class="form-control" placeholder="Ingresa tu contrase&ntilde;a" aria-label="Username" aria-describedby="basic-addon1">
                  </div>
                  <div class="input-group mb-4">
                      <span    class="input-group-text" id=""><i class="fas fa-lock"></i></span> 
                      <input type="password" class="form-control" placeholder="Ingresa de nuevo la contrase&ntilde;a" aria-label="Username" aria-describedby="basic-addon1">
                  </div>
                  <div class="input-group mb-4">
                      <span    class="input-group-text" id=""><i class="fa fa-envelope"></i></span> 
                      <input type="password" class="form-control" placeholder="Ingresa un correo electronico" aria-label="Username" aria-describedby="basic-addon1">
                  </div>
                  
                  <div class="d-grid">
                      <button type="submit" class="btn btn-danger btn-block">REGISTRATE</button>
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