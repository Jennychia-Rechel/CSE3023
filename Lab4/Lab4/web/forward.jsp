<%-- 
    Document   : forward
    Created on : 21 Apr 2026, 3:19:33 pm
    Author     : Huawei
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
    <%-- Segala yang ada kat sini takkan muncul kat browser --%>
    <jsp:forward page="forwardInfo.jsp">
        <jsp:param name="uname" value="Wan Nural Jawahir Hj Wan Yussof" />
        <jsp:param name="email" value="wannurwy@umt.edu.my" />
        <jsp:param name="nationality" value="Malaysia" />
        <jsp:param name="background" value="Lecturer" />
    </jsp:forward>
</body>
</html>