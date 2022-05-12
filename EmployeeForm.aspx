<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeForm.aspx.cs" Inherits="TableView.WebForm1" %>

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
        .auto-style1 {
            /*width: 78%;*/
            width: 90%;
            margin-left: 20px;
        }

        .auto-style2 {
            width: 312px;
        }

        .auto-style3 {
            margin-left: 0px;
        }

        .auto-style4 {
            margin-left: 2px;
        }

        .btnSearch {
            margin-left: 20px;
        }
    </style>
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
    <script>
        $(document).ready(function () {
            $("#btnSearch").click(function () {
                var Search = $("#txtSearch").val();
                if (Search == "") {
                    alert('Please Fill Name for search');
                    return false;
                }
                return true;
            })
        });
    </script>
    <script>
        $(document).ready(function () {
            $("#Update_Button").click(function () {
                var Name = $("#txtName").val();
                var Address = $("#txtAddress").val();
                var Age = $("#txtAge").val();
                var City = $("#txtCity").val();
                var Gender = $("#txtGender").val();
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
    <script type="text/javascript">
        $(function () {
            $("#txtName").keypress(function (e) {
                var keyCode = e.keyCode || e.which;

                $("#lblError").html("");

                //Regex for Valid Characters i.e. Alphabets.
                var regex = (/^[a-zA-Z\s]+$/);

                //Validate TextBox value against the Regex.
                var isValid = regex.test(String.fromCharCode(keyCode));
                if (!isValid) {
                    $("#lblError").html("Only Alphabets allowed.");
                }
                return isValid;
            });
        });
    </script>
    <script type="text/javascript">
        $(function () {
            $("#txtCity").keypress(function (e) {
                var keyCode = e.keyCode || e.which;

                $("#lblError1").html("");

                //Regex for Valid Characters i.e. Alphabets.
                var regex = (/^[a-zA-Z\s]+$/);

                //Validate TextBox value against the Regex.
                var isValid = regex.test(String.fromCharCode(keyCode));
                if (!isValid) {
                    $("#lblError1").html("Only Alphabets allowed.");
                }
                return isValid;
            });
        });
    </script>

    <script type="text/javascript">
        $(function () {
            $("#Update_Button").on("click", function () {
                if ($('#txtAge').val() > 60 || $('#txtAge').val() < 18) {
                    $("#lblErrorage").html("Age should be in 18-60.");
                    return false;
                }
            });
        });
    </script>
    <script type="text/javascript">
        $(function () {
            $("#txtAge").keypress(function (e) {
                var keyCode = e.keyCode || e.which;
                $("#lblErrorage").html("");
                //Regex for Valid Characters i.e. Alphabets.
                var regex = (/^[0-9\s]+$/);
                //Validate TextBox value against the Regex.
                var isValid = regex.test(String.fromCharCode(keyCode));
                if (!isValid) {
                    $("#lblErrorage").html("Only Numbers allowed.");
                }
                return isValid;
            });
        });
    </script>

    <%--For ADD Butoon Script--%>
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
    <script type="text/javascript">
        function EditShowPopup() {
            $("#PopupEdit").modal("show");
        }
    </script>
    <script type="text/javascript">
        function ShowPopup() {
            $("#MyPopup").modal("show");
        }
    </script>
    <script type="text/javascript">
        function ShowEditModal(Name, Address, Age, City, Gender) {
            $("#txtName").val(Name);
            $("#txtAddress").val(Address);
            $("#txtAge").val(Age);
            $("#txtCity").val(City);
            $("#txtGender").val(Gender);
            $("#PopupEdit").modal("show");
        }
    </script>
    <script type="text/javascript">
        function ShowDeleteModal(ID) {
            $("#txtEmployeeId").val(ID);
            $("#MyPopup").modal("show");
        }
    </script>
    <script type="text/javascript">
        function ClickDetails() {
            location.href = '/EmployeeDetail.aspx';
        }
    </script>
</head>

<body>
    <%--Navigaton Bar--%>
    <form id="form1" runat="server">
        <nav class="navbar navbar-light" style="background-color: #e3f2fd;">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">EmployeeInfo</a>
                </div>
                <ul class="nav navbar-nav">
                    <%--<li class="active"><a href="#">Home</a></li>--%>
                    <li>
                        <button type="button" class="btn btn-default navbar-btn">Home</button></li>
                    <li>
                        <asp:Button ID="Button2" class="btn btn-default navbar-btn" runat="server" Text="HelpDesk" OnClick="HelpDesk" /></li>                        
                    <%--<li><a href="#">Feeds</a></li>
                    <li><a href="#" class="auto-style5">People</a></li>
                    <li><a href="#">Helpdesk</a></li>--%>
                    <li>
                        <button type="button" class="btn btn-default navbar-btn" data-toggle="modal" data-target="#exampleModal1">
                            Add Data
                        </button>
                    </li>
                </ul>
            </div>
        </nav>

        <%--Delete PopUP--%>
        <div id="MyPopup" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">
                            &times;</button>
                        <h4 class="modal-title">Delete Page</h4>
                    </div>
                    <div class="modal-body">
                        <p>Are you sure to delete that ID!!!</p>
                        <table id="DeleteFarm" class="table table-striped">
                            <tr>
                                <td class="auto-style2">ID:</td>
                                <td>
                                    <asp:TextBox ID="txtEmployeeId" runat="server" Style="margin-bottom: 0px"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">
                            Close</button>
                        <asp:Button ID="Button3" runat="server" class="btn btn-primary" OnClick="Delete_Click" Text="Delete" />
                    </div>
                </div>
            </div>
        </div>
        <%--Edit Popup--%>
        <div id="PopupEdit" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">
                            &times;</button>
                        <h4 class="modal-title">Edit Page</h4>
                    </div>
                    <div class="modal-body">
                        <p>Update the Data!!!</p>
                        <table class="table table-striped">

                            <%--<tr>
                                <td>&nbsp;</td>
                                <td class="auto-style2">Id:</td>
                                <td>
                                    <asp:TextBox ID="txtId" runat="server" Style="margin-bottom: 0px"></asp:TextBox>
                                </td>
                            </tr>--%>
                            <tr>
                                <td>&nbsp;</td>
                                <td class="auto-style2">Name:</td>
                                <td>
                                    <span id="lblError" style="color: red"></span>
                                    <asp:TextBox ID="txtName" runat="server" MaxLength="30"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td class="auto-style2">Address:</td>
                                <td>
                                    <asp:TextBox ID="txtAddress" runat="server" CssClass="auto-style3" MaxLength="50"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td class="auto-style2">Age:</td>
                                <td>
                                    <span id="lblErrorage" style="color: red"></span>
                                    <asp:TextBox ID="txtAge" runat="server" MaxLength="2"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td class="auto-style2">City:</td>
                                <td>
                                    <span id="lblError1" style="color: red"></span>
                                    <asp:TextBox ID="txtCity" runat="server" MaxLength="20"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td class="auto-style2">Gender:</td>
                                <td>
                                    <span id="lblError2" style="color: red"></span>
                                    <asp:DropDownList ID="txtGender" runat="server">
                                        <asp:ListItem Value="">Please Select</asp:ListItem>
                                        <asp:ListItem>Male </asp:ListItem>
                                        <asp:ListItem>Female</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">
                            Close</button>
                        <asp:Button ID="Update_Button"
                            Text="Update" class="btn btn-primary"
                            OnClick="Update_Click"
                            runat="server" />
                    </div>
                </div>
            </div>
        </div>

        <%--Add Employee button--%>

        <br />
        <h3 class="auto-style1">All Employee Info:</h3>
        <br />

        <%--Add Modal form--%>

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
        <div class="btnSearch">
            Search User by Name:-  
            <asp:TextBox runat="server" ID="txtSearch"></asp:TextBox>
            <br />
            <asp:Button ID="btnSearch" class="btn btn-primary" runat="server" Text="Search" OnClick="btn_Search" />
        </div>
        <br />
        <%--Grid view--%>
        <div class="auto-style1">
            <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="180%"  Height="147px" AllowPaging="True" OnPageIndexChanging=" GridView1_PageIndexChanging" PageSize="5">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="EditPopup" runat="server" class="btn btn-primary" OnClick="EditShowPopup" Text="Edit" />
                            <button type="button" class="btn btn-primary" onclick="ShowDeleteModal('<%#Eval("ID")%>')">
                                Delete
                            </button>
                            <asp:Button ID="ShowDetail" runat="server" class="btn btn-primary" OnClick="ClickDetails" Text="Show" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
        </div>
    </form>
</body>
</html>
