<?php
include'conexion.php';
include'../Sesion.php';
include'../user.php';
  
$objData = new  Database();
$userSession = new UserSession();
$user = new User();

$user->setUserDocente($userSession->getCurrentUser());
$us=$userSession->getCurrentUser();



$sth = $objData->prepare('SELECT max(id_documento) FROM tbl_documentos');
$idD=$sth->execute();



$sth1 = $objData->prepare('INSERT INTO avances ( Titulo, Descripcion, Fecha) VALUES (:titulo,:descripcion,:fecha)');

$titulo= $_POST['titulo'];
$descripcion = $_POST['desc'];
$fecha = $_POST['fecha'];

$sth1->bindParam(':titulo', $titulo);
$sth1->bindParam(':descripcion', $desc);
$sth1->bindParam(':fecha', $fecha);
$sth1->execute();



header('location: ../../index.php');
?>   
