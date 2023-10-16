<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>

        <%@include file="all-component/allcss.jsp" %>

        <style>
            .back-image{
                background-image: url("img/n3.jpg");
                height: 80vh;
                position: relative;
                background-position: center;
                background-repeat: no-repeat;
                background-size: cover;
            }
        </style>

    </head>
    <body>
        <%@include file="all-component/navbar.jsp" %>
        <div class="container-fluid back-image">
            <div class="text-center py-4">
                <h1 class="text-white"><i class="fa fa-book"></i> E Notes -  Save Your Notes</h1>
                <a href="login.jsp" class="btn btn-light me-2"><span class="fa fa-user-circle fa-spin"></span> Login</a>
                <a href="register.jsp" class="btn btn-light"><i class="bi bi-person-plus-fill"></i> Register</a>
            </div>
        </div>
        <%@include file="all-component/footer.jsp" %>
    </body>
</html>
