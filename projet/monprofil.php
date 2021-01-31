<?php
    session_start();
    require_once 'config.php';
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

    <h2>Mon Profil</h2>
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

<section id="section">
    
    <table class="tableinfos">

        <?php
        $prenom = $_SESSION['prenom'];
        $nom = $_SESSION['nom'];
        $url = "https://avatar.oxro.io/avatar.png?name=".$prenom."+".$nom."&background=a78225&caps=3&bold=true";
        ?>
        <img class="avatar" src=<?php echo $url;?>>
        <tr>
            <td>Numéro adhérent:</td>
            <td><?php echo $_SESSION['adherentID']; ?></td>
        </tr>
        <tr>
            <td>Pseudo:</td>
            <td><?php echo $_SESSION['pseudo']; ?></td>
        </tr>
        <tr>
            <td>Prénom::</td>
            <td><?php echo $_SESSION['prenom']; ?></td>
        </tr>
        <tr>
            <td>Nom:</td>
            <td><?php echo $_SESSION['nom']; ?></td>
        </tr>
        <tr>
            <td>Email:</td>
            <td><?php echo $_SESSION['email']; ?></td>
        </tr>
        <tr>
            <td>Téléphone:</td>
            <td><?php echo $_SESSION['numero']; ?></td>
        </tr>
        <tr>
            <td>Adresse:</td>
            <td><?php echo $_SESSION['adresse1']; ?></td>
        </tr>
        <tr>
            <td>Code Postale:</td>
            <td><?php echo $_SESSION['zip']; ?></td>
        </tr>
        <tr>
            <td>Ville:</td>
            <td><?php echo $_SESSION['ville']; ?></td>
        </tr>
        <tr>
            <td>Adherent depuis:</td>
            <td><?php 
            // on récupère le nb de jours d'adhésion : démarche expliquée dans membres.php 
            $dateadh = strtotime($_SESSION['date_adhesion']);
            $datetoday = strtotime(date("Y-m-d H:i:s"));

            $nbofdaysTimestamp = $datetoday - $dateadh;
            $nbofdays = $nbofdaysTimestamp/86400;

            echo intval($nbofdays);


            ?></td>
        </tr>
        <tr>
            <td>Mes centres d'intérêts:</td>
            <td>
                <?php
                $adhnum = $_SESSION['adherentID'];
                $rqt = $bdd->prepare('SELECT DISTINCT nom_interet FROM Interets LEFT JOIN InteretAdherent ON Interets.interetID = InteretAdherent.interetID WHERE InteretAdherent.adherentID = "'.$adhnum.'"');
                $rqt->execute();

                $resultat = $rqt->fetchAll(PDO::FETCH_ASSOC);
                
                $nbresultat = count($resultat);

                foreach($resultat as $result)
                {
                    echo "<br>".$result[nom_interet];
                }
                ?>
            
            </td>
        </tr>
    </table>
 
<script src="./js/main.js"></script>
</body>

</html>