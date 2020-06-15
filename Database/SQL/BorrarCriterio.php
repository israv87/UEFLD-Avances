<?php
include'conexion.php';
include'../Sesion.php';
include'../user.php';
$objData = new  Database();
$userSession = new UserSession();
$user = new User();
$user->setUserDocente($userSession->getCurrentUser());
$us=$userSession->getCurrentUser();
if(isset($_POST['dlteBtn'])){
 $id=$_POST['itemid'];
 $sth1 = $objData->prepare('DELETE FROM criterios WHERE (idCriterio ='.$id.' )');
 }
 $sth1->execute();
header('location: ../../index.php');
?>