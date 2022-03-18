<?php 
$fecha_actual = date("Y-m-d");
  $_SESSION["bdesde"] = date("Y-m-d",strtotime($fecha_actual."- 1 month"));
  $_SESSION["bhasta"] = date("Y-m-d",strtotime($fecha_actual."+ 1 day"));

?>

<?php 
if(isset($_POST["bdesde"]) && isset($_POST["bhasta"])){
  $_SESSION["bdesde"] = $_POST["bdesde"];
  $_SESSION["bhasta"] = $_POST["bhasta"];

}
?>

<?php 
                  $codigoObjeto=7;
                    $accion='Ingreso a la bitacora universal';
                    $descripcion= 'Consultar la informacion de la bitacora';
                    bitacora($codigoObjeto, $accion,$descripcion);
                    ?>
<head>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<!-- Esta primera section  muestra el titulo central y en la parte superior derecha especifica y direcciona que esta en la bitacora -->
<div class="content-wrapper">

 <section class="content-header text-xl-center mb-3 btn-light">
      <h1>
           Bitácora Universal

      </h1>

      <ol class="breadcrumb">

      <!--  <li><i class="fa fa-dashboard"></i>Inicio</li>
        
        <li class="active">Bitácora Universal</li>-->

      </ol>

    </section>


  <section class="content">

    <div class="container-fluid">

      <div class="box-header with-border">

     <!-- <button type="submit"  name="excel" class="btn btn-success"><span class="glyphicon glyphicon-export"></span> Exportar Excel</button>-->

        <form action="Formbitacora" method="POST"  role="form" >
      <div class="row pl-3">
       

          <div class="col-sm-3">
            <label class=" col-sm-1 control-label" style=" text-align: right; width: 150px">Desde:</label>
            <input class="form-control" type="date" max="<?= date("Y-m-d") ?>" id="bd-desde" name="bdesde" value="<?php echo $_SESSION['bdesde']?>" />
          </div>

          <div class="col-sm-3">
            <label class=" col-sm-1 control-label" style=" text-align: right; width: 150px">Hasta:</label>
            <input class="form-control" type="date" max="<?= date("Y-m-d") ?>" id="bd-hasta" name="bhasta" value="<?php echo $_SESSION['bhasta']?>" />
          </div>
          <div class="col-sm-2 mt-4">
             <button type="submit"  name="guardarCambiosb" class="btn btn-primary"><span class="glyphicon glyphicon-log-out"></span> Filtrar por Fecha</button>
           </div>
       </div>
        <br>
        



<?php 

if(isset($_POST['excel'])){
  $desde = date("Y-m-d", strtotime($_POST['bdesde']));
$hasta = date("Y-m-d", strtotime($_POST['bhasta']));
$conexion =@mysqli_connect('localhost','root', '','db_Proyecto_Prosecar') or die ("Problema en la conexion");
$sql = "SELECT COUNT(*) FROM `tbl_bitacora_sistema`
 WHERE  `FECHA`  BETWEEN '$desde' AND '$hasta'";

$result = mysqli_query($conexion, $sql);
while($fila = mysqli_fetch_assoc($result)){
  $_SESSION['bcontador2'] = $fila["COUNT(*)"];} 

  echo "<script>
  window.open('/ProyectoFinal/vistas/modulos/ReportesBitacoraex.php','_blank');
  window.open(this.href,'_self');
  
  </script>";
  
} 
?> 


<?php 
if(isset($_POST["guardarCambiosb"]) && !Empty($_POST["bdesde"]) && !Empty($_POST["bhasta"])
&&($_POST["bdesde"])>($_POST["bhasta"])){

  echo '<script>
              Swal.fire({
                type: "error",
                title: "¡La fecha de entrada no debe ser menor al la fecha actual! ",
                showConfirmButton: "true",
                confirmButtonText: "Ok",
                closeOnConfirm: "false",
                background:"rgb(0,0,0,0.95)"
      
                }).then((result)=>{
      
                  if (result.value){
      
                    window.location = "Formbitacora";
                  }
                  });
                  </script>';

  } 


  if(isset($_POST["tipo"]) && !Empty($_POST["tipo"]) && $_POST["tipo"] == "Venta")
