<?php 

    require_once 'config.php';

    if(isset($_POST['adh-num']) && isset($_POST['pseudo']) && isset($_POST['prenom']) && isset($_POST['nom']) && isset($_POST['email']) && isset($_POST['password']) && isset($_POST['password_retype']))
    {   

        $adhnum = htmlspecialchars($_POST['adh-num']);
        $pseudo = htmlspecialchars($_POST['pseudo']);
        $prenom = htmlspecialchars($_POST['prenom']);
        $nom = htmlspecialchars($_POST['nom']);
        $email = htmlspecialchars($_POST['email']);
        $password = htmlspecialchars($_POST['password']);
        $passwordRetype = htmlspecialchars($_POST['password_retype']);
        $numero = htmlspecialchars($_POST['numero']);
        $adresse = htmlspecialchars($_POST['adresse']);
        $zip = htmlspecialchars($_POST['zip']);
        $ville = htmlspecialchars($_POST['ville']);


        $check = $bdd->prepare('SELECT * FROM Adherents, Interets, InteretAdherent, Profils, WHERE email = ?');
        $check->execute(array($email));
        $data = $check->fetch();
        $row = $check->rowCount();

        $findadh = 'adh-2045-';
        $adhnumcheck = stripos($adhnum, $findadh);

        if($row == 0){

            if ($adhnumcheck !== false) {

                if(strlen($adhnum) <= 255 || strlen($pseudo) <= 255 || strlen($prenom) <= 255 || strlen($nom) <= 255 || strlen($email) <= 255)
                {

                    if(filter_var($email, FILTER_VALIDATE_EMAIL))
                    {

                        if($password == $passwordRetype)
                        {

                                $password = hash('sha256', $password);

                                $insert = $bdd->prepare('INSERT INTO Adherents (adherentID, pseudo, prenom, nom, email, numero, adresse1, zip, ville, password) VALUES( :adherentID, :pseudo, :prenom, :nom, :email, :numero, :adresse1, :zip, :ville, :password)');
                                $insert->execute(array(
                                    'adherentID' => $adhnum,
                                    'pseudo' => $pseudo,
                                    'prenom' => $prenom,
                                    'nom' => $nom,
                                    'email' => $email,
                                    'numero' => $numero,
                                    'adresse1' => $adresse,
                                    'zip' => $zip,
                                    'ville' => $ville,
                                    'password' => $password
                                ));

                                header('Location: connexion.html'); die();
                            
                        }else header('Location: inscription.html?reg_err=password'); die(); 

                    }else header('Location: inscription.html?reg_err=emailInvalid'); die(); 

                }else header('Location: inscription.html?reg_err=adhnumORpseudoORprenomORnomORemailIStoo_long'); die(); 

            }else header('Location: inscription.html?reg_err=adhnumInvalid'); die(); 
                
        }else header('Location: inscription.html?reg_err=alreadyUsed'); die(); 

    }

/*   if(!empty($_POST['numero']) && !empty($_POST['zip']))
    {
    if(preg_match("#[0-9]{10}#",$numero) && preg_match("#[0-9]{5}#",$zip))

    }else header('Location: inscription.html?reg_err=numeroORzip'); die();
    }