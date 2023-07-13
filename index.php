<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1" />

    <link rel="stylesheet" href="https://pyscript.net/latest/pyscript.css" />

    <title>Online Revision Cards</title>
  </head>
  <body>
    <?php
      include 'credentials.php';

      //create SQL connection
      $conn = new mysqli($servername, $username, $password, $database);
      if ($conn->connect_error) {
          die("SQL Connection failed: " . $conn->connect_error);
      }

      $set = test_input($_POST["set"]);

      #check if valid question set entered
      $questions = array();
      if ($set != NULL) {
          $sql = "SELECT SetID FROM Sets WHERE SetName = '$set'";
          $result = $conn->query($sql);
          if ($result -> num_rows > 0) {
              $row = $result -> fetch_assoc();
              $setID = $row["SetID"];
          } else {
              echo "Question Set is Undefined! Check your spelling, or make your own set.";
          }

          $sql = "SELECT Question, Answer FROM Questions, Sets WHERE Questions.SetID = $setID";
          $result = $conn->query($sql);
          if ($result -> num_rows > 0) {
              while ($row = $result -> fetch_assoc()) {
                  array_push($questions, array($row["Question"], $row["Answer"]));
              }
          } else {
              echo "No Questions Found!";
          }
      }
    ?>


    <p id="question" style="font-size: 60px; font-weight:bold;">No Question Set Loaded</p>
    <p id="answer" style="font-size: 50px;">Load a Question Set to get Started</p>
    <button id="show_answer" class="py-button" onclick="toggle_answer()">Toggle Answer</button>
    <button id="previous_question" class="py-button" onclick="previous_question()">Previous Question</button>
    <button id="next_question" class="py-button" onclick="next_question()">Next Question</button>

    <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
      <input class="py-input" name="set" placeholder="Question Set" value="<?php if ($set != NULL) {echo $set;}?>"></input>

      <input type="submit" class="py-button" value="Load Question Set"></input>
    </form>

    <button onclick="location.href='create.php';" class="py-button">Create Questions</button>

    <script>
      let questions = filter_list(<?php echo json_encode($questions); ?>).sort((a, b) => 0.5 - Math.random());
      let count = 0;
      let showing_answer = true;
      let question_element = document.getElementById("question");
      let answer_element = document.getElementById("answer");
      reload();

      function filter_list(list) {
        let new_list = [];
        let filtered_values = [];
        for (let i = 0; i<list.length; i++) {
          if (!filtered_values.includes(list[i][0])) {
            new_list.push(list[i]);
            filtered_values.push(list[i][0]);
          }
        }
        return new_list;
      }

      function toggle_answer() {
        showing_answer = !showing_answer;
        if (showing_answer) {
          answer_element.innerHTML = questions[count][1];
        } else {
          answer_element.innerHTML = "[ ]";
        }
      }

      function reload() {
        if (count >= 0 && count < questions.length) {
          question_element.innerHTML = questions[count][0];

          showing_answer = true;
          toggle_answer();
        } else {
          count = 0;
          reload();
        }
      }

      function next_question() {
        count = count + 1;
        reload();
      }

      function previous_question() {
        count = count - 1;
        reload();
      }
    </script>
  </body>
</html>
