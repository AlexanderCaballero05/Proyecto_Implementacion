 <!-- Navbar -->
 <?php
  include_once "conexion.php";
  include_once "conexion3.php";
 ?>

<nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- item de desplegar el menu o no-->
    <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
        </li>
    </ul>

        <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
      <li class="nav-item">
        <a class="nav-link" data-widget="fullscreen" href="#" role="button">
          <i class="fas fa-expand-arrows-alt"></i>
        </a>
      </li>
    
       <li class="nav-item dropdown">
          <a class="nav-link" data-toggle="dropdown" href="#" aria-expanded="false"><!--Para la foto de perfil -->
           
            <img style="max-width:25px;"  src="data:image/jpeg;base64,<?php echo base64_encode($var12); ?>">
            </a>
        
           <div class="dropdown-menu dropdown-menu-sm dropdown-menu-right bg-gradient-blue" style="left: inherit; right: 0px;">
                <div  class="dropdown-item">
                <div class="dropdown-author" style="color:#3F4041;"><?php echo $_SESSION['vario']; ?>
                </div>
                </div>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item menu-action" onclick="location.href='perfilUsuario'" >
                <i class="fas fa-user"></i>
                <span class="menu-action-text pr-2" style="color:#3F4041;">Perfil</span>
                </a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item menu-action" onclick="location.href='crudPreguntasUsuarios'" >
                <i class="fas fa-user"></i>
                <span class="menu-action-text pr-2" style="color:#3F4041;">Preguntas de seguridad</span>
                </a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item menu-action" onclick="location.href='salir'" >
                <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                <span class="menu-action-text pr-2" style="color:#3F4041;">Cerrar sesion</span>
                </a>
           </div>
        </li>
    </ul>
</nav>
<!-- /.navbar -->

        