<?php
/*llamamos a user.php para validar los datos del login.
Sesion apra iniciar una sesión con losdatos delsusuario logueado
*/
include_once 'Database/user.php';
include_once 'Database/Sesion.php';
//Definimos variables de suaurio y sesion apra guardar los datos de los mismos
$userSession = new UserSession();
$user = new User();
//verificamos si hay sesion
if(isset($_SESSION['user'])){
    //echo "hay sesion";   
    $user->setUserEstudiante($userSession->getCurrentUser());
    $user->setUserDocente($userSession->getCurrentUser());
// si el usuario ya ha iniciado sesion se verifica que rol tiene  y se redirige al modulo correspondiente
    if($user->getRol()==1){
        include_once 'Internas/Estudiante.php';
    }else if($user->getRol()==2){
        include_once 'Internas/Docente.php';
    }
  
// si no hay sesion verificamoms los datos del suaurio
}else if(isset($_POST['username']) && isset($_POST['password'])){
    
    $userForm = $_POST['username'];//datos que ingresa el usuario en el formulario
    $passForm = $_POST['password'];

    $user = new User();
    if($user->userExists($userForm, $passForm)){
        //echo "Existe el usuario";
        
        $userSession->setCurrentUser($userForm);
        $user->setUserEstudiante($userSession->getCurrentUser());
        $user->setUserDocente($userSession->getCurrentUser());
  //dependiendo del rol q tenga el usuario llamamos a los módulos  
        if($user->getRol()==1){
            include_once 'Internas/Estudiante.php';
        }else if($user->getRol()==2){
            include_once 'Internas/Docente.php';
        }

    }else{
        //echo "No existe el usuario";
        $errorLogin = "Nombre de usuario y/o password incorrecto";
        include_once 'Database/login.php';
    }
}else{
    //echo "login";
    include_once 'Database/login.php';
   
}
?>