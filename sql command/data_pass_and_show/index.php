<?php

    $server = "localhost";
    $username = "root";
    $password = "";
    $dbname = "data_store";

    $conn = new mysqli($server, $username, $password, $dbname);

    // if ($conn->connect_error) 
    // {
    //     die("Connection failed: " . $conn->connect_error);
    // }
    // echo "Connection successful";
    
?>