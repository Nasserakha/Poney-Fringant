<?php 
    try 
    {
        $bdd = new PDO("mysql:host=localhost;dbname=poneyfringant;", "poneysh", "Poneyshfringant");
    }
    catch(Exception $e)
    {
        die('Erreur : '.$e->getMessage());
    }
