<?php
require_once('pdf/fpdf.php');

function Crear($pasteles, $grantotal){

	// create a new PDF document
	$pdf = new FPDF();

	$pdf->AddPage();
	// set document information
	$pdf->SetTitle('Pedido');

	// set font for the content
	$pdf->SetFont('helvetica', '', 10);

	  foreach ($pasteles as $p) {

	    $precio = $p->Cantidad * $p->pastel->Precio;

	    $pdf->Cell(40,10, 'Pastel', 0, 1);
	    $pdf->Cell(40,10, 'Tamanio: ' .$p->pastel->Tamanio, 0, 1);
	    $pdf->Cell(40,10, 'Sabor: ' .$p->pastel->Sabor, 0, 1);
	    $pdf->Cell(40,10, 'Relleno: ' .$p->pastel->Relleno, 0, 1);
	    $pdf->Cell(40,10, 'Cobertura: ' .$p->pastel->Cobertura, 0, 1);
	    $pdf->Cell(40,10, 'Precio unitario: ' . $p->pastel->Precio, 0, 0);
	    $pdf->Cell(40,10, 'Cantidad: ' . $p->Cantidad, 0, 0);
	    $pdf->Cell(40,10, 'Total: ' . $precio , 0, 1);

	  }
	  $pdf->Cell(40,10, 'Gran total: ' . $grantotal , 0, 1);

	// output the PDF to a file or browser
	$pdf->Output('temp/orden.pdf', 'F');

}

?>
