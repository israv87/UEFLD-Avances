<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Unidad Educativa Fiscomisional La Dolorosa</title>
    <link href="assets/css/login.css" rel="stylesheet">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" rel="stylesheet" />
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <div class="card">
                    <form class="box" action="" method="post">
                        <?php
                            if(isset($errorLogin)){
                                echo $errorLogin;
                            }
                        ?>
                        <h2>Formulario de Ingreso</h2>
                        <p class="text-muted">Por favor ingrese su usuario y contraseña!</p>
                        <input type="text" name="username" placeholder="Usuario" />
                        <input type="password" name="password" placeholder="Contraseña" />

                        <input type="submit" value="Login" href="#" />

                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>