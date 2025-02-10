<?php
$host = 'localhost'; // Ou ton hôte de base de données
$dbname = 'myshop';  // Ton nom de base de données
$username = 'FREDERIC';  // Ton nom d'utilisateur
$password = 'Kylian250510?';      // Ton mot de passe

try {
    // Créer une nouvelle connexion PDO à la base de données
    $pdo = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    // Si la connexion échoue, afficher un message d'erreur
    die("Connection failed: " . $e->getMessage());
}
?>
