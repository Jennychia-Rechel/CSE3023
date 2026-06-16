<%-- 
    Document   : ProcessUser
    Created on : 12 May 2026, 4:26:15 pm
    Author     : Huawei
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Process Registration</title>
        <style>
            .message-box {
                width: 400px;
                margin: 20px auto;
                padding: 15px;
                border: 1px solid #4CAF50;
                border-radius: 5px;
                font-family: Arial, sans-serif;
            }
            .success { color: #2e7d32; font-weight: bold; }
            .error { color: #d32f2f; font-weight: bold; }
        </style>
    </head>
    <body>
        <div class="message-box">
            <%
                // Ambil data dari insertUser.html
                String user = request.getParameter("username");
                String pass = request.getParameter("password");
                String fname = request.getParameter("firstname");
                String lname = request.getParameter("lastname");

                int result;

                try {
                    Class.forName("com.mysql.jdbc.Driver");

                    String myURL = "jdbc:mysql://localhost/csa3203";
                    Connection myConnection = DriverManager.getConnection(myURL, "root", "admin");

                    String sql = "INSERT INTO userprofile (username, password, firstname, lastname) VALUES (?, ?, ?, ?)";
                    PreparedStatement myPS = myConnection.prepareStatement(sql);

                    myPS.setString(1, user);
                    myPS.setString(2, pass);
                    myPS.setString(3, fname);
                    myPS.setString(4, lname);

                    result = myPS.executeUpdate();

                    if (result > 0) {
                        out.println("<p class='success'>Registration Successful!</p>");
                        out.println("<p>User <strong>" + user + "</strong> has been registered.</p>");
                        out.println("<br><a href='login.jsp'>Go to Login Page</a>");
                    }

                    myConnection.close();

                } catch (Exception e) {
                    out.println("<p class='error'>Error: " + e.getMessage() + "</p>");
                    out.println("<p>Pastikan table 'userprofile' sudah wujud di phpMyAdmin.</p>");
                }
            %>
        </div>
    </body>
</html>