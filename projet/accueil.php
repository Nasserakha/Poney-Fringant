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

    <section class="header">
    <h1>Bienvenue au Poney Fringant</h1>
   
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

</section>

</body>

</html>