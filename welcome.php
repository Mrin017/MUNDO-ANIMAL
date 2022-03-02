<?php 
session_start();
if(isset($_POST['cerrarSesion'])){
    unset($_SESSION['usuario']);
    header('Location: index.php');
}
?>

<?php if(isset($_SESSION['usuario'])) { ?>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inicio</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="css/Index.css">
</head>

<body>
    <header class="main-header">
        <div class="container">
            <div class="row mt-3 justify-content-md-center">
                <div class="col-md-6">
                    <h1>Hola, bienvenido</h1>
                </div>

            </div>
            <nav class="navbar navbar-expand-lg main-nav px-0">
                <a class="navbar-brand" href="welcome.php"><img src="images/MundoAnimal.png" alt=""></a>

                <div class="navbar-collapse" id="mainMenu">
                    <ul class="navbar-nav ml-auto text-uppercase">
                        <li>
                            <a href="welcome.php">Inicio</a>
                        </li>
                        <li>
                            <a href="Alimentos.php">Alimentos</a>
                        </li>
                        <li>
                            <a href="Medicinas.php">Medicinas</a>
                        </li>
                        <li>
                            <a href="Accesorios.php">Accesorios</a>
                        </li>
                    </ul>
                </div>
                <form action="" method="POST">
                    <button type="submit" class="btn btn-primary btn-block" name="cerrarSesion"> Cerrar Sesion </button>
                </form>
            </nav>
        </div>
    </header>
</body>

</html>

<?php }else{ 
    header('Location: index.php');
 } ?>