<?php
/**
 * Created by PhpStorm.
 * User: HILARIWEB
 * Date: 9/1/2024
 * Time: 16:38
 */

include ('../../../app/config.php');

$id_pago = $_POST['id_pago'];
$estudiante_id = $_POST['estudiante_id'];
$mes_pagado = $_POST['mes_pagado'];
$monto_apagar = $_POST['monto_apagar'];
$monto_pagado = $_POST['monto_pagado'];
$metodo_pago = $_POST['metodo_pago'];
$fecha_pagado = $_POST['fecha_pagado'];
$fecha_inicio = $_POST['fecha_inicio'];
$fecha_fin = $_POST['fecha_fin'];

$sentencia = $pdo->prepare('UPDATE pagos
       SET mes_pagado=:mes_pagado,
           monto_apagar=:monto_apagar,
           monto_pagado=:monto_pagado,
           metodo_pago=:metodo_pago,
           fecha_pagado=:fecha_pagado,
           fecha_inicio=:fecha_inicio,
           fecha_fin=:fecha_fin,
           fyh_actualizacion=:fyh_actualizacion
      WHERE id_pago=:id_pago ');

$sentencia->bindParam(':mes_pagado',$mes_pagado);
$sentencia->bindParam(':monto_apagar',$monto_apagar);
$sentencia->bindParam(':monto_pagado',$monto_pagado);
$sentencia->bindParam(':metodo_pago',$metodo_pago);
$sentencia->bindParam(':fecha_pagado',$fecha_pagado);
$sentencia->bindParam(':fecha_inicio',$fecha_inicio);
$sentencia->bindParam(':fecha_fin',$fecha_fin);
$sentencia->bindParam('fyh_actualizacion',$fechaHora);
$sentencia->bindParam(':id_pago',$id_pago);

if($sentencia->execute()){
    echo 'success';
    session_start();
    $_SESSION['mensaje'] = "Se actualizó el pago correctamente";
    $_SESSION['icono'] = "success";
    ?><script>window.history.back();</script><?php
//header('Location:' .$URL.'/');
}else{
    echo 'error al registrar a la base de datos';
    session_start();
    $_SESSION['mensaje'] = "Error no se pudo actualizar en la base datos, comuniquese con el administrador";
    $_SESSION['icono'] = "error";
    ?><script>window.history.back();</script><?php
}