<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Logout Confirmation</title>
    <style>
       
        .overlay {
            display: none; 
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 1; 
            text-align: center;
        }

        
        .modal-content {
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            width: 400px;
            margin: 10% auto;
        }

        
        .modal-button {
            padding: 10px 20px;
            margin: 10px;
            font-size: 16px;
            cursor: pointer;
        }

        .cancel-btn {
            background-color: #FF6347; 
            color: white;
            border: none;
            border-radius: 5px;
        }

        .confirm-btn {
            background-color: #4CAF50; 
            color: white;
            border: none;
            border-radius: 5px;
        }
    </style>
    <script>
        
        window.onload = function() {
            document.getElementById("overlay").style.display = "block";
        }

        
        function confirmLogout() {
            
            window.location.href = "register.jsp";
        }

        
        function cancelLogout() {
            
        	 window.location.href = "main.jsp";
        }
    </script>
</head>
<body>
    
    <div id="overlay" class="overlay">
        <div class="modal-content">
            <h3>Are you sure you want to log out?</h3>
            <button class="modal-button confirm-btn" onclick="confirmLogout()">Yes, Log out</button>
            <button class="modal-button cancel-btn" onclick="cancelLogout()">Cancel</button>
        </div>
    </div>
</body>
</html>
