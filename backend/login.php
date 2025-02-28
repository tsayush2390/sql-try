<?php
require 'db_config.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = $_POST["email"];
    $password = $_POST["password"];

    // Security issue: Fetching password directly
    $sql = "SELECT * FROM users WHERE email = '$email' AND password = '$password'";
    $stmt = $conn->query($sql);
    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($user) {
        echo "Login successful! Welcome, " . $user['username'];
    } else {
        echo "Invalid credentials!";
    }
}
?>
