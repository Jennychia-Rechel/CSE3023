<%-- 
    Document   : processRegistration
    Created on : 14 Apr 2026, 4:13:35 pm
    Author     : Huawei
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Successful</title>
    </head>
    <body>
        <%@include file="headerExercise.jsp" %>

        <%
            String name = request.getParameter("studName");
         
            ArrayList<String> list = (ArrayList<String>) session.getAttribute("daftarNama");
            
            if (list == null) {
                list = new ArrayList<String>();
            }
            if (name != null && !name.trim().isEmpty()) {
                list.add(name);
            }
            session.setAttribute("daftarNama", list);
        %>

        <h2>Registration Successful!</h2>
        <p>Thank you, <b><%= name %></b>. You have been added to the directory.</p>
        
        <br/>
        <a href="memberDirectory.jsp">View Member Directory</a>

        <%@include file="footerExercise.jsp" %>
    </body>
</html>
