<?php 
	$dsn = 'mysql:host=localhost; dbname=branstudiobehance';
	$user = 'root1';
	$password = 'P@ssword11';
 

	try{
		$pdo = new PDO($dsn, $user, $password);
	}catch(PDOException $e){
		echo 'connection error! ' . $e;
	}	
?>
