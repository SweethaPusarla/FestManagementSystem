<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TechFest 2025 Registration page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            font-family: 'Amazon Ember', Arial, sans-serif;
            background-color: white;
            color: #232F3E; /* Amazon Dark Blue */
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            background-color: #1399FF; 
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.3);
            width: 400px;
            max-height: 90vh;
            overflow-y: auto;
            color: white;
        }

        h2 {
            text-align: center;
            color: white;
            margin-bottom: 20px;
        }

        label {
            font-size: 14px;
            color: white;
            margin-top: 10px;
            display: block;
        }

        input,
        select {
            width: 100%;
            padding: 12px;
            margin-top: 8px;
            border: 2px solid white;
            border-radius: 8px;
            background-color: white;
            color: #232F3E;
            font-size: 16px;
        }

        .checkbox-group {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }

        .checkbox-group label {
            font-size: 14px;
            color: white;
            display: flex;
            align-items: center;
        }

        .checkbox-group input[type="checkbox"] {
            margin-right: 8px;
            margin-bottom: 5px;
            accent-color: white; 
        }

        .btn {
            background-color: white;
            color: #1399FF;
            padding: 12px 20px;
            margin-top: 20px;
            border: 2px solid white;
            border-radius: 8px;
            cursor: pointer;
            font-weight: bold;
            font-size: 16px;
            width: 100%;
        }

        .btn:hover {
            background-color: #4B4BFF;
            color: white;
            border: 2px solid #4B4BFF;
        }

        .login-link {
            text-align: center;
            margin-top: 15px;
            font-size: 14px;
        }

        .login-link a {
            color: white;
            text-decoration: none;
        }

        .footer-text {
            text-align: center;
            font-size: 12px;
            color: white;
            margin-top: 20px;
        }

        .error {
            color: red;
            font-size: 12px;
        }
    </style>
</head>

<body>
    <div class="container">
        <h2>TechFest 2025 Registrations</h2>
        <form action="Festregister" method="post" onsubmit="showSuccessMessage(event)">
            <label for="username">Full Name</label>
            <input type="text" id="username" name="username" required>

            <label for="email">Email</label>
            <input type="email" id="email" name="email" required>

            <label for="phone">Phone Number</label>
            <input type="number" id="phone" name="phone" required>

            <label for="gender">Gender</label>
            <select id="gender" name="gender" required>
                <option value="">Select Gender</option>
                <option value="Male">Male</option>
                <option value="Female">Female</option>
                <option value="Other">Other</option>
            </select>

            <label for="college">College Name</label>
            <input type="text" id="college" name="college" required>

            <label for="branch">Branch Name</label>
            <input type="text" id="branch" name="branch" required>

            <label>Events</label>
            <div class="checkbox-group">
                <label for="singing">
                    <input type="checkbox" id="singing" name="events" value="Singing">
                    Singing
                </label>
                <label for="dancing">
                    <input type="checkbox" id="dancing" name="events" value="Dancing">
                    Dancing
                </label>
                <label for="comedy">
                    <input type="checkbox" id="comedy" name="events" value="Comedy">
                    Standup Comedy
                </label>
                <label for="theatre">
                    <input type="checkbox" id="theatre" name="events" value="Theatre">
                    Theatre
                </label>
                <label for="gaming">
                    <input type="checkbox" id="gaming" name="events" value="Gaming">
                    Gaming
                </label>
                <label for="poetry">
                    <input type="checkbox" id="poetry" name="events" value="Poetry">
                    Poetry
                </label>
            </div>

            <button type="submit" class="btn">Register</button>
        </form>
    </div>

    <script>
        function showSuccessMessage(event) {
            // Prevent form submission to show the success message first
            event.preventDefault();

            // Show success message
            alert("Data saved successfully!");

            // After the alert, submit the form to complete the registration
            event.target.submit();
        }
    </script>
</body>

</html>
