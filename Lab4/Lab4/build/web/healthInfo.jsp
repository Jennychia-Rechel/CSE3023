<%-- 
    Document   : healthInfo
    Created on : 21 Apr 2026, 4:15:00 pm
    Author     : Huawei
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><title>Health Information</title></head>
<body>
    <%@include file="header.jsp" %>
    
    <div style="max-width: 500px; margin: auto;">
        <h2>BMI Categories Reference</h2>
        <table border="1" style="width: 100%; border-collapse: collapse; text-align: left;">
            <tr style="background: #eee;">
                <th>Category</th>
                <th>BMI Range</th>
            </tr>
            <%
                ArrayList<String[]> categories = new ArrayList<>();
                categories.add(new String[]{"Underweight", "< 18.5"});
                categories.add(new String[]{"Normal", "18.5 - 25"});
                categories.add(new String[]{"Overweight", "> 25"});
                
                for(String[] row : categories) {
                    out.println("<tr><td>" + row[0] + "</td><td>" + row[1] + "</td></tr>");
                }
            %>
        </table>
    </div>

    <%@include file="footer.jsp" %>
</body>
</html>
