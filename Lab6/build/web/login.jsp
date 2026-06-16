<%-- 
    Document   : login
    Created on : 12 May 2026, 4:13:26 pm
    Author     : Huawei
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>User Login</title>
    <style>
        .login-box { width: 350px; margin: 50px auto; border: 2px solid #2196F3; border-radius: 8px; padding: 20px; font-family: Arial; }
        .error-msg { color: red; font-size: 13px; margin-bottom: 10px; text-align: center; }
        h2 { text-align: center; color: #2196F3; }
    </style>
</head>
<body>
    <div class="login-box">
        <h2>Login System</h2>
        
        <%-- Mesej ralat dari doLogin.jsp --%>
        <% if(request.getParameter("msg") != null) { %>
            <div class="error-msg"><%= request.getParameter("msg") %></div>
        <% } %>

        <form action="doLogin.jsp" method="POST">
            <table width="100%">
                <tr><td>Username:</td><td><input type="text" name="username" required></td></tr>
                <tr><td>Password:</td><td><input type="password" name="password" required></td></tr>
                <tr><td colspan="2" align="center"><br><input type="submit" value="Login"></td></tr>
            </table>
        </form>
    </div>
</body>
</html>