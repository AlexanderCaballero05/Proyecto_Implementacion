<?php

    include('../Vistas/modulos/conexionpdo.php');
    session_start();
    $usuario= $_SESSION['vario'];
    //Consulta que trae el codigo del usuario
    $sentencia1 = $db->prepare("SELECT p.CODIGO_PERSONA
    FROM tbl_usuario u, tbl_persona p 
    WHERE u.CODIGO_PERSONA = p.CODIGO_PERSONA
    AND NOMBRE_USUARIO = (?);");
    $sentencia1->execute(array($usuario));
    $cod_usuario=$sentencia1->fetchColumn();
?>

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
		$this->SetX(120);
		$this->Cell(180, 8, utf8_decode('Reporte Historial de las Tutorias'));
		$this->SetX(5);
		$this->Ln(5);
		$this->SetFont('Arial','',10);
		$this->Cell(60, 5, "Fecha: ". date('d/m/Y | g:i:a') ,00,1,'R');
		
		$this->Ln(10);
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
			$this->SetFont('Helvetica', 'B', 10);
			$this->SetFont('Helvetica', 'B', 10);
			$this->Cell(10, 11, 'N', 1, 0, 'C', 1);
            $this->Cell(40, 11, 'Nombre de la Tutoria', 1, 0, 'C', 1);
			$this->Cell(30, 11, 'Area', 1, 0, 'C', 1);
            $this->Cell(32, 11, 'Hora de Inicio', 1, 0, 'C', 1);
			$this->Cell(32, 11, 'Hora Final', 1, 0, 'C', 1);
			$this->Cell(35, 11, 'Fecha de Inicio', 1, 0, 'C', 1);
			$this->Cell(35, 11, 'Fecha finilización', 1, 0, 'C', 1);
            $this->Cell(25, 11, 'Modalidad', 1, 0, 'C', 1);
            $this->Cell(25, 11, 'Grado', 1, 0, 'C', 1);
			$this->Cell(25, 11, 'Anio', 1, 0, 'C', 1);
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
	$strquery ="SELECT
    tma.FECHA_MATRICULA , 
    tca.HORA as inicial , 
    tca.HORA_FINAL , 
    tca.FECHA_INICIO ,
    tca.FECHA_FINAL , 
    tt.NOMBRE as tutoria,
    ta.NOMBRE  as area, 
    tm.TIPO as modalidad,
    ts.NOMBRE  as seccion,
	tca.ANIO
    from  tbl_matricula_academica tma 
    left join tbl_carga_academica tca                 on tca.CODIGO_CARGA = tma.CODIGO_CARGA 
    left join tbl_estudiante te                       on te.CODIGO_ESTUDIANTE = tma.CODIGO_ESTUDIANTE
    left join tbl_persona tp                          on te.CODIGO_PERSONA   = tp.CODIGO_PERSONA 
    left join tbl_tutoria tt                          on tt.CODIGO_TUTORIA  = tca.CODIGO_TUTORIA 
    left join tbl_area ta                             on ta.CODIGO_AREA  = tt.CODIGO_AREA 
    left join tbl_modalidad tm                        on tm.CODIGO_MODALIDA = tca.CODIGO_MODALIDAD 
    left join tbl_seccion ts                          on ts.CODIGO_SECCION  = tca.CODIGO_SECCION 
    where tp.CODIGO_PERSONA  = '$cod_usuario' ";
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
$pdf->SetX(5);
$pdf->SetFillColor(72, 208, 234);
$pdf->SetFont('Helvetica', 'B', 10);
$pdf->Cell(10, 11, 'N', 1, 0, 'C', 1); 
$pdf->Cell(40, 11, 'Nombre de la Tutoria', 1, 0, 'C', 1);
$pdf->Cell(30, 11, 'Area', 1, 0, 'C', 1);
$pdf->Cell(32, 11, 'Hora de Inicio', 1, 0, 'C', 1);
$pdf->Cell(32, 11, 'Hora Final', 1, 0, 'C', 1);
$pdf->Cell(35, 11, 'Fecha de Inicio', 1, 0, 'C', 1);
$pdf->Cell(35, 11, 'Fecha finilizacion', 1, 0, 'C', 1);
$pdf->Cell(25, 11, 'Modalidad', 1, 0, 'C', 1);
$pdf->Cell(25, 11, 'Grado', 1, 0, 'C', 1);
$pdf->Cell(25, 11, 'Anio', 1, 1, 'C', 1);





// -------TERMINA----ENCABEZADO------------------

$pdf->SetFillColor(252, 254, 254); //color de fondo rgb
$pdf->SetDrawColor(61, 61, 61); //color de linea  rgb

$pdf->SetFont('Arial', '', 10);

//El ancho de las celdas
$pdf->SetWidths(array(10,40,30,32,32,35,35,25,25,25)); //cambiar

for ($i = 0; $i < count($data); $i++) {

	$pdf->Row(array($i + 1,(utf8_decode($data[$i]['tutoria'])),
    ucwords(strtolower(utf8_decode($data[$i]['area']))),
    ucwords(strtolower(utf8_decode($data[$i]['inicial'])))
    ,ucwords(strtolower(utf8_decode($data[$i]['HORA_FINAL']))),
    ucwords(strtolower(utf8_decode($data[$i]['FECHA_INICIO'])))  
    ,ucwords(strtolower(utf8_decode($data[$i]['FECHA_FINAL']))),
    ucwords(strtolower(utf8_decode($data[$i]['modalidad']))),
    ucwords(strtolower(utf8_decode($data[$i]['seccion']))),
	ucwords(strtolower(utf8_decode($data[$i]['ANIO']))) ,),5); //EL 28 ES EL MARGEN QUE TIENE DE DERECHA
}

// cell(ancho, largo, contenido,borde?, salto de linea?)

$pdf->Output();
?>