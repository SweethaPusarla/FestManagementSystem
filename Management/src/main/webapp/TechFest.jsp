<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Main Page</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: white;
            color: black;
        }

        .navbar {
            background-color: #1399FF;
        }

        .navbar-brand {
            color: white;
            font-weight: bold;
        }

        .navbar-nav {
            display: flex;
            gap: 10px;
        }

       
        .navbar-nav .btn {
            background-color: white; 
            color: #1399FF; 
            border-radius: 5px;
            font-weight: bold;
            padding: 8px 15px;
            border: 2px solid white; 
        }

    
        .navbar-nav .btn:hover {
            background-color: #4B4BFF; 
            color: white; 
            border: 2px solid #4B4BFF; 
        }

        .container {
            margin-top: 50px;
        }

        .btn-lg {
            font-size: 18px;
            padding: 15px;
        }

        .btn-info {
            background-color: #1399FF;
            color: white;
            border: none;
        }

        .btn-info:hover {
            background-color: #4B4BFF;
            color: black;
        }

        .footer-text {
            margin-top: 30px;
            font-size: 18px;
            text-align: center;
            color: #1399FF;
        }
    </style>
</head>

<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg">
        <div class="container">
            <a class="navbar-brand">TechFest 2025</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                <div class="navbar-nav">
                    <a href="TechFestRegister.jsp" class="btn">Register</a>
                    <a href="resources/TechFest_2025_Brochure.pdf" class="btn" download>Brochure</a>
                    <a href="main.jsp" class="btn">Home</a>
                    <a href="loginTechFest.jsp" class="btn">Login</a>
                </div>
            </div>
        </div>
    </nav>


    <div class="container text-center">
        <div class="row justify-content-center">
            <div class="col-md-4">
                <a href="singing.jsp" class="btn btn-info btn-lg w-100">Singing</a>
                <p>Be like the blue bird who never is blue, for he knows from his upbringing what singing can do.</p>
            </div>
            <div class="col-md-4">
                <a href="dancing.jsp" class="btn btn-info btn-lg w-100">Dancing</a>
                <p>Life is better when you dance! Dance is the hidden language of the soul!</p>
            </div>
            <div class="col-md-4">
                <a href="comedy.jsp" class="btn btn-info btn-lg w-100">Standup Comedy</a>
                <p>Stand-up comedy is an alpha job: The only person in a room with a microphone who's allowed to talk.</p>
            </div>
        </div>

        <div class="row justify-content-center mt-4">
            <div class="col-md-4">
                <a href="theatre.jsp" class="btn btn-info btn-lg w-100">Theatre</a>
                <p>Theatre is the art of making the invisible visible and bringing dreams to life.</p>
            </div>
            <div class="col-md-4">
                <a href="gaming.jsp" class="btn btn-info btn-lg w-100">Gaming</a>
                <p>Level up your fun! A place for gamers to shine and conquer!</p>
            </div>
            <div class="col-md-4">
                <a href="poetry.jsp" class="btn btn-info btn-lg w-100">Poetry</a>
                <p>Where words flow and stories are told, the magic of poetry comes alive!</p>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <div class="footer-text">
        <p>For more details about the event, please download the brochure.</p>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
