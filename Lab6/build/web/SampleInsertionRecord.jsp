<%-- 
    Document   : SampleInsertionRecord
    Created on : 12 May 2026, 2:18:37 pm
    Author     : Huawei
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Lab 6 - Task 1</title>
    </head>
    <body>
        <h1>Lab 6 - Task 1 - Sample Insertion records into MySQL through JSP's page</h1>

        <%
            int result;

            try {
                // Step 1: Load JDBC driver
                Class.forName("com.mysql.cj.jdbc.Driver");
                out.println("Step 1: MySQL driver loaded...!");
        %>
        <br>
        <%
                // Step 2: Establish the connection
                String myURL = "jdbc:mysql://localhost/csa3203";
                Connection myConnection = DriverManager.getConnection(myURL, "root", "admin");
                out.println("Step 2: Database is connected...!");
        %>
        <br>
        <%
                // Step 3: Create a PreparedStatement object
                out.println("Step 3: Prepared Statements created...!");
                String sInsertQry = "INSERT INTO FirstTable VALUE(?)";
                PreparedStatement myPS = myConnection.prepareStatement(sInsertQry);
        %>
        <br>
        <%
                // Step 4: Perform insertion of record
                out.println("Step 4: Perform insertion of record...!");
                String name = "Welcome to access MySQL database with JSP. ....!";
                myPS.setString(1, name);
                result = myPS.executeUpdate();

                if (result > 0) {
        %>
        <br>
        <%
                    // Step 5: Close database connection
                    out.println("Step 5: Close database connection...!");
                    out.println("<br>Database connection is closed...!");
                    out.print("<p style='color:blue'>" + "The record : (" + name 
                            + ") is successfully created..!" + "</p>");
                }
                
                myConnection.close();
                
            } catch (Exception e) {
                out.println("Error: " + e.getMessage());
            }
        %>
    </body>
</html>
