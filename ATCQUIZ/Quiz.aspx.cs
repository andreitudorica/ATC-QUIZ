using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ATCQUIZ
{
    public partial class Quiz : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string UrlString = CryptoStuff.Decrypt(Request.QueryString.ToString());
            ShowQuestions(UrlString);
        }

        private int indexq = 1, indexr = 1;

        protected string GetQDivClass()
        {
            return (indexq++).ToString();
        }
        protected string GetRDivClass()
        {
            return "qr" + indexr++;
        }
        protected string isSingleAnswer()
        {
            return "";
        }
        public void ShowQuestions(string UrlString)
        {
            using (var dbc = new ATCQuizEntities())
            {
                List<ATCQUIZ.Questions_Tests> QuestionTestRelations = new List<ATCQUIZ.Questions_Tests>();
                List<ATCQUIZ.Question> QuestionsInTest = new List<ATCQUIZ.Question>();
                int testID = Int32.Parse(UrlString.Substring(4));
                QuestionTestRelations = dbc.Questions_Tests.Where(o => o.TestID == testID).ToList();
                if (QuestionTestRelations != null)
                    foreach (Questions_Tests rel in QuestionTestRelations)
                        QuestionsInTest.Add(rel.Question);
                this.Rep1.DataSource = QuestionsInTest;
                this.Rep1.DataBind();
            }
        }
        public List<String> ShowAnswers(object cID)
        {
            using (var dbc = new ATCQuizEntities())
            {
                List<Answer> l = dbc.Answers.Where(o => o.QuestionID == (int)cID).ToList();
                List<String> s = new List<String>();
                foreach (Answer ans in l)
                    s.Add(ans.AnswerText.ToString());
                return s;
            }
        }

        protected void Rep1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            Question q = (Question)e.Item.DataItem;
            //e.Item.FindControl
            if (q.Type == "Fixed Answer")
            {
                Control c = e.Item.FindControl("txtOneAnswer");
                if (c != null)
                    c.Visible = true;
                c = e.Item.FindControl("rblMultipleResponseOneAnswer");
                if (c != null)
                    c.Visible = false;
                c = e.Item.FindControl("cblMuResponseMoreAnswers");
                if (c != null)
                    c.Visible = false;
            }
            if (q.Type == "Multiple choice one answer" || q.Type == "True or False")
            {
                Control c = e.Item.FindControl("txtOneAnswer");
                if (c != null)
                    c.Visible = false;
                c = e.Item.FindControl("rblMultipleResponseOneAnswer");
                if (c != null)
                    c.Visible = true;
                c = e.Item.FindControl("cblMuResponseMoreAnswers");
                if (c != null)
                    c.Visible = false;
            }
            if (q.Type == "Multiple choice more answers")
            {
                Control c = e.Item.FindControl("txtOneAnswer");
                if (c != null)
                    c.Visible = false;
                c = e.Item.FindControl("rblMultipleResponseOneAnswer");
                if (c != null)
                    c.Visible = false;
                c = e.Item.FindControl("cblMuResponseMoreAnswers");
                if (c != null)
                    c.Visible = true;
            }
        }
    }
}