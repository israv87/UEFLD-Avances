<?php
/*Instanciamos los datos del usuario mediante la variable $userSession
que obtiene los datos de la sesion actual apuntanto a get current user
que es la funcion que obtiene los datos del usuario actual, 
el mas improtante de ellos la varible user que es laque usamos para comparar
la consulta sql con el usuario al que estamos buscando
*/
$user->SetCriteriosD($userSession->getCurrentUser()); //Numero de criterios creados por el docente
$user->SetNEstudiantesD($userSession->getCurrentUser()); //Numero de estudiantes a cargo del docente
$user->SetNAvancesD($userSession->getCurrentUser()); //Numero de avances por revisar
$user->SetNAvancesRevisadosD($userSession->getCurrentUser()); //Numero de avances revisados
$user->SetNObservacionesD($userSession->getCurrentUser()); //Numero de avances revisados
$user->SetNCalificacionesD($userSession->getCurrentUser()); //Numero de calificaciones realizadas
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <!-- Titulo para el navegador -->
    <title>Unidad Educatica Fiscomisional La Dolorosa</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- llamamos alos estilos y frameworks -->
    <link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/css/estilos.css" rel="stylesheet">
    <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <link rel="icon" type="../../assets/img/logo.png" href="/imágenes/mifavicon.png" />
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-T8Gy5hrqNKT+hzMclPo118YTQO6cYprQmhrYwIiQ/3axmI1hQomh7Ud2hPOy8SP1" crossorigin="anonymous">
    <link href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css">
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <script script src="assets/js/jquery.dataTables.min.js"></script>
    <script>
        $(document).ready(function() {
            $("#Resumen").click(function() {
                $("#res").show();
                $("#avz,#cri,#cali").hide();
            });
            $("#Avances").click(function() {
                $("#avz").show();
                $("#res,#cri,#cali").hide();
            });
            $("#Criterios").click(function() {
                $("#cri").show();
                $("#avz,#res,#cali").hide();
            });
            $("#Calificaciones").click(function() {
                $("#cali").show();
                $("#cri,#avz,#res").hide();
            });
        });
    </script>
</head>

<body class="home">
    <div class="container-fluid display-table">
        <div class="row display-table-row">
            <div class="col-md-2 col-sm-1 hidden-xs display-table-cell v-align box" id="navigation">

                <div class="logo">
                    <h1>Docentes</h1>
                    <a hef="home.html"><img src="assets/img/logo.png" alt="merkery_logo" alt="merkery_logo" class="hidden-xs hidden-sm">
                        <img src="assets/img/logo.png" alt="merkery_logo" class="visible-xs visible-sm circle-logo">
                    </a>

                </div>
                <div class="navi">
                    <ul>
                        <li><a id="Resumen"><i class="fa fa-home" aria-hidden="true"></i>Resumen</a></li>
                        <li><a id="Avances"><i class="fa fa-tasks" aria-hidden="true"></i>Revisión de Avances</a></li>
                        <li><a id="Calificaciones"><i class="fa fa-bar-chart" aria-hidden="true"></i>Calificaciones</a></li>
                        <li><a id="Criterios"><i class="fa fa-tasks" aria-hidden="true"></i>Criterios de Evaluación</a></li>

                    </ul>
                </div>
            </div>
            <div class="col-md-10 col-sm-11 display-table-cell v-align">
                <div class="row">
                    <header id="l1">

                        <div class="col-md-12">
                            <div class="header-rightside">
                                <ul class="list-inline header-top pull-right">


                                    <li>
                                        <a href="#" class="icon-info">
                                            <i class="fa fa-bell" aria-hidden="true" style="color:white"></i>

                                        </a>
                                    </li>
                                    <li class="dropdown">
                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><img src="assets/img/teacher.png" alt="user">
                                            <b class="caret"></b></a>
                                        <ul class="dropdown-menu">
                                            <li>
                                                <div class="navbar-content">
                                                    <span><?php echo $user->getPNombre() . ' ' . $user->getPApellido() ?></span>

                                                    <div class="divider">
                                                    </div>
                                                    <a href="#" data-toggle="modal" data-target="#add_project">Editar perfil</a>

                                                </div>
                                            </li>
                                            <div class="navbar-content">
                                                <li class="tooltips-general exit-system-button" data-href="Database/logout.php" data-placement="bottom" title="Salir del sistema"><a href="Database/logout.php">Salir</a>
                                                    <i class="zmdi zmdi-power"></i>
                                                </li>
                                            </div>
                                        </ul>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </header>
                </div>
                <div id="res">
                    <div class="user-dashboard">
                        <h1> Bienvenido </h1>
                        <div class="panel panel-default">
                            <div class="panel-heading resume-heading">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="col-xs-12 col-sm-2">
                                            <figure>
                                                <img class="img-circle img-responsive" alt="" src="assets/img/teacher.png">
                                            </figure>

                                        </div>
                                        <div class="col-xs-12 col-sm-10">
                                            <div class="col-xs-12 col-sm-6">
                                                <ul class="list-group">
                                                    <li class="list-group-item"><?php echo $user->getPNombre() . ' ' . $user->getSNombre() . ' ' .
                                                                                    $user->getPApellido() . ' ' . $user->getMApellido(); ?></li>
                                                    <li class="list-group-item">Paralelos: <?php $user->ParaleloDocente($userSession->getCurrentUser()); ?></li>
                                                    <li class="list-group-item">Estudiantes: <?php echo $user->getNEstudiantesD() ?> </li>
                                                    <li class="list-group-item"></i> Criterios establecidos: <?php echo $user->getCriteriosD() ?>
                                                    </li>

                                                </ul>
                                            </div>
                                            <div class="col-xs-12 col-sm-6">
                                                <ul class="list-group">
                                                    <li class="list-group-item">Informes por revisar: <?php echo $user->getNAvancesD() ?> </li>
                                                    <li class="list-group-item">Informes revisados: <?php echo $user->getNAvancesRevisadosD() ?></li>
                                                    <li class="list-group-item">Observaciones: <?php echo $user->getNObservacionesD() ?> </li>
                                                    <li class="list-group-item"></i> Avances calificados: <?php echo $user->getNCalifiacionesD() ?>
                                                    </li>

                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="bs-callout bs-callout-danger ">
                                <h4>Ultimas Entradas</h4>
                                <?php $user->AvancesD($userSession->getCurrentUser()); ?>
            </div>
        </div>
    </div>
