<?php
$port = "8080";
$fp = fsockopen('121.241.242.114', $port, $errno, $errstr, 120);
print_r($fp);
echo $errno.'--'.$errstr;
//if ($fp) echo "Connected.";
//else echo "Could not connect!";

$msg = "hello";
$send_no = "233243080560";
$url = "http://121.241.242.114:8080/bulksms/bulksms?username=sob-uscl&password=smylnb&type=0&dlr=0&destination=" . $send_no . "&source=USCL&message=" . $msg;
		$result = file_get_contents($url);
		print_r($result);
		
		if(!function_exists("fsockopen")) {
 echo "function not exists";
 }
 else

 echo  "Function Exists";
?>