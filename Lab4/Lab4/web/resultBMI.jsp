<%-- 
    Document   : resultBMI
    Created on : 21 Apr 2026, 4:14:09 pm
    Author     : Huawei
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><title>BMI Result</title></head>
<body>
    <%@include file="header.jsp" %>
    
    <div style="max-width: 400px; margin: auto; padding: 20px; text-align: center; border: 2px solid #6f42c1; border-radius: 10px;">
        <h2 style="color: #6f42c1;">Your BMI Result</h2>
        <%
            double bmiResult = Double.parseDouble(request.getParameter("bmiVal"));
            String category = request.getParameter("bmiCat");
        %>
        <h3>BMI Value: <%= String.format("%.2f", bmiResult) %></h3>
        <h3>Category: <span style="color: red;"><%= category %></span></h3>
        
        <br>
        <a href="bmiCalculator.jsp">Calculate Again</a>
    </div>

    <%@include file="footer.jsp" %>
</body>
</html>
