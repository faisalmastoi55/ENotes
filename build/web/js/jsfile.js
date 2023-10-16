$(document).ready(function () {
    let editStatus = false;
    $('#edit-profile-button').click(function () {
        if (editStatus == false) {
            $("#profile-details").hide();
            $("#edit-profile").show();
            editStatus = true;
            $(this).text("Done");
        } else {
            $("#profile-details").show();
            $("#edit-profile").hide();
            editStatus = false;
            $(this).text("Edit");
        }
    });
});

//sweet alert msg in add note



//sweet alert msg in edit note

$(document).ready(function (e) {
    
    $("#edit-notes-form").on("submit", function (event) {
        event.preventDefault();
        console.log("clicked");
        let edit = new FormData(this);
        $.ajax({
            url: "EditNoteServlet",
            type: 'POST',
            data: edit,
            success: function (data, textStatus, jqXHR) {
                console.log(data);
                if (data.trim() == 'done') {
                    swal("Congratulations", "Edit Successfully", "success")
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

