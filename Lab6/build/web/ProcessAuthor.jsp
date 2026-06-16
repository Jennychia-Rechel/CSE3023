<%-- 
    Document   : ProcessAuthor
    Created on : 12 May 2026, 3:20:35 pm
    Author     : Huawei
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Process Author</title>
    </head>
    <body>
        <h1>Lab 6 - Task 1 - Perform creating and retrieving records via JSP page</h1>

        <%-- Step 16: Create an author's object using JSP Standard Action tag --%>
        <jsp:useBean id="myAuthor" class="Lab6.com.Author" scope="request"/>

        <%-- Step 17: Assign data entry from insertAuthor.jsp into author's bean --%>
        <jsp:setProperty name="myAuthor" property="*"/>

        <%
            int result;

            try {
                // Step 18: Load driver and create connection
                Class.forName("com.mysql.jdbc.Driver");
                String myURL = "jdbc:mysql://localhost/csa3203";
                Connection myConnection = DriverManager.getConnection(myURL, "root", "admin");

                // Step 19: Create PreparedStatement object
                String sInsertQry = "INSERT INTO Author(authno, name, address, city, state, zip) VALUES(?, ?, ?, ?, ?, ?)";
                PreparedStatement myPS = myConnection.prepareStatement(sInsertQry);

                // Mapping bean properties to SQL parameters
                myPS.setString(1, myAuthor.getAuthno());
                myPS.setString(2, myAuthor.getName());
                myPS.setString(3, myAuthor.getAddress());
                myPS.setString(4, myAuthor.getCity());
                myPS.setString(5, myAuthor.getState());
                myPS.setString(6, myAuthor.getZip());

                // Step 20: Execute query and display result
                result = myPS.executeUpdate();
                
                if (result > 0) {
                    out.println("<br>Record successfully added into Author table...!");
                    out.print("<p>" + "Record with author no " + myAuthor.getAuthno() + " successfully created..!" + "</p>");
                    out.print("<p>" + "Details of record are: " + "</p>");
                    out.print("<p>Name : " + myAuthor.getName() + "</p>");
                    out.print("<p>Address : " + myAuthor.getAddress() + "</p>");
                    out.print("<p>City : " + myAuthor.getCity() + "</p>");
                    out.print("<p>State : " + myAuthor.getState() + "</p>");
                    out.print("<p>Zip : " + myAuthor.getZip() + "</p>");
                }

                // Step 21: Close connection
                myConnection.close();
                out.println("<br>Database connection is closed...!");

            } catch (Exception e) {
                out.println("Error: " + e.getMessage());
            }
        %>
    </body>
</html>