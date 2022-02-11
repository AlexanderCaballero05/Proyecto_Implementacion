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
      .btn-outline-info{
       color: #424141;
       border-color: none;
       background-color:#F9F9F9;
       }
       .cabeza{
        background-color:#2F2F2F;
       }
       .fondo{
         background:linear-gradient(rgba(5,4,5,0.10), rgba(5,4,5,0.10)),
         url(../assets/imagenes/fondo3.jpg);
         background-position: center center;
         max-width: 100%;
         background-attachment: fixed;
         background-repeat:no repeat;
       }
       .form-control{
         background: rgba(5,4,5,0.10);
       }
       .form-control:hover{
         background: rgba(5,4,5,0.12);
       }

       .form-select:hover {
        background: rgba(5,4,5,0.12);
       }
       .form-select{
        background: rgba(5,4,5,0.10);
       }
       
       .form-label{
         color:#030303;
       }
    </style>
      <div class="container-fluid w-50  mt-5">
          <div class="card fondo  md-12 lg-5 xl-6 rounded-end" >
              <div class="card-header text-white  mb-3 cabeza">
                <h4 class=" text-center ">Recuperación mediante pregunta secreta</h4>
              </div>
              <!-- INCIO FOMULARIO-->
              <form class="form-horizontal">
                <div class="card-body" >
                   <div class="form-group row mb-3">
                     <label  class="col-md-4 col-form-label ">Seleccione la pregunta:</label>
                        <div class="col-md-8">
                            <select class="form-select" aria-label="Default select example">
                                <option selected></option>
                                <option value="1">One</option>
                            </select>
                        </div>
                   </div>

                   <div class="form-group row mb-3">
                      <label  class="col-md-4 col-form-label">Respuesta:</label>
                      <div class="col-md-8">
                          <input type="text" class="form-control" id="inputPassword3" >
                       </div>
                    </div>

                    <div class="form-group row mb-3">
                       <label  class="col-md-4 col-form-label">Contrase&ntilde;a nueva:</label>
                       <div class="col-md-8">
                          <input type="password" class="form-control" id="inputPassword3" >
                        </div>
                    </div>
                    <div class="form-group row mb-3">
                       <label  class="col-md-4 col-form-label">Confirmar contrase&ntilde;a:</label>
                       <div class="col-md-8">
                          <input type="password" class="form-control" id="inputPassword3" >
                        </div>
                    </div>
                </div>
                   <div class="d-grid gap-2 d-md-block text-center">
                     <button class="  btn btn-outline-info col-4 mx-auto  " type="button">
                       <a style="text-decoration:none; color:#090909;" href="#">
                         Aceptar
                      </button>
                       <button class="btn btn-outline-info col-4 mx-auto  " type="button">
                         <a style=" text-decoration:none; color:#090909"; href="#">
                          Siguiente
                        </button>
                   </div></br> 
              </form>
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