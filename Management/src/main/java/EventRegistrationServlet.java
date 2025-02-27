import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/EventRegistrationServlet")
public class EventRegistrationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        String type = request.getParameter("type");

        
        if (type == null || type.trim().isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing or invalid 'type' parameter.");
            return;
        }

        String query = "";
        String csvHeader = "";

        
        switch (type) {
            case "event":
                query = "SELECT username, email, phone, gender, college, branch, events FROM event_registrations";
                csvHeader = "Username,Email,Phone,Gender,College,Branch,Event";
                break;
            case "song":
                query = "SELECT username, song FROM song_selections";
                csvHeader = "Username,Song";
                break;
            case "dance":
                query = "SELECT username, dance_name FROM dance_selections";
                csvHeader = "Username,Dance Name";
                break;
            default:
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid request type.");
                return;
        }

       
        response.setContentType("text/csv");
        response.setHeader("Content-Disposition", "attachment;filename=" + type + "_registrations.csv");

       
        try (PrintWriter out = response.getWriter();
             Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sweetha", "root", "root");
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {

        
            out.println(csvHeader);

      
            while (rs.next()) {
                if ("event".equals(type)) {
                    out.println(rs.getString("username") + "," + rs.getString("email") + "," + rs.getString("phone") + ","
                            + rs.getString("gender") + "," + rs.getString("college") + "," + rs.getString("branch") + ","
                            + rs.getString("events"));
                } else {
                    out.println(rs.getString("username") + "," + rs.getString(2));
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error generating CSV file.");
        }
    }
}
