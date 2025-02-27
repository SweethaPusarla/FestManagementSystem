<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.Statement, java.sql.ResultSet" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Event Registrations</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: white;
            color: #232F3E;
            text-align: center;
            margin: 20px;
        }
        
        .table-container {
            margin: 20px auto;
            width: 80%;
            background-color: #1399FF; 
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            color: white;
        }

        h3 {
            color: white;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
            background-color: white;
            color: #232F3E;
            border-radius: 8px;
            overflow: hidden;
        }

        th, td {
            border: 1px solid #1399FF;
            padding: 10px;
            text-align: center;
        }

        th {
            background-color: #1399FF;
            color: white;
        }

        .download-btn {
            display: inline-block;
            background-color: white;
            color: #1399FF;
            padding: 12px 15px;
            margin-top: 10px;
            text-decoration: none;
            border-radius: 8px;
            font-weight: bold;
            border: 2px solid white;
            transition: 0.3s;
        }

        .download-btn:hover {
            background-color: #4B4BFF;
            color: white;
            border: 2px solid #4B4BFF;
        }
    </style>
</head>
<body>

<div>
    <a href="TechFest.jsp" class="download-btn">Home</a>
    <h1>Event Registration Details</h1>
</div>  

<%! 
    public Connection getDBConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/sweetha", "root", "root");
    }
%>


<div class="table-container">
    <h3>Event Registrations</h3>
    <table>
        <thead>
            <tr>
                <th>Username</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Gender</th>
                <th>College</th>
                <th>Branch</th>
                <th>Event</th>
            </tr>
        </thead>
        <tbody>
            <%
                try {
                    Connection conn = getDBConnection();
                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM event_registrations");

                    while (rs.next()) {  
            %>
                <tr>
                    <td><%= rs.getString("username") %></td>
                    <td><%= rs.getString("email") %></td>
                    <td><%= rs.getString("phone") %></td>
                    <td><%= rs.getString("gender") %></td>
                    <td><%= rs.getString("college") %></td>
                    <td><%= rs.getString("branch") %></td>
                    <td><%= rs.getString("events") %></td> 
                </tr>
            <%
                    }
                    rs.close();
                    stmt.close();
                    conn.close();
                } catch (Exception e) {
                    e.printStackTrace();
            %>
                <tr><td colspan="7" style="color:red;">Error loading data.</td></tr>
            <%
                }
            %>
        </tbody>
    </table>
    <a href="EventRegistrationServlet?type=event" class="download-btn">Download Event CSV</a>
</div>

<!-- Song Selections Table -->
<div class="table-container">
    <h3>Song Selections</h3>
    <table>
        <thead>
            <tr>
                <th>Username</th>
                <th>Song</th>
            </tr>
        </thead>
        <tbody>
            <%
                try (Connection conn = getDBConnection();
                     Statement stmt = conn.createStatement();
                     ResultSet rs = stmt.executeQuery("SELECT * FROM song_selections")) {
                    while (rs.next()) {
            %>
                <tr>
                    <td><%= rs.getString("username") %></td>
                    <td><%= rs.getString("song") %></td>
                </tr>
            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
            %>
                <tr><td colspan="2" style="color:red;">Error loading data.</td></tr>
            <%
                }
            %>
        </tbody>
    </table>
    <a href="EventRegistrationServlet?type=song" class="download-btn">Download Song CSV</a>
</div>

<!-- Dance Selections Table -->
<div class="table-container">
    <h3>Dance Selections</h3>
    <table>
        <thead>
            <tr>
                <th>Username</th>
                <th>Dance Name</th>
            </tr>
        </thead>
        <tbody>
            <%
                try (Connection conn = getDBConnection();
                     Statement stmt = conn.createStatement();
                     ResultSet rs = stmt.executeQuery("SELECT * FROM dance_selections")) {
                    while (rs.next()) {
            %>
                <tr>
                    <td><%= rs.getString("username") %></td>
                    <td><%= rs.getString("dance_name") %></td>
                </tr>
            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
            %>
                <tr><td colspan="2" style="color:red;">Error loading data.</td></tr>
            <%
                }
            %>
        </tbody>
    </table>
    <a href="EventRegistrationServlet?type=dance" class="download-btn">Download Dance CSV</a>
</div>

</body>
</html>
