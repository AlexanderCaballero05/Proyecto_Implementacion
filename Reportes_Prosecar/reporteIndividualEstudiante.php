<?php
require('../Vistas/modulos/REPORTES/fpdf/fpdf.php');
include('../Vistas/modulos/REPORTES/conexion/Conexion.php');  
class PDF extends FPDF {

// Cabecera de página

	function Header() {
        date_default_timezone_set("America/Guatemala");
		//$this->Image('img/triangulosrecortados.png',0,0,50);
		$this->Image('../Vistas/modulos/REPORTES/img/LOGO.jpg',242,10,25);
		$this->SetY(20);
		$this->SetX(70);
		$this->SetFont('Arial','B',16);
		$this->Cell(14, 5, ' PROYECTO SEMILLERO CARMELITANO PROSECAR',0,1);
		$this->SetFont('Arial','',14);
		$this->SetX(120);
		$this->Cell(170, 14, utf8_decode('Reporte individual estudiante '));
		$this->SetX(5);
		$this->Ln(5);
		//$this->Cell(40,5,date('d/m/Y') ,00,1,'R');
		$this->SetFont('Arial','',10);
		$this->Cell(65, 5, "Fecha: ". date("d/m/Y"), 0, 1, "C");
		
		$this->Ln(10);
	}

// Pie de página

	function Footer() {
	// Posición: a 1,5 cm del final
	$this->SetFont('helvetica', 'B', 9);
	$this->SetY(-18);
	$this->SetX(28);
	$this->Cell(120,5,utf8_decode('Página ').$this->PageNo().'/{nb}',0,0,'L');
	$this->Cell(120,5,date('d/m/Y | g:i:a') ,00,1,'R',);
	$this->SetX(27);
	$this->Line(27,197,270,197);
	
	$this->Cell(0,5,utf8_decode(' Proyecto Prosecar © Todos los derechos reservados '),0,0,'C');
	$this->SetX(10);
	

	//$this->Cell(40,0,date('d/m/Y | g:i:a') ,00,1,'R');
//	$this->Cell(95,5,utf8_decode('Página ').$this->PageNo().' / {nb}',0,0,'L');
//	$this->Line(10,287,200,287);
//	$this->Cell(0,5,utf8_decode("Kodo Sensei © Todos los derechos reservados."),0,0,"C");
  
	//$this->Line(10,287,200,287);
//





	}

// --------------------METODO PARA ADAPTAR LAS CELDAS------------------------------
	var $widths;
	var $aligns;

	function SetWidths($w) {
		//Set the array of column widths
		$this->widths = $w;
	}

	function SetAligns($a) {
		//Set the array of column alignments
		$this->aligns = $a;
	}

	function Row($data, $setX) //
	{
		//Calculate the height of the row
		$nb = 0;
		for ($i = 0; $i < count($data); $i++) {
			$nb = max($nb, $this->NbLines($this->widths[$i], $data[$i]));
		}

		$h = 8 * $nb;
		//Issue a page break first if needed
		$this->CheckPageBreak($h, $setX);
		//Draw the cells of the row
		for ($i = 0; $i < count($data); $i++) {
			$w = $this->widths[$i];
			$a = isset($this->aligns[$i]) ? $this->aligns[$i] :'C';
			//Save the current position
			$x = $this->GetX();
			$y = $this->GetY();
			//Draw the border
			$this->Rect($x, $y, $w, $h, 'DF');
			//Print the text
			$this->MultiCell($w, 8, $data[$i], 0, $a);
			//Put the position to the right of the cell
			$this->SetXY($x + $w, $y);
		}
		//Go to the next line
		$this->Ln($h);
	}

	function CheckPageBreak($h, $setX) {
		//If the height h would cause an overflow, add a new page immediately
		if ($this->GetY() + $h > $this->PageBreakTrigger) {
			$this->AddPage($this->CurOrientation);
			$this->SetX($setX);
           
			//volvemos a definir el  encabezado cuando se crea una nueva pagina
			/*$this->SetFont('Helvetica', 'B', 15);
			$this->SetFont('Helvetica', 'B', 15);
			$this->Cell(50, 8, 'Sección', 1, 0, 'C', 0);
			$this->Cell(60, 8, 'Modalidad', 1, 0, 'C', 0);
			$this->Cell(80, 8, 'Tutoria', 1, 0, 'C', 0);
			$this->Cell(35, 8, 'Tutor', 1, 1, 'C', 0);
			$this->Cell(35, 8, 'Hora', 1, 1, 'C', 0);
			$this->SetFont('Arial', '', 12); */
			
		
		}

		if ($setX == 100) {
			$this->SetX(100);
		} else {
			$this->SetX($setX);
		}

	}

