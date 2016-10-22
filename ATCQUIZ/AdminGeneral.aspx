<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminGeneral.aspx.cs" Inherits="ATCQUIZ.AdminGeneral" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <link rel="stylesheet" href="css/adminGeneral.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="buttonsGeneralAdmin">
        <asp:Button ID="btnQuestions" runat="server" Text="Questions"  OnClick="btnQuestions_Click" CssClass="button"/><br/>
        <asp:Button ID="btnTests" runat="server" Text="Tests"  CssClass="button" OnClick="btnTests_Click"/><br/>
        <asp:Button ID="btnStudents" runat="server" Text="Students"  CssClass="button"/>
    </div>
</asp:Content>
