<!-- 
<?php

session_start();

?> -->


<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Prosecar</title>

  <!--=====================================
  =            PLUGING DE CSS             =
  ======================================-->

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="Vistas/plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Tempusdominus Bootstrap 4 -->
  <link rel="stylesheet" href="Vistas/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="Vistas/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- JQVMap -->
  <link rel="stylesheet" href="Vistas/plugins/jqvmap/jqvmap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="Vistas/dist/css/adminlte.min.css">
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href="Vistas/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
  <!-- Daterange picker -->
  <link rel="stylesheet" href="Vistas/plugins/daterangepicker/daterangepicker.css">
  <!-- summernote -->
  <link rel="stylesheet" href="Vistas/plugins/summernote/summernote-bs4.min.css">
</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">

  <!-- Preloader -->
  <div class="preloader flex-column justify-content-center align-items-center">
    <img class="animation__shake" src=" Vistas/dist/img/AdminLTELogo.png" alt="AdminLTELogo" height="60" width="60">
  </div>

<!--=====================================
  =            PLUGING DE JAVASCRIPT      =
  ======================================-->

<!-- jQuery -->
<script src="Vistas/plugins/jquery/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="Vistas/plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->

<!-- Bootstrap 4 -->
<script src="Vistas/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- ChartJS -->
<script src="Vistas/plugins/chart.js/Chart.min.js"></script>
<!-- Sparkline -->
<script src="Vistas/plugins/sparklines/sparkline.js"></script>
<!-- JQVMap -->
<script src="Vistas/plugins/jqvmap/jquery.vmap.min.js"></script>
<script src="Vistas/plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
<!-- jQuery Knob Chart -->
<script src="Vistas/plugins/jquery-knob/jquery.knob.min.js"></script>
<!-- daterangepicker -->
<script src="Vistas/plugins/moment/moment.min.js"></script>
<script src="Vistas/plugins/daterangepicker/daterangepicker.js"></script>
<!-- Tempusdominus Bootstrap 4 -->
<script src="Vistas/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
<!-- Summernote -->
<script src="Vistas/plugins/summernote/summernote-bs4.min.js"></script>
<!-- overlayScrollbars -->
<script src="Vistas/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
<!-- AdminLTE App -->
<script src="Vistas/dist/js/adminlte.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="Vistas/dist/js/pages/dashboard.js"></script>


<?php


 /*=============================================
=           ENCABEZADO                        =
=============================================*/ 

include "modulos/encabezado.php";



/*=============================================
  =            MENU                             =
  =============================================*/

  include "modulos/menu_general.php";


  include "modulos/inicioadmin.php";

  /*=============================================
  =           FOOTER                     =
  =============================================*/
  include "modulos/footer.php";


  

/*=============================================
  =            CONTENIDO                        =
  =============================================*/ 


  

   if(isset($_GET["ruta"])){

     if($_GET["ruta"] == "login"){
       include "modulos/".$GET["ruta"].".php";
     }

   }else{

     include "../modulos/login.php";

   }

?>


  

    

<?php
if (isset($_SESSION["iniciarSesion"])&& $_SESSION["iniciarSesion"] == "ok"){
    echo '<div class="wrapper">';


}else{

include "/modulos/Login.login.php";
}
?> 

 

 



</body>
</html>
