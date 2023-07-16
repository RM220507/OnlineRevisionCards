<?php
  function test_input($data) {
      $data = trim($data);
      $data = stripslashes($data);
      $data = htmlspecialchars($data);
      return $data;
  }

  $servername = "<SERVER>";
  $username = "<USERNAME>";
  $password = "<PASSWORD>";
  $database = "<DATABASE>";
?>
