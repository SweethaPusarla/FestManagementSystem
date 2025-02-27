import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import db.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/Festregister")
public class TechFestRegister extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Getting parameters from the form
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String gender = request.getParameter("gender");
        String college = request.getParameter("college");
        String branch = request.getParameter("branch");
        String[] eventsArray = request.getParameterValues("events");
        String events = (eventsArray != null) ? String.join(", ", eventsArray) : "";

       
        if (username == null || username.trim().isEmpty()) {
            out.println("<h3>Username cannot be empty</h3>");
            return;
        }

        try {
            // Getting DB connection
            Connection conn = DBConnection.getConnection();
            // Preparing SQL statement
            PreparedStatement ps = conn.prepareStatement(
                "INSERT INTO event_registrations(username, email, phone, gender, college, branch, events) VALUES (?, ?, ?, ?, ?, ?, ?)");

            
            ps.setString(1, username);
            ps.setString(2, email);
            ps.setString(3, phone);
            ps.setString(4, gender);
            ps.setString(5, college);
            ps.setString(6, branch);
            ps.setString(7, events);

            // Executing the query and check if insertion was successful
            int rowCount = ps.executeUpdate();
            if (rowCount > 0) {
                // Successful insertion, redirect to a new page
                response.sendRedirect("main.jsp");
            } else {
                out.println("<h3>Registration Failed</h3>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h3>Error: " + e.getMessage() + "</h3>");
        }
    }
}
