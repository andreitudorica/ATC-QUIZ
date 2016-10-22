using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ATCQUIZ
{
    public partial class QuestionsOverview : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            ShowQuestions();
            if (IsPostBack) return;
            populateDdlCategories();
        }
        public void ShowQuestions()
        {
            using (var dbc = new ATCQuizEntities())
            {
                this.Rep1.DataSource = dbc.Questions.ToList();
                this.Rep1.DataBind();
            }
        }
        protected void populateDdlCategories()
        {
            using (var dbc = new ATCQuizEntities())
            {
                this.ddlCategories.DataSource = dbc.Categories.ToList();
                this.ddlCategories.DataTextField = "CategoryName";
                this.ddlCategories.DataValueField = "ID";
                this.ddlCategories.DataBind();
                this.ddlCategories.Items.Add("Other...");
            }
        }

    }
}