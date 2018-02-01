using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Employee_Complaint_Send : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void btnSend_Click(object sender, EventArgs e)
    {
        Employee emp = new Employee();
        string equipment = txtsub.Text;
        string description = txtMsg.Text;
        string s_username = Session["uname"].ToString();
        string s_name = Session["name"].ToString();

        if (emp.InsertComplaint(equipment, description, s_username, s_name))
        {
            lblmsg.Text = "Send succesfully.";
            lblmsg.CssClass = "alert alert-success col-lg-12 col-md-12";
            lblmsg.Visible = true;
            txtsub.Text="";
            txtMsg.Text = "";
        }
        else
        {
            lblmsg.Text = "Try again";
        }
    }
}