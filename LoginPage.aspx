<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="TableView.LoginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script type="text/javascript" src='https://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.3.min.js'></script>
    <script type="text/javascript" src='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/js/bootstrap.min.js'></script>
    <link rel="stylesheet" href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/css/bootstrap.min.css'
        media="screen" />
    <title></title>
    <style type="text/css">
        .Style1{
            width: 60%;
            margin-left: 100px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="Style1" style="max-width: 400px;">
            <h2 class="form-signin-heading">Login</h2>
            <label for="txtUsername">
                Username</label>
            <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Enter Username" />
            <br />
            <label for="txtPassword">
                Password</label>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control"
                placeholder="Enter Password" />
            <asp:Label ID="Label4" runat="server" Font-Size="Large"></asp:Label>
            <div class="checkbox">
                <asp:CheckBox ID="chkRememberMe" Text="Remember Me" runat="server" />
            </div>
            <asp:Button ID="btnLogin" Text="Login" runat="server" OnClick="btnSubmit_Click" Class="btn btn-primary" />
            <br />
            <br />
            <div id="dvMessage" runat="server" visible="false" class="alert alert-danger">
                <strong>Error!</strong>
                <asp:Label ID="lblMessage" runat="server" />
            </div>
        </div>
    </form>
</body>
</html>
