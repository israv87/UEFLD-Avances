<?php
//nos conectamos a la BD`
include'conexion.php';

$objData = new  Database();
$cod = $_POST['selectAvance'];
$str = substr($cod, 0, 4);
$nota = $_POST['nota'];
$codEst= $_POST['codEstudiante'];

$sth1 = $objData->prepare("UPDATE avances SET NotaTotal=:nota  WHERE idAvance=$str");     
$sth1->bindParam(':nota',$nota );     
$sth1->execute();

$sth6 = $objData->prepare("SELECT AVG(NotaTotal) as'promedio' from avances where idEstudiante =:idEst");     
$sth6->bindParam(':idEst', $codEst);    
$sth6->execute(); 

foreach ($sth6 as $currentUser) {   
$promedio = $currentUser['promedio'];

$sth7 = $objData->prepare("UPDATE calificaciones SET Calificacion = :promedio where idEstudianteC =:idEst");     
$sth7->bindParam(':idEst', $codEst);    
$sth7->bindParam(':promedio', $promedio );  
$sth7->execute(); 
}
echo $promedio;
header('location: ../../index.php');
?>