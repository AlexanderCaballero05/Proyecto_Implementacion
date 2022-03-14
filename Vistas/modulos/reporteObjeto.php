<?php

require('REPORTES/fpdf/fpdf.php');
include('REPORTES/conexion/Conexion.php'); 
class PDF extends FPDF {
	function _beginpage($orientation, $size,$rotation) {
		$this->page++;
	   
	   // Resuelve el problema de sobrescribir una página si ya existe.
		if(!isset($this->pages[$this->page])) 
		 $this->pages[$this->page] = '';
		$this->state  =2;
		$this->x = $this->lMargin;
		$this->y = $this->tMargin;
		$this->FontFamily = '';
	   
		// Compruebe el tamaño y la orientación.
		if($orientation=='')
		 $orientation = $this->DefOrientation;
		else
		 $orientation = strtoupper($orientation[0]);
		if($size=='')
		 $size = $this->DefPageSize;
		else
		 $size = $this->_getpagesize($size);
		if($orientation!=$this->CurOrientation || $size[0]!=$this->CurPageSize[0] || $size[1]!=$this->CurPageSize[1])
		{
	   
		 // Nuevo tamaño o la orientación
		 if($orientation=='P')
		 {
		  $this->w = $size[0];
		  $this->h = $size[1];
		 }
		 else
		 {
		  $this->w = $size[1];
		  $this->h = $size[0];
		 }
		 $this->wPt = $this->w*$this->k;
		 $this->hPt = $this->h*$this->k;
		 $this->PageBreakTrigger = $this->h-$this->bMargin;
		 $this->CurOrientation = $orientation;
		 $this->CurPageSize = $size;
		}
		if($orientation!=$this->DefOrientation || $size[0]!=$this->DefPageSize[0] || $size[1]!=$this->DefPageSize[1])
		 $this->PageSizes[$this->page] = array($this->wPt, $this->hPt);
	   }

// Cabecera de página

	function Header() {
		//$this->Image('img/triangulosrecortados.png',0,0,50);
		$this->Image('REPORTES/img/LOGO.jpg',170,10,25);
		$this->SetY(20);
		$this->SetX(45);
		$this->SetFont('Arial','B',12);
		$this->Cell(10, 5, ' PROYECTO SEMILLERO CARMELITANO PROSECAR',0,1);
		$this->SetFont('Arial','',10);
		$this->SetX(73);
		$this->Cell(45, 8, utf8_decode('Reporte de carga académica'));
		$this->SetX(5);
		$this->Ln(5);
		//$this->Cell(40,5,date('d/m/Y') ,00,1,'R');
		$this->Cell(30, 5, "Fecha: ". date('d-m-Y'), 0, 1, "C");
		
		$this->Ln(10);
	}

// Pie de página

	function Footer() {
	// Posición: a 1,5 cm del final
	$this->SetFont('helvetica', 'B', 9);
	$this->SetY(-15);
	$this->Cell(40,0,date('d/m/Y | g:i:a') ,00,1,'R');
  
	//$this->Line(10,287,200,287);
	$this->Cell(170,0,utf8_decode('Prosecar © Todos los derechos reservados.'),0,0,'C');
	$this->Cell(0,0,utf8_decode('Página ').$this->PageNo().'/{nb}',0,0,'L');
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

	function Row($data, $setX) 
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
    
            
            $this->SetFont('Helvetica', 'B', 12);
            $this->Cell(17, 8, 'Codigo ', 1, 0, 'C', 1);
            $this->Cell(33, 8, 'Objeto', 1, 0, 'C', 1);
            $this->Cell(50, 8, 'Descripcion', 1, 0, 'C', 1);
            $this->Cell(40, 8, 'Creado por', 1, 0, 'C', 1);
            $this->Cell(33, 8, 'Fecha creacion', 1, 1, 'C', 1);
            $this->SetFont('Arial', '', 12);
            
		
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
	$strquery ="SELECT * FROM tbl_objetos";
	$result = $conexion->prepare($strquery);
	$result->execute();
	$data = $result->fetchall(PDO::FETCH_ASSOC);

/* IMPORTANTE: si estan usando MVC o algún CORE de php les recomiendo hacer uso del metodo
que se llama *select_all* ya que es el que haria uso del *fetchall* tal y como ven en la linea 161
ya que es el que devuelve un array de todos los registros de la base de datos
si hacen uso de el metodo *select* hara uso de fetch y este solo selecciona una linea*/

//--------------TERMINA BASE DE DATOS-----------------------------------------------

// Creación del objeto de la clase heredada
$pdf = new PDF(); //hacemos una instancia de la clase
$pdf->AliasNbPages();
$pdf->AddPage(); //añade l apagina / en blanco
$pdf->SetMargins(10, 10, 10); //MARGENES
$pdf->SetAutoPageBreak(true, 20); //salto de pagina automatico

// -----------ENCABEZADO------------------
$pdf->SetX(15);
$pdf->SetFillColor(33, 186, 212);
$pdf->SetFont('Helvetica', 'B', 12);
$pdf->Cell(17, 8, 'Codigo ', 1, 0, 'C', 1);
$pdf->Cell(33, 8, 'Objeto', 1, 0, 'C', 1);
$pdf->Cell(50, 8, 'Descripcion', 1, 0, 'C', 1);
$pdf->Cell(40, 8, 'Creado por', 1, 0, 'C', 1);
$pdf->Cell(33, 8, 'Fecha creacion', 1, 1, 'C', 1);
// -------TERMINA----ENCABEZADO------------------

$pdf->SetFillColor(252, 254, 254); //color de fondo rgb
$pdf->SetDrawColor(61, 61, 61); //color de linea  rgb

$pdf->SetFont('Arial', '', 12);

//El ancho de las celdas
$pdf->SetWidths(array(17, 33, 50, 40,33)); //???

for ($i = 0; $i < count($data); $i++) {

	$pdf->Row(array($data[$i]['CODIGO_OBJETO'], ucwords(strtolower(utf8_decode($data[$i]['NOMBRE']))),ucwords(strtolower(utf8_decode($data[$i]['DESCRIPCION']))), ucwords(strtolower(utf8_decode($data[$i]['CREADO_POR_USUARIO']))), utf8_decode($data[$i]['FECHA_CREACION'])   ),15 );
}

// cell(ancho, largo, contenido,borde?, salto de linea?)

$pdf->Output();
?>