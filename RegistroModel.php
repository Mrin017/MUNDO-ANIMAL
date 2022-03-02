<?php 

    class Registro extends Database{

        public function insertRegistro($documento_u, $nombre_u, $apellido_u, $telefono_u, $direccion_u, $correo_u, $clave_u){
            $sql = "INSERT INTO usuario(documento_u,nombre_u,apellido_u,telefono_u,direccion_u,correo_u,clave_u) VALUES ('$documento_u','$nombre_u','$apellido_u','$telefono_u','$direccion_u','$correo_u','$clave_u')";

            $result = $this->connect()->query($sql);
            
            /*$numRows = $result->num_rows;
            if($numRows == 1){
                return false;
            }
            return true;
        */}
    }