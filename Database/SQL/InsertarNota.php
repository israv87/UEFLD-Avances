<?php
include'conexion.php';

$objData = new  Database();

$obsrevacion = $_POST['observacion'];
$nota = $_POST['nota'];
$criterio= $_POST['selectCriterios'];
$idAvance = $_POST['idAv'];
$idEstudiante = $_POST['idEst'];

$sth1 = $objData->prepare('INSERT INTO observaciones (observacion,idAvanceFKO)
                            VALUES(:observacion,:idav)');          
$sth1->bindParam(':idav', $idAvance);
$sth1->bindParam(':observacion', $obsrevacion);
$sth1->execute();

$sth2 = $objData->prepare('INSERT INTO notas (idAvanceFKN,Criterio,notaPorcentaje)
                            VALUES(:idav,:criterio,:nota)');          
$sth2->bindParam(':nota', $nota);
$sth2->bindParam(':idav', $idAvance);
$sth2->bindParam(':criterio', $criterio);
$sth2->execute();

$sth3 = $objData->prepare("UPDATE avances SET Estado='Revisado' WHERE idAvance=:idav");     
$sth3->bindParam(':idav', $idAvance);     
$sth3->execute();

$sth4 = $objData->prepare("SELECT SUM(notaPorcentaje) as 'suma' from notas where idAvanceFKN =:idav");     
$sth4->bindParam(':idav', $idAvance);     
$sth4->execute(); 

foreach ($sth4 as $currentUser) {   
$suma = $currentUser['suma'];

$sth5 = $objData->prepare("UPDATE avances SET NotaTotal = :suma where idAvance =:idav");     
$sth5->bindParam(':idav', $idAvance);    
$sth5->bindParam(':suma', $suma);  
$sth5->execute(); 
}

$sth6 = $objData->prepare("SELECT AVG(NotaTotal) as'promedio' from avances where idEstudiante =:idEst");     
$sth6->bindParam(':idEst', $idEstudiante);    
$sth6->execute(); 

foreach ($sth6 as $currentUser) {   
$promedio = $currentUser['promedio'];

$sth7 = $objData->prepare("UPDATE calificaciones SET Calificacion = :promedio where idEstudianteC =:idEst");     
$sth7->bindParam(':idEst', $idEstudiante);    
$sth7->bindParam(':promedio', $promedio );  
$sth7->execute(); 
}


header('location: ../../index.php');
?>   
