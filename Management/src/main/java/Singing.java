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

@WebServlet("/SongSelectionServlet")
public class Singing extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter();
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        JSONArray songArray = new JSONArray();

        try {
            String url = "jdbc:mysql://localhost:3306/sweetha"; 
            String user = "root"; 
            String password = "root"; 

            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(url, user, password);

            
            String query = "SELECT song, COUNT(*) as count, GROUP_CONCAT(username SEPARATOR ', ') as users FROM song_selections GROUP BY song";
            pst = con.prepareStatement(query);
            rs = pst.executeQuery();

            while (rs.next()) {
                JSONObject songData = new JSONObject();
                songData.put("name", rs.getString("song"));
                songData.put("count", rs.getInt("count"));
                songData.put("users", rs.getString("users"));

                songArray.add(songData);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) {}
            try { if (pst != null) pst.close(); } catch (Exception e) {}
            try { if (con != null) con.close(); } catch (Exception e) {}
        }

        out.print(songArray.toString());
        out.flush();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String song = request.getParameter("song");
        String username = request.getParameter("username");

        Connection con = null;
        PreparedStatement pst = null;

        try {
            String url = "jdbc:mysql://localhost:3306/sweetha"; 
            String user = "root"; 
            String password = "root"; 

            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(url, user, password);

            
            String query = "INSERT INTO song_selections (username, song) VALUES (?, ?)";
            pst = con.prepareStatement(query);
            pst.setString(1, username);
            pst.setString(2, song);
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
