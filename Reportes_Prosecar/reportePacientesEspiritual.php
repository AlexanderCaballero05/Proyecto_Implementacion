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
		$this->SetX(86);
		$this->SetFont('Arial','B',14);
		$this->Cell(175, 9, ' PROYECTO SEMILLERO CARMELITANO PROSECAR',0,1);
		$this->SetFont('Arial','',16);
		$this->SetX(96);
		$this->Cell(180, 8, utf8_decode('Reporte de Pacientes del Área Espiritual'));
		$this->Ln(6);
		$this->SetX(5);
		$this->SetFont('Arial','',12);
		$this->SetX(90);
		$this->Cell(170, 8, utf8_decode('Dirección: Tegucigalpa,M.D.C. Colonia 15 de Septiembre'));
		$this->Ln(5);
		$this->SetX(5);
		$this->SetFont('Arial','',12);
		$this->SetX(122);
		$this->Cell(300, 8, utf8_decode('Teléfono: 2233-1539'));
		$this->Ln(13);
		$this->SetFont('Arial','',10);
		$this->Cell(53, 5, "Fecha: ". date('d/m/Y | g:i:a') ,0,1,'R');
		$this->SetFont('Arial','',12);
		$this->SetX(22);
		$this->SetX(5);
		$this->Ln(5);
	}

// Pie de página

	function Footer() {
	// Posición: a 1,5 cm del final
	$this->SetFont('helvetica', 'B', 10);
	$this->SetY(-18);
	$this->SetX(28);
	$this->Cell(120,5,utf8_decode('Página ').$this->PageNo().'/{nb}',0,0,'L');
	
	$this->SetX(27);
	$this->Line(27,197,270,197);
	
	$this->Cell(0,5,utf8_decode(' Proyecto Prosecar © Todos los derechos reservados '),0,0,'C');
	$this->SetX(10);
	


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
			$a = isset($this->aligns[$i]) ? $this->aligns[$i] : 'C';
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
            $this->SetFont('Helvetica', 'B', 10);
            $this->Cell(15, 11, 'N', 1, 0, 'C', 1); 
            $this->Cell(65, 11, 'Nombre completo del paciente', 1, 0, 'C', 1);
            $this->Cell(30, 11, 'DNI', 1, 0, 'C', 1);
            $this->Cell(35, 11, 'Fecha Nacimiento', 1, 0, 'C', 1);
            $this->Cell(26, 11, 'Estado', 1, 0, 'C', 1);
            $this->Cell(25, 11, 'Sexo', 1, 0, 'C', 1);
            $this->Cell(22, 11, utf8_decode('Teléfono'), 1, 0, 'C', 1);
            $this->Cell(50, 11, 'Correo', 1, 1, 'C', 1);
            $this->SetFont('Arial', '', 10);

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
  $data=new Conexion();
  $conexion=$data->conect(); 
	$strquery ="SELECT p.CODIGO_PERSONA, p.DNI, es.NOMBRE AS ESTADO, CONCAT_WS(' ',p.PRIMER_NOMBRE, p.SEGUNDO_NOMBRE, p.PRIMER_APELLIDO,p.SEGUNDO_APELLIDO) AS PACIENTE ,p.FECHA_NACIMIENTO,  
     ex.CODIGO_EXPEDIENTE, ex.FECHA_CREACION ,t.NUMERO_TELEFONO as telefono,s.SEXO ,c.CORREO_PERSONA
    FROM tbl_expediente_espiritual ex  
    LEFT JOIN tbl_persona p on ex.CODIGO_PERSONA = p.CODIGO_PERSONA
     LEFT JOIN tbl_sexo s on s.CODIGO_SEXO = p.SEXO 
     LEFT JOIN  tbl_correo_electronico c on c.CODIGO_PERSONA = p.CODIGO_PERSONA
     LEFT JOIN tbl_estado es on es.CODIGO_ESTADO = ex.CODIGO_ESTADO
     LEFT JOIN tbl_telefono t on  t.CODIGO_PERSONA = p.CODIGO_PERSONA";
    
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
$pdf->SetX(16);
$pdf->SetFillColor(72, 208, 234);
$pdf->SetFont('Helvetica', 'B', 10);
$pdf->Cell(15, 11, 'N', 1, 0, 'C', 1); 
$pdf->Cell(65, 11, 'Nombre Completo del Paciente', 1, 0, 'C', 1);
$pdf->Cell(30, 11, 'DNI', 1, 0, 'C', 1);
$pdf->Cell(35, 11, 'Fecha Nacimiento', 1, 0, 'C', 1);
$pdf->Cell(26, 11, 'Estado', 1, 0, 'C', 1);
$pdf->Cell(25, 11, 'Sexo', 1, 0, 'C', 1);
$pdf->Cell(22, 11, utf8_decode('Teléfono'), 1, 0, 'C', 1);
$pdf->Cell(50, 11, 'Correo', 1, 1, 'C', 1);


// -------TERMINA----ENCABEZADO------------------

$pdf->SetFillColor(252, 254, 254); //color de fondo rgb
$pdf->SetDrawColor(61, 61, 61); //color de linea  rgb
$pdf->SetFont('Arial', '', 10);

//El ancho de las celdas
$pdf->SetWidths(array(15,65,30,35,26,25,22,50)); //cambiar

for ($i = 0; $i < count($data); $i++) {
	$pdf->Row(array($i + 1, $data[$i]['PACIENTE'],ucwords(strtolower(utf8_decode($data[$i]['DNI']))),ucwords(strtolower(utf8_decode($data[$i]['FECHA_NACIMIENTO']))) 
    ,ucwords(strtolower(utf8_decode($data[$i]['ESTADO'])))  ,ucwords(strtolower(utf8_decode($data[$i]['SEXO']))) ,ucwords(strtolower(utf8_decode($data[$i]['telefono']))) 
 ,ucwords(strtolower(utf8_decode($data[$i]['CORREO_PERSONA']))) ,),16); //EL 28 ES EL MARGEN QUE TIENE DE DERECHA
}

// cell(ancho, largo, contenido,borde?, salto de linea?)

$pdf->Output();
?>