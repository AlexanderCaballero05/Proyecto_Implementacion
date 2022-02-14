<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="../fontawesome-free/css/all.min.css">
    <title>Cambio de contraseña</title>
  </head>

 <style>
    .fa-eye:hover{
        color:steelblue;

    }
 </style>

<body >
    <div class="row align-items-center justify-content-center mt-5">
          <div class="col-md-5 rounded" style="width: 20rem;" >
            <H3 class="fw-bold text-center py-4">Cambio Contraseña</H3>
          <div  class="card">


          
                
              <div class="card-body">
                <form  action="../../../validaciones/Validar_cambio_contrasena.php" method="POST">
                <div class="form-group mb-3">
                            <label>Ingrese su usuario:</label>
                            <input type="text" name="nomUser" class="form-control"  aria-label="Username" aria-describedby="basic-addon1" minlength="6" maxlength="15" onkeyup="mayus(this);">
                    </div>
                   <div class="form-group mb-3">
                            <label>Contrase&ntilde;a anterior:</label>
                            <input id="ver_clave" type="password" name="contraAnte" class="form-control"  required >
                    </div>
                    <div class="form-group mb-3">
                            <label>Nueva Contrase&ntilde;a:</label>
                            <input id="ver_clave1" type="password" name="contraNueva" class="form-control" >
                    </div>
                    <div class="form-group mb-3">
                            <label>Confirmar contrase&ntilde;a:</label>
                            <input id="ver_clave2" type="password" name="contraConfirm" class="form-control"  >
                    </div>
                    <div class="form-group">
                       <span  onclick="mostrar_clave()" ><i class="fa fa-eye"></i></span>
                       <span class="form-text mx-2">Ver contraseñas</span>
                        
                      </span>
                    </div>
                    
                    <div id="passwordHelpBlock" class="form-text">
                      Usar una contraseña maximo 10 digitos y minimo 8,xa con un caracter especial y por lo menos una mayuscula.
                    </div>
                    
                    </br>
                    <div class="d-grid">
                        <button type="submit" name="GUARDARCONTRA" id="GUARDARCONTRA" class="btn btn btn-success btn-block">Cambiar Contrase&ntilde;a</button>
                    </div>
                </form>
              </div>
        </div>
        </div>

    </div>

    <script type="text/javascript">





                function mayus(e) {
                e.value = e.value.toUpperCase();
                }          
                    

            function mostrar_clave(){
                var cla = document.getElementById("ver_clave");
                if(cla.type==="password"){
                    cla.type="text";
                }else{
                    cla.type="password";
                }
                var cla = document.getElementById("ver_clave1");
                if(cla.type==="password"){
                    cla.type="text";
                }else{
                    cla.type="password";
                }
                var cla = document.getElementById("ver_clave2");
                if(cla.type==="password"){
                    cla.type="text";
                }else{
                    cla.type="password";
                }


            }

        </script>





  
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    -->
  </body>
</html>