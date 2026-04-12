/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {

    // PART 1: Display the form with existing data
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String id = request.getParameter("id");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/CSE3023", "root", "admin2128");

            String sql = "SELECT * FROM users WHERE id=?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, Integer.parseInt(id));
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                out.println("<h2>Update User</h2>");
                out.println("<form action='UpdateServlet' method='POST'>");
                out.println("<input type='hidden' name='id' value='" + id + "'>");
                out.println("Username: <input type='text' name='username' value='" + rs.getString("username") + "'><br><br>");
                out.println("Password: <input type='text' name='password' value='" + rs.getString("password") + "'><br><br>");
                out.println("Role: <select name='roles'>");
                out.println("<option value='Admin'>Admin</option>");
                out.println("<option value='Staff'>Staff</option>");
                out.println("<option value='Student'>Student</option>");
                out.println("</select><br><br>");
                out.println("<input type='submit' value='Update User'>");
                out.println("</form>");
            }
            conn.close();
        } catch (Exception e) { e.printStackTrace(); }
    }

    // PART 2: Save the modified data
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Retrieve modified form data
        String id = request.getParameter("id");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String roles = request.getParameter("roles");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/CSE3023", "root", "admin2128");

            String sql = "UPDATE users SET username=?, password=?, roles=? WHERE id=?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            pstmt.setString(3, roles);
            pstmt.setInt(4, Integer.parseInt(id));

            pstmt.executeUpdate();
            pstmt.close();
            conn.close();

            response.sendRedirect("ViewServlet");
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}