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
		$this->SetX(100);
		$this->Cell(180, 8, utf8_decode('Reporte Datos Escolares Estudiantes'));
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
		$this->Cell(55, 5, "Fecha: ". date('d/m/Y | g:i:a') ,0,1,'R');
		$this->SetFont('Arial','',12);
		$this->SetX(22);
		$this->SetX(5);
		$this->Ln(5);
	}

// Pie de página

	function Footer() {
	// Posición: a 1,5 cm del final
	$this->SetFont('helvetica', 'B', 9);
	$this->SetY(-18);
	$this->SetX(28);
	$this->Cell(120,5,utf8_decode('Página ').$this->PageNo().'/{nb}',0,0,'L');
	
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
			$this->SetFont('Helvetica', 'B', 12);
			$this->Cell(10, 8, 'N', 1, 0, 'C', 0);
			$this->Cell(30, 8, 'Nombre', 1, 0, 'C', 0);
			$this->Cell(15, 8, 'Grado', 1, 0, 'C', 0);
			$this->Cell(15, 8, 'Repite', 1, 0, 'C', 0);
			$this->Cell(15, 8, 'Indice', 1, 0, 'C', 0);
			$this->Cell(30, 8, 'Materias', 1, 0, 'C', 0);
			$this->Cell(30, 8, 'Pasatiempos', 1, 0, 'C', 0);
			$this->Cell(30, 8, 'Distractores', 1, 0, 'C', 0);
			$this->Cell(30, 8, 'Metas', 1, 0, 'C', 0);
			$this->Cell(40, 8, 'Contenido socieco', 1, 0, 'C', 0);
			$this->Cell(40, 8, 'Contenido tipo', 1, 1, 'C', 0);
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
	$strquery ="SELECT es.CODIGO_ESTUDIANTE as codigo_estudiante, CONCAT_WS(' ',p.PRIMER_NOMBRE,p.SEGUNDO_NOMBRE,p.PRIMER_APELLIDO) as nombre_estudiante, e.GRADO_ACTUAL, e.REPITENTE, e.INDICE_ACADEMICO, e.MATE_BAJO_RENDI, e.PASATIEMPOS, e.DISTRACTORES_ESCOLARES, e.METAS , GROUP_CONCAT(t.TIPO) as tipo_contenido, GROUP_CONCAT(c.NOMBRE_TIPO) as nombre_tipo_contenido
    FROM tbl_tipo_socioeconomico t, tbl_contenido_socioeconomico c, tbl_estudiante_socioeconomico es, tbl_estudiante e , tbl_persona p
                            WHERE es.CODIGO_ESTUDIANTE = e.CODIGO_ESTUDIANTE
                            AND es.CODIGO_CONTENIDO_SOCIOECONOMICO = c.CODIGO_CONTENIDO_SOCIOECONOMICO
                            AND t.CODIGO_TIPOSOCIO = c.CODIGO_TIPOSOCIO
                            AND e.CODIGO_PERSONA = p.CODIGO_PERSONA
                            GROUP BY E.CODIGO_ESTUDIANTE
                            order by e.CODIGO_ESTUDIANTE;";
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
$pdf->SetX(6);
$pdf->SetFillColor(72, 208, 234);
$pdf->SetFont('Helvetica', 'B', 12);
$pdf->Cell(10, 12, 'N', 1, 0, 'C', 1);
$pdf->Cell(30, 12, 'Nombre', 1, 0, 'C', 1);
$pdf->Cell(15, 12, 'Grado', 1, 0, 'C', 1);
$pdf->Cell(15, 12, 'Repite', 1, 0, 'C', 1);
$pdf->Cell(15, 12, 'Indice', 1, 0, 'C', 1);
$pdf->Cell(30, 12, 'Materias', 1, 0, 'C', 1);
$pdf->Cell(30, 12, 'Pasatiempos', 1, 0, 'C', 1);
$pdf->Cell(30, 12, 'Distractores', 1, 0, 'C', 1);
$pdf->Cell(30, 12, 'Metas', 1, 0, 'C', 1);
$pdf->Cell(40, 12, 'Contenido socieco', 1, 0, 'C', 1);
$pdf->Cell(40, 12, 'Contenido tipo', 1, 1, 'C', 1);





// -------TERMINA----ENCABEZADO------------------

$pdf->SetFillColor(252, 254, 254); //color de fondo rgb
$pdf->SetDrawColor(61, 61, 61); //color de linea  rgb

$pdf->SetFont('Arial', '', 10);

//El ancho de las celdas
$pdf->SetWidths(array(10, 30, 15, 15,15,30,30,30,30,40,40)); //???

for ($i = 0; $i < count($data); $i++) {

	$pdf->Row(array($i + 1, $data[$i]['nombre_estudiante'], $data[$i]['GRADO_ACTUAL'] , ucwords(strtolower(utf8_decode($data[$i]['REPITENTE']))), utf8_decode($data[$i]['INDICE_ACADEMICO']), $data[$i]['MATE_BAJO_RENDI'], $data[$i]['PASATIEMPOS'] , $data[$i]['DISTRACTORES_ESCOLARES'] , $data[$i]['METAS'] , $data[$i]['tipo_contenido'] , $data[$i]['nombre_tipo_contenido']  ),6 ); //EL 28 ES EL MARGEN QUE TIENE DE DERECHA
}

// cell(ancho, largo, contenido,borde?, salto de linea?)

$pdf->Output();
?>