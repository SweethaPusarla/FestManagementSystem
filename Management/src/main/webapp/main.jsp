<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Event List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: white;
            color: white;
            margin: 0;
            padding: 0;
        }

   
        .navbar {
            width: 100%;
            background-color: #1399FF;
            padding: 10px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .navbar div {
            display: flex;
            gap: 20px;
        }

        .navbar a {
            color: white;
            text-decoration: none;
            padding: 10px 20px;
            font-size: 18px;
            font-weight: bold;
        }

        .navbar a:hover {
            background-color: #4B4BFF;
            border-radius: 5px;
        }

        h1 {
            margin-top: 50px;
            color: #1399FF;
            text-align: center;
        }


        .event-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 30px;
            margin-top: 50px;
            padding: 0 20px;
        }

        .event-box {
            width: 250px;
            background-color: #1399FF;
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0px 6px 12px rgba(0, 0, 0, 0.3);
            text-align: center;
            font-size: 18px;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .event-box h3 {
            font-size: 24px;
            color: white;
            margin-bottom: 10px;
        }

        .event-box p {
            font-size: 16px;
            color: #333;
            margin-bottom: 15px;
        }

        .event-box:hover {
            background-color: #4B4BFF;
            transform: scale(1.05);
            cursor: pointer;
        }

        
        .techfest {
            background-color: #1399FF;
        }

        .techfest:hover {
            background-color: #4B4BFF;
        }

        a {
            text-decoration: none;
            color: #1399FF;
        }

    </style>
</head>
<body>

   
    <div class="navbar">
        <div>
            <a href="#">Home</a>
        </div>
        <div>
            <a href="profile.jsp">Profile</a>
            <a href="logout.jsp">Logout</a>
        </div>
    </div>

    <h1>Upcoming Events</h1>


    <div class="event-container">
        <!-- Event 1: TechFest2025 (Highlighted) -->
        <a href="TechFest.jsp">
            <div class="event-box techfest">
                <h3>TechFest2025</h3>
                <p>Join us for the biggest tech event of the year!</p>
            </div>
        </a>

        <!-- Event 2 -->
        <a href="CodeSprint.jsp">
            <div class="event-box">
                <h3>CodeSprint</h3>
                <p>Speed coding challenge with amazing prizes.</p>
            </div>
        </a>

        <!-- Event 3 -->
        <a href="AIRevolution.jsp">
            <div class="event-box">
                <h3>AI Revolution</h3>
                <p>Explore the future of Artificial Intelligence.</p>
            </div>
        </a>

        <!-- Event 4 -->
        <a href="HackathonX.jsp">
            <div class="event-box">
                <h3>HackathonX</h3>
                <p>Collaborate and create innovative solutions in 24 hours.</p>
            </div>
        </a>

        <!-- Event 5 -->
        <a href="InnovationExpo.jsp">
            <div class="event-box">
                <h3>Innovation Expo</h3>
                <p>Showcasing the latest innovations in technology.</p>
            </div>
        </a>
    </div>

</body>
</html>
