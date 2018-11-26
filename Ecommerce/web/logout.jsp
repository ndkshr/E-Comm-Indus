<%-- 
    Document   : logout
    Created on : 26 Nov, 2018, 6:14:34 AM
    Author     : Owner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        HttpSession sess = request.getSession();
        sess.invalidate();
        %>
        <jsp:forward page="index.html" />
    </body>
</html>
