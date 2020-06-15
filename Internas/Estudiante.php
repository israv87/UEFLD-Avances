<?php
/*Instanciamos los datos del usuario mediante la variable $userSession
que obtiene los datos de la sesion actual apuntanto a get current user
que es la funcion que obtiene los datos del usuario actual, 
el mas improtante de ellos la varible user que es laque usamos para comparar
la consulta sql con el usuario al que estamos buscando
*/
$user->SetResumen1($userSession->getCurrentUser()); //Paralelo, Profesor, Proyecto
$user->SetInformesE($userSession->getCurrentUser()); //Informes
$user->SetObservacionesE($userSession->getCurrentUser()); //Observaciones
$user->SetCalificacionesE($userSession->getCurrentUser()); //Califiaciones
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
<script>
    $(document).ready(function() {
        $("#Resumen").click(function() {
            $("#res").show();
            $("#avz,#cali").hide();
        });
        $("#Avances").click(function() {
            $("#avz").show();
             $("#res,#cali").hide();
        });
        $("#Calificaciones").click(function() {
            $("#cali").show();
            $("#avz,#res").hide();
        });
    });
</script>
</head>

<body>

    <body class="home">
        <div class="container-fluid display-table">
            <div class="row display-table-row">
                <div class="col-md-2 col-sm-1 hidden-xs display-table-cell v-align box" id="navigation">
                    <div class="logo">
                        <h1>Estudiantes</h1>
                        <a hef="home.html"><img src="assets/img/logo.png" alt="merkery_logo" alt="merkery_logo" class="hidden-xs hidden-sm">
                            <img src="assets/img/logo.png" alt="merkery_logo" class="visible-xs visible-sm circle-logo">
                        </a>
                    </div>
                    <div class="navi">
                        <!-- Menú lateral -->
                        <ul>
                            <li><a id="Resumen"><i class="fa fa-home" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Resumen</span></a></li>
                            <li><a id="Avances"><i class="fa fa-tasks" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Avances</span></a></li>
                            <li><a id="Calificaciones"><i class="fa fa-bar-chart" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Calificaciones</span></a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-10 col-sm-11 display-table-cell v-align">
                    <div class="row">
                        <!-- Menu superior con funcion apra deslogearse -->
                        <header id="l1">
                            <div class="col-md-12">
                                <div class="header-rightside">
                                    <ul class="list-inline header-top pull-right">
                                        <li>
                                        </li>
                                        <li class="dropdown">
                                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><img src="assets/img/sev1.jpg" alt="user">
                                                <b class="caret"></b></a>
                                            <ul class="dropdown-menu">
                                                <li>
                                                    <div class="navbar-content">
                                                        <span><?php echo $user->getPNombre() . ' ' . $user->getPApellido() ?></span>

                                                        <div class="divider">
                                                        </div>
                                                        <!-- Se muetsra un modal con un formulario para cambiar datos del perfil-->
                                                        <a href="#" data-toggle="modal" data-target="#add_project">Editar perfil</a>
                                                    </div>
                                                </li>
                                                <div class="navbar-content">
                                                    <!-- Al hacer clic ens alir se llama la pagina logout.php y se destruye la sesion-->
                                                    <li class="tooltips-general exit-system-button" data-href="Database/logout.php" 
                                                    data-placement="bottom" title="Salir del sistema">
                                                    <a href="Database/logout.php">Salir</a>
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
                    <!------------------------SECCION RESUMEN------------------------------>
                    <div id="res">
                        <div class="user-dashboard">
                            <h1> Bienvenido </h1>
                            <div class="panel panel-default">
                                <div class="panel-heading resume-heading">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="col-xs-12 col-sm-2">
                                                <figure>
                                                    <img class="img-circle img-responsive" alt="" src="assets/img/sev1.jpg">
                                                </figure>
                                            </div>
                                            <div class="col-xs-12 col-sm-10">
                                                <div class="col-xs-12 col-sm-6">
                                                    <ul class="list-group">
                                                        <!-- presentamos las variables que obtuvimos de la base de datos -->
                                                        <li class="list-group-item"><?php echo $user->getPNombre() . ' ' . $user->getSNombre() . ' ' .
                                                                                        $user->getPApellido() . ' ' . $user->getMApellido(); ?></li>
                                                        <li class="list-group-item">Paralelo: "<?php echo $user->getParaleloE() ?>"</li>
                                                        <li class="list-group-item">Profesor: <?php echo $user->getProfesorE() ?> </li>
                                                        <li class="list-group-item"></i> Tema: <?php echo $user->getProyectoE() ?></li>
                                                    </ul>
                                                </div>
                                                <div class="col-xs-12 col-sm-6">
                                                    <ul class="list-group">
                                                        <li class="list-group-item">Informes entregados : <?php echo $user->getInformesE() ?></li>
                                                        <li class="list-group-item">Observaciones: <?php echo $user->getObservacionesE() ?></li>
                                                        <li class="list-group-item">Documentos Validados: <?php echo $user->getObservacionesE() ?> </li>
                                                        <li class="list-group-item"></i> Calificaciones: <?php echo $user->getCalificacionesE() ?></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="bs-callout bs-callout-danger">
                                    <h4>Últimas Entradas</h4>
                                    <?php $user->AvancesResumen($userSession->getCurrentUser()); ?>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!------------------------SECCION AVANCES------------------------------>
                    <div id="avz" style="display: none;">
                        <div class="user-dashboard">
                            <div class="panel-group">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" href="#collapse10000"> <button type="button" class="btn btn-success">Nuevo Avance Monográfico</button></a>
                                        </h4>
                                    </div>
                                    <div id="collapse10000" class="panel-collapse collapse">
                                        <ul class="list-group">
                                            <li class="list-group-item">
                                             <?php
                                            include 'Database/SQL/conexion.php';
                                            $objData = new  Database();
                                         
                                            if (isset($_POST['subir'])) {
                                                //declare variables
                                                $archivo= $_FILES['archivo']['tmp_name'];
                                                $nombreArchivo = $_FILES['archivo']['name'];
                                                $archivo = base64_encode(file_get_contents(addslashes($archivo)));
                                                $sth1 = $objData->prepare("INSERT INTO `avances`(`nombreArchivo`, `Archivo`) 
                                                VALUES ('$nombreArchivo','$archivo')");
                                                 $sth1->execute();
                                                 $sth2 = $objData->prepare('UPDATE avances 
                                                 SET Titulo = :titulo , Descripcion = :descripcion, Fecha =:fecha 
                                                 WHERE idAvance = (SELECT max(idAvance) FROM avances)');
                                                    $titulo= $_POST['titulo'];
                                                    $descripcion = $_POST['descripcion'];
                                                    $fecha = $_POST['fecha'];
                                                    $sth2->bindParam(':titulo', $titulo);
                                                    $sth2->bindParam(':descripcion', $descripcion);
                                                    $sth2->bindParam(':fecha', $fecha);
                                                    $sth2->execute();
                                                    $user->UpdateAvanceEst($userSession->getCurrentUser());
                                        }
                                            ?>   
                                                <form class="form-horizontal" method="post" action="" enctype="multipart/form-data" >
                                                        <legend>Avance Monográfico</legend>
                                                        <div class="row">
                                                            <div class="col-sm-6">
                                                                <div class="form-group">
                                                                    <label for="Titulo" class="control-label col-sm-2">Titulo</label>
                                                                    <div class="col-sm-10" style="display: block;">
                                                                        <input type="text" class="form-control" name="titulo" id="titulo" placeholder="Titulo">
                                                                        <p class="help-block">Avance semana...</p>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="fecha" class="control-label col-sm-2">Fecha</label>
                                                                    <div class="col-sm-10">
                                                                        <input type="date" class="form-control" name="fecha" id="fecha" placeholder="">
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label col-sm-2">Archivo</label>
                                                                    <div class="col-sm-10">
                                                                        <input type="file" name="archivo">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-6">
                                                                <div class="form-group">
                                                                    <label class="control-label col-sm-2" for="descripcion">Descripción</label>
                                                                    <div class="col-sm-10">
                                                                        <textarea class="form-control" id="descripcion" name="descripcion" rows="7"></textarea>
                                                                        <p class="help-block">Avance monográfico semana ....
                                                                        </p>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="control-label col-sm-2"></label>
                                                                    <div class="text-center col-sm-10">
                                                                        <div id="LimpiarGroup" class="btn-group" role="group" aria-label="">
                                                                            <button type="button" id="Limpiar" name="Limpiar" class="btn btn-warning" aria-label="limpiar">limpiar</button>
                                                                            <button type="subir"  name="subir" class="btn btn-primary" aria-label="subir">enviar</button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                </form>
                                            </li>
                                        </ul>
                                        <div class="panel-footer">Nuevo Avance Monográfico</div>
                                    </div>
                                    <div class="bs-callout bs-callout-danger">
                                        <h4>Avances</h4>
                                        <?php $user->AvancesResumen($userSession->getCurrentUser()); ?>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                 
                   
                    <!------------------------SECCION CALIFICACION------------------------------>
                    <div id="cali" style="display: none;">
                        <div class="user-dashboard">
                            <div class="panel-group">
                                <div class="panel panel-default">
                                 <?php $user-> CalificacionesEstudiante($userSession->getCurrentUser()); ?>
                                </div>
                            </div>
                            <div class="panel-group">
                                <div class="panel panel-default">
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal -->
        <div id="add_project" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header login-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Editar Perfil</h4>
                    </div>
                    <div class="text-center">
                        <img src="http://ssl.gstatic.com/accounts/ui/avatar_2x.png" class="avatar img-circle img-thumbnail" alt="avatar">
                        <h6>Upload a different photo...</h6>
                        <input type="file" class="text-center center-block file-upload">
                    </div>
                    <div class="modal-body">
                        <form class="form" action="##" method="post" id="registrationForm">
                            <div class="form-group">
                                <div class="col-xs-6">
                                    <label for="first_name">
                                        <h4>First name</h4>
                                    </label>
                                    <input type="text" class="form-control" name="first_name" id="first_name" placeholder="first name" title="enter your first name if any.">
                                </div>
                            </div>
                            <div class="form-group">

                                <div class="col-xs-6">
                                    <label for="last_name">
                                        <h4>Last name</h4>
                                    </label>
                                    <input type="text" class="form-control" name="last_name" id="last_name" placeholder="last name" title="enter your last name if any.">
                                </div>
                            </div>
                            <div class="form-group">

                                <div class="col-xs-6">
                                    <label for="phone">
                                        <h4>Phone</h4>
                                    </label>
                                    <input type="text" class="form-control" name="phone" id="phone" placeholder="enter phone" title="enter your phone number if any.">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-6">
                                    <label for="mobile">
                                        <h4>Mobile</h4>
                                    </label>
                                    <input type="text" class="form-control" name="mobile" id="mobile" placeholder="enter mobile number" title="enter your mobile number if any.">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-6">
                                    <label for="email">
                                        <h4>Email</h4>
                                    </label>
                                    <input type="email" class="form-control" name="email" id="email" placeholder="you@email.com" title="enter your email.">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-6">
                                    <label for="email">
                                        <h4>Location</h4>
                                    </label>
                                    <input type="email" class="form-control" id="location" placeholder="somewhere" title="enter a location">
                                </div>
                            </div>
                            <div class="form-group">

                                <div class="col-xs-6">
                                    <label for="password">
                                        <h4>Password</h4>
                                    </label>
                                    <input type="password" class="form-control" name="password" id="password" placeholder="password" title="enter your password.">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-6">
                                    <label for="password2">
                                        <h4>Verify</h4>
                                    </label>
                                    <input type="password" class="form-control" name="password2" id="password2" placeholder="password2" title="enter your password2.">
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="cancel" data-dismiss="modal">Cerrar</button>
                        <button type="button" class="add-project" data-dismiss="modal">Guardar</button>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <script type="text/javascript">
        $(document).ready(function() {
            $('[data-toggle="offcanvas"]').click(function() {
                $("#navigation").toggleClass("hidden-xs");
            });
        });
    </script>
</body>

</html>