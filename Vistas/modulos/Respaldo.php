
?><div class="content-wrapper">

<section class="content-header">
  <h1>
	Respaldo y Restauración de Base de Datos

  </h1>

  <ol class="breadcrumb">

  <li><a href="inicio"><i class="fa fa-dashboard"></i> Inicio</a></li>
	
	<li class="active">Respaldo y Restauración de Base de Datos</li>

  </ol>

</section>


<section class="content">

  <div class="box">

	<div class="box-header with-border">

	<div class="box-body">

	<div class="box-header bg-black text-center">
    	<h2 class="box-title">Respaldo</h1>
    </div> 
	<br>

	<p>Las copias de seguridad proveen una importante 
	solución para proteger datos críticos que están almacenados
	en bases de datos. Y para minimizar el riego de pérdida de datos,
	usted necesita asegurarse de que respalda sus bases de datos regularmente
	tomando en consideración los cambios aplicados a sus datos.</p>
	<br>
	  <!-- <a href="./vistas/modulos/Backup.php">Realizar copia de seguridad</a> -->
	  <form action="./vistas/modulos/Backup.php" method="POST"> 
                    <?php
                            include "conexionpdo.php";
                            $usuario=$_SESSION['vario'];
                            //Evaluo si existe el tipo de Rol
                            $evaluar_usuario = $db->prepare("SELECT CODIGO_TIPO_ROL 
                                                            FROM tbl_usuario 
                                                            WHERE NOMBRE_USUARIO = (?);");
                            $evaluar_usuario->execute(array($usuario));
                            $row=$evaluar_usuario->fetchColumn();
                            if($row > 0){
                                $usuariomo = $row;//capturo el nombre del ROl en la variable para usarla en el Procedimiento almacenado

                                //llamar al procedimiento almacenado
                                $evaluar_permiso = $db->prepare("CALL Sp_permiso_insertar(?,?);");
                                $evaluar_permiso->execute(array($usuariomo, '10'));
                                $row1=$evaluar_permiso->fetchColumn();
                                $permiso_registrar =$row1;             
                            }
                            ?> <!-- fin del codigo para sustraer el permiso de insertar.-->

                    <?php 
                    if ($permiso_registrar == 'SI') // Aqui valida que si permiso esta en ON se mostrara el botton de agregar
                    {
                    ?>      

	            <button type="submit"  name="backup" class="btn btn-primary"><span class="glyphicon glyphicon-eject"></span>  Realizar Copia de Seguridad</button>
   
                <?php
                }
            
                ?> 
    </form> 
    <br> 
	<div class="box-header bg-black text-center">

    	<h2 class="box-title">Restauración</h1>
    </div>
	<br>
	<form action="./vistas/modulos/Restore.php" method="POST">

		<p>Cuando se está recuperando de una falla de base de datos,
		un administrador necesita restaurar un conjunto 
		de copias de seguridad en una secuencia correcta y significativa.
		Con esto en mente, el objetivo es tener un punto de recuperación ante
		desastres, creando un plan de copias de seguridad, así como un plan 
		apropiado de restauración de bases de datos.</p>
	<br>
	

	<label>Selecciona un Punto de Restauración:</label>
	
	<br>
	
		<select name="restorePoint" required>
			<option value="">Selecciona un Punto de Restauración</option>
			<?php
				include_once 'Connet.php';
				$ruta="C:/xampp/htdocs/Proyecto_Implementacion17/vistas/modulos/Backup/" ;
				if(is_dir($ruta)){
				    if($aux=opendir($ruta)){
				        while(($archivo = readdir($aux)) !== false){
				            if($archivo!="."&&$archivo!=".."){
				                $nombrearchivo=str_replace(".sql", "", $archivo);
				                $nombrearchivo=str_replace("-", ":", $nombrearchivo);
				                $ruta_completa=$ruta.$archivo;
				                if(is_dir($ruta_completa)){
				                }else{
				                    echo '<option value="'.$ruta_completa.'">'.$nombrearchivo.'</option>';
				                }
				            }
				        }
				        closedir($aux);
				    }
				}else{
				    echo $ruta." No es ruta válida";
				}
			?>
		</select>
		<br>
		<br>
                    <?php
                            include "conexionpdo.php";
                            $usuario=$_SESSION['vario'];
                            //Evaluo si existe el tipo de Rol
                            $evaluar_usuario = $db->prepare("SELECT CODIGO_TIPO_ROL 
                                                            FROM tbl_usuario 
                                                            WHERE NOMBRE_USUARIO = (?);");
                            $evaluar_usuario->execute(array($usuario));
                            $row=$evaluar_usuario->fetchColumn();
                            if($row > 0){
                                $usuariomo = $row;//capturo el nombre del ROl en la variable para usarla en el Procedimiento almacenado

                                //llamar al procedimiento almacenado
                                $evaluar_permiso = $db->prepare("CALL Sp_permiso_insertar(?,?);");
                                $evaluar_permiso->execute(array($usuariomo, '10'));
                                $row1=$evaluar_permiso->fetchColumn();
                                $permiso_registrar =$row1;             
                            }
                            ?> <!-- fin del codigo para sustraer el permiso de insertar.-->

                    <?php 
                    if ($permiso_registrar == 'SI') // Aqui valida que si permiso esta en ON se mostrara el botton de agregar
                    {
                    ?>      
    <footer class="footer">
	<button type="submit" class="btn btn-success"><span class="glyphicon glyphicon-repeat"></span>  Restaurar Copia de Seguridad</button>
     </div>
   
                <?php
                }
                ?> 	
	<br>
	</form>
	</div>
</body>
</div>
</div>
</div>
</section>
</div>
