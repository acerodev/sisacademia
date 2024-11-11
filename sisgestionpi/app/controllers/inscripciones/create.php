<?php
/**
 * Created by PhpStorm.
 * User: HILARIWEB
 * Date: 17/1/2024
 * Time: 08:14
 */

include ('../../../app/config.php');

$rol_id = $_POST['rol_id'];
$nombres = $_POST['nombres'];
$apellidos = $_POST['apellidos'];
$ci = $_POST['ci'];
$fecha_nacimiento = $_POST['fecha_nacimiento'];
$celular = $_POST['celular'];
$email = $_POST['email'];
$direccion_per = $_POST['direccion_per'];

$config_institucion_id = $_POST['config_institucion_id'];

$nivel_id = $_POST['nivel_id'];
$grado_id = $_POST['grado_id'];
$rude = $_POST['rude'];
$modalidad = $_POST['modalidad'];

$nombres_apellidos_ppff = $_POST['nombres_apellidos_ppff'];
$ci_ppf = $_POST['ci_ppf'];
$celular_ppff = $_POST['celular_ppff'];
$ocupacion_ppff = $_POST['ocupacion_ppff'];
$ref_nombre = $_POST['ref_nombre'];
$ref_parentezco = $_POST['ref_parentezco'];
$ref_celular = $_POST['ref_celular'];
$profesion = "ESTUDIANTE";

$pdo->beginTransaction();

try {
    // INSERTAR A LA TABLA USUARIOS
    $password = password_hash($ci, PASSWORD_DEFAULT);

    $sentencia = $pdo->prepare('INSERT INTO usuarios
        (rol_id, email, password, fyh_creacion, estado)
        VALUES (:rol_id, :email, :password, :fyh_creacion, :estado)');

    $sentencia->bindParam(':rol_id', $rol_id);
    $sentencia->bindParam(':email', $email);
    $sentencia->bindParam(':password', $password);
    $sentencia->bindParam('fyh_creacion', $fechaHora);
    $sentencia->bindParam('estado', $estado_de_registro);
    $sentencia->execute();

    $id_usuario = $pdo->lastInsertId();

    // INSERTAR A LA TABLA PERSONAS
    $sentencia = $pdo->prepare('INSERT INTO personas
        (usuario_id, nombres, apellidos, ci, fecha_nacimiento, celular, profesion, direccion_per, fyh_creacion, estado)
        VALUES (:usuario_id, :nombres, :apellidos, :ci, :fecha_nacimiento, :celular, :profesion, :direccion_per, :fyh_creacion, :estado)');

    $sentencia->bindParam(':usuario_id', $id_usuario);
    $sentencia->bindParam(':nombres', $nombres);
    $sentencia->bindParam(':apellidos', $apellidos);
    $sentencia->bindParam(':ci', $ci);
    $sentencia->bindParam(':fecha_nacimiento', $fecha_nacimiento);
    $sentencia->bindParam(':celular', $celular);
    $sentencia->bindParam(':profesion', $profesion);
    $sentencia->bindParam(':direccion_per', $direccion_per);
    $sentencia->bindParam('fyh_creacion', $fechaHora);
    $sentencia->bindParam('estado', $estado_de_registro);
    $sentencia->execute();

    $id_persona = $pdo->lastInsertId();

    // INSERTAR A LA TABLA ESTUDIANTES
    $sentencia = $pdo->prepare('INSERT INTO estudiantes
        (persona_id, nivel_id, grado_id, rude, modalidad, fyh_creacion, estado)
        VALUES (:persona_id, :nivel_id, :grado_id, :rude, :modalidad, :fyh_creacion, :estado)');

    $sentencia->bindParam(':persona_id', $id_persona);
    $sentencia->bindParam(':nivel_id', $nivel_id);
    $sentencia->bindParam(':grado_id', $grado_id);
    $sentencia->bindParam('rude', $rude);
    $sentencia->bindParam('modalidad', $modalidad);
    $sentencia->bindParam('fyh_creacion', $fechaHora);
    $sentencia->bindParam('estado', $estado_de_registro);
    $sentencia->execute();

    $id_estudiante = $pdo->lastInsertId();

    // INSERTAR A LA TABLA PPFFS
    $sentencia = $pdo->prepare('INSERT INTO ppffs
        (estudiante_id, nombres_apellidos_ppff, ci_ppf, celular_ppff, ocupacion_ppff, ref_nombre, ref_parentezco, ref_celular, fyh_creacion, estado)
        VALUES (:estudiante_id, :nombres_apellidos_ppff, :ci_ppf, :celular_ppff, :ocupacion_ppff, :ref_nombre, :ref_parentezco, :ref_celular, :fyh_creacion, :estado)');

    $sentencia->bindParam(':estudiante_id', $id_estudiante);
    $sentencia->bindParam(':nombres_apellidos_ppff', $nombres_apellidos_ppff);
    $sentencia->bindParam(':ci_ppf', $ci_ppf);
    $sentencia->bindParam(':celular_ppff', $celular_ppff);
    $sentencia->bindParam(':ocupacion_ppff', $ocupacion_ppff);
    $sentencia->bindParam(':ref_nombre', $ref_nombre);
    $sentencia->bindParam(':ref_parentezco', $ref_parentezco);
    $sentencia->bindParam(':ref_celular', $ref_celular);
    $sentencia->bindParam('fyh_creacion', $fechaHora);
    $sentencia->bindParam('estado', $estado_de_registro);
    $sentencia->execute();

    $id_ppffs = $pdo->lastInsertId();

    // INSERTAR RELACION INSTITUCION - PERSONA

    $sentencia = $pdo->prepare('INSERT INTO instituciones_personas
        (persona_id, config_institucion_id, fyh_creacion, estado)
        VALUES (:persona_id,:config_institucion_id,:fyh_creacion,:estado)');
    
    $sentencia->bindParam(':persona_id', $id_persona);
    $sentencia->bindParam(':config_institucion_id', $config_institucion_id);
    $sentencia->bindParam('fyh_creacion', $fechaHora);
    $sentencia->bindParam('estado', $estado_de_registro);

    if ($sentencia->execute()) {
        echo 'success';
        $pdo->commit();
        session_start();
        $_SESSION['mensaje'] = "Se registró al estudiante de la manera correcta en la base de datos";
        $_SESSION['icono'] = "success";
        header('Location:' . APP_URL . "/admin/estudiantes");
    } else {
        throw new Exception("Error al registrar en la base de datos");
    }
} catch (Exception $exception) {
    $pdo->rollBack();
    session_start();
    $errorMessage = $exception->getMessage();

    if (strpos($errorMessage, 'email') !== false) {
        $_SESSION['mensaje'] = "El email ya existe en la base de datos";
    } elseif (strpos($errorMessage, 'rude') !== false) {
        $_SESSION['mensaje'] = "El código de estudiante ya existe en la base de datos";
    } else {
        $_SESSION['mensaje'] = "Error: no se pudo registrar en la base de datos, comuníquese con el administrador";
    }

    $_SESSION['icono'] = "error";
    ?><script>window.history.back();</script><?php
}
