<?php 
session_start();
    if(isset($_SESSION['usuario'])){
        header('Location: welcome.php');
    }

include 'Database/Db.php';
include 'UserModel.php';
include 'UserController.php';

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Iniciar Sesion</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="css/Index.css">
</head>

<body class="my-login-page">
    <header class="main-header">
        <div class="container">
            <nav class="navbar navbar-expand-lg main-nav px-0">
                <a class="navbar-brand" href="index.php"><img src="img/MundoAnimal.png" alt=""></a>

                <div class="navbar-collapse" id="mainMenu">
                    <ul class="navbar-nav ml-auto text-uppercase">
                        <li>
                            <a href="registro.php">Registrarse</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
    </header>
    <section class="h-100">
        <div class="container h-100">
            <div class="row justify-content-md-center h-100">
                <div class="card-wrapper">
                    <div class="card fat">
                        <div class="card-body">

                            <h4 class="card-title">Iniciar Sesion</h4>

                            <form action="" method="POST" class="my-login-validation">

                                <div class="form-group">
                                    <label for="documento_u">Documento</label>
                                    <input class="form-control" name="documento_u" type="number" placeholder="Documento">
                                </div>

                                <div class="form-group">
                                    <label for="clave_u">Contraseña</label>
                                    <input class="form-control" name="clave_u" type="password">
                                </div>

                                <div class="form-group m-0">
                                    <button type="submit" name="submit" class="btn btn-primary btn-block">
                                        Iniciar sesion
                                    </button>
                                </div>

                                <div class="mt-4 text-center">
                                    No tienes una cuenta? <a href="registro.php">Crea una</a>
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