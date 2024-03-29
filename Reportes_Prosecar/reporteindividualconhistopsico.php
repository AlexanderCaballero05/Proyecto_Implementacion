
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
		$this->Cell(175, 5, ' PROYECTO SEMILLERO CARMELITANO PROSECAR',0,1);
		$this->SetFont('Arial','',12);
		$this->SetX(120);
		$this->Cell(180, 8, utf8_decode('Reporte individual de consulta psicologica historicas '));
		$this->SetX(5);
		$this->Ln(5);
		//$this->Cell(40,5,date('d/m/Y') ,00,1,'R');
		$this->SetFont('Arial','',10);
		$this->Cell(60, 5, "Fecha: ". date('d/m/Y | g:i:a') ,00,1,'R');
		
		$this->Ln(10);
	}

// Pie de página

	function Footer() {
		$this->SetFont('helvetica', 'B', 9);
		$this->SetY(-18);
		$this->SetX(28);
		$this->Cell(120,5,utf8_decode('Página ').$this->PageNo().'/{nb}',0,0,'L');
		// $this->Cell(120,5,date('d/m/Y | g:i:a') ,00,1,'R',);
		$this->SetX(27);
		$this->Line(27,197,270,197);
		
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
			$this->SetFont('Helvetica', 'B', 15);
			$this->SetFont('Helvetica', 'B', 15);
			$this->Cell(10, 8, 'N', 1, 0, 'C', 0);
			$this->Cell(50, 8, 'Paciente', 1, 0, 'C', 0);
			$this->Cell(50, 8, utf8_decode('Síntomas'), 1, 0, 'C', 0);
			$this->Cell(50, 8,utf8_decode ('Diagnóstico de Ingreso'), 1, 0, 'C', 0);
			$this->Cell(50, 8, utf8_decode('Diagnóstico de egreso'), 1, 0, 'C', 0);
			$this->Cell(50, 8, 'Observaciones', 1, 1, 'C', 0);
			
		
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
  if (isset($_POST['imprimir'])) {
	$carga=($_POST['imprimir']);
	
	 } 
	$strquery ="SELECT epc.CODIGO_EXPEDIENTE_PSICO, 
    CONCAT_WS(' ',tp.PRIMER_NOMBRE, tp.SEGUNDO_NOMBRE, tp.PRIMER_APELLIDO,tp.SEGUNDO_APELLIDO) AS PACIENTE, 
    epc.SINTOMAS, 
    epc.DIAGNOSTICO_INGRESO,
     epc.DIAGNOSTICO_EGRESO, 
    epc.OBSEVARCIONES FROM tbl_expediente_psicologico_consulta epc, 
    tbl_inscripcion_cita ic, tbl_persona tp
    where epc.CODIGO_CITA = ic.CODIGO_CITA and 
   ic.CODIGO_PERSONA = tp.CODIGO_PERSONA and epc.CODIGO_EXPEDIENTE_PSICO = '$carga'";
	
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
$pdf->AddPage('L'); //añade l apagina / en blanco
$pdf->SetMargins(10, 10, 10); //MARGENES
$pdf->SetAutoPageBreak(true, 20); //salto de pagina automatico

// -----------ENCABEZADO------------------
$pdf->SetX(15);
$pdf->SetFillColor(72, 208, 234);
$pdf->SetFont('Helvetica', 'B', 12);
$pdf->Cell(10, 12, 'N', 1, 0, 'C', 1);
$pdf->Cell(50, 12, 'Paciente', 1, 0, 'C', 1);
$pdf->Cell(50, 12, utf8_decode('Síntomas'), 1, 0, 'C', 1);
$pdf->Cell(50, 12, utf8_decode('Diagnóstico de Ingreso'), 1, 0, 'C', 1);
$pdf->Cell(50, 12, utf8_decode('Diagnóstico de egreso'), 1, 0, 'C', 1);
$pdf->Cell(50, 12, 'Observaciones', 1, 1, 'C', 1);

// -------TERMINA----ENCABEZADO------------------

$pdf->SetFillColor(252, 254, 254); //color de fondo rgb
$pdf->SetDrawColor(61, 61, 61); //color de linea  rgb

$pdf->SetFont('Arial', '', 12);

//El ancho de las celdas
$pdf->SetWidths(array(10, 50, 50, 50,50,50)); //???

for ($i = 0; $i < count($data); $i++) {

	$pdf->Row(array($i + 1, ucwords(strtolower(utf8_decode($data[$i]['PACIENTE']))), ucwords(strtolower(utf8_decode($data[$i]['SINTOMAS']))),ucwords(strtolower(utf8_decode($data[$i]['DIAGNOSTICO_INGRESO']))), 
	ucwords(strtolower(utf8_decode($data[$i]['DIAGNOSTICO_EGRESO']))),ucwords(strtolower(utf8_decode($data[$i]['OBSEVARCIONES']))),   ),15); //EL 28 ES EL MARGEN QUE TIENE DE DERECHA
}

// cell(ancho, largo, contenido,borde?, salto de linea?)

$pdf->Output();
?>