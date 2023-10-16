
<%@page import="com.notes.project.entities.AddNotesPost"%>
<%@page import="com.notes.project.helper.ConnectionProvider"%>
<%@page import="com.notes.project.dao.PostDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Page</title>

        <%@include file="all-component/allcss.jsp" %>
                
    </head>
    <body>
        <%@include file="all-component/profilenavbar.jsp" %>

        <%            Integer noteid = Integer.parseInt(request.getParameter("note_id"));
            PostDao post = new PostDao(ConnectionProvider.getConnection());
            AddNotesPost p = post.getDataById(noteid);
        %>

        <!-- start the main body of profile page -->

        <div class="container mb-4">
            <h2 class="mt-5 text-center">Edit Notes Carefully</h2>
            <form id="edit-notes-form" action="EditNoteServlet" method="post">
                <input type="hidden" name="noteid" value="<%= noteid%>">
                <div class="mb-3">
                    <label for="exampleFormControlInput1" class="form-label fw-bold">Note Title</label>
                    <input name="edit_post_title" type="text" class="form-control" id="exampleFormControlInput1" placeholder="Enter here" value="<%= p.getTitle()%>">
                </div>
                <div class="mb-3">
                    <label for="exampleFormControlTextarea1" class="form-label fw-bold">New Content</label>
                    <textarea name="edit_post_content" class="form-control" id="exampleFormControlTextarea1" rows="10" placeholder="Enter Your Content"><%= p.getContent()%></textarea>
                </div>
                <div class="mb-3 text-center">
                    <button type="submit" class="btn btn-primary">Update Note</button>
                </div>
            </form>
        </div>

    </body>
</html>
