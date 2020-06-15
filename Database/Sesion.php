<?php
class UserSession{//Creamos una clase apra la sesion
    public function __construct(){
        session_start();//iniciamos la sesion
    }
    public function setCurrentUser($user){
        $_SESSION['user'] = $user;//asiganamos la sesion con el nombre del usuario que se logeó a la variable $user
    }
    public function getCurrentUser(){
        return $_SESSION['user'];//obtenemos la sesion
    }
    public function closeSession(){
        session_unset();//Eliminamos la
        session_destroy();
    }
}
?>