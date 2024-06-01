<?php

include "index.php";

header('Content-Type: application/json');

$request = $_SERVER['REQUEST_METHOD'];

switch ($request) {
    case 'POST':
        $data = json_decode(file_get_contents('php://input'), true);
        postMethod($data, $conn);  // Pass the $conn variable to the function
        break;

    default:
        echo json_encode(["message" => "Request method not supported"]);
        break;
}

function postMethod($data, $conn)
{
    // Extract data from the input
    $FirstName = $data['FirstName'];
    $SecondName = $data['SecondName'];
    $Email = $data['Email'];
    $Studentid = $data['Studentid'];
    $password = $data['password'];
    $created_by = $data['created_by'];
    
    // Prepare an SQL statement
    $stmt = $conn->prepare("INSERT INTO `register`(`FirstName`, `SecondName`, `Email`, `Studentid`, `password`, `created_by`) VALUES (?, ?, ?, ?, ?, ?)");

    if ($stmt) {
        // Bind parameters to the SQL statement
        $stmt->bind_param("ssssss", $FirstName, $SecondName, $Email, $Studentid, $password, $created_by);

        // Execute the statement
        if ($stmt->execute()) {
            echo json_encode(["message" => "Data inserted successfully"]);
        } else {
            echo json_encode(["message" => "Error inserting data", "error" => $stmt->error]);
        }

        // Close the statement
        $stmt->close();
    } else {
        echo json_encode(["message" => "Error preparing statement", "error" => $conn->error]);
    }
}
?>
