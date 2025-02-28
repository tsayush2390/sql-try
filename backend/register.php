<?php
require 'db_config.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST["username"];
    $email = $_POST["email"];
    $password = $_POST["password"];

    // Security issue: No password hashing
    $sql = "INSERT INTO users (username, email, password) VALUES ('$username', '$email', '$password')";
    $conn->exec($sql);
    
    echo "User registered successfully!";
}
?>
