<?php
    session_start();
    require_once 'config.php';

    $rqt = $bdd->prepare('SELECT DISTINCT pseudo, prenom, nom, date_adhesion FROM Adherents');
    $rqt->execute();

    $resultat = $rqt->fetchAll(PDO::FETCH_ASSOC);   

    //INTERETS
    $rqt2 = $bdd->prepare('SELECT ALL interetID FROM InteretAdherent');
    $rqt2->execute();

    $resultat2 = $rqt2->fetchAll(PDO::FETCH_ASSOC);


?>    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/style.css">
    <title>connexion</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
</head>
<body>

    <h2>Stats</h2>
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
    <h2>Nb de personne / centre d'interet</h2>
    <div style="width: 50%"> 
    <canvas id="myChart"></canvas>
    </div>

    <script>
        Chart.defaults.global.title.display = true;
        Chart.defaults.global.title.text = "Nb de personne / centre d'interet";        
    </script>

    <script>
            var ctx = document.getElementById('myChart').getContext('2d');
            var chart = new Chart(ctx, {
            // The type of chart we want to create
            type: 'pie',

            // The data for our dataset
            data: {
                labels: ['Sport', 'Musique', 'SVT', 'Jux vidéos', 'Lecture', 'Informatique', 'Sorties', 'Cuisine', 'Aviation', 'Mécanique', 'Licornes', 'Joaillerie', 'Agriculture', 'Cinéma', 'Politique', 'Couture', 'Animaux', 'Science', 'Histoire', 'SVT', 'Physique-chimie', 'Taxidermie', 'Philatélie'],
                datasets: [{
                    label: 'My First dataset',
                    backgroundColor: ['red', 'yellow', 'blue', 'violet', 'pink', 'orange', 'brown', 'grey', 'white', 'purple', 'turquoise', 'red', 'yellow', 'blue', 'violet', 'pink', 'orange', 'brown', 'grey', 'white', 'purple', 'turquoise'],
                    borderColor: 'rgb(0, 0, 0)',
                    data: [10, 20, 30, 10, 30]
                    }]
            },

            // Configuration options go here
            options: {}
            });
    </script>

    

    

    <h2>Nb moyen de centre d'interets / perssonne</h2>



 
<script src="./js/main.js"></script>
</body>

</html>