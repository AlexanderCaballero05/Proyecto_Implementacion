<?php

$codigoObjeto=1;
$accion='salio al modulo de administrador';
$descripcion= 'Usuario se salio del sistema';
bitacora($codigoObjeto, $accion,$descripcion);

session_destroy();
echo '<script> 
window.location = "login";
</script>'; 
?>