<%@page import="java.util.List"%>
<%@page import="com.notes.project.helper.ConnectionProvider"%>
<%@page import="com.notes.project.dao.PostDao"%>
<%@page import="com.notes.project.entities.AddNotesPost"%>
<%@page import="com.notes.project.entities.Message"%>
<%@page import="com.notes.project.entities.User"%>
<%@page errorPage="error_page.jsp" %>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Show Notes Page</title>

        <%@include file="all-component/allcss.jsp" %>

    </head>
    <body>

        <%@include file="all-component/profilenavbar.jsp" %>

        <!-- start the main body of show notes page -->

        <div class="container">
            <h2 class="text-center mt-4 mb-5">All Notes:</h2>

            <div class="row">
                <div class="col-md-12">

                    <%                        User u = (User) session.getAttribute("currentUser");

                        if (user != null) {

                            PostDao po = new PostDao(ConnectionProvider.getConnection());

                            List<AddNotesPost> post = po.getPostById(user.getId());

                            for (AddNotesPost pt : post) {
                    %>

                    <div class="card mb-4">
                        <img src="img/Home_page_pic.jpg" class="card-img-top mt-2 mx-auto" alt="alt" style="max-width: 200px"/>
                        <div class="card-body p-4">
                            <h5 class="card-title"> <%= pt.getTitle()%> </h5>
                            <p> <%= pt.getContent()%> </p>
                            <p>
                                <b class="text-success">Published By: <%= user.getName()%> </b>
                                <br> 
                                <b class="text-primary"></b>
                            </p>
                            <p>
                                <b class="text-success">Published Date: <%= pt.getDate()%> </b>
                                <br> 
                                <b class="text-success"></b>
                            </p>
                            <div class="container text-center mt-2">
                                <a href="DeleteServlet?note_id=<%= pt.getPid()%>" id="delete-button" class="btn btn-danger">Delete</a>
                                <a href="edit.jsp?note_id=<%= pt.getPid()%>" class="btn btn-primary">Edit</a>
                            </div>
                        </div>
                    </div>

                    <%
                            }

                        }


                    %>


                </div>
            </div>

        </div>

        <!-- end the main body of show notes page -->

        
    </body>
</html>
