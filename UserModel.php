<?php 

    class User extends Database{

        public function getUser($documento_u, $clave_u){
            $sql = "SELECT * FROM usuario WHERE documento_u = '$documento_u' AND clave_u ='$clave_u'";

            $result = $this->connect()->query($sql);

            $numRows = $result->num_rows;
            if($numRows == 1){
                return true;
            }

            return false;
        }

    }