<?php
/**
 * Created by PhpStorm.
 * User: HILARIWEB
 * Date: 18/1/2024
 * Time: 10:36
 */
$sql_estudiantes = "SELECT * FROM usuarios as usu 
INNER JOIN roles as rol ON rol.id_rol = usu.rol_id 
INNER JOIN personas as per ON per.usuario_id = usu.id_usuario 
INNER JOIN estudiantes as est ON est.persona_id = per.id_persona
INNER JOIN niveles as niv ON niv.id_nivel = est.nivel_id
INNER JOIN grados as gra ON gra.id_grado = est.grado_id
INNER JOIN ppffs as ppf ON ppf.estudiante_id = est.id_estudiante
INNER JOIN pagos as pg ON pg.estudiante_id = est.id_estudiante
INNER JOIN instituciones_personas as insper ON insper.persona_id = per.id_persona
INNER JOIN configuracion_instituciones as conf_inst ON conf_inst.id_config_institucion = insper.config_institucion_id
 where est.estado = '1' ";
$query_estudiantes = $pdo->prepare($sql_estudiantes);
$query_estudiantes->execute();
$estudiantes = $query_estudiantes->fetchAll(PDO::FETCH_ASSOC);