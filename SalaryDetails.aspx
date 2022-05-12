<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SalaryDetails.aspx.cs" Inherits="TableView.SalaryDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
    <style>
        .style1 {
            margin-left: 20px;
        }

        .auto-style2 {
            width: 50px;
        }

        .auto-style3 {
            margin-left: 0px;
        }

        .hiddenColumn {
            display: none;
        }
    </style>
    <script>
        $(document).ready(function () {
            $("#btnPaid").click(function () {
                var Month = $("#txtPaidMonth").val();
                var PaidDate = $("#txtPaid").val();
                if (Month == "") {
                    alert('Please Write Month As per requirement!!!');
                    return false;
                }
                if (PaidDate == "") {
                    alert('Please Select the Pay Date...');
                    return false;
                }
                $("#lblMsg").html("Paid Successfully.");
                return true;
            })
        });
    </script>
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
                        <asp:Button ID="Button23" class="btn btn-default navbar-btn" runat="server" Text="Home" OnClick="HomePage" /></li>
                    <li>
                        <asp:Button ID="btnHelpDesk" class="btn btn-default navbar-btn" runat="server" Text="HelpDesk" OnClick="HelpDesk" /></li>
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
                        <asp:Button ID="Button24"
                            Text="Save" class="btn btn-primary"
                            OnClick="Add_Click"
                            runat="server" />
                    </div>
                </div>
            </div>
        </div>
        <div class="style1">
            <h3>Employee Salary and Leaves!!!</h3>
            <br />
            <asp:TextBox ID="txtMonth" runat="server" TextMode="Date"></asp:TextBox>
            <asp:Button ID="btnSelectMonth" runat="server" OnClick="ShowMonthLeaves" Text="MonthlyLeaves" />
            <br />
            <br />
            <div>
                <%--<asp:GridView ID="GridView1" runat="server" OnRowDataBound="GridView1_RowDataBound1" CellPadding="4" ForeColor="#333333" GridLines="None" Width="1181px" CssClass="auto-style3">
                    <EditRowStyle BackColor="#2461BF" />
                    <EmptyDataTemplate></EmptyDataTemplate>
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" Visible="false" />
                        <asp:BoundField DataField="Total_Leave" ItemStyle-CssClass="hiddenColumn" HeaderStyle-CssClass="hiddenColumn" />
                        <asp:BoundField DataField="Salary" ItemStyle-CssClass="hiddenColumn" HeaderStyle-CssClass="hiddenColumn" />
                        <asp:BoundField DataField="Start_Date" ItemStyle-CssClass="hiddenColumn" HeaderStyle-CssClass="hiddenColumn" />

                        <asp:TemplateField HeaderText="NetSalary">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" headertext="NetSalary"  />
                                <asp:Label ID="Label2" runat="server" headertext="Month_Leave" />
                                <asp:Label ID="Label3" runat="server" headertext="Month" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>--%>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White"
                    BorderColor="Red" BorderStyle="Solid" BorderWidth="1px" CellPadding="2" Font-Names="Verdana"
                    ShowFooter="true" Font-Size="10pt" Width="50%" GridLines="Horizontal"
                    OnRowDataBound="GridView1_RowDataBound">
                    <Columns>
                        <asp:BoundField DataField="Leave_Type" headertext="LeaveType"/>
                        <asp:BoundField DataField="Start_Date" headertext="StartDate"/>
                        <asp:BoundField DataField="Salary" headertext="Salary"/>

<%--                        <asp:BoundField DataField="Total_Leave" headertext="TotalLeave" ItemStyle-CssClass="hiddenColumn" HeaderStyle-CssClass="hiddenColumn"/>--%>
<%--                        <asp:BoundField DataField="Salary" headertext="Salary"/>--%>
                        <asp:TemplateField HeaderText="TotalLeaves">
                            <ItemTemplate>
                                <asp:Label ID="lblTotalLeave" runat="server" Text='<%# Eval("Total_Leave")%>'  />
                                <asp:Label ID="Label1" runat="server" headertext="NetSalary" />
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:Label ID="TotalLeave" runat="server" />
                            </FooterTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#336699" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
                    <HeaderStyle BackColor="#336699" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
                </asp:GridView>
                <br />
                <h4>Net Salary:</h4>
                <asp:Label ID="lblNetSalary" runat="server"></asp:Label>
            </div>
            <br />
            <h4>Add Salary Paid Date:</h4>
            <span>Select Month:</span>
            <asp:TextBox ID="txtPaidMonth" runat="server" />
            <span>Choose Paid Date:</span>
            <asp:TextBox ID="txtPaid" TextMode="Date" runat="server" />
            <br />
            <br />
            <asp:Button ID="btnPaid" class="btn btn-primary" runat="server" Text="Pay" OnClick="InsertPaidDate" />
            <span id="lblMsg" style="color: blue"></span>
        </div>
    </form>
</body>
</html>
