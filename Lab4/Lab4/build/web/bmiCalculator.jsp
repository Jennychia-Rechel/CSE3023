<%-- 
    Document   : bmiCalculator
    Created on : 21 Apr 2026, 4:07:32 pm
    Author     : Huawei
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><title>BMI Calculator</title></head>
<body>
    <%@include file="header.jsp" %>
    
    <div style="max-width: 400px; margin: auto; padding: 20px; border: 1px solid #ccc; border-radius: 10px;">
        <h2>BMI Input Form</h2>
        <form action="processBMI.jsp" method="POST">
            <p>Weight (kg): <br>
            <input type="number" name="weight" step="0.1" required></p>
            
            <p>Height (m): <br>
            <input type="number" name="height" step="0.01" min="0.1" required></p>
            
            <button type="submit" style="background: #6f42c1; color: white; padding: 10px; border: none; border-radius: 5px;">Calculate BMI</button>
        </form>
    </div>

    <%@include file="footer.jsp" %>
</body>
</html>
