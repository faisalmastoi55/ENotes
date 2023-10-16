<%@page import="com.notes.project.entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error_page.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>

        <%@include file="all-component/allcss.jsp" %>

    </head>
    <body>
        <%@include file="all-component/navbar.jsp" %>

        <div class="container-fluid background-color">
            <div class="row">
                <div class="col-md-4 offset-md-4 mb-5">
                    <div class="card mt-5">
                        <div class="card-header text-center text-white bg-custom">
                            <i class="bi bi-person-fill fa-3x"></i>
                            <h5>Login here</h5>
                        </div>
                        
                        <%
                            Message m = (Message) session.getAttribute("msg");
                            if(m != null){
                            
                        %>
                        
                        <div class="alert <%= m.getCsClass() %>" role="alert">
                            <%= m.getContent() %>
                        </div>
                        
                        <%
                            session.removeAttribute("msg");
                            }
                        %>
                        
                        <div class="card-body">
                            <form action="LoginServlet" method="post">
                                <div class="mb-3">
                                    <label for="exampleInputEmail1" class="form-label">Enter Email Id</label>
                                    <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                                </div>
                                <div class="mb-3">
                                    <label for="exampleInputPassword1" class="form-label">Enter Password</label>
                                    <input name="user_password" type="password" class="form-control" id="exampleInputPassword1">
                                </div>
                                <button type="submit" class="btn btn-primary w-100 rounded-pill">Login</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="all-component/footer.jsp" %>
    </body>
</html>
