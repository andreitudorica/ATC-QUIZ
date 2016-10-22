using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
namespace ATCQUIZ
{
    public partial class NewQuestion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtQuestion.Attributes.Add("onkeydown", "javascript:ChangeSize()");
            if (!Page.IsPostBack)
                populateDdlCategories();
        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            using (var dbc = new ATCQuizEntities())
            {
                Question q = new Question();
                Answer a = new Answer();
                if (this.txtQuestion.Text.ToString() != "" && this.txtAnswer.Text.ToString() != "")
                {
                    q.QuestionText = this.txtQuestion.Text;
                    q.isDeleted = false;
                    q.Source = "Andrei";
                    q.Type = "Fixed Answer";
                    String chosenCategory = this.ddlCategories.SelectedItem.Text;

                    if (chosenCategory == "Other...")
                    {
                        Category c = new Category();
                        c.CategoryName = this.txtCategory.Text;
                        this.txtCategory.Text = "";
                        dbc.Categories.Add(c);
                        dbc.SaveChanges();
                        q.CategoryID = c.ID;
                    }
                    else
                        q.CategoryID = dbc.Categories.ToList().Where(o => o.CategoryName == chosenCategory).ToList()[0].ID;
                    a.AnswerText = this.txtAnswer.Text;
                    dbc.Questions.Add(q);
                    dbc.SaveChanges();
                    a.QuestionID = q.ID;
                    a.isCorrect = true;
                    dbc.Answers.Add(a);
                    dbc.SaveChanges();
                    Response.Redirect("~/QuestionsOverview.aspx");
                }
            }
        }
        protected void btnAddTF_Click(object sender, EventArgs e)
        {
            using (var dbc = new ATCQuizEntities())
            {
                Question q = new Question();
                Answer a = new Answer();
                if (TrueOrFalse.SelectedItem != null && this.txtQuestionTF.Text.ToString() != "")
                {
                    q.QuestionText = this.txtQuestionTF.Text;
                    q.isDeleted = false;
                    /*if (this.ddlCategoriesTF.SelectedItem.Text == "Other...")
                        q.Category = this.txtCategoryTF.Text;
                    else
                        q.Category = this.ddlCategoriesTF.SelectedItem.Text;*/
                    q.CategoryID = 1;
                    q.Type = "True or False";

                    for (int i = 0; i < TrueOrFalse.Items.Count; i++)
                    {
                        a.AnswerText = TrueOrFalse.Items[i].Text;
                        a.QuestionID = q.ID;
                        if (TrueOrFalse.Items[i].Selected)
                            a.isCorrect = true;
                        else
                            a.isCorrect = false;
                        dbc.Answers.Add(a);
                        dbc.SaveChanges();
                        if (this.ddlCategoriesTF.SelectedItem.Text == "Other...")
                        {
                            Category c = new Category();
                            c.CategoryName = this.txtCategoryTF.Text;
                            this.txtCategoryTF.Text = "";
                            dbc.Categories.Add(c);
                            dbc.SaveChanges();
                        }
                    }
                    Response.Redirect("~/QuestionsOverview.aspx");
                }
            }
        }
        protected void btnAddMC_Click(object sender, EventArgs e)
        {
            using (var dbc = new ATCQuizEntities())
            {
                Question q = new Question();
                Answer a = new Answer();
                if (this.cbMultipleCorrectAnswer.Checked == false)
                    if (rblChoices.SelectedItem != null && this.txtQuestionMC.Text.ToString() != "")
                    {
                        q.QuestionText = this.txtQuestionMC.Text;
                        q.isDeleted = false;
                        q.Type = "Multiple choice one answer";
                        dbc.Questions.Add(q);
                        dbc.SaveChanges();
                        for (int i = 0; i < rblChoices.Items.Count; i++)
                        {
                            a.AnswerText = rblChoices.Items[i].Text;
                            a.QuestionID = q.ID;
                            if (rblChoices.Items[i].Selected)
                                a.isCorrect = true;
                            else
                                a.isCorrect = false;
                            dbc.Answers.Add(a);
                            dbc.SaveChanges();
                            Response.Redirect("~/QuestionsOverview.aspx");
                        }

                    }
                if (this.cbMultipleCorrectAnswer.Checked == true)
                    if (cblChoices.SelectedItem != null && this.txtQuestionMC.Text.ToString() != "")
                    {
                        q.QuestionText = this.txtQuestionMC.Text;
                        q.isDeleted = false;
                        q.Type = "Multiple choice more answers";
                        dbc.Questions.Add(q);
                        dbc.SaveChanges();
                        for (int i = 0; i < cblChoices.Items.Count; i++)
                        {
                            a.AnswerText = cblChoices.Items[i].Text;
                            a.QuestionID = q.ID;
                            if (cblChoices.Items[i].Selected)
                                a.isCorrect = true;
                            else
                                a.isCorrect = false;
                            dbc.Answers.Add(a);
                            dbc.SaveChanges();
                            Response.Redirect("~/QuestionsOverview.aspx");
                        }

                    }
            }
        }
        protected void cbMultipleCorrectAnswers_OnChange(object sender, EventArgs e)
        {
            if (this.cbMultipleCorrectAnswer.Checked == true)
            {
                this.rblChoices.Visible = false;
                this.cblChoices.Visible = true;
                this.cbMultipleCorrectAnswer.Text = "Multiple correct answers";
            }
            else
            {
                this.rblChoices.Visible = true;
                this.cblChoices.Visible = false;
                this.cbMultipleCorrectAnswer.Text = "One correct answer";
            }
            this.updatePanel.Update();
        }
        protected void btnAddAnswer_Click(object sender, EventArgs e)
        {
            if (AnswerToAdd.Text.ToString() != "")
            {
                this.rblChoices.Items.Add(AnswerToAdd.Text);
                this.cblChoices.Items.Add(AnswerToAdd.Text);
                AnswerToAdd.Text = null;
                this.updatePanel.Update();
            }
        }


        protected void ddlCategories_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (this.ddlCategories.SelectedItem.Text == "Other...")
                this.PanelAddCategory.Visible = true;
            else
                this.PanelAddCategory.Visible = false;
            this.upCategories.Update();
        }
        protected void ddlCategoriesTF_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (this.ddlCategoriesTF.SelectedItem.Text == "Other...")
                this.PanelAddCategoryTF.Visible = true;
            else
                this.PanelAddCategoryTF.Visible = false;
            this.upCategoriesTF.Update();
        }
        protected void populateDdlCategories()
        {
            using (var dbc = new ATCQuizEntities())
            {
                this.ddlCategories.Items.Add("Chose a category");
                this.ddlCategories.DataSource = dbc.Categories.ToList();
                this.ddlCategories.DataTextField = "CategoryName";
                this.ddlCategories.DataValueField = "ID";
                this.ddlCategories.DataBind();
                this.ddlCategories.Items.Add("Other...");

                this.ddlCategoriesTF.DataSource = dbc.Categories.ToList();
                this.ddlCategoriesTF.DataTextField = "CategoryName";
                this.ddlCategoriesTF.DataValueField = "ID";
                this.ddlCategoriesTF.DataBind();
                this.ddlCategoriesTF.Items.Add("Other...");
            }
        }
    }
}