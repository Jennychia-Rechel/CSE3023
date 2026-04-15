<%-- 
    Document   : ArrayList
    Created on : 14 Apr 2026, 3:24:20 pm
    Author     : Huawei
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Use Java ArrayList</title>
        <style>
            .blue-text {
                color: blue;
                font-family: Arial, sans-serif;
            }
        </style>
    </head>
    <body>
        <h1>Use JSP Page Directive</h1>

        <div class="blue-text">
            <%
                ArrayList<String> studentList = new ArrayList<String>();

                studentList.add("Mohamad Azam");
                studentList.add("Peter Chong");
                studentList.add("Rahimah Mansor");
                studentList.add("Sri Devi");
                studentList.add("Ng Hue Ween");
                studentList.add("S. Nagarajan");

                out.println("<p>The number of records in Arraylist is " + studentList.size() + "</p>");

                for (int i = 0; i < studentList.size(); i++) {
                    out.println("<p>Record " + (i + 1) + " is " + studentList.get(i) + "</p>");
                }
            %>
        </div>

        <br>
        <footer>&copy;2026-Jenny</footer>
    </body>
</html>