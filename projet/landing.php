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

    <h2>BIENVENUE <?php echo $_SESSION['pseudo']; ?> tu es bien connecté ! </h2>

    <a href="logout.php"><input type="button" value="Déconnexion"></a>

<section id="section">
    
    <table class="tableinfos">
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
    </table>

    <h3>Veuillez selectionner 3 à 8 centres d'intérêts dans la liste ci-dessous:</h3>
    <form action="" name="chkform" method="post" enctype="multipart/form-data">
        <div class="chkbox">
        <p><input type="checkbox" class="chuck" name="chk[]" value="1"> Sport</p>
        <p><input type="checkbox" class="chuck" name="chk[]" value="2"> Musique</p>
        <p><input type="checkbox" class="chuck" name="chk[]" value="3"> Jeux Vidéos</p>
        <p><input type="checkbox" class="chuck" name="chk[]" value="4"> Lecture</p>
        <p><input type="checkbox" class="chuck" name="chk[]" value="5"> Informatique</p>
        <p><input type="checkbox" class="chuck" name="chk[]" value="6"> Sorties</p>
        <p><input type="checkbox" class="chuck" name="chk[]" value="7"> Cuisine</p>
        <p><input type="checkbox" class="chuck" name="chk[]" value="8"> Aviation</p>
        <p><input type="checkbox" class="chuck" name="chk[]" value="9"> Mécanique</p>
        <p><input type="checkbox" class="chuck" name="chk[]" value="10"> Licornes</p>
        <p><input type="checkbox" class="chuck" name="chk[]" value="11"> Joaillerie</p>
        <p><input type="checkbox" class="chuck" name="chk[]" value="12"> Agriculture</p>
        <p><input type="checkbox" class="chuck" name="chk[]" value="13"> Cinéma</p>
        <p><input type="checkbox" class="chuck" name="chk[]" value="14"> Politique</p>
        <p><input type="checkbox" class="chuck" name="chk[]" value="15"> Couture</p>
        <p><input type="checkbox" class="chuck" name="chk[]" value="16"> Animaux</p>
        <p><input type="checkbox" class="chuck" name="chk[]" value="17"> Science</p>
        <p><input type="checkbox" class="chuck" name="chk[]" value="18"> Histoire</p>
        <p><input type="checkbox" class="chuck" name="chk[]" value="19"> SVT</p>
        <p><input type="checkbox" class="chuck" name="chk[]" value="20"> Physique-Chimie</p>
        <p><input type="checkbox" class="chuck" name="chk[]" value="21"> Taxidermie</p>
        <p><input type="checkbox" class="chuck" name="chk[]" value="22"> Philatélie</p>
        </div>
        <input id="Envoyer" type="submit" value="Envoyer" name="sub">
    </form>

    <script>
    let checks = document.querySelectorAll(".chuck");
    let max = 8;

    for(let i = 0; i < checks.length; i++)
        checks[i].onclick = selectionCheck;
        function selectionCheck (event) {
        let checked = document.querySelectorAll(".chuck:checked");
        if (checked.length > max)
            return false; 
    }
    </script>
    
<?php
    //$requeteCI= $bdd->prepare("SELECT DISTINCT * FROM Interets"); 

    //$check = $requeteCI->execute();

    //$interets = $requeteCI->fetchAll();
    $adhnum = $_SESSION['adherentID'];
    $chbox = $_POST['chk'];
    
    if(isset($_POST['sub']))
    {
        for($i=0; $i<sizeof ($chbox); $i++)
        {
            $rqt = $bdd->prepare("INSERT INTO InteretAdherent (adherentID, interetID) VALUES ( :adherentID, :interetID)");
            $rqt->execute(array(
            'adherentID' => $adhnum,
            'interetID' => $chbox[$i]
        ));
        }
        header('Location:accueil.php');die();
    }
    ?>

<script src="./js/main.js"></script>
</body>

</html>