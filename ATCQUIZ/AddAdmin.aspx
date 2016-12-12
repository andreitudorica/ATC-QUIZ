<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AddAdmin.aspx.cs" Inherits="ATCQUIZ.AddAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/addQuestion.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="containerFields">
        <div class="field">
            <asp:Label ID="lblUsername" runat="server" CssClass="lblAddAdmin" Text="Username:"></asp:Label>
            <asp:TextBox ID="txtUsername" CssClass="txtAddAdmin" runat="server"></asp:TextBox>
        </div>
        <div class="field" >
            <asp:Label ID="lblPassword" runat="server" CssClass="lblAddAdmin" Text="Password:"></asp:Label>
            <asp:TextBox ID="txtPassword" CssClass="txtAddAdmin" runat="server" TextMode="Password"></asp:TextBox>
        </div>
        <div class="field" >

            <asp:Label ID="lblConfirmPassword" runat="server" CssClass="lblAddAdmin" Text="Confirm password:"></asp:Label>
            <asp:TextBox ID="txtConfirmPassword" CssClass="txtAddAdmin" runat="server" TextMode="Password"></asp:TextBox>
        </div>
        <div class="field">
            <asp:Button ID="btnAdd" runat="server" CssClass="bi-new-button-add-q" Text="Confirm" OnClick="btnAdd_Click"/>
        </div>
    </div>
</asp:Content>
