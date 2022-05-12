<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeDetail.aspx.cs" Inherits="TableView.EmployeeDetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.3/jquery.validate.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.3/additional-methods.min.js"></script>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>

    <script type="text/javascript" src='https://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.3.min.js'></script>
    <script type="text/javascript" src='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/js/bootstrap.min.js'></script>
    <link rel="stylesheet" href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/css/bootstrap.min.css'
        media="screen" />
    <title></title>


    <style type="text/css">
        .style1 {
            width: 50%;
            margin-left: 20px;
        }

        .div1 {
            width: 200px;
            height: 80px;
            border: 1px solid black;
        }

        .container {
            margin-right: 200px;
        }

        #dvPreview {
            min-height: 400px;
            min-width: 400px;
            display: none;
        }

        #box {
            position: relative;
            bottom: 380px;
            left: 600px;
        }

        .auto-style1 {
            width: 237px;
        }

        .auto-style2 {
            width: 47%;
            margin-left: 20px;
        }

        .style3 {
            margin-left: 15px;
        }
    </style>
    <script type="text/javascript">
        function ApplyLeave() {
            $("#txtId1").val("<%=Id%>");
            $("#PopupApply").modal("show");
            $('#txtId1').attr('readonly', 'true');
        }
    </script>
    <script type="text/javascript">
        function TotalLeave() {
            $("#TotalLeaves").modal("show");
        }
    </script>
    <script>
        $(document).ready(function () {
            $("#btnApply").click(function () {
                var Month = $("#txtMonth").val();
                var LeaveType = $("#txtLeave").val();
                var StartDate = $("#txtStartDate").val();
                var TotalLeave = $("#txtTotalDays").val();
                if (Month == "") {
                    alert('Please Select Month');
                    return false;
                }
                if (LeaveType == "") {
                    alert('Please Select leave type');
                    return false;
                }
                if (StartDate == "") {
                    alert('Enter date for leave');
                    return false;
                }
                if (TotalLeave == "") {
                    alert('Enter Total Leave');
                    return false;
                }
                return true;
            })
        });
    </script>
    <script type="text/javascript">
        $(function () {
            $("#txtTotalDays").keypress(function (e) {
                var keyCode = e.keyCode || e.which;
                $("#lblTotalDays").html("");
                //Regex for Valid Characters i.e. Alphabets.
                var regex = (/^[0-9\s]+$/);
                //Validate TextBox value against the Regex.
                var isValid = regex.test(String.fromCharCode(keyCode));
                if (!isValid) {
                    $("#lblTotalDays").html("Only Numbers allowed.");
                }
                return isValid;
            });
        });
    </script>
    <%--Add Popup--%>
    <script type="text/javascript">
        $(function () {
            $("#TextName").keypress(function (e) {
                var keyCode = e.keyCode || e.which;

                $("#lblErrorName").html("");

                //Regex for Valid Characters i.e. Alphabets.
                var regex = (/^[a-zA-Z\s]+$/);

                //Validate TextBox value against the Regex.
                var isValid = regex.test(String.fromCharCode(keyCode));
                if (!isValid) {
                    $("#lblErrorName").html("Only Alphabets allowed.");
                }
                return isValid;
            });
        });
    </script>
    <script type="text/javascript">
        $(function () {
            $("#TextCity").keypress(function (e) {
                var keyCode = e.keyCode || e.which;

                $("#lblErrorCity").html("");
                var regex = (/^[a-zA-Z\s]+$/);
                var isValid = regex.test(String.fromCharCode(keyCode));
                if (!isValid) {
                    $("#lblErrorCity").html("Only Alphabets allowed.");
                }
                return isValid;
            });
        });
    </script>
    <script type="text/javascript">
        $(function () {
            $("#Button1").on("click", function () {
                if ($('#TextAge').val() > 60 || $('#TextAge').val() < 18) {
                    $("#lblErrorAge").html("Age should be in 18-60.");
                    return false;
                }
            });
        });
    </script>
    <script type="text/javascript">
        $(function () {
            $("#TextAge").keypress(function (e) {
                var keyCode = e.keyCode || e.which;
                $("#lblErrorAge").html("");
                var regex = (/^[0-9\s]+$/);
                var isValid = regex.test(String.fromCharCode(keyCode));
                if (!isValid) {
                    $("#lblErrorAge").html("Only Numbers allowed.");
                }
                return isValid;
            });
        });
    </script>
    <script>
        $(document).ready(function () {
            $("#Button1").click(function () {
                var Name = $("#TextName").val();
                var Address = $("#TextAddress").val();
                var Age = $("#TextAge").val();
                var City = $("#TextCity").val();
                var Gender = $("#TextGender").val();
                if (Name == "") {
                    alert('Please Enter your Name');
                    return false;
                }
                if (Address == "") {
                    alert('Please Enter your Address');
                    return false;
                }
                if (Age == "") {
                    alert('Please Enter your Age');
                    return false;
                }
                if (City == "") {
                    alert('Please Enter your City Name');
                    return false;
                }
                if (Gender == '') {
                    alert('Please fill Gender')
                    return false;
                }
                return true;
            })
        });
    </script>
