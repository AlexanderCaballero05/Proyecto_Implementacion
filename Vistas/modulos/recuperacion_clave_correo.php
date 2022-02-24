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
         background-image:url(../assets/imagenes/fondo_correo.jpg);
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
                   <h3  class="fw-bold text-center py-1">Recuperar contrase&ntilde;a via correo </h3>
               </di""v></br>
               <form action="../../modelos/recu_contrasena_porCorreo.php" method="POST">
                     <div class="input-group mb-3">
                        <p class="accent-info"><strong>¿Olvidaste tu contraseña?</strong>  </br>
                          <p class="text-md-center text-success"> Ingresa tu nombre de usuario abajo y </p> </br>
                            <p class="text-md-center text-success">    te enviaremos un correo para reiniciarla</p>
                    
                    </div>
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="Usuario-recuperar"><i class="fas fa-user"></i></span>
                        
                        <input type="text" id="recupUsuario" name="recupUsuario" class="form-control" placeholder="Ingresa el usuario" aria-label="Username" aria-describedby="basic-addon1" minlength="6" maxlength="15" onkeyup="mayus(this);">
                    </div>

                  
                    <div class="d-grid gap-2">
                       <button type="submit" name="recupCorreo" id="recupCorreo"class="btn btn-block btn-info  btn-flat">
                           Reiniciar my contrase&ntilde;a
                       </button>

                       <button type="reset" onclick="location.href='../../index.php'" class="btn btn-clock bg-warning btn-flat">
                          cancelar
                      </button>
                   </div>               
                
               </form>
           

         </div>
    </div>
    <script type="text/javascript">
  
  function mayus(e) {
    e.value = e.value.toUpperCase();
}
</script>


    <script > </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>