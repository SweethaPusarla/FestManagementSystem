<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>

<html>

<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <style>
        body {
            font-family: 'Amazon Ember', Arial, sans-serif;
            background-color: white;
            color: #232F3E;
            text-align: center;
        }
        
        h2 {
            color: white;
        }

        .login-container {
            width: 300px;
            margin: 100px auto;
            padding: 20px;
            background: #1399FF; 
            box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.2);
            border-radius: 5px;
            color: white;
        }

        input[type="text"], input[type="password"] {
            width: 90%;
            padding: 10px;
            margin: 10px 0;
            border: 2px solid white;
            border-radius: 5px;
            background-color: white;
            color: #232F3E;
            font-size: 16px;
        }

        label {
            display: block;
            margin-top: 10px;
            text-align: left;
            color: white;
        }

        button {
            width: 100%;
            padding: 10px;
            background: white;
            color: #1399FF;
            border: 2px solid white;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
            transition: 0.3s;
        }

        button:hover {
            background: #4B4BFF;
            color: white;
            border: 2px solid #4B4BFF;
        }

        .login-link {
            color: white;
            text-decoration: none;
        }

        .login-link:hover {
            text-decoration: underline;
        }

        .error-message {
            color: red;
        }
    </style>
</head>

<body>

    <div class="login-container">
        <h2>Login</h2>
        
        <p style="color: yellow;">This page is only accessible to Program Coordinators.</p>

        <form action="loginTechFest" method="post">
            <label>Email</label>
            <input type="text" name="email" placeholder="Enter Email" required>
            <label>Password</label>
            <input type="password" name="password" placeholder="Enter Password" required>
            <button type="submit">Login</button>
        </form>

    </div>

</body>

</html>
