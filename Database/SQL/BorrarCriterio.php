<?php
include 'conexion.php';
$objData = new  Database();


if(isset($_POST['dlteBtn'])){
 $id=$_POST['itemid'];
 $cr=$_POST['crt'];
 echo $cr;
 $sth = $objData->prepare("SELECT idNotas from Notas Where Criterio = '$cr'");
 $sth->execute();
 foreach ( $sth as $currentUser) {
     $idC =$currentUser['idNotas'];
     echo$idC;
    $sth1 = $objData->prepare("DELETE FROM Notas WHERE (idNotas = $idC)");
    $sth1->execute();
 }
 $sth2 = $objData->prepare('DELETE FROM criterios WHERE (idCriterio ='.$id.' )');
 $sth2->execute();
 }


header('location: ../../index.php');
?>