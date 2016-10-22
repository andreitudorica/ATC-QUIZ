using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ATCQUIZ
{
    public partial class AdminGeneral : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnQuestions_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/QuestionsOverview.aspx");
        }

        protected void btnTests_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/TestsOverview.aspx");

        }
    }
}