</head>
<body>
    <form id="form1" runat="server" method="post" enctype="multipart/form-data">
        <nav class="navbar navbar-light" style="background-color: #e3f2fd;">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">EmployeeInfo</a>
                </div>
                <ul class="nav navbar-nav">
                    <li>
                        <asp:Button ID="Button2" class="btn btn-default navbar-btn" runat="server" Text="Home" OnClick="HomePage" /></li>
                    <li>
                        <asp:Button ID="Button3" class="btn btn-default navbar-btn" runat="server" Text="HelpDesk" OnClick="HelpDesk" /></li>
                    <li>
                        <button type="button" class="btn btn-default navbar-btn" data-toggle="modal" data-target="#exampleModal1">
                            Add Data
                        </button>
                    </li>
                </ul>
            </div>
        </nav>
        <%-- Add popup--%>
        <div class="modal fade" id="exampleModal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel1">Add Employee Data</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <table id="AddForm" class="table table-striped">
                            <tr>
                                <td class="auto-style2" visible="false">ID:</td>
                                <td>
                                    <asp:TextBox ID="TextId" runat="server" Visible="false" Style="margin-bottom: 0px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style2">Name:</td>
                                <td>
                                    <span id="lblErrorName" style="color: red"></span>
                                    <asp:TextBox ID="TextName" runat="server" MaxLength="30"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style2">Address:</td>
                                <td>
                                    <asp:TextBox ID="TextAddress" runat="server" CssClass="auto-style3" MaxLength="50"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style2">Age:</td>
                                <td>
                                    <span id="lblErrorAge" style="color: red"></span>
                                    <asp:TextBox ID="TextAge" runat="server" MaxLength="2"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style2">City:</td>
                                <td>
                                    <span id="lblErrorCity" style="color: red"></span>
                                    <asp:TextBox ID="TextCity" runat="server" MaxLength="20"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style2">Gender:</td>
                                <td>
                                    <span id="lblErrorGender" style="color: red"></span>
                                    <asp:DropDownList ID="TextGender" runat="server">
                                        <asp:ListItem Value="">Please Select</asp:ListItem>
                                        <asp:ListItem>Male </asp:ListItem>
                                        <asp:ListItem>Female</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <asp:Button ID="Button1"
                            Text="Save" class="btn btn-primary"
                            OnClick="Add_Click"
                            runat="server" />
                    </div>
                </div>
            </div>
        </div>
        <div id="PopupApply" class="modal" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h3 class="modal-title">Applying for Leave!!!</h3>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <table class="table table-striped">
                            <tr>
                                <td>Id:</td>
                                <td>
                                    <asp:TextBox ID="txtId1" runat="server"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <td>Leave Type:</td>
                                <td>
                                    <asp:DropDownList ID="txtLeave" runat="server">
                                        <asp:ListItem Value="">Please Select</asp:ListItem>
                                        <asp:ListItem>CL </asp:ListItem>
                                        <asp:ListItem>PL</asp:ListItem>
                                        <asp:ListItem>LOP</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>Start Date:</td>
                                <td>
                                    <asp:TextBox ID="txtStartDate" TextMode="Date" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>Total Leave:</td>
                                <td>
                                    <asp:TextBox ID="txtTotalDays" MaxLength="2" runat="server"></asp:TextBox>
                                    <span id="lblTotalDays" style="color: red"></span>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <asp:Button ID="btnApply" class="btn btn-secondary" runat="server" Text="Apply" OnClick="btn_ApplyLeave" />
                    </div>
                </div>
            </div>
        </div>
        <h3 class="style1">All Information of selected Employee:</h3>
        <div class="auto-style2">
            <table class="table table-striped" style="width: 90%">

                <tr>
                    <td class="auto-style1">ID:</td>
                    <td>
                        <asp:TextBox ID="TXTID" ReadOnly="true" runat="server" MaxLength="30" Width="190px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">Date Of Joining:</td>
                    <td>
                        <asp:TextBox ID="txtDOJ" ReadOnly="true" runat="server" MaxLength="25" CssClass="auto-style4" Width="190px"></asp:TextBox>
                    </td>

                </tr>
                <tr>
                    <td class="auto-style1">Job Title:</td>
                    <td>
                        <asp:TextBox ID="txtJobTitle" ReadOnly="true" runat="server" MaxLength="25" Width="190px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">Employee Type:</td>
                    <td>
                        <asp:TextBox ID="txtET" ReadOnly="true" runat="server" MaxLength="20" Width="190px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">Salary:</td>
                    <td>
                        <asp:TextBox ID="txtSalary" ReadOnly="true" runat="server" Width="190px"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </div>
        <div class="style1">
            <%--<asp:Button ID="ButtonUpdate" runat="server" class="btn btn-primary" Text="Update" OnClick="Update_Button" />--%>
            <br />
            <%--Button for leave--%>
            <asp:Button ID="btnLeave" runat="server" class="btn btn-primary" OnClick="ApplyLeave" Text="ApplyLeave" />
            <asp:Button ID="ButtonSalaryDeatails" runat="server" class="btn btn-primary" Text="ShowSalaryData" OnClick="SalaryPage" />
        </div>
        <br />
        <div class="style1">
            <a href="EmployeeForm.aspx">Go Back</a>
        </div>
        <div id="box">
            <div class="container">
                <h2>Profile picture</h2>
                <img src="<%=Id%>.jpg" alt="DP" id="Image12" width="150" height="150" />
            </div>
            <div class="style3">
                <asp:FileUpload ID="flUpload" runat="server" />
                <asp:Button Text="Upload" runat="server" ID="btnUploadFile" OnClick="btnUploadFile_Click"></asp:Button>
            </div>
        </div>
    </form>
</body>
</html>
