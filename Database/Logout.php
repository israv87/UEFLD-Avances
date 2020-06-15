<?php
    include_once 'sesion.php';
    $userSession = new UserSession();
    $userSession->closeSession();
    header("location: ../index.php");
?>