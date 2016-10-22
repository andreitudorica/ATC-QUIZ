<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="NewQuestion.aspx.cs" Inherits="ATCQUIZ.NewQuestion" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="css/addQuestion.css" rel="stylesheet" />



    <div id="exTab1" class="container">
        <ul class="nav nav-pills">
            <li class="active">
                <a href="#1a" data-toggle="tab">Fixed Answer</a>
            </li>
            <li><a href="#2a" data-toggle="tab">True or False</a>
            </li>
            <li><a href="#3a" data-toggle="tab">Multiple choice</a>
            </li>
        </ul>

        <div class="tab-content clearfix">
            <div class="tab-pane active" id="1a">

                <div class="TPddlDisplay">
                    <asp:UpdatePanel runat="server" ID="upCategories" UpdateMode="Conditional">
                        <ContentTemplate>
                            Category:
                    <asp:DropDownList ID="ddlCategories" runat="server" CssClass="ddl" OnSelectedIndexChanged="ddlCategories_SelectedIndexChanged" AutoPostBack="true">
                    </asp:DropDownList>
                            <asp:Panel ID="PanelAddCategory" runat="server" class="addCategoryBox" Visible="false">
                                Type a new category
                                    <asp:TextBox ID="txtCategory" runat="server"></asp:TextBox>
                            </asp:Panel>

                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <div class="TwoBigTextBoxes">
                    <div class="BigTextBox">
                        <asp:Label ID="Label3" runat="server" Text="Question" class="lbl"></asp:Label>
                        <asp:TextBox ID="txtQuestion" runat="server" class="txt" TextMode="MultiLine"></asp:TextBox>
                    </div>
                    <div class="BigTextBox">
                        <asp:Label ID="Label4" runat="server" Text="Answer" class="lbl"></asp:Label>
                        <asp:TextBox ID="txtAnswer" runat="server" class="txt" TextMode="MultiLine"></asp:TextBox>
                    </div>
                </div>
                <div class="btnAdd">
                    <asp:Button ID="btnAdd" runat="server" Text="Save Question" OnClick="btnAdd_Click" class="bi-new-button" />
                </div>

            </div>
            <div class="tab-pane" id="2a">
                <div class="TPddlDisplay">
                    <asp:UpdatePanel runat="server" ID="upCategoriesTF" UpdateMode="Conditional">
                        <ContentTemplate>
                            Category:
                    <asp:DropDownList ID="ddlCategoriesTF" runat="server" CssClass="ddl" OnSelectedIndexChanged="ddlCategoriesTF_SelectedIndexChanged" AutoPostBack="true">
                    </asp:DropDownList>
                            <asp:Panel ID="PanelAddCategoryTF" runat="server" class="addCategoryBox" Visible="false">
                                Type a new category
                             
                                    <asp:TextBox ID="txtCategoryTF" runat="server"></asp:TextBox>
                            </asp:Panel>

                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <div class="BigTextBox">
                    <asp:Label ID="Label1" runat="server" Text="Question" class="lbl"></asp:Label>
                    <asp:TextBox ID="txtQuestionTF" runat="server" class="txt" TextMode="MultiLine"></asp:TextBox>
                </div>
                </br>
                    <div class="TroeOrFalseButtons">
                        <asp:RadioButtonList ID="TrueOrFalse" runat="server" CssClass="radio" RepeatDirection="Horizontal">
                            <asp:ListItem Selected="False">True</asp:ListItem>
                            <asp:ListItem Selected="False">False</asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                </br>
                    <div class="btnAdd">
                        <asp:Button ID="btnAddTF" runat="server" Text="Save Question" OnClick="btnAddTF_Click" class="bi-new-button" />
                    </div>
            </div>
            <div class="tab-pane" id="3a">
                <div class="TPddlDisplay">
                    Category:
                    <asp:DropDownList ID="DropDownList3" runat="server" CssClass="ddl">
                        <asp:ListItem Selected="True">All</asp:ListItem>
                        <asp:ListItem>New category</asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div class="BigTextBox">
                    <asp:Label ID="Label2" runat="server" Text="Question" CssClass="lbl"></asp:Label>
                    <asp:TextBox ID="txtQuestionMC" runat="server" class="txt" TextMode="MultiLine"></asp:TextBox>
                </div>

                <asp:UpdatePanel ID="updatePanel" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div class="cbMultipleAnswers">
                            <asp:CheckBox ID="cbMultipleCorrectAnswer" runat="server" Text="One correct answer" OnCheckedChanged="cbMultipleCorrectAnswers_OnChange" AutoPostBack="True" />

                        </div>
                        <br />
                        <div>

                            <asp:RadioButtonList ID="rblChoices" runat="server" Visible="true">
                            </asp:RadioButtonList>
                            <asp:CheckBoxList ID="cblChoices" runat="server" Visible="false">
                            </asp:CheckBoxList>
                            <div>
                                <div class="BigTextBox">
                                    <asp:Button ID="btnAddAnswer" runat="server" Text="Add" OnClick="btnAddAnswer_Click" class="bi-new-button-add-q btn" />

                                    <asp:TextBox ID="AnswerToAdd" runat="server" class="txt" TextMode="MultiLine"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <br />
                        <br />

                    </ContentTemplate>
                </asp:UpdatePanel>
                <div class="btnAdd">
                    <asp:Button ID="btnAddMC" runat="server" Text="Save Question" OnClick="btnAddMC_Click" class="bi-new-button" />
                </div>
            </div>

        </div>
    </div>

</asp:Content>
