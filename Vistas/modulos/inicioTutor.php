
 <!-- Content Wrapper. Contains page content -->
 <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 px-3">Bienvenido <?php  echo $_SESSION['vario'];  ?></h1>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->
<!-- Contenido general de pagina -->
<section class="content">
    <div class="container-fluid">
        <div class="accordion" id="accordionExample"><!--Codigo de la mision y vision -->
          <div class="card card-info card-outline">
            <div class="card-header" id="headingOne">
              <h2 class="mb-0">
                <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                  VISIÓN
                </button>
              </h2>
            </div>
            <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
              <div class="card-body">
              A partir de un acompañamiento integral en lo niños, niñas y jóvenes los valores humanos, cristianos y espirituales,
              que les capacite para lo que será su proyecto de vida, vocación y misión, con herramientas que les faciliten su entrada al mundo laboral.
              </div>
            </div>
          </div>
          <div class="card card-success card-outline">
            <div class="card-header" id="headingTwo">
              <h2 class="mb-0">
                <button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                MISIÓN
                </button>
              </h2>
            </div>
            <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
              <div class="card-body">
                Brindar acompañamiento académico, médico, psicológico, tecnológico y de espiritual que propicie el desarrollo integral, en jóvenes que estudien de 7° al 9°
                grado y bachillerato, en edades de 12 a 18 años, que pertenezcan a los sectores de Las Torres, La Rosa, La Padrera y Flor del Campo de la Parroquia Santa Teresa de Jésus. 
              </div>
            </div>
          </div>
        </div> 
        
        <div class="card" style="width: 18rem;">
          <img src="assets/imagenes/prosecar.PNG" class="card-img-top" alt="...">
          <div class="card-body">
            <h5 class="card-title">Tutoria </h5>
            <p class="card-text">Tutoria del area academica.</p>
            <a href="#" class="btn btn-primary">Ir al curso</a>
          </div>
        </div>
        
        
      
      
    
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->