
<?php /*
$fecha_actual = date("Y-m-d");
  $_SESSION["bdesde"] = date("Y-m-d",strtotime($fecha_actual."- 1 month"));
  $_SESSION["bhasta"] = date("Y-m-d",strtotime($fecha_actual."+ 1 day"));

?>

<?php 
if(isset($_POST["bdesde"]) && isset($_POST["bhasta"])){
  $_SESSION["bdesde"] = $_POST["bdesde"];
  $_SESSION["bhasta"] = $_POST["bhasta"];

}
*/?>

<!-- Esta primera section  muestra el titulo central y en la parte superior derecha especifica y direcciona que esta en la bitacora -->
<div class="content-wrapper">

 <section class="content-header">
      <h1>
           Bitácora Central

      </h1>

      <ol class="breadcrumb">

        <li><i class="fa fa-dashboard"></i>Inicio</li>
        
        <li class="active">Bitácora Central</li>

      </ol>

    </section>


  <section class="content">

    <div class="box box-primary">

      <div class="box-header with-border">

        <center>


<form action="rbitacora" method="POST"  role="form" >


<label class=" col-sm-1 control-label" style=" text-align: right; width: 150px">Desde:</label>

<div class="col-sm-2">

<input class="form-control" type="date" />
</div>

<label class=" col-sm-1 control-label" style=" text-align: right; width: 150px">Hasta:</label>
<div class="col-sm-2">
<input class="form-control" type="date"  />
</div>

<button type="submit"  name="guardarCambiosb" class="btn btn-primary"><span class="glyphicon glyphicon-log-out"></span> Filtrar por Fecha</button>


<button type="submit"  name="excel" class="btn btn-warning"><span class="glyphicon glyphicon-export"></span> Exportar Excel</button>





<?php /*

if(isset($_POST['excel'])){
  $desde = date("Y-m-d", strtotime($_POST['bdesde']));
$hasta = date("Y-m-d", strtotime($_POST['bhasta']));
$conexion =@mysqli_connect('localhost','root', '','si-ortizindustrial') or die ("Problema en la conexion");
$sql = "SELECT COUNT(*) FROM `tbl_bitacora_sistema`
 WHERE  `Fec_bitacora`  BETWEEN '$desde' AND '$hasta'";

$result = mysqli_query($conexion, $sql);
while($fila = mysqli_fetch_assoc($result)){
  $_SESSION['bcontador2'] = $fila["COUNT(*)"];} 

  echo "<script>
  window.open('/ProyectoFinal/vistas/modulos/ReportesBitacoraex.php','_blank');
  window.open(this.href,'_self');
  
  </script>";
  
} 
*/?> 


<?php /*
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
      
                    window.location = "rbitacora";
                  }
                  });
                  </script>';

  } 


  if(isset($_POST["tipo"]) && !Empty($_POST["tipo"]) && $_POST["tipo"] == "Venta")
*/?>




</div>
</div>


<div class="box box-success">

<div class="box-header with-border">
</form>



        </center>
        
           <!--  Este codigo muestra el  datagrip  que contiene todos los datos que se le mostraran al Gerente -->
           <div class="box-body">
            <div class="table-responsive">
              <table id="ventas" class="table table-bordered table-striped tablas">
                <br><center>
                  
            
               <thead>
                <tr>
                   <th style="visibility:hidden;"></th>
                <th>Id_bitacora</th>
			        	<th width="20%" class="center">Fecha</th>
				        <th>Codigo_usuario</th>
				        <th>Id_objeto</th>
				        <th>Accion</th>
                <th>Descripción</th>
               
                
                 
                </tr>
              </thead>
              <tbody>
              <?php   
            include_once "modelos/conexion2.php";
            ?>
                <!-- es la conexion de la base para que muestre los datos en el datagrip-->
                <?php /*

 //Este hace la union de dos tablas pero solo e spara reflejar el nombre del usuario que realiza la modificaion
                   $desde1= $_SESSION['bdesde'];
$hasta1= $_SESSION['bhasta'];
 //Este hace la union de dos tablas pero solo e spara reflejar el nombre del usuario que realiza la modificaion
                    $queryi = "SELECT * FROM `tbl_bitacora_sistema`
            WHERE  `Fec_bitacora` BETWEEN '$desde1' AND '$hasta1'";
                           //llamando los datos de la base y almacenadolos en variables 
                    $resulta = $conn->query($queryi);
                    if ($resulta->num_rows > 0) {
                        // output data of each row
                        while($row = $resulta->fetch_assoc()) {
                          $var9 = $row['Cod_bitacora'];
                          $var1 = $row['Cod_usuario'];
                          $var2 = $row['Tabla'];
                          $var3 = $row['Cod_registro'];
                          $var4 = $row['Campo'];
                          $var5 = $row['Actividad'];
                          $var6 = $row['Val_actual'];
                          $var7 = $row['Val_anterior'];
                          $var8 = $row['Fec_bitacora'];
                           

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
				 <td class="text-center"><?php echo $var7 ?></td>
                 <td class="text-center"><?php echo $var8 ?></td>
                         </form>
                    </div>
                    <?php
                      }
  }
                        
              */      ?>
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


       


<!-- ordenar tabla de modo descendente -->

