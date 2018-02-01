using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Employee_Change_Password_Emp : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnsave_Click(object sender, EventArgs e)
    {
        int ID = 0;
        ID = Convert.ToInt32(Session["userid"]);
        Employee emp = new Employee();
        string npswd = txtnewpwd.Text;
        string psd = txtPwd.Text;

        if (psd == Session["password"].ToString())
        {
            if (emp.ChangePassword(ID, npswd))
            {
             
                lblmsg.Text = "Update Successfuly";
                lblmsg.CssClass = "alert alert-success col-lg-12 col-md-12";
                lblmsg.Visible = true;
                txtnewpwd.Text = "";
                txtPwd.Text = "";
                txtRpwd.Text = "";
            }
            else
            {
                lblmsg.Text = "Try again";
                lblmsg.CssClass = "alert alert-danger col-lg-12 col-md-12";
                lblmsg.Visible = true;
            }
        }
        else
        {
            lblmsg.Text = "Your current password is not corect";
            lblmsg.CssClass = "alert alert-danger col-lg-12 col-md-12";
            lblmsg.Visible = true;
        }
    }
}