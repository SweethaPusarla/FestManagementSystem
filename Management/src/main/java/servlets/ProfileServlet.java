package servlets;

import java.io.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.*;

@WebServlet("/profile")
public class ProfileServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);

       
        if (session == null || session.getAttribute("userEmail") == null) {
            response.sendRedirect("login.jsp?error=Please log in");
            return;
        }

        String email = (String) session.getAttribute("userEmail");

     
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            String dbUrl = "jdbc:mysql://localhost:3306/sweetha";
            String dbUsername = "root";
            String dbPassword = "root";
            conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);

            
            String query = "SELECT fest_name, event_name, event_date FROM event_registrations WHERE user_email=?";
            stmt = conn.prepareStatement(query);
            stmt.setString(1, email);
            rs = stmt.executeQuery();

            
            request.setAttribute("events", rs);

          
            request.getRequestDispatcher("/profile.jsp").forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("profile.jsp?error=Database error");
        } finally {
            // Clean up DB resources
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
