<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="TestsOverview.aspx.cs" Inherits="ATCQUIZ.TestsOverview" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="horizAllign" id="plusBtn"><a href="NewTest.aspx"><i class="fa fa-plus-circle fa-5x" id="addTest"></i></a></div>
    <div id="elements" runat="server">
        <asp:Repeater ID="Rep1" runat="server" ValidateRequestMode="Inherit">
            <ItemTemplate>
                <div class="elementDisplay">
                    <p>
                        <%#DataBinder.Eval(Container.DataItem,"ID") %>. 
                        <%#DataBinder.Eval(Container.DataItem,"Question1") %>
                        <%#DataBinder.Eval(Container.DataItem,"Category") %>
                        <a href="%">
                            <i class="fa fa-times-circle fa-2x" style="color: #ff3333; float: right; padding: 10px 10px 10px 10px;"></i>
                        </a>
                        <a>
                            <i class="fa fa-pencil-square-o fa-2x" style="color: #00b33c; float: right; padding: 10px 10px 10px 10px"></i>
                        </a>
                    </p>
                </div>
            </ItemTemplate>
            <AlternatingItemTemplate>
                <div class="elementDisplayAlternate">
                    <p>
                        <%#DataBinder.Eval(Container.DataItem,"Id") %>. <%#DataBinder.Eval(Container.DataItem,"Question1") %><a href="%"><i class="fa fa-times-circle fa-2x" style="color: #ff3333; float: right; padding: 10px 10px 10px 10px;"></i></a><a href="#"><i class="fa fa-pencil-square-o fa-2x" style="color: #00b33c; float: right; padding: 10px 10px 10px 10px"></i></a>
                    </p>

                </div>
            </AlternatingItemTemplate>
            <FooterTemplate>
            </FooterTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
