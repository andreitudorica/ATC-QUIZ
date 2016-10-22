<%@ Page Title="Questions" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="QuestionsOverview.aspx.cs" Inherits="ATCQUIZ.QuestionsOverview" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="horizAllign" id="plusBtn"><a href="NewQuestion.aspx"><i class="fa fa-plus-circle fa-5x" id="addQuestion"></i></a></div>
    <div id="elements" runat="server">

        <div class="ddlDisplay">
            <asp:UpdatePanel runat="server" ID="upCategories" UpdateMode="Conditional">
                <ContentTemplate>
                    Category:
                    <asp:DropDownList ID="ddlCategories" runat="server" CssClass="ddl"  AutoPostBack="true">
                    </asp:DropDownList>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>


        <asp:Repeater ID="Rep1" runat="server" ValidateRequestMode="Inherit">
            <ItemTemplate>
                <div class="elementDisplay">
                    <p>
                        <%#DataBinder.Eval(Container.DataItem,"ID") %>. 
                        <%#DataBinder.Eval(Container.DataItem,"QuestionText") %>
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
                        <%#DataBinder.Eval(Container.DataItem,"ID") %>. 
                        <%#DataBinder.Eval(Container.DataItem,"QuestionText") %>
                        <a href="%">
                            <i class="fa fa-times-circle fa-2x" style="color: #ff3333; float: right; padding: 10px 10px 10px 10px;"></i>
                        </a>
                        <a>
                            <i class="fa fa-pencil-square-o fa-2x" style="color: #00b33c; float: right; padding: 10px 10px 10px 10px"></i>
                        </a>
                    </p>

                </div>
            </AlternatingItemTemplate>
            <FooterTemplate>
            </FooterTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
