<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HelpDesk.aspx.cs" Inherits="TableView.HelpDesk" %>

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
    <style>
        .style1 {
            margin-left: 20px;
        }
    </style>
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
                        <asp:Button ID="Button3" class="btn btn-default navbar-btn" runat="server" Text="HelpDesk" /></li>
                    <%--<li>
                        <button type="button" class="btn btn-default navbar-btn" data-toggle="modal" data-target="#exampleModal1">
                            Add Data
                        </button>
                    </li>--%>
                </ul>
            </div>
        </nav>
        <div class="style1">
            <h3>This is a helpdesk page.</h3>
            <br />
            <h4>Contact us by Mail!!! </h4>
            <h5>xyz@gmail.com</h5>
        </div>
    </form>
</body>
</html>
