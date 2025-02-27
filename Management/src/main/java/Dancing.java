import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

@WebServlet("/DanceSelectionServlet")
public class Dancing extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter();
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        JSONArray dancesArray = new JSONArray();

        try {
            String url = "jdbc:mysql://localhost:3306/sweetha"; 
            String user = "root"; 
            String password = "root"; 

            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(url, user, password);

        
            String query = "SELECT dance_name, COUNT(*) as count, GROUP_CONCAT(username SEPARATOR ', ') as users FROM dance_selections GROUP BY dance_name";
            pst = con.prepareStatement(query);
            rs = pst.executeQuery();

            while (rs.next()) {
                JSONObject danceData = new JSONObject();
                danceData.put("name", rs.getString("dance_name"));
                danceData.put("count", rs.getInt("count"));
                danceData.put("users", rs.getString("users"));

                dancesArray.add(danceData);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) {}
            try { if (pst != null) pst.close(); } catch (Exception e) {}
            try { if (con != null) con.close(); } catch (Exception e) {}
        }

        out.print(dancesArray.toString());
        out.flush();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String dance = request.getParameter("dance");
        String username = request.getParameter("username");

        Connection con = null;
        PreparedStatement pst = null;

        try {
            String url = "jdbc:mysql://localhost:3306/sweetha"; 
            String user = "root"; 
            String password = "root"; 

            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(url, user, password);


            String query = "INSERT INTO dance_selections (username, dance_name) VALUES (?, ?)";
            pst = con.prepareStatement(query);
            pst.setString(1, username);
            pst.setString(2, dance);
            pst.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { if (pst != null) pst.close(); } catch (Exception e) {}
            try { if (con != null) con.close(); } catch (Exception e) {}
        }

        response.setStatus(HttpServletResponse.SC_OK);
    }
}
