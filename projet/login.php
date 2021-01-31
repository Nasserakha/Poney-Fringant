<?php 
    session_start();
    require_once 'config.php';

    if(isset($_POST['email']) && isset($_POST['password']))
    {
        $email = htmlspecialchars($_POST['email']);
        $password = htmlspecialchars($_POST['password']);

        $check = $bdd->prepare('SELECT * FROM Adherents WHERE email = ?');
        $check->execute(array($email));
        $data = $check->fetch();
        $row = $check->rowCount();    

        if($row == 1)
        {
            if(filter_var($email, FILTER_VALIDATE_EMAIL))
            {
                //$password = password_hash($password, PASSWORD_DEFAULT);
                $hash = hash('sha256', $password);
                if($data['password'] === $hash)
                {
                    $_SESSION['adherentID'] = $data['adherentID'];
                    $_SESSION['pseudo'] = $data['pseudo'];
                    $_SESSION['prenom'] = $data['prenom'];
                    $_SESSION['nom'] = $data['nom'];
                    $_SESSION['email'] = $data['email'];
                    $_SESSION['numero'] = $data['numero'];
                    $_SESSION['adresse1'] = $data['adresse1'];
                    $_SESSION['zip'] = $data['zip'];
                    $_SESSION['ville'] = $data['ville'];
                    $_SESSION['date_adhesion'] = $data['date_adhesion'];
                    header('Location:landing.php');
                    die();
                }else header('Location: connexion.html?login_err=password'); die();
            }else header('Location: connexion.html?login_err=email'); die();
        }else header('Location: connexion.html?login_err=doesntexist'); die();
    }
    


