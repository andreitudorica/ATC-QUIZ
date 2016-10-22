<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ATCQUIZ.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <link rel="Stylesheet" href="css/loginStyle.css" />

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.0/jquery-ui.min.js"></script>
    <script type="text/javascript" src="JavaScripts/Util.js"></script>
</head>
<body>
    <form runat="server">
    <div class="bi-login-container">
        <div class="bi-header">
            <div class="bi-header">
                <div class="bi-header-container">
                    <div class="bi-header-logo logo-center">
                        <span>ATC</span>Quiz
                    </div>
                </div>
            </div>
        </div>
        <div class="bi-login-content">
            <div class="bi-login-line">
                User:
                    <br />
                <asp:TextBox ID="txtUsername" CssClass="input-580" runat="server"></asp:TextBox>
            </div>
            <div class="bi-login-line">
                Password:
                    <br />
                <asp:TextBox ID="txtPassword" CssClass="input-580" TextMode="Password" runat="server"></asp:TextBox>
            </div>
            <div class="bi-login-line">
                <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" CssClass="bi-new-button button-right float-right"/>
                <asp:Button ID="btnForgotPass" runat="server" Text="Forgot Password" CssClass="bi-new-button button-left float-left"/>
            </div>
            <div class="clear">
            </div>
        </div>
    </div>
    </form>
</body>
</html>
