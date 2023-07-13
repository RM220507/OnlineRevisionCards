<?php
  function test_input($data) {
      $data = trim($data);
      $data = stripslashes($data);
      $data = htmlspecialchars($data);
      return $data;
  }

  $servername = "sql308.epizy.com";
  $username = "epiz_33908874";
  $password = "Z13hXQhcanH";
  $database = "epiz_33908874_revisioncards";
?>
