<%-- 
    Document   : processBMI
    Created on : 21 Apr 2026, 4:08:01 pm
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
        <%
    String wStr = request.getParameter("weight");
    String hStr = request.getParameter("height");
    
    double weight = Double.parseDouble(wStr);
    double height = Double.parseDouble(hStr);
    
    double bmi = weight / (height * height);
    
    String category = "";
    if (bmi < 18.5) category = "Underweight";
    else if (bmi <= 25) category = "Normal";
    else category = "Overweight";
%>

<jsp:forward page="resultBMI.jsp">
    <jsp:param name="bmiVal" value="<%= String.valueOf(bmi) %>" />
    <jsp:param name="bmiCat" value="<%= category %>" />
</jsp:forward>
    </body>
</html>
