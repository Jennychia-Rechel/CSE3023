/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.RequestDispatcher; // ADDED: Need this for RequestDispatcher to work
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Huawei
 */
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String user = request.getParameter("username");
        String pass = request.getParameter("password");

        // Semakan kata laluan (Authentication)
        if (user != null && user.equals("Ahmad") && pass != null && pass.equals("4567")) {
            
            // Data Sharing: Menyimpan maklumat tambahan ke dalam 'request'
            request.setAttribute("accountType", "Premium Student");
            request.setAttribute("email", "ahmad@siswa.edu.my");

            // Request Forwarding ke AccountServlet
            RequestDispatcher rd = request.getRequestDispatcher("AccountServlet");
            rd.forward(request, response);
            return; // Exit here so it doesn't try to run more code

        } else if (user != null && user.equals("Siti") && pass != null && pass.equals("1234")) {
            
            // Contoh untuk pengguna lain
            request.setAttribute("accountType", "Standard Student");
            request.setAttribute("email", "siti@siswa.edu.my");
            
            RequestDispatcher rd = request.getRequestDispatcher("AccountServlet");
            rd.forward(request, response);
            return; // Exit here after forwarding

        } else {
            // Jika login gagal
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<h3>Login Failed! Invalid credentials.</h3>");
            out.println("<a href='login.html'>Try Again</a>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Usually, we redirect GET requests to the login page or handle them here
        response.sendRedirect("login.html");
    }
}