<%-- 
    Document   : feeCalculator
    Created on : 14 Apr 2026, 4:15:34 pm
    Author     : Huawei
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exercise</title>
    </head>
    <body>
        <%@include file="headerExercise.jsp" %>
        <h2>Membership Fee Calculator</h2>
        <form method="GET">
            Number of activities joined: 
            <input type="number" name="activityCount">
            <input type="submit" value="Calculate Fee">
        </form>

        <%
            if(request.getParameter("activityCount") != null) {
                int count = Integer.parseInt(request.getParameter("activityCount"));
                double total = count * 10.0;
        %>
            <h3>Total Fee: RM <%= String.format("%.2f", total) %></h3>
        <% } %>
        <%@include file="footerExercise.jsp" %>
    </body>
</html>
