<%-- 
    Document   : memberDirectory
    Created on : 14 Apr 2026, 4:17:48 pm
    Author     : Huawei
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Club Member Directory</title>
    </head>
    <body>
        <%@include file="headerExercise.jsp" %>

        <h2>Club Member Directory</h2>

        <%
            ArrayList<String> list = (ArrayList<String>) session.getAttribute("daftarNama");
        %>

        <table border="1" cellpadding="10" width="80%">
            <tr bgcolor="#eeeeee">
                <th>No.</th>
                <th>Member Name</th>
            </tr>
            
            <%
                if (list == null || list.isEmpty()) {
                    out.println("<tr><td colspan='2' align='center'>No members registered yet.</td></tr>");
                } else {
                    for (int i = 0; i < list.size(); i++) {
            %>
            <tr>
                <td><%= (i + 1) %></td>
                <td><%= list.get(i) %></td>
            </tr>
            <% 
                    }
                } 
            %>
        </table>

        <br/>
        <a href="registerClub.jsp">Add More Members</a>

        <%@include file="footerExercise.jsp" %>
    </body>
</html>
