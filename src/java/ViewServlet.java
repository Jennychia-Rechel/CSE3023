/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;        
import java.sql.DriverManager;     
import java.sql.ResultSet;       
import java.sql.Statement;       
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Huawei
 */
@WebServlet(urlPatterns = {"/ViewServlet"})
public class ViewServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        out.println("<h2>User List</h2>");
        out.println("<table border='1'><tr><th>ID</th><th>Username</th><th>Password</th><th>Role</th><th>Actions</th></tr>");

        try {
            // 2. Establish connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/CSE3023", "root", "admin");

            // 3 & 4. Execute Query
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM users");

            // 5. Iterate through results
            while (rs.next()) {
                int id = rs.getInt("id");
                String user = rs.getString("username");
                String pass = rs.getString("password");
                String role = rs.getString("roles");

                // 6 & 7. Generate table rows and Action links
                out.println("<tr>");
                out.println("<td>" + id + "</td>");
                out.println("<td>" + user + "</td>");
                out.println("<td>" + pass + "</td>");
                out.println("<td>" + role + "</td>");
                out.println("<td>");
                out.println("<a href='UpdateServlet?id=" + id + "'>Edit</a> | ");
                out.println("<a href='DeleteServlet?id=" + id + "'>Delete</a>");
                out.println("</td>");
                out.println("</tr>");
            }
            
            out.println("</table>"); 
            out.println("<br><a href='index.html'>Add New User</a>");

            rs.close();
            stmt.close();
            conn.close();
            
        } catch (Exception e) {
            out.println("<p style='color:red'>Error: " + e.getMessage() + "</p>");
            e.printStackTrace();
        }
    } 
} 