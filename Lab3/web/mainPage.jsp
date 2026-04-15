<%-- 
    Document   : mainPage
    Created on : 14 Apr 2026, 3:46:31 pm
    Author     : Huawei
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Main Page - Include Directive</title>
    </head>
    <body>

        <%@include file="headerPage.jsp" %>

        <h1>Using JSP Include directive</h1>
        
        <p style="color: red;">
            Java Server Page (JSP) is a technology for controlling the content<br> 
            or appearance of Web pages through the use of servlets, small<br> 
            programs that are specified in the Web page and run on the Web server<br> 
            to modify the Web page before it is sent to the user who requested it.<br>
        </p>

        <%@include file="footerPage.jsp" %>

    </body>
</html>
