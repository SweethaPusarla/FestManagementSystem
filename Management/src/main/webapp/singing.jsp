<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Singing Performance List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: white;
            text-align: center;
            color: #1399FF; 

       
        .navbar {
            width: 100%;
            background-color: #1399FF; 
            padding: 15px;
            display: flex;
            justify-content: center;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.3);
        }

        .navbar a {
            color: white;
            text-decoration: none;
            font-size: 18px;
            padding: 10px 20px;
            border-radius: 5px;
            background-color: white;
            color: #1399FF;
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

        /* Song List */
        .song-list {
            list-style: none;
            padding: 0;
        }

        .song-item {
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

        .song-item:hover {
            transform: scale(1.05);
            background-color: #E8F4FF;
        }

        .song-title {
            font-size: 18px;
            font-weight: bold;
            color:#1399FF;
        }

        .song-count {
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
        function fetchSongCounts() {
            fetch('SongSelectionServlet')
            .then(response => response.json())
            .then(data => {
                data.forEach(song => {
                    let countElement = document.getElementById(song.name + "-count");
                    if (countElement) {
                        countElement.textContent = song.count; // Update the count
                    }
                });
            })
            .catch(error => console.error("Error fetching data:", error));
        }

        function selectSong(song) {
            let username = prompt("Enter your name to sing " + song);
            if (username) {
                fetch('SongSelectionServlet', {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                    body: 'username=' + encodeURIComponent(username) + '&song=' + encodeURIComponent(song)
                })
                .then(response => {
                    if (response.ok) {
                        alert(username + " has selected " + song);
                        fetchSongCounts(); // Refresh counts after selection
                    } else {
                        alert("Error selecting song!");
                    }
                });
            }
        }

        window.onload = fetchSongCounts; 
    </script>
</head>
<body>


    <div class="navbar">
        <a href="TechFest.jsp">Home</a>
    </div>

    <h1>Singing Performance List 🎤</h1>
    <h3>Select one song if you have registered in the form only then you can perform in the fest</h3>
    
    <div class="container">
        <div class="box">
            <h2>🎶 Song List 🎶</h2>
            <ul class="song-list">
                <li class="song-item">
                    <span class="song-title">UUU</span>
                    <span class="song-count" id="UUU-count">0</span>
                    <button onclick="selectSong('UUU')">🎤 Sing</button>
                </li>

                <li class="song-item">
                    <span class="song-title">YYYY</span>
                    <span class="song-count" id="YYYY-count">0</span>
                    <button onclick="selectSong('YYYY')">🎤 Sing</button>
                </li>

                <li class="song-item">
                    <span class="song-title">NNNN</span>
                    <span class="song-count" id="NNNN-count">0</span>
                    <button onclick="selectSong('NNNN')">🎤 Sing</button>
                </li>

                <li class="song-item">
                    <span class="song-title">OOOOO</span>
                    <span class="song-count" id="OOOOO-count">0</span>
                    <button onclick="selectSong('OOOOO')">🎤 Sing</button>
                </li>
            </ul>
        </div>
    </div>

</body>
</html>
