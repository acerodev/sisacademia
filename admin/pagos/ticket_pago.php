<?php
//============================================================+
// File name   : example_001.php
// Begin       : 2008-03-04
// Last Update : 2013-05-14
//
// Description : Example 001 for TCPDF class
//               Default Header and Footer
//
// Author: Nicola Asuni
//
// (c) Copyright:
//               Nicola Asuni
//               Tecnick.com LTD
//               www.tecnick.com
//               info@tecnick.com
//============================================================+

/**
 * Creates an example PDF TEST document using TCPDF
 * @package com.tecnick.tcpdf
 * @abstract TCPDF - Example: Default Header and Footer
 * @author Nicola Asuni
 * @since 2008-03-04
 * @group header
 * @group footer
 * @group page
 * @group pdf
 */

// Include the main TCPDF library (search for installation path).
$id_pago = $_GET['id'];
$id_estudiante = $_GET['id_estudiante'];

include ('../../app/config.php');
require_once('../../public/TCPDF-main/tcpdf.php');

include ('../../app/controllers/configuraciones/institucion/listado_de_instituciones.php');
include ('../../app/controllers/estudiantes/datos_del_estudiante.php');
// include ('../../app/controllers/pagos/datos_pago_estudiante.php');


//////////////////////////traendo datos de la institución
foreach ($instituciones as $institucione){
    $nombre_institucion = $institucione['nombre_institucion'];
    $direccion = $institucione['direccion'];
    $telefono = $institucione['telefono'];
    $celular = $institucione['celular'];
    $correo = $institucione['correo'];
    $logo = $institucione['logo'];
}
//////////////////////////traendo datos de la institución

// Consultar datos del pago
$sql_pagos = "SELECT * FROM pagos WHERE id_pago = :id_pago AND estado = '1'";
$query_pagos = $pdo->prepare($sql_pagos);
$query_pagos->bindParam(':id_pago', $id_pago, PDO::PARAM_INT);
$query_pagos->execute();
$pagos = $query_pagos->fetchAll(PDO::FETCH_ASSOC);

// Verificar que hay datos de pago
if (!empty($pagos)) {
    $pago = $pagos[0]; // Asegúrate de que sólo hay un registro
    $mes_pagado = $pago['mes_pagado'];
    $monto_pagado = $pago['monto_pagado'];
    $fecha_pagado = $pago['fecha_pagado'];
    $fyh_creacion = $pago['fyh_creacion'];
    $cajero = $pago['cajero'];
} else {
    echo "No se encontraron datos para el pago.";
    exit();
}

/*

///////////////////////// traendo los datos del pago del estudiante
foreach ($pagos as $pago){
    $mes_pagado = $pago['mes_pagado'];
    $monto_pagado = $pago['monto_pagado'];
    $fecha_pagado = $pago['fecha_pagado'];
    $fyh_creacion = $pago['fyh_creacion'];
}
///////////////////////// traendo los datos del pago del estudiante

*/

// create new PDF document
//$pdf = new TCPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, array(58,80), true, 'UTF-8', false);
$pdf = new TCPDF('P', 'mm', array(80, 132), true, 'UTF-8', false);
// set document information
$pdf->setCreator(PDF_CREATOR);
$pdf->setAuthor(APP_NAME);
$pdf->setTitle(APP_NAME);
$pdf->setSubject(APP_NAME);
$pdf->setKeywords(APP_NAME);


$pdf->setMargins(3, 0, 3, 0); // Márgenes pequeños para maximizar el espacio
$pdf->SetPrintHeader(false);
$pdf->SetPrintFooter(false);
$pdf->setAutoPageBreak(TRUE, 10);
$pdf->setFont('Helvetica', '', 8); // Tamaño de fuente reducido para caber en el ticket
$pdf->AddPage();


$date = new DateTime($fecha_pagado);
// Crear un formateador de fechas con locale en español
$formatter = new IntlDateFormatter(
    'es_ES', // Locale en español
    IntlDateFormatter::LONG, // Tipo de formato de fecha
    IntlDateFormatter::NONE // Tipo de formato de hora
);

$fecha_formateada = $formatter->format($date);

// Generar el contenido del PDF
$html = '
<table border="0">
<tr>
    <td style="text-align: center"><img src="../../public/images/configuracion/'.$logo.'" width="60px" alt=""></td>
