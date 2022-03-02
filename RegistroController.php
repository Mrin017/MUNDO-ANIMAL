<?php 

if(isset($_POST['submit'])){

    $documento_u=$_POST['documento_u'];
	$nombre_u=$_POST['nombre_u'];
    $apellido_u=$_POST['apellido_u'];
	$telefono_u=$_POST['telefono_u'];
	$direccion_u=$_POST['direccion_u'];
    $correo_u=$_POST['correo_u'];
    $clave_u=$_POST['clave_u'];

    if(empty($documento_u) || empty($nombre_u) || empty($apellido_u) || empty($telefono_u) || empty($direccion_u) || empty($correo_u) || empty($clave_u)){
        echo '<div class="alert alert-danger">Complete los campos</div>';
    }else{
        $registro = new Registro;

        if($registro->insertRegistro($documento_u,$nombre_u,$apellido_u,$telefono_u,$direccion_u,$correo_u,$clave_u,$clave_u)){
            //session_start();
            //$_SESSION['usuario'] = $documento_u;
            //header('Location: index.php');
        }else{
         echo '<div class="alert alert-danger">Usuario registrado correctamente</div>';
        }
    }

}   