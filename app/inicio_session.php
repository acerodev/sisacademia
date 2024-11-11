<?php
session_start();

if(isset($_SESSION['sesion_email'])){
   // echo "el usuarios paso por el login";
    $email_sesion = $_SESSION['sesion_email'];
    $query_sesion = $pdo->prepare("SELECT * FROM usuarios as usu
                                    INNER JOIN roles as rol ON rol.id_rol = usu.rol_id 
                                    INNER JOIN personas as per ON per.usuario_id = usu.id_usuario
                                    WHERE usu.email = '$email_sesion' AND usu.estado = '1' ");
    $query_sesion->execute();

    $datos_sesion_usuarios = $query_sesion->fetchAll(PDO::FETCH_ASSOC);
    foreach ($datos_sesion_usuarios as $datos_sesion_usuario){
       $nombre_sesion_usuario = $datos_sesion_usuario['email'];
       $id_rol_sesion_usuario = $datos_sesion_usuario['id_rol'];
       $rol_sesion_usuario = $datos_sesion_usuario['nombre_rol'];
       $nombres_sesion_usuario = $datos_sesion_usuario['nombres'];
       $apellidos_sesion_usuario = $datos_sesion_usuario['apellidos'];
       $ci_sesion_usuario = $datos_sesion_usuario['ci'];
    }

}else{
    echo "el usuario no paso por el login";
    header('Location:'.APP_URL."/login");
}