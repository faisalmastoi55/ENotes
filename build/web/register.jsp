<%@page import="com.notes.project.entities.Message"%>
<%@page errorPage="error_page.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>

        <%@include file="all-component/allcss.jsp" %>

    </head>
    <body>
        <%@include file="all-component/navbar.jsp" %>

        <!-- Register Form -->

        <div class="container-fluid background-color">
            <div class="row">
                <div class="col-md-4 offset-md-4 mb-3">
                    <div class="card mt-5">
                        <div class="card-header text-center bg-custom text-white">
                            <i class="bi bi-person-plus-fill fa-3x"></i>
                            <h5>Registration</h5>
                        </div>
                        
                        <%
                                Message m = (Message) session.getAttribute("msg");
                                if (m != null) {
                            %>
                            <div class="alert <%= m.getCsClass() %>" role="alert">
                                <%= m.getContent() %> <a href="login.jsp">click here</a>
                            </div>
                            <%
                                session.removeAttribute("msg");
                                }
                            %>
                            
                            <%
                                Message m1 = (Message) session.getAttribute("errormsg");
                                if (m1 != null) {
                            %>
                            <div class="alert <%= m1.getCsClass() %>" role="alert">
                                <%= m1.getContent() %> 
                            </div>
                            <%
                                session.removeAttribute("errormsg");
                                }
                            %>
                            
                            
                        
                        <div class="card-body">
                            <form action="RegisterServlet" method="POST">
                                <div class="mb-3">
                                    <label for="exampleInputName" class="form-label">Enter Full Name</label>
                                    <input name="user_name" type="text" class="form-control" id="user_name" aria-describedby="emailHelp">
                                </div>
                                <div class="mb-3">
                                    <label for="exampleInputEmail1" class="form-label">Enter Email Id</label>
                                    <input name="user_email" type="email" class="form-control" id="user_email" aria-describedby="emailHelp">
                                    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                                </div>
                                <div class="mb-3">
                                    <label for="exampleInputPassword1" class="form-label">Enter Password</label>
                                    <input name="user_password" type="password" class="form-control" id="user_password">
                                </div>
                                <button type="submit" class="btn btn-primary w-100 rounded-pill">Register</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="all-component/footer.jsp" %>

    </body>
</html>
