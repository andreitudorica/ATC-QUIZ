<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="NewTest.aspx.cs" Inherits="ATCQUIZ.NewTest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/addQuestion.css" rel="stylesheet" />
    <link rel="stylesheet" href="multi-select/multi-select.css" type="text/css" />
    <script type="text/javascript" src="multi-select/jquery.multi-select.js"></script>
    <script type="text/javascript" src="multi-select/jquery.quicksearch.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="NewTestContainer">
        <div id="divName">
            <asp:Label ID="lblTestName" runat="server" Text="Name for the test" CssClass="lbl"></asp:Label>
            <asp:TextBox ID="txtTestName" runat="server"></asp:TextBox>
            <input id="btnName" type="button" value="Confirm" class="bi-new-button" />
        </div>

        <div id="divQuestions">
            <div id="demo-container" style="width: 100%; text-align: center;">
                <select id="demo" multiple="multiple">
                    <asp:Repeater ID="CategoryRepeater" runat="server" ValidateRequestMode="Inherit">
                        <ItemTemplate>
                            <optgroup label='<%#DataBinder.Eval(Container.DataItem,"CategoryName") %>'>
                                <asp:Repeater ID="QuestionsRepeater" runat="server" ValidateRequestMode="Inherit" DataSource='<%#ShowQuestions(DataBinder.Eval(Container.DataItem,"ID")) %>'>
                                    <ItemTemplate>
                                        <option value='<%#DataBinder.Eval(Container.DataItem,"ID")%>'>
                                            <%#DataBinder.Eval(Container.DataItem,"QuestionText") %>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </optgroup>

                            </option>
                        </ItemTemplate>
                    </asp:Repeater>

                </select>
            </div>
            <input id="btnQuestions" type="button" value="Confirm" class="bi-new-button" />

        </div>

        <div id="divFinalTouches">
            <asp:Label ID="Label1" runat="server" Text="Further test settings to be added"></asp:Label>
            <br />
            <asp:Button ID="btnFinalTouches" runat="server" OnClick="btnFinalTouches_Click" Text="Finish" class="bi-new-button" />
        </div>
    </div>
    <script>
        $(function () {
            $("[id*='btnName']").focus();
            $("[id*='divQuestions']").hide();
            $("[id*='divFinalTouches']").hide();
            $("[id*='btnName']").click(function ()
            {
                $("[id*='btnQuestions']").focus();
                $("[id*='divQuestions']").show('slow');
                $("[id*='divName']").hide('slow');
            });
            $("[id*='btnQuestions']").click(function ()
            {
                $("[id*='btnFinalTouches']").focus();
                $("[id*='divFinalTouches']").show('slow');
                $("[id*='divQuestions']").hide('slow');
                var select1 = document.getElementById("demo");
                var selected1 = [];
                for (var i = 0; i < select1.length; i++) {
                    if (select1.options[i].selected)
                        selected1.push(select1.options[i].value);
                }
                PageMethods.AddQuestionsToTest(selected1, onSucess, onError);

                function onSucess(result) {
                }

                function onError(result) {
                    alert('Cannot process your request at the moment, please try later.');
                }
            });
        }
        );
    </script>
    <style>
        .search-input {
            width: 100%;
            border-radius: 5px;
            font-size: 24px;
            color: #ff6800;
        }
    </style>
    <script>
            $('#demo').multiSelect({
            selectableOptgroup: true,
            selectableHeader: "<input type='text' class='search-input' autocomplete='off' placeholder='search Questions'>",
            selectionHeader: "<input type='text' class='search-input' autocomplete='off' placeholder='search Questions'>",
            afterInit: function (ms) {
                var that = this,
                    $selectableSearch = that.$selectableUl.prev(),
                    $selectionSearch = that.$selectionUl.prev(),
                    selectableSearchString = '#' + that.$container.attr('id') + ' .ms-elem-selectable:not(.ms-selected)',
                    selectionSearchString = '#' + that.$container.attr('id') + ' .ms-elem-selection.ms-selected';

                that.qs1 = $selectableSearch.quicksearch(selectableSearchString)
                .on('keydown', function (e) {
                    if (e.which === 40) {
                        that.$selectableUl.focus();
                        return false;
                    }
                });

                that.qs2 = $selectionSearch.quicksearch(selectionSearchString)
                .on('keydown', function (e) {
                    if (e.which == 40) {
                        that.$selectionUl.focus();
                        return false;
                    }
                });
            },
            afterSelect: function () {
                this.qs1.cache();
                this.qs2.cache();
            },
            afterDeselect: function () {
                this.qs1.cache();
                this.qs2.cache();
            }
        });
    </script>
</asp:Content>
