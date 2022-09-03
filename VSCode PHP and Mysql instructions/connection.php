<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Untitled Document</title>
</head>

<body>
<?php

$servername = "localhost"; ## Server name should be localhost as we setup to run locally
$username = "root"; ## Username is root however can setup to different names, root by default works
$password = "password"; ## This is your workbench password
$dbname = "ap";  ## If you used the newest file `create_db_ap.sql` this should be ap

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT * FROM vendors";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
  // output data of each row
  while($row = $result->fetch_assoc()) {
    echo "id: " . $row["vendor_name"]. "<br>";
  }
} else {
  echo "0 results";
}
$conn->close();
?>
</body>
</html>