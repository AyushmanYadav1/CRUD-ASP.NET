<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Salary.aspx.cs" Inherits="TableView.Salary" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
    <link rel="stylesheet" href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/css/bootstrap.min.css'
        media="screen" />
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
        .auto-style1 {
            width: 1291px;
        }

        .auto-style2 {
            width: 1135px
        }

        .style1 {
            margin-left: 20px;
        }
    </style>
    <script>
        $(document).ready(function () {
            $("#Btn").click(function () {
                var Month = $("#txtMonth").val();
                if (Month == "") {
                    alert('Please fill the month');
                    return false;
                }
                return true;
            })
        });
    </script>
    <script>
        $(document).ready(function () {
            $("#btnInsert").click(function () {
                var SalaryPaidOn = $("#txtPaid").val();
                var Remarks = $("#txtRemarks").val();
                if (SalaryPaidOn == "") {
                    alert('Please fill the Date for SalaryPaidOn');
                    return false;
                }
                if (Remarks == "") {
                    alert('Please fill the Reamrks');
                    return false;
                }
                return true;
            })
        });
    </script>
    <%--Add Popup --%>
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
    <form id="form1" runat="server">
        <nav class="navbar navbar-light" style="background-color: #e3f2fd;">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">EmployeeInfo</a>
                </div>
                <ul class="nav navbar-nav">
                    <li>
                        <asp:Button ID="Button2" class="btn btn-default navbar-btn" runat="server" Text="Home" OnClick="HomePage" /></li>
                    <li>
                        <button type="button" class="btn btn-default navbar-btn">Feeds</button></li>
                    <li>
                        <button type="button" class="btn btn-default navbar-btn">People</button></li>
                    <li>
                        <button type="button" class="btn btn-default navbar-btn">Helpdesk</button></li>
                    <li>
                        <button type="button" class="btn btn-default navbar-btn" data-toggle="modal" data-target="#exampleModal1">
                            Add Data
                        </button>
                    </li>
                </ul>
            </div>
        </nav>
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
        <div class="style1">
            <br />
            <h3>Employee Salary:</h3>
            <br />
            <table class="table table-striped" style="width: 36%; height: 230px">
                <tr>
                    <td class="auto-style2">ID:</td>
                    <td class="auto-style1">
                        <asp:TextBox ID="TXTID" runat="server" ReadOnly="true" MaxLength="30" Width="190px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td class="auto-style2">Salary:</td>
                    <td class="auto-style1">
                        <asp:TextBox ID="txtSalary" runat="server" ReadOnly="true" MaxLength="30" Width="190px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td class="auto-style2">Month:</td>
                    <td class="auto-style1">
                        <asp:TextBox ID="txtMonth" TextMode="Month" runat="server" MaxLength="30" Width="190px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td class="auto-style2">Leaves:</td>
                    <td class="auto-style1">
                        <asp:TextBox ID="txtLeave" runat="server" ReadOnly="true" MaxLength="30" Width="190px"></asp:TextBox></td>
                </tr>
            </table>
            <asp:Button ID="Btn" class="btn btn-primary" runat="server" Text="Total Leave" OnClick="btn_LeaveCount" />
            <br />
            <br />
            <table class="table table-striped" style="width: 36%">
                <tr>
                    <td class="auto-style2">Net Salary:</td>
                    <td class="auto-style1">
                        <asp:TextBox ID="txtNetSalary" runat="server" ReadOnly="true" MaxLength="30" Width="190px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td class="auto-style2">Salary Paid On:</td>
                    <td class="auto-style1">
                        <asp:TextBox ID="txtPaid" TextMode="Date" runat="server" MaxLength="30" Width="190px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td class="auto-style2">Remarks:</td>
                    <td class="auto-style1">
                        <asp:TextBox ID="txtRemarks" runat="server" MaxLength="30" Width="190px"></asp:TextBox></td>
                </tr>
            </table>
            <asp:Button ID="btnInsert" class="btn btn-primary" runat="server" Text="Insert" OnClick="btn_InsertData" />
        </div>
    </form>
</body>
</html>
