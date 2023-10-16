<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error Page</title>
        <%@include file="all-component/allcss.jsp" %>
    </head>
    <body>
        
        <div class="container text-center">
            <img src="img/computer.png" class="img-fluid mt-5">
            <h1 class="display-3">Sorry ! something went wrong</h1>
            <%= exception %>
            <br>
            <a href="index.jsp" class="btn btn-lg btn-primary text-white mt-3">Home</a>
        </div>
        
    </body>
</html>
