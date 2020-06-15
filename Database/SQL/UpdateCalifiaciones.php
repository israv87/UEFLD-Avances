<?php
//nos conectamos a la BD`
include'conexion.php';

$objData = new  Database();
$cod = $_POST['selectAvance'];
$str = substr($cod, 0, 4);
$nota = $_POST['nota'];

$sth1 = $objData->prepare("UPDATE avances SET NotaTotal=:nota  WHERE idAvance=$str");     
$sth1->bindParam(':nota',$nota );     
$sth1->execute();


header('location: ../../index.php');
?>