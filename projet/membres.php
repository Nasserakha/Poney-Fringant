<?php
    session_start();
    require_once 'config.php';
    require_once 'pagination.php';

    $rqt = $bdd->prepare('SELECT DISTINCT pseudo, prenom, nom, date_adhesion FROM Adherents');
    $rqt->execute();

    $resultat = $rqt->fetchAll(PDO::FETCH_ASSOC);   
?>    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/style.css">
    <title>connexion</title>
</head>
<body>

    <h2>Liste des members</h2>
    <nav>
        <div class="nav-container">
            <ul>
                <li><a href="accueil.php"><img id="logo" src="assets/profil/donkey.png" alt="logo"></a></li>
                <li><a href="monprofil.php">Mon profil</a></li>
                <li><a href="membres.php">Members</a></li>
                <li><a href="stats.php">Stats</a></li>
                <li><a href="logout.php"><input type="button" value="Déconnexion"></a></li>
            </ul>
        </div>
    </nav>


        <?php foreach ($resultat as $result): ?>

        <section class="cartemembre">
        <img class="avatar" src=
        <?php $prenom = $result['prenom'];
        $nom = $result['nom'];
        $url = "https://avatar.oxro.io/avatar.png?name=".$prenom."+".$nom."&background=a78225&bold=true";
        echo $url;
        ?>>
        <ul>
        <li>Pseudo: <?php echo $result['pseudo']?></li>
        <li>Prénom: <?php echo $result['prenom']?></li>
        <li>Nbrs de jours depuis adhésion: 
        <?php 
        
        $result['date_adhesion'];
        //trouver le nb de jours depuis l'ahdésion
        $dateadh = strtotime($result['date_adhesion']);   //date de la BDD (à l'inscription) en timestamp
        $datetoday = strtotime(date("Y-m-d H:i:s"));        //date du jour en timestamp

        $nbofdaysTimestamp = $datetoday - $dateadh;         //on soustrait les deux dates
        $nbofdays = $nbofdaysTimestamp/86400;               //on divise timestamp / 86400: 60s x 60m x 24h

        echo intval($nbofdays);                              //on convertis le résultat en nb entier      
        ?>
        </li>       
        </ul>
        </section>

        <?php endforeach ?>


        <div>
        
        <button class="button" onclick="firstPage()">| < </button>
        <button class="button" onclick="previousPage()"> < </button>
        <button class="button" onclick="nextPage()"> > </button>
        <button class="button" onclick="lastPage()"> > | </button>


        </div>

 
<script src="./js/main.js"></script>
</body>

</html>