<%-- 
    Document   : subjectInfo
    Created on : 21 Apr 2026, 3:08:29 pm
    Author     : Huawei
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Subject Info</title>
    <style>
        /* CSS kamu tadi - saya kekalkan tapi pastikan class digunakan di bawah */
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
        .card {
            background: #ffffff;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.05);
        }
        .form-title {
            color: #6f42c1;
            font-size: 1.6rem;
            font-weight: 500;
            margin-top: 0;
            margin-bottom: 25px;
        }
        .info-group {
            margin-bottom: 15px;
            font-size: 1rem;
            color: #333;
        }
        strong {
            display: inline-block;
            width: 80px; /* Supaya label Code, Subject, Credit sejajar */
        }
    </style>
</head>
<body>

    <div class="container">
        <div class="card">
            <h2 class="form-title">Calling SubjectInfo.Jsp Page</h2>
            
            <div class="info-group">
                <strong>Code:</strong> <%= request.getParameter("code") %>
            </div>
            
            <div class="info-group">
                <strong>Subject:</strong> <%= request.getParameter("subject") %>
            </div>
            
            <div class="info-group">
                <strong>Credit:</strong> <%= request.getParameter("credit") %>
            </div>
        </div>
    </div>

</body>
</html>