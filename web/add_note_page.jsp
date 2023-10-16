<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Notes Page</title>

        <%@include file="all-component/allcss.jsp" %>

    </head>
    <body>

        <%@include file="all-component/profilenavbar.jsp" %>

        <!-- start the main body of profile page -->

        <div class="container mb-4">
            <h2 class="mt-5 text-center">Add Your Notes</h2>
            <form id="add-note" action="AddNoteServlet" method="post">
                <div class="mb-3">
                    <label for="exampleFormControlInput1" class="form-label fw-bold">Note Title</label>
                    <input name="post_title" type="text" class="form-control" id="exampleFormControlInput1" placeholder="Enter here">
                </div>
                <div class="mb-3">
                    <label for="exampleFormControlTextarea1" class="form-label fw-bold">New Content</label>
                    <textarea name="post_content" class="form-control" id="exampleFormControlTextarea1" rows="10" placeholder="Enter Your Content"></textarea>
                </div>
                <div class="mb-3 text-center">
                    <button type="submit" class="btn btn-primary">Add</button>
                </div>
            </form>
        </div>

        <!-- end the main body of profile page -->


        <script>

            $(document).ready(function (e) {
                //
                $("#add-note").on("submit", function (event) {
                    event.preventDefault();
                    console.log("clicked");
                    var form = new FormData(this);
                    $.ajax({
                        url: "AddNoteServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);
                            if (data.trim() == 'done') {
                                swal("Good job!", "Save Successfully", "success")
                                        .then((value) => {
                                            window.location = "show_notes.jsp"
                                        });

                            } else {
                                swal("Error!!", "Something went wrong try again...", "error");
                            }

                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            swal("Error!!", "Something went wrong try again...", "error");
                        },
                        processData: false,
                        contentType: false
                    });
                });
            });


        </script>

    </body>
</html>
