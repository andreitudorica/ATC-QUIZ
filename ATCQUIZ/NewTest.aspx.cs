using ATCQUIZ.Utils;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ATCQUIZ
{
    public partial class NewTest : System.Web.UI.Page
    {
        //string TestURL
        //{
        //    set { Session["TestURL"] = value; }
        //    get
        //    {
        //        if (Session["TestURL"] == null)
        //            return string.Empty;
        //        return Session["TestURL"].ToString();
        //    }
        //}

        //string SelectedTestID
        //{
        //    set { Session["SelectedTestID"] = value; }
        //    get
        //    {
        //        if (Session["SelectedTestID"] == null)
        //            return string.Empty;
        //        return Session["SelectedTestID"].ToString();
        //    }
        //}

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["StudentId"] == null) Response.Redirect("~/Login.aspx");
            if (IsPostBack) return;
            ShowCategories();
        }

        public void ShowCategories()
        {
            using (var dbc = new ATCQuizEntities())
            {
                List<Category> Categs = dbc.Categories.ToList();
                foreach (Category c in Categs)
                {
                    c.QuestionsInCategory = dbc.Questions.Where(o => o.CategoryID == c.ID).ToList();
                }

                this.CategoryRepeater.DataSource = Categs;
                this.CategoryRepeater.DataBind();

            }
        }

        public List<Question> ShowQuestions(object cID)
        {
            using (var dbc = new ATCQuizEntities())
            {
                return dbc.Questions.Where(o => o.CategoryID == (int)cID && o.isDeleted == false).ToList();
            }
        }

        protected void btnFinalTouches_Click(object sender, EventArgs e)
        {
            using (var dbc = new ATCQuizEntities())
            {
                Test t = dbc.Tests.ToList()[dbc.Tests.Count() - 1];
                t.TestName = this.txtTestName.Text;
                dbc.SaveChanges();
            }
            Response.Redirect("~/TestsOverview.aspx");
        }

        [System.Web.Services.WebMethod]
        public static string AddQuestionsToTest(IEnumerable<int> ids)
        {
            string ActualURL;
            using (var dbc = new ATCQuizEntities())
            {
                Test t = new Test();
                t.isDeleted = false;
                t.TestName = "andrei";
                dbc.Tests.Add(t);
                dbc.SaveChanges();
                //HttpContext.Current.Session["SelectedTestID"] = t.ID;

                string urlFormat = "{0}/Quiz.aspx?{1}";
                string param = CryptoStuff.Encrypt("tid=" + t.ID);
                string rootURL = Configs.FullyQualifiedApplicationPath;
                ActualURL = HttpUtility.UrlEncode(string.Format(urlFormat, rootURL, param));

                t.TestLink = HttpUtility.UrlDecode(ActualURL);
                dbc.SaveChanges();
                
                foreach (int id in ids)
                {
                    Questions_Tests qt = new Questions_Tests();
                    qt.QuestionID = id;
                    qt.TestID = t.ID;
                    dbc.Questions_Tests.Add(qt);
                    dbc.SaveChanges();
                }
            }
            return HttpUtility.UrlDecode(ActualURL);
        }
    }
}