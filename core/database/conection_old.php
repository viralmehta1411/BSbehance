<?php

$dsn  ='mysql:host=localhost; dbname=branstudiobehance';
$user = 'root1';
$pass = 'P@ssword11';
try{
    $pdo = new PDO($dsn,$user,$pass);
}catch(PDOException $e){
     
    echo 'connect erorr' .$e -> getMessage();

}

?>