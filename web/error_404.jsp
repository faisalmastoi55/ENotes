<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Page not found</title>
        <%@include file="all-component/allcss.jsp" %>
    </head>
    <body>
        <div class="container text-center">
            <img src="img/404-error.png" class="img-fluid w-50" style="margin-top: -60px">
            <h1 class="display-2 mb-4" style="margin-top: -80px">Sorry ! Page not found</h1>
            <a href="index.jsp" class="btn btn-lg btn-primary text-white mt-3">Home</a>
        </div>
    </body>
</html>
