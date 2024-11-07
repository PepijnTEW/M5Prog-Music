<?php

// haal de configuratie op door het config.php bestand te laden.
require_once('../source/config.php');

// Maak een database verbinding waarbij je de constanten uit de .env file gebruikt
$connection = new mysqli(DB_HOST, DB_USERNAME, DB_PASSWORD, DB_NAME);
$query = 'SELECT * FROM mydb.song ORDER BY song_name';
$stmt = $connection->prepare($query);
$stmt->execute();
$result = $stmt->get_result();
while( $song = mysqli_fetch_assoc($result) ) {
    print_r( $song );
}
