/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class InsertServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // 3. Retrieve form data
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String roles = request.getParameter("roles");

        try {
            // 4. Load driver and establish connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/CSE3023", "root", "admin");

            // 5. Create PreparedStatement
            String sql = "INSERT INTO users (username, password, roles) VALUES (?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);

            // 6. Set parameters and execute
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            pstmt.setString(3, roles);
            
            pstmt.executeUpdate();

            // Clean up
            pstmt.close();
            conn.close();

            // 7. Successful insertion redirect
            response.sendRedirect("ViewServlet");

        } catch (Exception e) {
            // It's helpful to show the error on the page if it fails
            response.setContentType("text/html");
            response.getWriter().println("Database Error: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
