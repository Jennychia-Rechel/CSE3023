<%-- 
    Document   : ProcessStudent
    Created on : 12 May 2026, 3:58:14 pm
    Author     : Huawei
--%>

<%-- Step 2: Add page directives --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java"%>
<%@page import="java.sql.*"%>
<%@page errorPage="errorStudent.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Process Student Registration</title>
    </head>
    <body>
        <%-- Step 3: Create Student object --%>
        <jsp:useBean id="myStudent" class="Lab6.com.Student" scope="request"/>

        <%-- Step 4: Assign data from insertStudent.jsp --%>
        <jsp:setProperty name="myStudent" property="*"/>

        <%
            int result;

            try {
                // Step 5: Load driver and establish connection
                Class.forName("com.mysql.jdbc.Driver");
                String myURL = "jdbc:mysql://localhost/csa3203"; // Pastikan nama DB betul
                Connection myConnection = DriverManager.getConnection(myURL, "root", "admin");

                // Step 6: Create PreparedStatement
                String sInsertQry = "INSERT INTO Student(stuno, stuname, stuprogram) VALUES(?, ?, ?)";
                PreparedStatement myPS = myConnection.prepareStatement(sInsertQry);

                // Assign values from bean to SQL
                myPS.setString(1, myStudent.getStudentID());
                myPS.setString(2, myStudent.getStudentName());
                myPS.setString(3, myStudent.getProgram());

                // Step 7: Execute query and display result
                result = myPS.executeUpdate();

                if (result > 0) {
                    out.print("<p>Record with student no " + myStudent.getStuno() + " successfully created..!</p>");
                    out.print("<p>Details of record are:</p>");
                    out.print("<p>Student ID : " + myStudent.getStuno() + "</p>");
                    out.print("<p>Name : " + myStudent.getName() + "</p>");
                    out.print("<p>Program : " + myStudent.getProgram() + "</p>");
                }

                // Step 8: Close database connection
                myConnection.close();

            } catch (Exception e) {
                // Ralat akan dihantar ke errorStudent.jsp secara automatik
                throw e; 
            }
        %>
    </body>
</html>