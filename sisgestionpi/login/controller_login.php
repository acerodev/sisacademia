<?php
/**
 * Created by PhpStorm.
 * User: HILARIWEB
 * Date: 28/12/2023
 * Time: 19:57
 */

include ('../app/config.php');

$email = $_POST['email'];
$password = $_POST['password'];

$sql = "SELECT * FROM usuarios WHERE email = :email AND estado = '1' ";
$query = $pdo->prepare($sql);
$query->bindParam(':email', $email);
$query->execute();

$usuario = $query->fetch(PDO::FETCH_ASSOC);
//print_r($usuarios);


if ($usuario && password_verify($password, $usuario['password'])) {
    // Iniciar la sesión
    session_start();
    // Almacenar el ID del usuario en la sesión
    $_SESSION['usuario_id'] = $usuario['id_usuario']; // Suponiendo que la columna del ID del usuario es 'id'
    $_SESSION['sesion_email'] = $usuario['email'];
    $_SESSION['mensaje'] = "Bienvenido al sistema";
    $_SESSION['icono'] = "success";
    // Redirigir al dashboard o panel de administración
    header('Location:'.APP_URL."/admin");
} else {
    // Datos incorrectos
    session_start();
    $_SESSION['mensaje'] = "Los datos introducidos son incorrectos, vuelva a intentarlo";
    $_SESSION['icono'] = "error";

    // Redirigir al login
    header('Location:'.APP_URL."/login");
}
