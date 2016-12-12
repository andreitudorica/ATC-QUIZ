<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Quiz.aspx.cs" Inherits="ATCQUIZ.Quiz" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="css/TakeTest.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="elements" runat="server">
        <asp:Repeater ID="Rep1" runat="server" ValidateRequestMode="Inherit" OnItemDataBound="Rep1_ItemDataBound">
            <ItemTemplate>
                <a target="<%#GetQDivClass()%>" class="elementDisplay">
                    <div class="elementIndex">
                        <%# Container.ItemIndex + 1 %>.
                    </div>
                    <div class="elementQuestion">
                        <%#DataBinder.Eval(Container.DataItem,"QuestionText") %>
                    </div>
                    <div class="elementID">
                        (<%#DataBinder.Eval(Container.DataItem,"ID") %>)
                    </div>
                </a>
                <div id="<%#GetRDivClass()%>" class="answerDisplay">
                    <div class="oneResponse">
                        <asp:TextBox ID="txtOneAnswer" class="txt" runat="server"></asp:TextBox>
                    </div>
                    <div class="multipleResponseOneAnswer">
                        <asp:RadioButtonList ID="rblMultipleResponseOneAnswer" runat="server" CssClass="radio" RepeatDirection="Vertical" DataSource='<%#ShowAnswers(DataBinder.Eval(Container.DataItem,"ID")) %>'></asp:RadioButtonList>
                    </div>
                    <div class="multipleResponseMoreAnswers">
                        <asp:CheckBoxList ID="cblMuResponseMoreAnswers" runat="server" DataSource='<%#ShowAnswers(DataBinder.Eval(Container.DataItem,"ID")) %>'></asp:CheckBoxList>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <script>
        jQuery('.answerDisplay').hide();
        jQuery(function () {
            jQuery('.elementDisplay').click(function () {
                jQuery('.answerDisplay').hide('slow');
                if ($('#qr' + $(this).attr('target')).is(":visible"))
                    $('#qr' + $(this).attr('target')).hide('slow');
                else
                    $('#qr' + $(this).attr('target')).show('slow');
            });
        });

        $("[id*='ans']").hide('slow');
        $("[id*='que']").click(function () {
            if ($("[id*='ans']").is(":visible"))
                $("[id*='ans']").hide('slow');
            else
                $("[id*='ans']").show('slow');
        });

    </script>
</asp:Content>
