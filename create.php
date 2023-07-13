<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1" />

    <link rel="stylesheet" href="https://pyscript.net/latest/pyscript.css" />

    <title>Online Revision Cards</title>
  </head>
  <body>
    <button onclick="location.href='index.php';" class="py-button">Go Back</button>
    <?php
      include 'credentials.php';

      //create SQL connection
      $conn = new mysqli($servername, $username, $password, $database);
      if ($conn->connect_error) {
          die("SQL Connection failed: " . $conn->connect_error);
      }

      $set = test_input($_POST["set"]);
      $question = test_input($_POST["q"]);
      $answer = test_input($_POST["a"]);

      #check if valid question set entered
      if ($set != NULL and $question != NULL and $answer != NULL) {
          # get question set id
          $sql = "SELECT SetID FROM Sets WHERE SetName = '$set'";
          $result = $conn->query($sql);
          if ($result -> num_rows > 0) {
              $row = $result -> fetch_assoc();
              $setID = $row["SetID"];
          } else {
              $sql = "INSERT INTO Sets (SetName) VALUES ('$set')";
              $result = $conn->query($sql);
              if ($result === TRUE) {
                  $setID = $conn -> insert_id;
              }
          }

          $sql = "INSERT INTO Questions (SetID, Question, Answer) VALUES ($setID, '$question', '$answer')";
          $result = $conn->query($sql);
          if ($result === TRUE) {
            echo "Successfully Added Question!";
          }
      }
    ?>

    <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
      <p><b>Question Set:</b></p>
      <input class="py-input" placeholder="Question Set" name="set" value="<?php if ($set != NULL) {echo $set;}?>"></input>

      <p>Question & Answer</p>
      <input name="q" placeholder="Question" class="py-input" autofocus></input>
      <input name="a" placeholder="Answer" class="py-input"></input>

      <input type="submit" class="py-button"></input>
    </form>
  </body>
</html>
