using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ATCQUIZ
{
    public partial class AddAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["StudentId"] == null) Response.Redirect("~/Login.aspx");
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if(this.txtPassword.Text==this.txtConfirmPassword.Text)
            {
                using (var dbc = new ATCQuizEntities())
                {
                    User usr = new ATCQUIZ.User();
                    usr.Name = this.txtUsername.Text.ToString();
                    usr.Password = this.txtPassword.Text.ToString();
                    usr.Type = "Admin";
                    dbc.Users.Add(usr);
                    dbc.SaveChanges();
                }
            }
        }
    }
}