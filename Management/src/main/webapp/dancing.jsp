<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dance Performance List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: white;
            text-align: center;
            color: #232F3E; 
        }

        
        .navbar {
            width: 100%;
            background-color: #1399FF; 
            padding: 15px;
            display: flex;
            justify-content: center;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.3);
        }

        .navbar a {
            color: #1399FF;
            text-decoration: none;
            font-size: 18px;
            padding: 10px 20px;
            border-radius: 5px;
            background-color: white;
            font-weight: bold;
            border: 2px solid white;
        }

        .navbar a:hover {
            background-color: #4B4BFF;
            color: white;
            border: 2px solid #4B4BFF;
        }

        
        .container {
            display: flex;
            justify-content: center;
            margin-top: 40px;
        }

        .box {
            background-color: #1399FF;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.3);
            width: 400px;
            color: white;
        }

        
        .dance-list {
            list-style: none;
            padding: 0;
        }

        .dance-item {
            background: white; 
            color: #232F3E; 
            padding: 12px;
            margin: 10px 0;
            border-radius: 8px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            transition: transform 0.2s ease-in-out;
            border: 2px solid #1399FF;
        }

        .dance-item:hover {
            transform: scale(1.05);
            background-color: #E8F4FF;
        }

        .dance-title {
            font-size: 18px;
            font-weight: bold;
        }

        .dance-count {
            font-size: 16px;
            color: #1399FF;
            margin-left: 15px;
        }

        
        button {
            background-color: white;
            border: 2px solid #1399FF;
            color: #1399FF;
            padding: 8px 12px;
            cursor: pointer;
            border-radius: 6px;
            font-size: 14px;
            font-weight: bold;
            transition: 0.2s;
        }

        button:hover {
            background-color: #4B4BFF;
            color: white;
            border: 2px solid #4B4BFF;
        }

    </style>
    <script>
        function fetchDanceCounts() {
            fetch('DanceSelectionServlet')
            .then(response => response.json())
            .then(data => {
                data.forEach(dance => {
                    let countElement = document.getElementById(dance.name + "-count");
                    if (countElement) {
                        countElement.textContent = dance.count; 
                    }
                });
            })
            .catch(error => console.error("Error fetching data:", error));
        }

        function selectDance(dance) {
            let username = prompt("Enter your name to perform " + dance);
            if (username) {
                fetch('DanceSelectionServlet', {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                    body: 'dance=' + encodeURIComponent(dance) + '&username=' + encodeURIComponent(username)
                })
                .then(response => {
                    if (response.ok) {
                        alert(username + " has selected " + dance);
                        fetchDanceCounts(); 
                    } else {
                        alert("Error selecting dance!");
                    }
                });
            }
        }

        window.onload = fetchDanceCounts; 
    </script>
</head>
<body>

    <!-- Navigation Bar -->
    <div class="navbar">
        <a href="TechFest.jsp">Home</a>
    </div>

    <h1>Dance Performance List 💃</h1>
    <h3>Select one dance if you have registered in the form only then you can perform in the fest</h3>
    <div class="container">
        <div class="box">
            <h2>💃 Dance Performance List 💃</h2>
            <ul class="dance-list">
                <li class="dance-item">
                    <span class="dance-title">Hip Hop</span>
                    <span class="dance-count" id="HipHop-count">0</span>
                    <button onclick="selectDance('Hip Hop')">💃 Perform</button>
                </li>

                <li class="dance-item">
                    <span class="dance-title">Contemporary</span>
                    <span class="dance-count" id="Contemporary-count">0</span>
                    <button onclick="selectDance('Contemporary')">💃 Perform</button>
                </li>

                <li class="dance-item">
                    <span class="dance-title">Ballet</span>
                    <span class="dance-count" id="Ballet-count">0</span>
                    <button onclick="selectDance('Ballet')">💃 Perform</button>
                </li>

                <li class="dance-item">
                    <span class="dance-title">Jazz</span>
                    <span class="dance-count" id="Jazz-count">0</span>
                    <button onclick="selectDance('Jazz')">💃 Perform</button>
                </li>
            </ul>
        </div>
    </div>

</body>
</html>
