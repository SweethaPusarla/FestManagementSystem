import java.io.IOException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import db.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/loginTechFest")
public class loginTechFest extends HttpServlet {
    private static final long serialVersionUID = 1L;


    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("login.jsp?error=method_not_allowed");
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        
        final String allowedEmail = "sweethapusarla@gmail.com"; 

        try {
            Connection conn = DBConnection.getConnection();
            if (conn == null) {
                response.sendRedirect("login.jsp?error=server");
                return;
            }

        
            PreparedStatement pst = conn.prepareStatement(
                "SELECT username, password FROM members WHERE email = ?");
            pst.setString(1, allowedEmail);
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                String dbPassword = rs.getString("password");
                String enteredPassword = request.getParameter("password");

                if (enteredPassword.equals(dbPassword)) {
                   
                    HttpSession session = request.getSession();
                    session.setAttribute("username", rs.getString("username"));
                    session.setAttribute("email", allowedEmail);

                    response.sendRedirect("EventRegistration.jsp");
                } else {
                    response.sendRedirect("login.jsp?error=invalid");
                }
            } else {
                response.sendRedirect("login.jsp?error=invalid");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp?error=server");
        }
    }
}
