using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Employee emp = new Employee();
        string usernm = txtUname.Text;
        string password = txtPassword.Text;
        int uid = 0;
        string name = null;
        string utype = null;
        string pswd = null;

        if (emp.login(usernm, password, out uid, out name, out pswd, out utype))
        {
            Session["userid"] = uid;
            Session["uname"] = txtUname.Text;
            Session["name"] = name;
            Session["utype"]=utype;
            Session["password"] = pswd;

            if(utype == "Employee")
            {
            Response.Redirect("Employee/Home_Emplyee.aspx");
            }
            
            else if (utype == "Admin")
            {
                Response.Redirect("Admin/pages/adminHome.aspx");
            }
            else
            {
                Response.Redirect("Engineer/Home_Engineer.aspx");
            }
        }
        else
        {
            lblmsg.Text = "User Name or Password is not match";
            lblmsg.CssClass = "alert alert-danger col-lg-12 col-md-12";
            lblmsg.Visible = true;
        }
    }
}