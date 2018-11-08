<?php
//Establishing connection with the database
defined('DB_SERVER') or define('DB_SERVER', 'localhost');
defined('DB_USERNAME') or define('DB_USERNAME', 'root');
defined('DB_PASSWORD') or define('DB_PASSWORD', '');
defined('DB_DATABASE') or define('DB_DATABASE', 'form_db'); 

$connect = mysqli_connect(DB_SERVER,DB_USERNAME,DB_PASSWORD,DB_DATABASE);



?>