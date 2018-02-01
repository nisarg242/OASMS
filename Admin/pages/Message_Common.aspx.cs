using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_pages_Message_Common : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSend_Click(object sender, EventArgs e)
    {
        admin emp = new admin();
        string subject = txtsub.Text;
        string message = txtMsg.Text;
        string s_username = Session["uname"].ToString();

        if (emp.InsertCommonMessage(subject, message, s_username))
        {
            lblmsg.Text = "Send succesfully.";
            lblmsg.CssClass = "alert alert-success col-lg-12 col-md-12";
            lblmsg.Visible = true;
            txtsub.Text = "";
            txtMsg.Text = "";
        }
        else
        {
            lblmsg.Text = "Try again";
        }
    }
}