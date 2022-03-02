<?php 

    if(isset($_POST['submit'])){
        $documento_u = $_POST['documento_u'];
        $clave_u = $_POST['clave_u'];

        if(empty($documento_u) || empty($clave_u)){
            echo '<div class="alert alert-danger">Documento o contraseña vacio</div>';
        }else{
            $user = new User;

            if($user->getUser($documento_u,$clave_u)){
                session_start();
                $_SESSION['usuario'] = $documento_u;
                header('Location: welcome.php');
            }else{
             echo '<div class="alert alert-danger">Este usuario no existe</div>';
            }
        }

    }   