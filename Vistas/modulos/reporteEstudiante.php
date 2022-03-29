<?php

require('REPORTES/fpdf/fpdf.php');
include('REPORTES/conexion/Conexion.php'); 
class PDF extends FPDF {

// Cabecera de página

	function Header() {
		//$this->Image('img/triangulosrecortados.png',0,0,50);
		$this->Image('REPORTES/img/LOGO.jpg',242,10,25);
		$this->SetY(20);
		$this->SetX(70);
		$this->SetFont('Arial','B',16);
		$this->Cell(14, 5, ' PROYECTO SEMILLERO CARMELITANO PROSECAR',0,1);
		$this->SetFont('Arial','',12);
		$this->SetX(120);
		$this->Cell(170, 14, utf8_decode('Reporte por estudiante '));
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
	 $parametro = 4;
	 $persona = 42;
	 $sentencia = $db->prepare("SELECT CONCAT(PRIMER_NOMBRE, ' ',SEGUNDO_NOMBRE,' ',PRIMER_APELLIDO) AS NOMBRE FROM tbl_persona
	 where CODIGO_TIPO_PERSONA = (?) and CODIGO_PERSONA = (?);" );
	 $sentencia->execute(array($parametro,$persona));
	 $row=$sentencia->fetchColumn();
	 if($row>0){
	   $valor = $row;
	 }

	 $sentencia = $db->prepare("SELECT FECHA_NACIMIENTO FROM tbl_persona
	 where CODIGO_TIPO_PERSONA = (?) and CODIGO_PERSONA = (?)");
	 $sentencia->execute(array($parametro,$persona));
	 $fila=$sentencia->fetchColumn();
	 if($fila>0){
	   $fecha = $fila;
	 }
	 $sentencia = $db->prepare("SELECT LUGAR_NACIMIENTO  FROM tbl_persona 
	 where  CODIGO_TIPO_PERSONA = (?) AND CODIGO_PERSONA = (?) ");
	 $sentencia->execute(array($parametro,$persona));
	 $fila1=$sentencia->fetchColumn();
	 if($fila1>0){
	   $lugar = $fila1;
	 }
	 $sentencia = $db->prepare("SELECT correo_persona  FROM tbl_correo_electronico
	  where CODIGO_PERSONA = (?) ");
	 $sentencia->execute(array($persona));
	 $fila2=$sentencia->fetchColumn();
	 if($fila2>0){
	   $correo = $fila2;
	 }
	 $sentencia = $db->prepare("SELECT GRADO_ACTUAL  FROM tbl_estudiante
	 where CODIGO_PERSONA = (?) ");
	$sentencia->execute(array($persona));
	$fila2=$sentencia->fetchColumn();
	if($fila2>0){
	  $grado = $fila2;
	}
	$sentencia = $db->prepare("SELECT INDICE_ACADEMICO  FROM tbl_estudiante
	where CODIGO_PERSONA = (?) ");
   $sentencia->execute(array($persona));
   $fila2=$sentencia->fetchColumn();
   if($fila2>0){
	 $indice = $fila2;
   }

   $sentencia = $db->prepare("SELECT REPITENTE FROM tbl_estudiante
	where CODIGO_PERSONA = (?) ");
   $sentencia->execute(array($persona));
   $fila2=$sentencia->fetchColumn();
   if($fila2>0){
	 $res = $fila2;
   }
	 

//--------------TERMINA BASE DE DATOS-----------------------------------------------

// Creación del objeto de la clase heredada
$pdf = new PDF(); //hacemos una instancia de la clase
$pdf->AliasNbPages();
$pdf->AddPage('L'); //añade l apagina / en blanco
$pdf->SetMargins(10, 10, 10); //MARGENES
$pdf->SetAutoPageBreak(true, 20); //salto de pagina automatico

// -----------ENCABEZADO------------------
$pdf->SetX(28);
$pdf->SetFillColor(72, 208, 234);
$pdf->SetFont('Helvetica', 'B', 10);
$pdf->Cell(45, 10, 'Nombres y Apellidos: ',0,0);
$pdf->SetFont('Arial','',10);
$pdf->Cell(90, 10,$valor ,0 );
$pdf->SetFont('Helvetica', 'B', 10);
$pdf->Cell(33, 10,'Fecha Nacimiento:' ,0 );
$pdf->SetFont('Arial','',10);
$pdf->Cell(30, 10,$fecha ,0,0);
$pdf->SetFont('Helvetica', 'B', 10);
$pdf->Cell(14, 10, 'Edad: ',0,0);
$pdf->Cell(8, 10,'13' ,0,1);


$pdf->SetX(28);
$pdf->Cell(33, 10,'Lugar y direccion:' ,0 );
$pdf->SetFont('Arial','',10);
$pdf->Cell(60, 10,$lugar ,0,0 );
$pdf->SetFont('Helvetica', 'B', 10);
$pdf->Cell(50, 10,'Celular y Correo electronico:' ,0 );
$pdf->SetFont('Arial','',10);
$pdf->Cell(100, 10,$correo ,0,1 );
$pdf->SetFont('Arial','',10);
$pdf->SetX(28);
$pdf->Cell(45, 10,'Datos Estudiantiles estudiante:',0,1,0);
$pdf->Line(29,73,91,73);
$pdf->SetX(28);
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

$pdf->SetX(28);
$pdf->SetFont('Helvetica', 'B', 12);
$pdf->Cell(60, 8, 'Proveedor ingreso ', 0,0, 'C',1);
$pdf->Cell(60, 8, 'Servicios Intenet ', 0,0, 'C',1);
$pdf->Cell(60, 8, 'Servicios basicos ', 0,0, 'C',1);
$pdf->Cell(60, 8, 'Dispositivos electronicos ', 0,1, 'C',1);

$data=new Conexion();
 $conexion=$data->conect(); 
  $strquery ="select ts.nombre_tipo as TIPO,  es.CODIGO_ESTUDIANTE 
  from tbl_tipo_socioeconomico tc ,tbl_contenido_socioeconomico ts ,tbl_estudiante_socioeconomico es
  where ts.CODIGO_CONTENIDO_SOCIOECONOMICO = es.CODIGO_CONTENIDO_SOCIOECONOMICO and ts.CODIGO_TIPOSOCIO = 3 and
   es.CODIGO_ESTUDIANTE = 42 and ts.CODIGO_TIPOSOCIO = tc.CODIGO_TIPOSOCIO ";
  $result = $conexion->prepare($strquery);
  $result->execute();
  $data = $result->fetchall(PDO::FETCH_ASSOC);

  $query ="select ts.nombre_tipo as TIPO,  es.CODIGO_ESTUDIANTE 
  from tbl_tipo_socioeconomico tc ,tbl_contenido_socioeconomico ts ,tbl_estudiante_socioeconomico es
  where ts.CODIGO_CONTENIDO_SOCIOECONOMICO = es.CODIGO_CONTENIDO_SOCIOECONOMICO and ts.CODIGO_TIPOSOCIO = 3 and
   es.CODIGO_ESTUDIANTE = 42 and ts.CODIGO_TIPOSOCIO = tc.CODIGO_TIPOSOCIO ";
  $result1 = $conexion->prepare($query);
  $result1->execute();
  $data1 = $result1->fetchall(PDO::FETCH_ASSOC);

// -------TERMINA----ENCABEZADO------------------

$pdf->SetFillColor(252, 254, 254); //color de fondo rgb
//$pdf->SetDrawColor(61, 61, 61); //color de linea  rgb

$pdf->SetFont('Arial', '', 12);
//El ancho de las celdas
$pdf->SetWidths(array(60,60,60,60)); //???
for ($i = 0; $i < count($data); $i++) {

	$pdf->Row(array(ucwords(strtolower(utf8_decode($data[$i]['m']))),$data['m'],$data['m'],$data['m'] ),28); //EL 28 ES EL MARGEN QUE TIENE DE DERECHA
} 
$pdf->Ln(3);
$pdf->SetX(15);
$pdf->SetFont('Helvetica', 'B', 12);
$pdf->Cell(130, 8, 'Situacion Familiar(personas con las que vive) : ', 0,1, 'C',1);
$pdf->Ln(3);

$pdf->SetFillColor(72, 208, 234);
$pdf->SetX(28);
$pdf->SetFont('Helvetica', 'B', 12);
$pdf->Cell(70, 8, 'Nombre y Apellido ', 0,0, 'C',1);
$pdf->Cell(60, 8, 'Ocupacion ', 0,0, 'C',1);
$pdf->Cell(30, 8, 'Edad ', 0,0, 'C',1);
$pdf->Cell(60, 8, 'Parentesco ', 0,1, 'C',1);
$pdf->SetFont('Arial', '', 12);
//El ancho de las celdas

$pdf->SetFillColor(252, 254, 254); //color de fondo rgb
$pdf->SetWidths(array(70,60,30,60)); //???
for ($i = 0; $i < count($data); $i++) {

	$pdf->Row(array(ucwords(strtolower(utf8_decode($data[$i]['DATO']))),$data['DATO'],$data['DATO'],$data['DATO'] ),28); //EL 28 ES EL MARGEN QUE TIENE DE DERECHA
}


//$pdf->Ln(10);
//$pdf->Cell(200,5 ,'Edad', 0);

// cell(ancho, largo, contenido,borde?, salto de linea?)

$pdf->Output();
?>