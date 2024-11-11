<?php
include ('../../app/config.php');
include ('../../admin/layout/parte1.php');

include ('../../app/controllers/estudiantes/listado_de_estudiantes.php');


?>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <br>
    <div class="content">
        <div class="container">
            <div class="row">
                <h1>Listado de pagos de estudiantes</h1>
            </div>
            <br>
            <div class="row">

                <div class="col-md-12">
                    <div class="card card-outline card-primary">
                        <div class="card-header">
                            <h3 class="card-title">Estudiantes registrados</h3>
                        </div>
                        <div class="card-body">
                            <table id="example1" class="table table-striped table-bordered table-hover table-sm">
                                <thead>
                                <tr>
                                    <th><center>Nro</center></th>
                                    <th><center>Apellidos y Nombres</center></th>
                                    <th><center>Sede</center></th>
                                    <!-- <th><center>Fecha de nacimiento</center></th> -->
                                    <!-- <th><center>Email</center></th> -->
                                    <th><center>Modalidad</center></th>
                                    <th><center>Nivel</center></th>
                                    <th><center>Fecha q' Pagó</center></th>
                                    <th><center>Estado Pago</center></th>
                                    <th><center>F. de Termino</center></th>
                                    <!-- <th><center>Grado</center></th> -->
                                    <!--<th><center>Estado</center></th>-->
                                    <th><center>Acciones</center></th>
                                </tr>
                                </thead>
                                <tbody>
                                <?php
                                $contador_estudiantes = 0;
                                $debe = 0;
                                foreach ($estudiantes as $estudiante){
                                    $id_estudiante = $estudiante['id_estudiante'];
                                    //$contador_estudiantes = $contador_estudiantes +1;
                                    $estado_pago = "SIN REGISTRO";

                                    if ($estudiante['monto_apagar'] <= 0) {
                                        $estado_pago = "REGISTRO INCORRECTO";
                                    } elseif ($estudiante['monto_pagado'] == $estudiante['monto_apagar']) {
                                        $estado_pago = "🟢 CANCELADO";
                                    } elseif ($estudiante['monto_pagado'] < $estudiante['monto_apagar']) {
                                        $debe = $estudiante['monto_apagar'] - $estudiante['monto_pagado'];
                                        $estado_pago = "🔴 DEBE - " . $debe;
                                    }
                                    
                                    
                                    // Verificar si el estado es CANCELADO y si la fecha actual es mayor que fecha_fin
                                    if ($estado_pago == "🟢 CANCELADO" && $estudiante['fecha_fin'] < $fecha_actual) {
                                        continue; // Saltar la fila si se cumple la condición
                                    }
                                    

                                    if($estudiante['id_config_institucion']==2){
                                        $contador_estudiantes = $contador_estudiantes +1;
                                    ?>
                                    <tr>
                                        <td style="text-align: center"><?=$contador_estudiantes;?></td>
                                        <td><?=$estudiante['apellidos']." ".$estudiante['nombres'];?></td>
                                        <td><?=$estudiante['nombre_institucion'];?></td>
                                        <!-- <td>$estudiante['fecha_nacimiento'];?></td> -->
                                        <!-- <td style="text-align: center">$estudiante['email'];?></td> -->
                                        <td><?=$estudiante['modalidad'];?></td>
                                        <td><?=$estudiante['nivel'];?></td>
                                        <td><?=$estudiante['fecha_pagado'];?></td>
                                        <!-- <td>$estudiante['curso']." | ".$estudiante['paralelo'];?></td> -->
                                        <td><?=$estado_pago;?></td>
                                        <td><?php
                                            if($estudiante['fecha_fin']<=$fecha_actual){
                                                echo "🔴 | ".$estudiante['fecha_fin'];
                                            }
                                            elseif($estudiante['fecha_fin']>$fecha_actual && $estudiante['fecha_fin'] <= date('Y-m-d', strtotime($fecha_actual. ' + 5 days'))){
                                                echo "🟡 | ".$estudiante['fecha_fin'];
                                            }
                                            else{
                                                echo "🟢 | ".$estudiante['fecha_fin'];
                                            }
                                            ?>
                                        </td>
                                        <!--<td>
                                            <
                                            if($estudiante['estado'] == "1") echo "ACTIVO";
                                            else echo "INACTIVO";
                                            ?>
                                        </td>-->
                                        <td style="text-align: center">
                                            <div class="btn-group" role="group" aria-label="Basic example">
                                                <a href="ficha_inscripcion.php?id=<?=$id_estudiante;?>" type="button" class="btn btn-warning btn-sm" target="_blank"><i class="bi bi-printer"></i></a>
                                                <a href="create.php?id=<?=$id_estudiante;?>" type="button" class="btn btn-success btn-sm"><i class="bi bi-cash-coin"></i></a>
                                            </div>
                                        </td>
                                    </tr>
                                    <?php
                                    }
                                }
                                ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.row -->
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->

<?php

include ('../../admin/layout/parte2.php');
include ('../../layout/mensajes.php');

?>

<script>
    $(function () {
        $("#example1").DataTable({
            "pageLength": 5,
            "language": {
                "emptyTable": "No hay información",
                "info": "Mostrando _START_ a _END_ de _TOTAL_ Estudiantes",
                "infoEmpty": "Mostrando 0 a 0 de 0 Estudiantes",
                "infoFiltered": "(Filtrado de _MAX_ total Estudiantes)",
                "infoPostFix": "",
                "thousands": ",",
                "lengthMenu": "Mostrar _MENU_ Estudiantes",
                "loadingRecords": "Cargando...",
                "processing": "Procesando...",
                "search": "Buscador:",
                "zeroRecords": "Sin resultados encontrados",
                "paginate": {
                    "first": "Primero",
                    "last": "Ultimo",
                    "next": "Siguiente",
                    "previous": "Anterior"
                }
            },
            "responsive": true, "lengthChange": true, "autoWidth": false,
            buttons: [{
                extend: 'collection',
                text: 'Reportes',
                orientation: 'landscape',
                buttons: [{
                    text: 'Copiar',
                    extend: 'copy',
                }, {
                    extend: 'pdf'
                },{
                    extend: 'csv'
                },{
                    extend: 'excel'
                },{
                    text: 'Imprimir',
                    extend: 'print'
                }
                ]
            },
                {
                    extend: 'colvis',
                    text: 'Visor de columnas',
                    collectionLayout: 'fixed three-column'
                }
            ],
        }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');
    });
</script>