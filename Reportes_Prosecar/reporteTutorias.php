<?php
session_start();
$tutoria= $_SESSION['clase'];


?>

<?php
require('../Vistas/modulos/REPORTES/fpdf/fpdf.php');
include('../Vistas/modulos/REPORTES/conexion/Conexion.php'); 
class PDF extends FPDF {

// Cabecera de página

	function Header() {
        date_default_timezone_set("America/Guatemala");
		$this->Image('../Vistas/modulos/REPORTES/img/LOGO.jpg',242,10,25);
		$this->SetY(20);
		$this->SetX(86);
		$this->SetFont('Arial','B',14);
		$this->Cell(175, 5, ' PROYECTO SEMILLERO CARMELITANO PROSECAR',0,1);
		$this->SetFont('Arial','',14);
		$this->SetX(120);
		$this->Cell(180, 8, utf8_decode('Listado de Alumnos por Tutoría'));
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
		$this->SetFont('helvetica', 'B', 10);
		$this->SetY(-18);
		$this->SetX(28);
		$this->Cell(100,5,utf8_decode('Página ').$this->PageNo().'/{nb}',0,0,'L');
		
		$this->SetX(6);
		$this->Line(6,200,290,200);
		
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
			$this->Cell(50, 8, 'N', 1, 0, 'C', 0);
			$this->Cell(60, 8, 'Asignatura', 1, 0, 'C', 0);
			$this->Cell(80, 8, 'Seccion', 1, 0, 'C', 0);
			$this->Cell(35, 8, 'Hora', 1, 1, 'C', 0);
			$this->Cell(35, 8, 'Modalidad', 1, 1, 'C', 0);
			$this->SetFont('Arial', '', 12);
			$this->Cell(35, 8, 'Nombre del tutor', 1, 1, 'C', 0);
			$this->Cell(35, 8, 'Estudiante', 1, 0, 'C', 0);
			$this->Cell(35, 8, 'Grado Actual', 1, 1, 'C', 0);
			
		
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
	$strquery ="SELECT ma.CODIGO_MATRICULA, concat_ws (' ',p.PRIMER_NOMBRE,p.SEGUNDO_NOMBRE,p.PRIMER_APELLIDO,p.SEGUNDO_APELLIDO) as ESTUDIANTE,
    (select concat_ws (' ', tp2.PRIMER_NOMBRE, tp2.SEGUNDO_NOMBRE,tp2.PRIMER_APELLIDO,tp2.SEGUNDO_APELLIDO) from tbl_persona tp2
     where ca.CODIGO_PERSONA = tp2.CODIGO_PERSONA) as NOMBRE_TUTOR, tu.NOMBRE as ASIGNATURA,
     mo.TIPO as MODALIDAD,  se.NOMBRE as SECCION, ca.HORA
    FROM tbl_matricula_academica ma, tbl_carga_academica ca, tbl_seccion se, tbl_tutoria tu, 
    tbl_modalidad mo, tbl_estudiante es, tbl_persona p
   WHERE ma.CODIGO_CARGA = ca.CODIGO_CARGA
   AND se.CODIGO_SECCION = ca.CODIGO_SECCION
   AND tu.CODIGO_TUTORIA = ca.CODIGO_TUTORIA
   AND mo.CODIGO_MODALIDA = ca.CODIGO_MODALIDAD
   AND es.CODIGO_ESTUDIANTE = ma.CODIGO_ESTUDIANTE
   AND p.CODIGO_PERSONA = es.CODIGO_PERSONA
   AND tu.CODIGO_TUTORIA = '$tutoria';";
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
$pdf->SetX(23);
$pdf->SetFillColor(72, 208, 234);
$pdf->SetFont('Helvetica', 'B', 12);
$pdf->Cell(10, 12, 'N', 1, 0, 'C', 1);
$pdf->Cell(40, 12, 'Tutoria', 1, 0, 'C', 1);
$pdf->Cell(30, 12, 'Seccion', 1, 0, 'C', 1);
$pdf->Cell(30, 12, 'Hora', 1, 0, 'C', 1);
$pdf->Cell(35, 12, 'Modalidad', 1, 0, 'C', 1);
$pdf->Cell(50, 12, 'Nombre del Tutor', 1, 0, 'C', 1);
$pdf->Cell(50, 12, 'Estudiante', 1, 1, 'C', 1);


// -------TERMINA----ENCABEZADO------------------

$pdf->SetFillColor(252, 254, 254); //color de fondo rgb
$pdf->SetDrawColor(61, 61, 61); //color de linea  rgb

$pdf->SetFont('Arial', '', 12);

//El ancho de las celdas
$pdf->SetWidths(array(10, 40, 30, 30, 35,50,50)); //???

for ($i = 0; $i < count($data); $i++) {

	$pdf->Row(array($i + 1 ,ucwords(strtolower(utf8_decode($data[$i]['ASIGNATURA']))), $data[$i]['SECCION'], $data[$i]['HORA'], ucwords(strtolower(utf8_decode($data[$i]['MODALIDAD']))), ucwords(strtolower(utf8_decode($data[$i]['NOMBRE_TUTOR']))), ucwords(strtolower(utf8_decode($data[$i]['ESTUDIANTE'])))),23); 

}   

// cell(ancho, largo, contenido,borde?, salto de linea?)

$pdf->Output();
?>