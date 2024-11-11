<?php
/**
 * Created by PhpStorm.
 * User: HILARIWEB
 * Date: 9/1/2024
 * Time: 17:07
 */
include ('../../../app/config.php');

$id_pago = $_POST['id_pago'];

$sentencia = $pdo->prepare("DELETE FROM pagos where id_pago=:id_pago ");

$sentencia->bindParam('id_pago',$id_pago);

if($sentencia->execute()){
    session_start();
    $_SESSION['mensaje'] = "Se elimino el pago correctamente";
    $_SESSION['icono'] = "success";
    ?><script>window.history.back();</script><?php
}else{
    session_start();
    $_SESSION['mensaje'] = "Error no se pudo eliminar en la base datos, comuniquese con el administrador";
    $_SESSION['icono'] = "error";
    ?><script>window.history.back();</script><?php
}