?>




</div>
</div>

<div class="pl-3">
  <button  onclick="Descargar()" data-toggle="modal"  href="" type='button' id="btnGuardar"  style="color:white;"class="btn btn-danger mb-3"> <span><i class="nav-icon fa fa-file-pdf mx-1"></i></span>Descargar Reporte</button>
  </div>
<div  class="card card-primary p-2" >

<div class="box-header with-border">
</form>



        </center>
        
           <!--  Este codigo muestra el  datagrip  que contiene todos los datos que se le mostraran al Gerente -->
           <div class="card-body pr-1">
            <div class="table-responsive">
              <table id="ventas" class="table table-bordered table-striped table-hover" style="width:100%">
                <br><center>
                  
            
               <thead class="bg-info">
                <tr>
                <th></th>
                <th>Id_bitacora</th>
			        	<th width="20%" class="center">Fecha</th>
				        <th>Usuario</th>
				        <th>Objeto</th>
				        <th>Accion</th>
                <th>Descripción</th>
               
                
                 
                </tr>
              </thead>
              <tbody>
              <?php   
            include_once "Conexion1.php";
            ?>
                <!-- es la conexion de la base para que muestre los datos en el datagrip-->
                <?php 

 //Este hace la union de dos tablas pero solo e spara reflejar el nombre del usuario que realiza la modificaion
                  $desde1= $_SESSION['bdesde'];
                  $hasta1= $_SESSION['bhasta'];
 //Este hace la union de dos tablas pero solo e spara reflejar el nombre del usuario que realiza la modificaion
                    $queryi = "SELECT bi.CODIGO_BITACORA, bi.FECHA, u.NOMBRE_USUARIO, ob.NOMBRE as NOMBRE_OBJETO, bi.ACCION, bi.DESCRIPCION
                    FROM tbl_bitacora_sistema bi, tbl_usuario u, tbl_objetos ob
                    WHERE bi.CODIGO_USUARIO = u.CODIGO_USUARIO
                    AND bi.CODIGO_OBJETO = ob.CODIGO_OBJETO
                    AND bi.FECHA BETWEEN '$desde1' AND '$hasta1';";
                           //llamando los datos de la base y almacenadolos en variables 
                           
                    $resulta = $conn->query($queryi);
                    if ($resulta->num_rows > 0) {
                        // output data of each row
                        while($row = $resulta->fetch_assoc()) {
                          $var1 = $row['CODIGO_BITACORA'];
                          $var2 = $row['FECHA'];
                          $var3 = $row['NOMBRE_USUARIO'];
                          $var4 = $row['NOMBRE_OBJETO'];
                          $var5 = $row['ACCION'];
                          $var6 = $row['DESCRIPCION'];
                          
                           

                    ?>
                <tr>
                     <td style="visibility:hidden;">
                        
                    </td>
                 <td class="text-center"><?php echo $var1 ?></td>
                 <td class="text-center"><?php echo $var2 ?></td>
                 <td class="text-center"><?php echo $var3 ?></td>
				         <td class="text-center"><?php echo $var4 ?></td>
				         <td class="text-center"><?php echo $var5 ?></td>
                 <td class="text-center"><?php echo $var6 ?></td>
				
                    </div>
                    <?php
                      }
  }
                        
                   ?>
                  </tr>
                </tbody>

              </table>
   
            </div>
          </div>
         <br>
               <br>
               <br>
               <br>
                <br>

        </div>


        <script>
          $(document).ready(function() {
          $('#ventas').DataTable();
          } );
        </script>


 <script>
    function Descargar() {
      window.open('Reportes_Prosecar/reporteBitacora.php','_blank');
      window.open(this.href,'_self');
    } 
  </script>
       


<!-- ordenar tabla de modo descendente -->

