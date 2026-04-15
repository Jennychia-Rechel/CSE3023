<%-- 
    Document   : registerClub
    Created on : 14 Apr 2026, 4:05:36 pm
    Author     : Huawei
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="headerExercise.jsp" %>
        <h2>Club Registration Form</h2>
        <form action="processRegistration.jsp" method="POST">
            <label>Student Name:</label><br/>
            <input type="text" name="studName" required><br/><br/>
    
            <label>Matric Number:</label><br/>
            <input type="text" name="matricNo" required><br/><br/>
    
            <label>Selected Club:</label><br/>
            <select name="club">
                <option value="IT Club">IT Club</option>
                <option value="Math Society">Math Society</option>
                <option value="Sports Club">Sports Club</option>
            </select><br/><br/>
    
            <input type="submit" value="Register Now">
        </form>
        <%@include file="footerExercise.jsp" %>
    </body>
</html>
