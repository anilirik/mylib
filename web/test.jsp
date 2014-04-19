<%-- 
    Document   : test
    Created on : Apr 8, 2014, 10:23:29 PM
    Author     : vadim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String str = "";
            int k = 0;
        for (int i = 0; i < 10; i++){
            k ++;
            str += k;
        }
        %>
        <h1>Hello World! <%=str%></h1>
    </body>
</html>
 