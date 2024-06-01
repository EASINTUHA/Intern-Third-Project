<?php

include "index.php";

header('content-type: application/json');

$request = $_SERVER['REQUEST_METHOD'];

switch ($request) {
    case 'POST':
        $data = json_decode(file_get_contents('php://input'), true);
        postmethod($data);
        break;

    default:
        echo json_encode(["message" => "Request method not supported"]);
        break;
}


function postmethod($data) {
    include "index.php";

    $Studentid = $data["Studentid"];

    $sql = "SELECT * FROM `register` WHERE `Studentid` = '$Studentid'";

    $request = mysqli_query($conn,$sql);

    if(mysqli_num_rows($request)>0){

        $row = array();

        while($r = mysqli_fetch_assoc($request)){
            $row = $r;
        }

        echo json_encode($row);
    }

    else{
        echo "Request Not Found";
    }
}

?>