<%-- 
    Document   : jspParameter
    Created on : 21 Apr 2026, 3:06:26 pm
    Author     : Huawei
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>JSP Include Page</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f7f6;
            margin: 0;
            padding: 40px;
        }
        .container {
            width: 100%;
            max-width: 600px;
            margin: 0 auto;
        }
        .main-header {
            font-size: 1.1rem;
            color: #333;
            margin-bottom: 20px;
            border-left: 5px solid #6f42c1;
            padding-left: 15px;
            font-weight: bold;
        }
        .card {
            background: #ffffff;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.05);
        }
    </style>
</head>
<body>

<div class="container">
    <div class="main-header">
        Using jsp:include and jsp:param to display information on JSP Page
    </div>

    <div class="card">
        <%
            // Data yang mahu dihantar
            String sCode = "CSE3023";
            String sSubject = "Web-based Application Development";
            String sCredit = "3(2+1)";
        %>

        <jsp:include page="subjectInfo.jsp" flush="true">
            <jsp:param name="code" value="<%= sCode %>" />
            <jsp:param name="subject" value="<%= sSubject %>" />
            <jsp:param name="credit" value="<%= sCredit %>" />
        </jsp:include>
    </div>
</div>

</body>
</html>