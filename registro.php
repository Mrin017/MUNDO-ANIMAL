<?php 

include 'Database/Db.php';
include 'RegistroModel.php';
include 'RegistroController.php';

?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registrarse</title>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="css/Index.css">
</head>

<body>
    <header class="main-header">
        <div class="container">
            <nav class="navbar navbar-expand-lg main-nav px-0">
                <a class="navbar-brand" href="registro.php"><img src="img/MundoAnimal.png" alt=""></a>

                <div class="navbar-collapse" id="mainMenu">
                    <ul class="navbar-nav ml-auto text-uppercase">
                        <li>
                            <a href="index.php">Iniciar Sesion</a>
                        </li>

                    </ul>
                </div>
            </nav>
        </div>
    </header>

    <body class="my-login-page">
        <section class="h-100">
            <div class="container h-100">
                <div class="row justify-content-md-center h-100">
                    <div class="card-wrapper">
                        <div class="card fat">
                            <div class="card-body">

                                <h4 class="card-title">Registrarse</h4>

                                <form method="POST" class="my-login-validation formulario" id="formulario">

                                    <div class="form-group">
                                        <label for="documento_u">Documento</label>
                                        <input type="number" class="form-control" name="documento_u">
                                    </div>

                                    <div class="form-group">
                                        <label for="nombre_u">Nombre</label>
                                        <input type="text" class="form-control" name="nombre_u">
                                    </div>

                                    <div class="form-group">
                                        <label for="apellido_u">Apellido</label>
                                        <input type="text" class="form-control" name="apellido_u">
                                    </div>

                                    <div class="form-group">
                                        <label for="telefono_u">Telefono</label>
                                        <input type="number" class="form-control" name="telefono_u">
                                    </div>

                                    <div class="form-group">
                                        <label for="direccion_u">Direccion</label>
                                        <input type="text" class="form-control" name="direccion_u">
                                    </div>

                                    <div class="form-group">
                                        <label for="correo_u">Correo</label>
                                        <input type="text" class="form-control" name="correo_u">
                                    </div>

                                    <div class="form-group">
                                        <label for="clave_u">Contraseña</label>
                                        <input type="password" class="form-control" name="clave_u">
                                    </div>

                                    <div class="form-group m-0">
                                        <button type="submit" name="submit" class="btn btn-primary btn-block">
                                            Registrarse
                                        </button>
                                    </div>

                                    <div class="mt-4 text-center">
                                        Ya tienes cuenta? <a href="index.php">Iniciar sesion</a>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="footer">
                            Copyright &copy; 2021 &mdash; Mundo Animal
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>

</html>