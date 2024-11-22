<?php
    include("database.php");  // Ensure the database connection file is correctly included

    // Prepare SQL query to fetch all records
    $sql = "SELECT * FROM user";

    // Execute query and store the result
    $result = $conn->query($sql);

    // Check if the query returns any rows
    if ($result->num_rows > 0) {
        // Print table headers
        echo "<table border='1'>
                <tr>
                    <th>User ID</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Hourly Pay</th>
                    <th>Hire Date</th>
                </tr>";

        // Loop through each row and print data
        while ($row = $result->fetch_assoc()) {
            echo "<tr>
                    <td>{$row['user']}</td>
                    <td>{$row['first_name']}</td>
                    <td>{$row['last_name']}</td>
                    <td>{$row['hourly_pay']}</td>
                    <td>{$row['hire_date']}</td>
                  </tr>";
        }
        echo "</table>";
    } else {
        echo "No records found.";
    }

    // $sql = "INSERT INTO user (first_name, last_name, hourly_pay, hire_date) 
    //        VALUES ('ccccccc', 'zzzzzz', '20.5', '2024-10-29')";


    // // Execute query
    // if ($conn->query($sql) === TRUE) {
    //     echo "Record inserted successfully!123";
    // } else {
    //     echo "Error: " . $sql . "<br>" . $conn->error;
    // }

    // Close the connection
    $conn->close();
?>