</div>
<div id="avz" style="display: none">
    <div class="user-dashboard">
        <div class="panel panel-default">
            <div class="bs-callout bs-callout-danger">
                <h4>Avances Monográficos</h4>

                                <?php $user->RevisionD($userSession->getCurrentUser()); ?>
            </div>
        </div>
    </div>
</div>
<div id="cri" style="display: none">
    <div class="user-dashboard">
        <div class="panel-group">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" href="#collapse1">Nuevo criterio para evaluación</a>
                    </h4>
                </div>
                <div id="collapse1" class="panel-collapse collapse">
                    <ul class="list-group">
                        <li class="list-group-item">

                            <form class="form-horizontal" action="Database/SQL/InsertCriterio.php" method="post">
                                    <legend>Critero para evaluación</legend>
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label for="Titulo" class="control-label ">Nombre del
                                                    criterio</label>

                                                <input type="text" class="form-control" id="criterio"name="criterio" placeholder="Criterio">
                                            </div>
                                            
                                            <div class="col-sm-2">
                                            </div>
                                            <div class="col-sm-4">
                                                <!-- File Button http://getbootstrap.com/css/#forms -->
                                                <div class="form-group">
                                                    <label for="Titulo" class="control-label ">Porcentaje</label>

                                                    <input type="text" class="form-control" name="porcentaje" id="porcentaje" placeholder="%">

                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-1"></div>
                                        <div class="col-sm-5">
                                            <!-- Textarea http://getbootstrap.com/css/#textarea -->
                                            <div class="form-group">
                                                <label class="control-label " for="desc">Descripción</label>

                                                <textarea class="form-control" id="desc" name="descripcion" rows=2"></textarea>
                                                <p class="help-block">Descripción del criterio ....
                                                </p>
                                            </div>
                                            <!-- Button Group http://getbootstrap.com/components/#btn-groups -->
                                            <div class="form-group">
                                                <label class="control-label col-sm-2"></label>
                                                <div class="text-center col-sm-10">
                                                    <div id="LimpiarGroup" class="btn-group" role="group" aria-label="">
                                                        <button type="button" id="Limpiar" name="Limpiar" class="btn btn-warning" aria-label="limpiar">Limpiar</button>
                                                        <button type="submit" id="Guardar" name="Guardar" class="btn btn-primary" aria-label="limpiar">Guardar</button>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                            </form>
                        </li>

                    </ul>

                </div>
                <div class="bs-callout bs-callout-danger" style="padding-left:1em;">
                    <h4>Criterios Establecitos</h4>
                    <?php $user->MostrarCriteriosD($userSession->getCurrentUser()); ?>
                </div>
            </div>
        </div>

    </div>
</div>
<div id="cali" style="display: none">
    <div class="user-dashboard">
        <div class="panel panel-default">
            <div class="bs-callout bs-callout-danger">
               
                <div class="row">
                    <div class="col-sm-12">
                    <h4>Paralelos</h4>
                    </div>
                    <div class="col-sm-12">
                    <?php $user->CalifiacionD($userSession->getCurrentUser()); ?>
                    </div>
                </div>
            
            </div>
        </div>
    </div>
</div>
</div>
</div>
</div>
<script>
    $(document).ready(function() {
        $('#tabla_resumen2').DataTable({
            "scrollY": "500px",
            "scrollCollapse": true,
            "paging": false,
            "order": [
                [0, 'desc']
            ]
        });
    });
    $(document).ready(function() {
        $('#tabla_criterios').DataTable({
            "scrollY": "500px",
            "scrollCollapse": true,
            "paging": false,
            "order": [
                [0, 'desc']
            ]
        });
    });
    $(document).ready(function() {
        $('#tabla_rev').DataTable({
            "scrollY": "500px",
            "scrollCollapse": true,
            "paging": false,
            "order": [
                [0, 'desc']
            ]
        });
    });
    $(document).ready(function() {
        $('#tabla_cali').DataTable({
            "scrollY": "500px",
            "scrollCollapse": true,
            "paging": false,
            "order": [
                [0, 'desc']
            ]
        });
    });
</script>

</body>

</html>
