<?php

include'conexion.php';

$objData = new  Database();

$idAvance = $_GET['idAv'];

$sth1 = $objData->prepare('SELECT * from avances where idAvance =:idav');          
$sth1->bindParam(':idav', $idAvance);
$sth1->execute();

foreach ($sth1 as $currentUser) {

  $pdf = $currentUser['nombreArchivo'];
  $path = $currentUser['directorio'];
  $date = $currentUser['Fecha'];
  $file = $path.'/'.$pdf;
  echo $file;
}
header('Content-type: application/pdf'); 
header('Content-Disposition: inline; filename="'.$file.'"'); 
header('Content-Transfer-Encoding: binary'); 
header('Accept-Ranges: bytes'); 
@readfile($file);  

?>