	function NbLines($w, $txt) {
		//Computes the number of lines a MultiCell of width w will take
		$cw = &$this->CurrentFont['cw'];
		if ($w == 0) {
			$w = $this->w - $this->rMargin - $this->x;
		}

		$wmax = ($w - 2 * $this->cMargin) * 1000 / $this->FontSize;
		$s = str_replace("\r", '', $txt);
		$nb = strlen($s);
		if ($nb > 0 and $s[$nb - 1] == "\n") {
			$nb--;
		}

		$sep = -1;
		$i = 0;
		$j = 0;
		$l = 0;
		$nl = 1;
		while ($i < $nb) {
			$c = $s[$i];
			if ($c == "\n") {
				$i++;
				$sep = -1;
				$j = $i;
				$l = 0;
				$nl++;
				continue;
			}
			if ($c == ' ') {
				$sep = $i;
			}

			$l += $cw[$c];
			if ($l > $wmax) {
				if ($sep == -1) {
					if ($i == $j) {
						$i++;
					}

				} else {
					$i = $sep + 1;
				}

				$sep = -1;
				$j = $i;
				$l = 0;
				$nl++;
			} else {
				$i++;
			}

		}
		return $nl;
	}
// -----------------------------------TERMINA---------------------------------
}

//------------------OBTENES LOS DATOS DE LA BASE DE DATOS-------------------------


     //servidor, usuario de base de datos, contraseña del usuario, nombre de base de datos
	 $servername = "localhost";
	 $username = "root";
	 $password = "";
	 $dbname = "db_proyecto_Prosecar";
	 try {
		 $db= new PDO( "mysql:host=localhost;dbname=db_proyecto_prosecar",
					   "root",
					   "", 
					   array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8"));           
	 } catch (PDOException $e) {
		 echo "ERROR DE CONEXION DE: ".$e->getMessage();
	 }

     if (isset($_POST['ESTUDIANTE'])) {
        $estudiante=($_POST['ESTUDIANTE']);
    }

	 $sentencia = $db->prepare("SELECT CONCAT_WS(' ', p.PRIMER_NOMBRE, p.SEGUNDO_NOMBRE,p.PRIMER_APELLIDO, p.SEGUNDO_APELLIDO) AS NOMBRE 
     FROM tbl_persona p ,tbl_estudiante es
          where es.CODIGO_PERSONA = p.CODIGO_PERSONA AND CODIGO_ESTUDIANTE = (?) " );
	 $sentencia->execute(array($estudiante));
	 $row=$sentencia->fetchColumn();
	 if($row>0){
	   $nombre = $row;
	 }
      
   
	 $sentencia = $db->prepare("SELECT p.FECHA_NACIMIENTO 
     FROM tbl_persona p ,tbl_estudiante es
     where p.CODIGO_PERSONA = es.CODIGO_PERSONA AND CODIGO_ESTUDIANTE = (?) ");
	 $sentencia->execute(array($estudiante));
	 $fila=$sentencia->fetchColumn();
	 if($fila>0){
	   $fecha = $fila;
	 }
    
	 $sentencia = $db->prepare("SELECT p.LUGAR_NACIMIENTO  FROM tbl_persona p ,tbl_estudiante es
	 where  es.CODIGO_PERSONA  =  p.CODIGO_PERSONA AND  es.CODIGO_ESTUDIANTE =(?)");
	 $sentencia->execute(array($estudiante));
	 $fila1=$sentencia->fetchColumn();
	 if($fila1>0){
	   $lugar = $fila1;
	 }

    
	 $sentencia = $db->prepare("SELECT c.correo_persona  
     FROM tbl_correo_electronico c ,tbl_persona p ,tbl_estudiante es
           where c.CODIGO_PERSONA = p.CODIGO_PERSONA and  es.CODIGO_PERSONA = p.CODIGO_PERSONA  and es.CODIGO_ESTUDIANTE = (?) ");
	 $sentencia->execute(array($estudiante));
	 $fila2=$sentencia->fetchColumn();
	 if($fila2>0){
	   $correo = $fila2;
	 }

	 $sentencia = $db->prepare("SELECT t.NUMERO_TELEFONO 
     FROM tbl_telefono t,tbl_persona p ,tbl_estudiante es
           where t.CODIGO_PERSONA = p.CODIGO_PERSONA and  es.CODIGO_PERSONA = p.CODIGO_PERSONA  and es.CODIGO_ESTUDIANTE = (?) ");
	 $sentencia->execute(array($estudiante));
	 $fila2=$sentencia->fetchColumn();
	 if($fila8>0){
	   $telefono = $fila8;
	 }

   
	 $sentencia = $db->prepare("SELECT GRADO_ACTUAL  FROM tbl_estudiante
	 where CODIGO_ESTUDIANTE = (?) ");
	$sentencia->execute(array($estudiante));
	$fila2=$sentencia->fetchColumn();
	if($fila2>0){
	  $grado = $fila2;
	}

    
	$sentencia = $db->prepare("SELECT INDICE_ACADEMICO  FROM tbl_estudiante
	where CODIGO_ESTUDIANTE= (?) ");
   $sentencia->execute(array($estudiante));
   $fila2=$sentencia->fetchColumn();
   if($fila2>0){
	 $indice = $fila2;
   }
    

   $sentencia = $db->prepare("SELECT REPITENTE FROM tbl_estudiante
	where CODIGO_ESTUDIANTE = (?) ");
   $sentencia->execute(array($estudiante));
   $fila2=$sentencia->fetchColumn();
   if($fila2>0){
	 $res = $fila2;
   }

   $sentencia = $db->prepare("SELECT p.DNI FROM tbl_estudiante es , tbl_persona p
	where   p.CODIGO_PERSONA = es.CODIGO_PERSONA AND  CODIGO_ESTUDIANTE = (?) ");
   $sentencia->execute(array($estudiante));
   $fila2=$sentencia->fetchColumn();
   if($fila2>0){
	 $DNI = $fila2;
   }

   $sentencia = $db->prepare("SELECT GROUP_CONCAT(c.NOMBRE_TIPO) as nombre_tipo_contenido FROM tbl_tipo_socioeconomico t, tbl_contenido_socioeconomico c, tbl_estudiante_socioeconomico es, tbl_estudiante e , tbl_persona p WHERE es.CODIGO_ESTUDIANTE = e.CODIGO_ESTUDIANTE AND es.CODIGO_CONTENIDO_SOCIOECONOMICO = c.CODIGO_CONTENIDO_SOCIOECONOMICO AND t.CODIGO_TIPOSOCIO = c.CODIGO_TIPOSOCIO AND e.CODIGO_PERSONA = p.CODIGO_PERSONA and t.CODIGO_TIPOSOCIO = 1
    and e.CODIGO_ESTUDIANTE = (?); ");
   $sentencia->execute(array($estudiante));
   $fila2=$sentencia->fetchColumn();
   if($fila2>0){
	 $provedor = $fila2;
   }

   $data=new Conexion();
  $conexion=$data->conect();
   $strquery ="SELECT  e.PASATIEMPOS, e.DISTRACTORES_ESCOLARES, e.METAS
   FROM tbl_tipo_socioeconomico t, tbl_contenido_socioeconomico c, tbl_estudiante_socioeconomico es, tbl_estudiante e
                           WHERE es.CODIGO_ESTUDIANTE = e.CODIGO_ESTUDIANTE
                           AND es.CODIGO_CONTENIDO_SOCIOECONOMICO = c.CODIGO_CONTENIDO_SOCIOECONOMICO
                           AND t.CODIGO_TIPOSOCIO = c.CODIGO_TIPOSOCIO and e.CODIGO_ESTUDIANTE = '$estudiante'
                           GROUP BY E.CODIGO_ESTUDIANTE
                           order by e.CODIGO_ESTUDIANTE;";
	
	$result = $conexion->prepare($strquery);
	$result->execute();
	$data = $result->fetchall(PDO::FETCH_ASSOC);
 

//--------------TERMINA BASE DE DATOS-----------------------------------------------

// Creación del objeto de la clase heredada
$pdf = new PDF(); //hacemos una instancia de la clase
$pdf->AliasNbPages();
$pdf->AddPage('L'); //añade l apagina / en blanco
$pdf->SetMargins(10, 10, 10); //MARGENES
$pdf->SetAutoPageBreak(true, 20); //salto de pagina automatico

// -----------ENCABEZADO------------------
$pdf->SetX(20);
$pdf->SetFillColor(72, 208, 234);
$pdf->SetFont('Helvetica', 'B', 10);
$pdf->Cell(38, 10, 'Nombres y Apellidos: ',0,0);
$pdf->SetFont('Arial','',10);
$pdf->Cell(90,10,utf8_decode($nombre)  ,0 );
$pdf->SetFont('Helvetica', 'B', 10);
$pdf->Cell(33, 10,'Fecha Nacimiento:' ,0 );
$pdf->SetFont('Arial','',10);
$pdf->Cell(22, 10,$fecha ,0,0);
$pdf->SetFont('Helvetica', 'B', 10);
$pdf->Cell(9, 10, 'DNI: ',0,0);
$pdf->SetFont('Arial','',10);
$pdf->Cell(30, 10,$DNI ,0,0);
$pdf->SetFont('Helvetica', 'B', 10);
$pdf->Cell(12, 10, 'Edad: ',0,0);
$pdf->SetFont('Arial','',10);
$pdf->Cell(4, 10,'18' ,0,1);


$pdf->SetX(20);
$pdf->SetFont('Helvetica', 'B', 10);
$pdf->Cell(33, 10,'Lugar y direccion:' ,0 );
$pdf->SetFont('Arial','',10);
$pdf->Cell(60, 10,$lugar ,0,0 );
$pdf->SetFont('Helvetica', 'B', 10);
$pdf->Cell(8, 10,'Celular:' ,0 );
$pdf->Cell(20, 10,$telefono ,0,0 );

$pdf->SetFont('Helvetica', 'B', 10);
$pdf->Cell(50, 10,'Correo electronico:' ,0 );
$pdf->SetFont('Arial','',10);
$pdf->Cell(100, 10,$correo ,0,1 );
$pdf->SetFont('Arial','',10);

$pdf->SetX(20);
$pdf->Cell(45, 10,'Datos Estudiantiles estudiante:',0,1,0);
$pdf->Line(20,73,91,73);
$pdf->SetX(20);
$pdf->SetFont('Helvetica', 'B', 10);
$pdf->Cell(30, 10,'Grado Escolar:',0);
$pdf->SetFont('Arial','',10);
$pdf->Cell(10, 10,$grado,0,0 );
$pdf->SetFont('Helvetica', 'B', 10);
$pdf->Cell(35, 10,'Indice Academico:',0);
$pdf->SetFont('Arial','',10);
$pdf->Cell(10, 10,$indice,0,0 );
$pdf->SetFont('Helvetica', 'B', 10);
$pdf->Cell(20, 10,'Repitente:',0);
$pdf->SetFont('Arial','',10);
$pdf->Cell(5, 10,$res,0,1 );

$pdf->Ln(8);
$pdf->SetX(50);
$pdf->SetFont('Helvetica', 'B', 10);
$pdf->Cell(60, 10,'Pasatiempos',1,0, 'C',1);
$pdf->Cell(60, 10,'Distractores Escolares',1,0, 'C',1);
$pdf->Cell(60, 10,'Metas',1,1, 'C',1);



$pdf->SetFillColor(252, 254, 254); //color de fondo rgb
$pdf->SetDrawColor(61, 61, 61); //color de linea  rgb
$pdf->SetFont('Arial', '', 10);

$pdf->SetWidths(array(60,60,60)); 

for ($i = 0; $i < count($data); $i++) {
	$pdf->Row(array(ucwords(strtolower(utf8_decode($data[$i]['PASATIEMPOS']))) ,ucwords(strtolower(utf8_decode($data[$i]['DISTRACTORES_ESCOLARES']))) ,ucwords(strtolower(utf8_decode($data[$i]['METAS'])))  ),50); //EL 28 ES EL MARGEN QUE TIENE DE DERECHA
}












// -------TERMINA----ENCABEZADO------------------

$pdf->SetFillColor(252, 254, 254); //color de fondo rgb
//$pdf->SetDrawColor(61, 61, 61); //color de linea  rgb

$pdf->SetFont('Arial', '', 12);






//$pdf->Ln(10);
//$pdf->Cell(200,5 ,'Edad', 0);

// cell(ancho, largo, contenido,borde?, salto de linea?)

$pdf->Output();
?>