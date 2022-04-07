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
		$this->SetX(110);
		$this->Cell(180, 8, utf8_decode('Reporte medico del  paciente'));
		$this->SetX(5);
		$this->Ln(4);
		$this->SetFont('Arial','',10);
		$this->Cell(60, 5, "Fecha: ". date('d/m/Y | g:i:a') ,0,1,'R');
		
		
		$this->Ln(6);
	}

// Pie de página

	function Footer() {
	// Posición: a 1,5 cm del final
	$this->SetFont('helvetica', 'B', 9);
	$this->SetY(-18);
	$this->SetX(20);
	$this->Cell(120,5,utf8_decode('Página ').$this->PageNo().'/{nb}',0,0,'L');
	
	$this->SetX(20);
	$this->Line(20,197,262,197);
	
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
			$this->SetFont('Helvetica', 'B', 15);
	        $this->SetFillColor(72, 208, 234);
            $this->SetFont('Helvetica', 'B', 12);
            
		
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
	$data1=new Conexion();
	$conexion=$data1->conect();	
	$consulti ="SELECT * FROM tbl_consulta_medica cm ,tbl_inscripcion_cita c
	where 	cm.CODIGO_CITA = c.CODIGO_CITA and  cm.CODIGO_CITA = '38'";
	$result1 = $conexion->prepare($consulti);
	$result1->execute();
	$data1 = $result1->fetchall(PDO::FETCH_ASSOC);

	$consuta2 = "SELECT per.CODIGO_PERSONA, per.PRIMER_NOMBRE, GROUP_CONCAT(me.NOMBRE_MEDICAMENTO) as medicamentos, GROUP_CONCAT(re.INDICACIONES_RECETA) as indicaciones
	FROM tbl_persona per, tbl_inscripcion_cita cita, tbl_consulta_medica consu, tbl_receta_medica re, tbl_medicamento me
	WHERE per.CODIGO_PERSONA = cita.CODIGO_PERSONA
	AND cita.CODIGO_CITA = consu.CODIGO_CITA
	AND consu.CODIGO_CONSULTA = re.CODIGO_CONSULTA
	AND re.CODIGO_MEDICAMENTO = me.CODIGO_MEDICAMENTO and cita.CODIGO_PERSONA ='$persona'";

	$data=new Conexion();
	$conexion=$data->conect();
	$consulta_g = "SELECT exp.CODIGO_EXPEDIENTE,  san.TIPO as TIPO_SANGRE, exp.TRATAMIENTOS, exp.ENFERMEDADES, ale.NOMBRE as ALERGIAS, tra.TIPO as TRASTORNOS, apa.TIPO as APARIENCIA
	FROM tbl_expediente_medico exp, tbl_persona per, tbl_personas_alergias alep, tbl_personas_transtornos trap, tbl_personas_apariencia apap, tbl_alergias ale, tbl_transtornos_corporales tra, tbl_apariencia_fisica apa, tbl_tipo_sangre san
	WHERE exp.CODIGO_PERSONA = per.CODIGO_PERSONA
	AND exp.CODIGO_EXPEDIENTE = alep.CODIGO_EXPEDIENTE_PERSONA
	AND exp.CODIGO_EXPEDIENTE = trap.CODIGO_EXPEDIENTE
	AND exp.CODIGO_EXPEDIENTE = apap.CODIGO_EXPEDIENTE
	AND alep.CODIGO_ALERGIAS = ale.CODIGO_ALERGIAS
	AND trap.CODIGO_TRANSTORNO = tra.CODIGO_TRANSTORNO
	AND apap.CODIGO_APARIENCIA = apa.CODIGO_APARIENCIA
	AND exp.CODIGO_TIPO_SANGRE = san.CODIGO_TIPO_SANGRE and exp.CODIGO_PERSONA = '42'";
	$result = $conexion->prepare($consulta_g);
	$result->execute();
	$data = $result->fetchall(PDO::FETCH_ASSOC);



   $area = '2';
   $estado ='12';
   $sentencia = $db->prepare(" SELECT CONCAT_WS(' ',p.PRIMER_NOMBRE, p.SEGUNDO_NOMBRE, p.PRIMER_APELLIDO,p.SEGUNDO_APELLIDO) 
    as PACIENTE from tbl_inscripcion_cita c ,tbl_persona p ,tbl_area a
    where p.CODIGO_PERSONA = c.CODIGO_PERSONA
    AND c.CODIGO_ESTADO = (?) and  c.AREA_CITA = a.CODIGO_AREA  and a.CODIGO_AREA = (?)");
	 $sentencia->execute(array($estado,$area));
	 $row=$sentencia->fetchColumn();
	 if($row>0){
	   $nombre = $row;
	}
	$sentencia = $db->prepare(" SELECT p.DNI from tbl_inscripcion_cita c ,tbl_persona p ,tbl_area a
    where p.CODIGO_PERSONA = c.CODIGO_PERSONA
    AND c.CODIGO_ESTADO = (?) and  c.AREA_CITA = a.CODIGO_AREA  and a.CODIGO_AREA = (?)");
	 $sentencia->execute(array($estado,$area));
	 $row=$sentencia->fetchColumn();
	 if($row>0){
	   $DNI = $row;
	}

	$sentencia = $db->prepare(" SELECT p.FECHA_NACIMIENTO from tbl_inscripcion_cita c ,tbl_persona p ,tbl_area a
    where p.CODIGO_PERSONA = c.CODIGO_PERSONA
    AND c.CODIGO_ESTADO = (?) and  c.AREA_CITA = a.CODIGO_AREA  and a.CODIGO_AREA = (?)");
	 $sentencia->execute(array($estado,$area));
	 $row=$sentencia->fetchColumn();
	 if($row>0){
	   $fecha = $row;
	}
	$sentencia = $db->prepare("SELECT c.CODIGO_CITA from tbl_inscripcion_cita c ,tbl_persona p ,tbl_area a
    where p.CODIGO_PERSONA = c.CODIGO_PERSONA
    AND c.CODIGO_ESTADO = (?) and  c.AREA_CITA = a.CODIGO_AREA  and a.CODIGO_AREA = (?)");
	 $sentencia->execute(array($estado,$area));
	 $row=$sentencia->fetchColumn();
	 if($row>0){
		 $cita = $row;
     
	 
	    $query = $db->prepare("SELECT pr.PESO
		FROM tbl_preclinica pr, tbl_inscripcion_cita c WHERE pr.CODIGO_CITA = c.CODIGO_CITA 
		AND C.AREA_CITA = (?) and c.CODIGO_CITA = (?);");
		$sentencia->execute(array($area,$cita));
		$row1=$sentencia->fetchColumn();
		if($row>0){
		  $peso = $row1;
		}
        
		
		$are ="2";
        $query = $db->prepare("SELECT pr.MASA_CORPORAL
		FROM tbl_preclinica pr, tbl_inscripcion_cita c WHERE pr.CODIGO_CITA = c.CODIGO_CITA 
		AND C.AREA_CITA = (?) and c.CODIGO_CITA = (?);");
		$sentencia->execute(array($area,$cita));
		$row2=$sentencia->fetchColumn();
		if($row2>0){
		  $masa = $row2;
		}



		$query = $db->prepare("SELECT  pr.ESTATURA
		FROM tbl_preclinica pr, tbl_inscripcion_cita c WHERE pr.CODIGO_CITA = c.CODIGO_CITA 
		AND C.AREA_CITA = (?) and c.CODIGO_CITA = (?);");
		$sentencia->execute(array($area,$cita));
		$row3=$sentencia->fetchColumn();
		if($row>0){
		$estatura = $row3;
		} 

		$query = $db->prepare("SELECT pr.FRECUENCIA_CARDIACA
		FROM tbl_preclinica pr, tbl_inscripcion_cita c WHERE pr.CODIGO_CITA = c.CODIGO_CITA 
		AND C.AREA_CITA = (?) and c.CODIGO_CITA = (?);");
		$sentencia->execute(array($area,$cita));
		$row4=$sentencia->fetchColumn();
		if($row4>0){
		$FC = $row4;
		} 
	
		$query = $db->prepare("SELECT  pr.TEMPERATURA
		FROM tbl_preclinica pr, tbl_inscripcion_cita c WHERE pr.CODIGO_CITA = c.CODIGO_CITA 
		AND C.AREA_CITA = (?) and c.CODIGO_CITA = (?);");
		$sentencia->execute(array($area,$cita));
		$row5=$sentencia->fetchColumn();
		if($row5>0){
		$temperatura = $row5;
		}

		$query = $db->prepare("SELECT  pr.FRECUENCIA_RESPIRATORIA
		FROM tbl_preclinica pr, tbl_inscripcion_cita c WHERE pr.CODIGO_CITA = c.CODIGO_CITA 
		AND C.AREA_CITA = (?) and c.CODIGO_CITA = (?);");
		$sentencia->execute(array($area,$cita));
		$row6=$sentencia->fetchColumn();
		if($row6>0){
		$FR = $row6;
		}

		$query = $db->prepare("SELECT  pr.PULSO
		FROM tbl_preclinica pr, tbl_inscripcion_cita c WHERE pr.CODIGO_CITA = c.CODIGO_CITA 
		AND C.AREA_CITA = (?) and c.CODIGO_CITA = (?);");
		$sentencia->execute(array($area,$cita));
		$row7=$sentencia->fetchColumn();
		if($row7>0){
		$pulso = $row7;
		}

	}
	
	      
 
    

//--------------TERMINA BASE DE DATOS-----------------------------------------------

// Creación del objeto de la clase heredada
$pdf = new PDF(); //hacemos una instancia de la clase
$pdf->AliasNbPages();
$pdf->AddPage('L'); //añade l apagina / en blanco
$pdf->SetMargins(10, 10, 10); //MARGENES
$pdf->SetAutoPageBreak(true, 20); //salto de pagina automatico

// -----------ENCABEZADO------------------
$pdf->SetX(20);
$pdf->SetFillColor(250, 250, 250);
$pdf->SetFont('Helvetica', 'B', 10);
$pdf->Cell(38, 10, 'Nombres y Apellidos: ',0,0);
$pdf->SetFont('Arial','',10);
$pdf->Cell(75,10,ucwords(strtolower(utf8_decode($nombre)))  ,0 );
$pdf->SetFont('Helvetica', 'B', 10);
$pdf->Cell(33, 10,'Fecha Nacimiento:' ,0 );
$pdf->SetFont('Arial','',10);
$pdf->Cell(25, 10,$fecha ,0,0);
$pdf->SetFont('Helvetica', 'B', 10);
$pdf->Cell(9, 10, 'DNI: ',0,0);
$pdf->SetFont('Arial','',10);
$pdf->Cell(30, 10,$DNI ,0,0);
$pdf->SetFont('Helvetica', 'B', 10);
$pdf->Cell(22, 10, 'Codigo cita: ',0,0);
$pdf->SetFont('Arial','',10);
$pdf->Cell(4, 10,$cita ,0,1);
$pdf->SetX(20);
$pdf->SetFont('Helvetica', 'B', 10);
$pdf->Cell(45, 10,'Datos Pre-clinica',0,1,0);
$pdf->Line(20,61,262,61);
$pdf->SetX(20);
$pdf->SetFont('Helvetica', 'B', 10);
$pdf->Cell(12, 10, 'Peso: ',0,0);
$pdf->SetFont('Arial','',10);
$pdf->Cell(20, 10, $peso ." Lb" ,0,0);
$pdf->SetFont('Helvetica', 'B', 10);
$pdf->Cell(26, 10, 'Masa corporal: ',0,0);
$pdf->SetFont('Arial','',10);
$pdf->Cell(20, 10,$masa ." kg" ,0,0);
$pdf->SetFont('Helvetica', 'B', 10);
$pdf->Cell(18, 10, 'Estatura: ',0,0);
$pdf->SetFont('Arial','',10);
$pdf->Cell(16, 10,$estatura ." m" ,0,0);


$pdf->SetFont('Helvetica', 'B', 10);
$pdf->Cell(25, 10, 'Temperatura: ',0,0);
$pdf->SetFont('Arial','',10);
$pdf->Cell(17, 10,$temperatura .utf8_decode(" °C") ,0,0);

$pdf->SetFont('Helvetica', 'B', 10);
$pdf->Cell(8, 10, 'PA: ',0,0);
$pdf->SetFont('Arial','',10);
$pdf->Cell(25, 10,$FC." mmHg" ,0,0);

$pdf->SetFont('Helvetica', 'B', 10);
$pdf->Cell(8, 10, 'FR: ',0,0);
$pdf->SetFont('Arial','',10);
$pdf->Cell(18, 10,$FR ,0,0);

$pdf->SetFont('Helvetica', 'B', 10);
$pdf->Cell(12, 10, 'Pulso: ',0,0);
$pdf->SetFont('Arial','',10);
$pdf->Cell(18, 10,$pulso ." lpm" ,0,1);

$pdf->SetX(20);
$pdf->SetFont('Helvetica', 'B', 10);
$pdf->Cell(45, 10,'Datos Expediente Medico',0,1,0);
$pdf->Line(20,82,262,82);



$pdf->Ln(8);
$pdf->SetX(20);
$pdf->SetFont('Helvetica', 'B', 10);
$pdf->Cell(23, 10,'Tipo sangre',1,0, 'C',1);
$pdf->Cell(50, 10,'Tratamientos',1,0, 'C',1);
$pdf->Cell(50, 10,'Enfermedades ',1,0, 'C',1);
$pdf->Cell(40, 10,'Alergias',1,0, 'C',1);
$pdf->Cell(40, 10,'Trastornos',1,0, 'C',1);
$pdf->Cell(40, 10,'Apariencia',1,1, 'C',1);;
$pdf->SetFillColor(252, 254, 254); //color de fondo rgb

$pdf->SetFont('Arial', '', 10);

$pdf->SetWidths(array(23,50,50,40,40,40));



for ($i = 0; $i < count($data); $i++) {
	$pdf->Row(array(ucwords(strtolower(utf8_decode($data[$i]['TIPO_SANGRE']))) ,ucwords(strtolower(utf8_decode($data[$i]['TRATAMIENTOS']))) ,ucwords(strtolower(utf8_decode($data[$i]['ENFERMEDADES']))),ucwords(strtolower(utf8_decode($data[$i]['ALERGIAS']))),ucwords(strtolower(utf8_decode($data[$i]['TRASTORNOS']))),ucwords(strtolower(utf8_decode($data[$i]['APARIENCIA'])))  ),20); //EL 28 ES EL MARGEN QUE TIENE DE DERECHA
}

$pdf->Ln(8);
$pdf->SetX(20);
$pdf->SetFont('Helvetica', 'B', 10);
$pdf->Cell(60, 10,'Sintomas',1,0, 'C',1);
$pdf->Cell(60, 10,'Diagnostico Ingreso',1,0, 'C',1);
$pdf->Cell(60, 10,utf8_decode('Evolución'),1,0, 'C',1);
$pdf->Cell(63, 10,'Diagnostico Egreso',1,1, 'C',1);


$pdf->SetFillColor(252, 254, 254); //color de fondo rgb

$pdf->SetFont('Arial', '', 10);

$pdf->SetWidths(array(60,60,60,63)); 
for ($i = 0; $i < count($data1); $i++) {
	$pdf->Row(array(ucwords(strtolower(utf8_decode($data1[$i]['SINTOMAS']))) ,ucwords(strtolower(utf8_decode($data1[$i]['DIAGNOSTICO_INGRESO']))) ,ucwords(strtolower(utf8_decode($data1[$i]['EVOLUCION']))),ucwords(strtolower(utf8_decode($data1[$i]['DIAGNOSTICO_EGRESO']))) ),20); //EL 28 ES EL MARGEN QUE TIENE DE DERECHA
}


//El ancho de las celdas

$pdf->Output();

?>