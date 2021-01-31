<?php

require_once 'config.php';

$rqtPagination = $bdd->prepare('SELECT adherentID FROM Adherents');
$rqtPagination->execute();

$resultats = $rqtPagination->fetchAll(PDO::FETCH_ASSOC);  

$nbMembres = count($resultats);
$nbPerPage = 50;
$nbPages = ceil($nbMembres / $nbPerPage);



echo $nbPages;

/*

if(isset($_GET['page'])&& !empty($_GET['page'])){
    $currentPage = (int) strip_tags($_GET['page']); 
}else {
    $currentPage = 1;
}

