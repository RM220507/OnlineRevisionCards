<!DOCTYPE html>
    <head>
        <title>Smart Home System - Home</title>
        <link rel="stylesheet" href="styles.css?v=<?php echo time(); ?>" />
        <?php
            //LINE 4 - 61 IS 'BOILER PLATE CODE' FOUND ON EVERY PAGE (OTHER THAN LOGIN)

            $servername = "localhost";
            $username = "webClient";
            $password = "Yw6b77tmFf9VjGDl";
            $database = "SmartHomeNetwork";
            
            //create SQL connection
            $conn = new mysqli($servername, $username, $password, $database);
            if ($conn->connect_error) {
                die("SQL Connection failed: " . $conn->connect_error);
            }

            $forename = $surname = "";
            $permlevel = 1;
            $user = $_GET["user"];
            
            #check if valid user entered; if not return to index.php for login
            if ($user != NULL) {
                $sql = "SELECT Forename, Surname, PermLevel FROM Users WHERE UserID = $user";
                $result = $conn->query($sql);
                if ($result -> num_rows > 0) {
                    $row = $result -> fetch_assoc();

                    $forename = $row["Forename"];
                    $surname = $row["Surname"];
                    $permlevel = $row["PermLevel"];
                } else {
                    header("Location:index.php");
                }
            } else {
                header("Location:index.php");
            }
        ?>
    </head>
    <body>
        <ul>
            <li><a class="active" href="home.php?user=<?php echo $user;?>">Home</a></li>
            <li><a href="security.php?user=<?php echo $user;?>">Security</a></li>
            <li><a href="clockfan.php?user=<?php echo $user;?>">Clock & Fan</a></li>
            <li><a href="sensor.php?user=<?php echo $user;?>">Sensor</a></li>
            <li><a href="lighting.php?user=<?php echo $user;?>">Lighting</a></li>
            <li><a href="drinks.php?user=<?php echo $user;?>">Drinks Dispenser</a></li>
            <li><a href="plantwater.php?user=<?php echo $user;?>">Plant Watering</a></li>
            <li><a href="calendar.php?user=<?php echo $user;?>">Calendar</a></li>
            <li><a href="music.php?user=<?php echo $user;?>">Music Player</a></li>
            <?php
                //echo account tab, if permission level allows (>= 2)
                if ($permlevel >= 2) {
                    echo "<li style='float:right; border-left:1px solid #bbb'><a href='account.php?user=$user'>$forename</a></li>";
                }

                //echo a settings tab, if permission level allows (>= 3)
                if ($permlevel >= 3) {
                    echo "<li style='float:right; border-left:1px solid #bbb'><a href='settings.php?user=$user'>Settings</a></li>";
                }
            ?>
        </ul>
        <div class="home-container">
            <div class="item home-username-widget">
                Hello, 
                <?php echo "<h3 style='text-align:center'>" . $forename . " " . $surname . "</h3>";?>
            </div>
            <div class="item home-connected-widget">
                <?php
                    $sql = "SELECT COUNT(ConnectionID) AS total FROM ConnectedDevices";
                    $result = $conn->query($sql);
                    if ($result -> num_rows > 0) {
                        $row = $result -> fetch_assoc();
                        $num = $row["total"];
                        echo "<h1>" . $num . "</h1>";
                    }
                ?>    
                Currently Connected Devices
            </div>
            <div class="item home-sensor-widget">
                <?php
                    $sql = "SELECT SensorID, ConnectionID, RoomName, Description, Temperature, Pressure, Humidity, GasRes, TimeRecorded 
                    FROM Sensors, Rooms
                    WHERE Sensors.RoomID = Rooms.RoomID";
                    $result = $conn->query($sql);
                    if ($result->num_rows > 0) {
                        while($row = $result->fetch_assoc()) {
                            $class = "";
                            $sensorID = $row["SensorID"];
                            $description = $row["Description"];
                            $roomName = $row["RoomName"];
                            $temperature = $row["Temperature"];
                            $pressure = $row["Pressure"];
                            $humidity = $row["Humidity"];
                            $gasres = $row["GasRes"];
                            $timeupdated = $row["TimeRecorded"];

                            if ($row["ConnectionID"] != NULL) {
                                echo "<h3>Sensor $sensorID - $description</h3>
                                    <h4>$roomName</h4>
                                    <div class='home-container'>
                                        <div class='backgroundless-item'>
                                            Temperature <br/>
                                            $temperature C
                                        </div>
                                        <div class='backgroundless-item'>
                                            Pressure <br/>
                                            $pressure hPa
                                        </div>
                                        <div class='backgroundless-item'>
                                            Humidity <br/>
                                            $humidity %
                                        </div>
                                        <div class='backgroundless-item'>
                                            Gas Resistance <br/>
                                            $gasres kOhm
                                        </div>
                                    </div><br/>
                                    <center>Last Updated: $timeupdated</center>";
                                break;
                            }
                        }
                    }
                ?>
            </div>
            <div class="item home-news-widget">
                <b>Latest UK News - The Guardian</b><br/>
                <?php
                    $rss_feed = simplexml_load_file("https://theguardian.com/uk/rss");
                    if (! empty($rss_feed)) {
                        $i = 0;
                        foreach ($rss_feed->channel->item as $feed_item) {
                            if ($i >= 8) {
                                break;
                            }
                ?>
                <a class="feed_title" href="<?php echo $feed_item->link; ?>" target="_blank"><?php echo $feed_item->title; ?></a><br/>
                <?php
                            $i ++;
                        }
                    }
                ?>
            </div>
            <div class="item home-alarm-widget">
                [Alarm Data]
            </div>
            <div class="item home-weather-widget">
                <b>3 Day Weather Forecast - BBC Weather</b><br/>
                <?php
                    $rss_feed = simplexml_load_file("https://weather-broker-cdn.api.bbci.co.uk/en/forecast/rss/3day/2653346");
                    if (! empty($rss_feed)) {
                        $i = 0;
                        foreach ($rss_feed->channel->item as $feed_item) {
                            if ($i >= 3) {
                                break;
                            }
                ?>
                <a class="feed_title" href="<?php echo $feed_item->link; ?>" target="_blank"><?php echo $feed_item->title; ?></a><br/>
                <?php
                            $i ++;
                        }
                    }
                ?>
            </div>
        </div>
    </body>
</html>