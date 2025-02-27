<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signup Page</title>
    <style>
        body {
            font-family: 'Amazon Ember', Arial, sans-serif;
            background-color: #1399FF;
            color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background-color: #232f3e;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            width: 350px;
        }
        h2 {
            text-align: center;
            color: #1399FF;
        }
        label {
            display: block;
            margin-top: 10px;
        }
        input, select {
            width: 100%;
            padding: 6px;
            margin-top: 5px;
            border: none;
            border-radius: 4px;
            font-size: 14px;
        }
        .btn {
            background-color: #1399FF;
            color: black;
            padding: 8px;
            margin-top: 15px;
            width: auto;
            min-width: calc(100px + 10px);
            border: none;
            cursor: pointer;
            font-weight: bold;
            display: block;
            margin-left: auto;
            margin-right: auto;
            font-size: 14px;
        }
        .btn:hover {
            background-color: #1399FF;
        }
        .error {
            color: red;
            font-size: 12px;
        }
        .login-link {
            text-align: center;
            margin-top: 10px;
        }
        .login-link a {
            color: #1399FF;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Signup</h2>
        <form action="register" method="post">
            <label>Full Name</label>
            <input type="text" name="username" required>
           
            <label>Email</label>
            <input type="email" name="email" required>
           
            <label>Password</label>
            <input type="password" name="password" required>
           
            <label>Gender</label>
            <select name="gender" required>
                <option value="">Select Gender</option>
                <option value="Male">Male</option>
                <option value="Female">Female</option>
                <option value="Other">Other</option>
            </select>
           
            <label>College Name</label>
            <input type="text" name="college" required>
           
            <label>Branch Name</label>
            <input type="text" name="branch" required>
            
            <!-- New Role field -->
            <label>Role</label>
            <select name="role" required>
                <option value="">Select Role</option>
                <option value="admin">Admin</option>
                <option value="client">Client</option>
                <option value="participant">Participant</option>
            </select>

            <button type="submit" class="btn">Sign Up</button>
            <div class="login-link">
                <p>Already have an account? <a href="login.jsp">Login</a></p>
            </div>
        </form>
    </div>
</body>
</html>
