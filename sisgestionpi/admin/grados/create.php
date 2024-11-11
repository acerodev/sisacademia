<?php
include ('../../app/config.php');
include ('../../admin/layout/parte1.php');

include ('../../app/controllers/niveles/listado_de_niveles.php');

?>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <br>
    <div class="content">
        <div class="container">
            <div class="row">
                <h1>Registro de nuevo grado</h1>
            </div>
            <br>
            <div class="row">

                <div class="col-md-6">
                    <div class="card card-outline card-primary">
                        <div class="card-header">
                            <h3 class="card-title">Llene los datos</h3>
                        </div>
                        <div class="card-body">
                            <form action="<?=APP_URL;?>/app/controllers/grados/create.php" method="post">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="">Nivel</label>
                                            <select name="nivel_id" id="" class="form-control">
                                                <?php
                                                foreach ($niveles as $nivele){
                                                    ?>
                                                    <option value="<?=$nivele['id_nivel'];?>"><?=$nivele['nivel']." - ".$nivele['turno'];?></option>
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
                                                <option value="PREU - 1">PREU - 1</option>
                                                <option value="PREU - 2">PREU - 2</option>
                                                <option value="PREU - SABADOS">PREU - SABADOS</option>
                                                <option value="REFORZAMIENTO - 1">REFORZAMIENTO - 1</option>
                                                <option value="ROBOTICA - 1">ROBOTICA - 1</option>
                                                <option value="ORATORIA - 1">ORATORIA - 1</option>
                                                <option value="ORATORIA - SABADOS">ORATORIA - SABADOS</option>
                                                <option value="FUTBOL - 1">FUTBOL - 1</option>
                                                <option value="INGLES - 1">INGLES - 1</option>
                                                <option value="AJEDREZ - 1">AJEDREZ - 1</option>
                                                <!--<option value="PRIMARIA - 5">PRIMARIA - 5</option>
                                                <option value="PRIMARIA - 6">PRIMARIA - 6</option>
                                                <option value="SECUNDARIA - 1">SECUNDARIA - 1</option>
                                                <option value="SECUNDARIA - 2">SECUNDARIA - 2</option>
                                                <option value="SECUNDARIA - 3">SECUNDARIA - 3</option>
                                                <option value="SECUNDARIA - 4">SECUNDARIA - 4</option>
                                                <option value="SECUNDARIA - 5">SECUNDARIA - 5</option>
                                                <option value="SECUNDARIA - 6">SECUNDARIA - 6</option>-->
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="">Salones</label>
                                            <select name="paralelo" id="" class="form-control">
                                                <option value="A">A</option>
                                                <option value="B">B</option>
                                                <option value="C">C</option>
                                                <option value="D">D</option>
                                                <option value="E">E</option>
                                                <option value="F">F</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <button type="submit" class="btn btn-primary">Registrar</button>
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
