<%@ page import="java.sql.*" %>
<%@ page import="jakarta.servlet.http.*, jakarta.servlet.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Get email from session (assuming user is logged in)
    String email = (String) session.getAttribute("email");

    if (email == null) {
        response.sendRedirect("login.jsp"); 
        return;
    }


    String jdbcURL = "jdbc:mysql://localhost:3306/sweetha";
    String jdbcUser = "root";
    String jdbcPass = "root";

    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    String username = "";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(jdbcURL, jdbcUser, jdbcPass);

        // Fetch username
        stmt = conn.prepareStatement("SELECT username FROM event_registrations WHERE email = ?");
        stmt.setString(1, email);
        rs = stmt.executeQuery();
        if (rs.next()) {
            username = rs.getString("username");
        }
        rs.close();
        stmt.close();
    } catch (Exception e) {
        out.println("Error loading user details: " + e.getMessage());
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile - TechFest2025</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: white;
            color: #232F3E; 
            text-align: center;
        }

        .container {
            width: 60%;
            margin: auto;
            padding: 20px;
            background-color: #1399FF; 
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
            margin-top: 50px;
            color: white;
        }

        h2, h3 {
            color: white;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: white;
            color: #232F3E;
            border-radius: 8px;
            overflow: hidden;
        }

        th, td {
            padding: 12px;
            border: 1px solid #1399FF;
            text-align: left;
        }

        th {
            background-color: #1399FF;
            color: white;
        }

     
        .logout-btn {
            display: inline-block;
            margin-top: 20px;
            padding: 12px 20px;
            background-color: white;
            color: #1399FF;
            text-decoration: none;
            border-radius: 8px;
            font-weight: bold;
            border: 2px solid white;
            transition: 0.3s;
        }

        .logout-btn:hover {
            background-color: #4B4BFF;
            color: white;
            border: 2px solid #4B4BFF;
        }

    </style>
</head>
<body>

<div class="container">
    <h2>Welcome, <%= username %></h2>
    <h3>TechFest2025 - Registered Events</h3>

    <table>
        <tr>
            <th>Event Name</th>
        </tr>
        <%
            try {
                
                stmt = conn.prepareStatement("SELECT events FROM event_registrations WHERE email = ?");
                stmt.setString(1, email);
                rs = stmt.executeQuery();
                boolean hasEvents = false;
                while (rs.next()) {
                    hasEvents = true;
        %>
                    <tr>
                        <td><%= rs.getString("events") %></td>
                    </tr>
        <%
                }
                if (!hasEvents) {
        %>
                    <tr>
                        <td>No events registered.</td>
                    </tr>
        <%
                }
                rs.close();
                stmt.close();
                conn.close();
            } catch (Exception e) {
                out.println("Error loading event data: " + e.getMessage());
                e.printStackTrace();
            }
        %>
    </table>

    <a href="logout.jsp" class="logout-btn">Logout</a>
</div>

</body>
</html>
