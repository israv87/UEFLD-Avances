<?php
//nos conectamos a la BD`
include'conexion.php';
include'../Sesion.php';
include'../user.php';

$objData = new  Database();
$userSession = new UserSession();
$user = new User();

$user->setUserDocente($userSession->getCurrentUser());
$us=$userSession->getCurrentUser();


$sth1 = $objData->prepare('INSERT INTO criterios ( Criterio, Descripcion, Porcentaje, idDocente) 
                            VALUES (:criterio,:descripcion,:porcentaje,(
                            select Cod_docente from docente, usuarios where idUsuarioD = idUsuarios and usuario= :us))');
$criterio = $_POST['criterio'];
$descripcion = $_POST['descripcion'];
$porcentaje = $_POST['porcentaje'];

$sth1->bindParam(':criterio', $criterio);
$sth1->bindParam(':porcentaje', $porcentaje);
$sth1->bindParam(':descripcion', $descripcion);
$sth1->bindParam(':us', $us);
$sth1->execute();


header('location: ../../index.php');
?>