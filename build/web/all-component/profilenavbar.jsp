<%@page import="com.notes.project.entities.Message"%>
<%@page import="com.notes.project.entities.User"%>
<%@page errorPage="error_page.jsp" %>

<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login.jsp");
    }
%>


<!-- bootstrap 5 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

<!-- bootstrap 5 icons -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

<!-- css -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- css link -->
<link rel="stylesheet" href="css/style.css">

<!-- javascript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<!-- javascript link -->
<script src="js/jsfile.js"></script>

<!-- Start Navbar -->

        <nav class="navbar navbar-expand-lg navbar-dark bg-custom navbar-custom">
            <div class="container-fluid">
                <a class="navbar-brand" href="profile_page.jsp"><i class="bi bi-mortarboard-fill"></i>E Notes</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link" aria-current="page" href="profile_page.jsp"><i class="bi bi-house-fill"></i>Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="add_note_page.jsp"><i class="bi bi-plus-circle-fill"></i>Add Note</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="show_notes.jsp"><i class="bi bi-person-square"></i>Show Note</a>
                        </li>
                    </ul>
                    <form class="d-flex">
                        <a class="nav-link me-2 profile-name" href="#!" data-bs-toggle="modal" data-bs-target="#profile-model"><i class="bi bi-person-circle"></i> <%= user.getName()%> </a>
                        <a href="LogoutServlet" class="btn btn-light" type="submit"><i class="bi bi-box-arrow-right"></i> Logout</a>
                    </form>
                </div>
            </div>
        </nav>

        <!-- End Navbar -->


        <%
            Message m = (Message) session.getAttribute("msg");
            
            if(m != null){
            
        %>
        
        <div class="alert <%= m.getCsClass() %> " role="alert">
            <%= m.getContent() %>
        </div>
        
        <%
            session.removeAttribute("msg");
            }
        %>
        
        <!-- Start the profile model -->


        <!-- Modal -->
        <div class="modal fade" id="profile-model" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header bg-custom text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Profile Page</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="container text-center">
                            <img src="img/default.png" class="img-fluid mb-3" style="border-right: 50%; max-width: 100px">
                            <h4 class="model-title mb-3"> <%= user.getName()%> </h4>

                            <!-- More Details of profile -->

                            <div id="profile-details">
                                <table class="table">
                                    <tbody>
                                        <tr>
                                            <th scope="row"> ID </th>
                                            <th> : </th>
                                            <th> <%= user.getId()%> </th>
                                        </tr>
                                        <tr>
                                            <th scope="row"> Full Name </th>
                                            <th> : </th>
                                            <th> <%= user.getName()%> </th>
                                        </tr>
                                        <tr>
                                            <th scope="row"> Email </th>
                                            <th> : </th>
                                            <th> <%= user.getEmail()%> </th>
                                        </tr>
                                        <tr>
                                            <th scope="row"> Password </th>
                                            <th> : </th>
                                            <th> <%= user.getPassword()%> </th>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                            <!-- end Details of profile -->

                            <!-- start edit Details of profile -->

                            <div id="edit-profile" style="display: none">
                                <h3>Please Edit Carefully</h3>
                                <form action="EditServlet" method="post">
                                    <table class="table">
                                        <tbody>
                                            <tr>
                                                <th> ID </th>
                                                <th> : </th>
                                                <th> <%= user.getId()%> </th>
                                            </tr>
                                            <tr>
                                                <th> Full Name </th>
                                                <th> : </th>
                                                <td> <input name="u_name" type="text" class="form-control" value="<%= user.getName()%>"> </td>
                                            </tr>
                                            <tr>
                                                <th> Email </th>
                                                <th> : </th>
                                                <td> <input name="u_email" type="email" class="form-control" value="<%= user.getEmail()%>"> </td>
                                            </tr>
                                            <tr>
                                                <th> Password </th>
                                                <th> : </th>
                                                <td> <input name="u_password" type="password" class="form-control" value="<%= user.getPassword()%>"> </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <div class="container">
                                        <button type="submit" class="btn btn-outline-primary">Save</button>
                                    </div>
                                </form>
                            </div>

                            <!-- end edit Details of profile -->

                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button id="edit-profile-button" type="button" class="btn btn-primary">Edit</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- End the profile model -->