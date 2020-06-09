var GlobalID;
$(document).ready(function () {
    $('#formSCRUD').validate({
        rules: {
            Nama: {
                required: true,
            },
            Email: {
                required: true,
                email: true,
            }
        },
        submitHandler: function () {
            if (GlobalID == null) {
                var DataPost = $('#formSCRUD').serialize();
                DataPost = DataPost + '&Option=1';
                $.ajax({
                    url: '/Home/InsertUser',
                    type: 'POST',
                    data: DataPost,
                    success: function (Result) {
                        if (Result == "Sukses") {
                            $('#ResultCRUD').load('/Home/ListUser');
                            $('#formSCRUD').trigger("reset");
                        } else {
                            alert(Result);
                        }
                    }
                })
            } else {
                var DataPost = $('#formSCRUD').serialize();
                DataPost = DataPost + '&Option=2&ID=' + GlobalID;
                $.ajax({
                    url: '/Home/InsertUser',
                    type: 'POST',
                    data: DataPost,
                    success: function (Result) {
                        if (Result == "Sukses") {
                            $('#ResultCRUD').load('/Home/ListUser');
                            $('#formSCRUD').trigger("reset");
                            $('#btnInsertData').show();
                            $('#btnUpdateData').hide();
                            $('#btnCancel').hide();
                            GlobalID = null;
                        } else {
                            alert(Result);
                        }
                    }
                })
            }
        }
    })
    $('#btnCancel').click(function () {
        GlobalID = null;
        $('#formSCRUD').trigger("reset");
        $('#btnInsertData').show();
        $('#btnUpdateData').hide();
        $('#btnCancel').hide();
    })
})

function DeleteUser(ID) {
    var DataPost = {
        ID: ID,
    }
    $.ajax({
        url: '/Home/DeleteUser',
        type: 'POST',
        data: DataPost,
        success: function (Result) {
            if (Result == "Sukses") {
                $('#ResultCRUD').load('/Home/ListUser');
            } else {
                alert(Result);
            }
        }
    })
}

function EditUser(ID, Nama, Email) {
    GlobalID = ID;
    $('#txtNama').val(Nama);
    $('#txtEmail').val(Email)
    $('#btnInsertData').hide();
    $('#btnUpdateData').show();
    $('#btnCancel').show();
}