</tr>
<tr>
    <td style="text-align: center"><b>ACADEMIA PI - ILO</b><br>Villa Primavera Mz.28 Lt.04, Ilo<br>Santa Rosa Mz-60 Lt-09, El Algarrobal<br>Ampliación Huascar L-2, Puerto<br>'.$telefono.' - '.$celular.'</td>
</tr>
<br>
<tr>
    <td style="text-align: center"><h4><b><u>RECIBO DE CAJA</u> (Original)</b></h4></td>
</tr>
<tr>
    <td><b>Nro: </b>'.$id_pago.'<br><b>Cajero(a): </b>'.$cajero.'</td>
</tr>
</table>

<br><br>

<table border="0">
<tr>
    <td><b>Estudiante: </b>'.$apellidos.', '.$nombres.'</td>
</tr>
<tr>
    <td><b>DNI: </b>'.$ci.'</td>
</tr>
<tr>
    <td><b>Nivel: </b>'.$nivel.' - '.$turno.'</td>
</tr>
<tr>
    <td><b>Curso: </b>'.$curso.' | Salón: '.$paralelo.'<br></td>
</tr>
<tr>
    <td><b>Fecha Pago: </b>'.$fecha_formateada.'</td>
</tr>
<tr>
    <td><b>Monto cancelado: </b>S/. '.$monto_pagado.'</td>
</tr>
</table>

<br><br><br>

<table border="0">
<tr>
    <td style="text-align: center">
    ____________________________ <br>
    <b>Recibi conforme</b><br>
    </td>
</tr>
<tr>
    <td style="text-align: center">
    ____________________________ <br>
    <b>Caja</b> <br>
    </td>
</tr>
<tr>
    <td style="text-align: center">
    <b>¡Gracias por confiar en nosotros.!</b> <br>
    </td>
</tr>
</table>

Fecha Actual: '.$dia_actual.' de '.$mes_actual.' de '.$ano_actual.'

<br>


<table border="0">
<tr>
    <td style="text-align: center"><img src="../../public/images/configuracion/'.$logo.'" width="60px" alt=""></td>
</tr>
<tr>
    <td style="text-align: center"><b>ACADEMIA PI - ILO</b><br>Villa Primavera Mz.28 Lt.04, Ilo<br>Santa Rosa Mz-60 Lt-09, El Algarrobal<br>Ampliación Huascar L-2, Puerto<br>'.$telefono.' - '.$celular.'</td>
</tr>
<br>
<tr>
    <td style="text-align: center"><h4><b><u>RECIBO DE CAJA</u> (Copia)</b></h4></td>
</tr>
<tr>
    <td><b>Nro: </b>'.$id_pago.'<br><b>Cajero(a): </b>'.$cajero.'</td>
</tr>
</table>

<br><br>

<table border="0">
<tr>
    <td><b>Estudiante: </b>'.$apellidos.' '.$nombres.'</td>
</tr>
<tr>
    <td><b>DNI: </b>'.$ci.'</td>
</tr>
<tr>
    <td><b>Nivel: </b>'.$nivel.' - '.$turno.'</td>
</tr>
<tr>
    <td><b>Curso: </b>'.$curso.' | Salón: '.$paralelo.'<br></td>
</tr>
<tr>
    <td><b>Fecha Pago: </b>'.$fecha_formateada.'</td>
</tr>
<tr>
    <td><b>Monto cancelado: </b>S/. '.$monto_pagado.'</td>
</tr>
</table>

<br><br><br>

<table border="0">
<tr>
    <td style="text-align: center">
    ____________________________ <br>
    <b>Recibi conforme</b><br>
    </td>
</tr>
<tr>
    <td style="text-align: center">
    ____________________________ <br>
    <b>Caja</b> <br>
    </td>
</tr>
<tr>
    <td style="text-align: center">
    <b>¡Gracias por confiar en nosotros.!</b> <br>
    </td>
</tr>
</table>

Fecha Actual: '.$dia_actual.' de '.$mes_actual.' de '.$ano_actual.'
   
';

// Print text using writeHTMLCell()
$pdf->writeHTMLCell(0, 0, '', '', $html, 0, 1, 0, true, '', true);

// ---------------------------------------------------------

// Close and output PDF document
// This method has several options, check the source code documentation for more information.
//$pdf->Output('comprobante.pdf', 'I');
$pdf->Output('RECIBO_N'.$id_pago.'_DE_'.$apellidos.'_'.$nombres.'_'.$fecha_formateada.'.pdf', 'I');

//============================================================+
// END OF FILE
//============================================================+
