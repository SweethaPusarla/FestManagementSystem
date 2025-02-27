<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <title>Login</title>

    <style>
         
        body {
            font-family: 'Amazon Ember', Arial, sans-serif;
            background-color: #1399FF;
            color: white;
            text-align: center;
        }
        
        h2{
        color:#1399FF;
        }

        .login-container {
            width: 300px;
            margin: 100px auto;
            padding: 20px;
            background: #232f3e;
            box-shadow: 0px 0px 10px 0px #0000001a;
            border-radius: 5px;
        }

        input[type="text"], input[type="password"] {
            width: 90%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        label {
            display: block;
            margin-top: 10px;
            text-align: left;
        }

        button {
            width: auto;
            min-width: calc(100px + 10px); /* Adjust the width to fit the text with extra padding */
            padding: 10px 15px; /* 5px increase to left and right */
            background: #1399FF;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background: #1399FF;
        }

        .login-link {
            color: #1399FF;
            text-decoration: none;
        }

        .login-link:hover {
            text-decoration: none; 
            }

    </style>

</head>

<body>

    <div class="login-container">

        <h2>Login</h2>

        <form action="login" method="post">
            <label>Email</label>
            <input type="text" name="email" placeholder="Enter Email" required>
            <label>Password</label>
            <input type="password" name="password" placeholder="Enter Password" required>

            <button type="submit">Login</button>

        </form>

        <p>Don't have an account? <a class="login-link" href="register.jsp">Register here</a></p>

    </div>

</body>

</html>
