<?php

$id_grado = $_GET['id'];
include ('../../app/config.php');
include ('../../admin/layout/parte1.php');

include ('../../app/controllers/grados/datos_grados.php');
include ('../../app/controllers/niveles/listado_de_niveles.php');

?>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <br>
    <div class="content">
        <div class="container">
            <div class="row">
                <h1>Modificación del salón: <?=$curso;?></h1>
            </div>
            <br>
            <div class="row">

                <div class="col-md-6">
                    <div class="card card-outline card-success">
                        <div class="card-header">
                            <h3 class="card-title">Llene los datos</h3>
                        </div>
                        <div class="card-body">
                            <form action="<?=APP_URL;?>/app/controllers/grados/update.php" method="post">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="">Nivel</label>
                                            <input type="text" name="id_grado" value="<?=$id_grado;?>" hidden>
                                            <select name="nivel_id" id="" class="form-control">
                                                <?php
                                                foreach ($niveles as $nivele){
                                                    ?>
                                                    <option value="<?=$nivele['id_nivel'];?>"<?=$nivel_id==$nivele['id_nivel'] ? 'selected' : ''?>><?=$nivele['nivel']." - ".$nivele['turno'];?></option>
                                                    <?php
                                                }
                                                ?>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="">Curso</label>
                                            <select name="curso" id="" class="form-control">
                                                <option value="PREU - 1"<?=$curso=='PREU - 1' ? 'selected' : ''?>>PREU - 1</option>
                                                <option value="PREU - 2"<?=$curso=='PREU - 2' ? 'selected' : ''?>>PREU - 2</option>
                                                <option value="PREU - SABADOS"<?=$curso=='PREU - SABADOS' ? 'selected' : ''?>>PREU - SABADOS</option>
                                                <option value="ROBOTICA - 1"<?=$curso=='ROBOTICA - 1' ? 'selected' : ''?>>ROBOTICA - 1</option>
                                                <option value="ORATORIA - 1"<?=$curso=='ORATORIA - 1' ? 'selected' : ''?>>ORATORIA - 1</option>
                                                <option value="ORATORIA - SABADOS"<?=$curso=='ORATORIA - SABADOS' ? 'selected' : ''?>>ORATORIA - SABADOS</option>
                                                <option value="FUTBOL - 1"<?=$curso=='FUTBOL - 1' ? 'selected' : ''?>>FUTBOL - 1</option>
                                                <option value="INGLES - 1"<?=$curso=='INGLES - 1' ? 'selected' : ''?>>INGLES - 1</option>
                                                <option value="AJEDREZ - 1"<?=$curso=='AJEDREZ - 1' ? 'selected' : ''?>>AJEDREZ - 1</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="">Salones</label>
                                            <select name="paralelo" id="" class="form-control">
                                                <option value="A"<?=$paralelo=='A' ? 'selected' : ''?>>A</option>
                                                <option value="B"<?=$paralelo=='B' ? 'selected' : ''?>>B</option>
                                                <option value="C"<?=$paralelo=='C' ? 'selected' : ''?>>C</option>
                                                <option value="D"<?=$paralelo=='D' ? 'selected' : ''?>>D</option>
                                                <option value="E"<?=$paralelo=='E' ? 'selected' : ''?>>E</option>
                                                <option value="F"<?=$paralelo=='F' ? 'selected' : ''?>>F</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <button type="submit" class="btn btn-success">Actualizar</button>
                                            <a href="<?=APP_URL;?>/admin/grados" class="btn btn-secondary">Cancelar</a>
                                        </div>
                                    </div>
                                </div>
                            </form>
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
