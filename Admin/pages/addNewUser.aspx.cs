using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_pages_addNewUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            admin adm = new admin();
            dlistDept.Items.Clear();
            dlistDept.DataSource = adm.GetDeptData("select * from Department");
            dlistDept.DataTextField = "dep_name";
            dlistDept.DataValueField = "dep_id";
            dlistDept.DataBind();
            dlistDept.Items.Insert(0, "--Select--");
        }
    }

    protected void btnsave_Click1(object sender, EventArgs e)
    {
        admin adm = new admin();

        int dept = Int32.Parse(dlistDept.SelectedValue);
        string username = txtUid.Text;
        string name = txtName.Text;
        string psw = txtPwd.Text;
        string usertype = dlistUtype.SelectedValue;
        string mobile = txtMobile.Text;
        string email = txtEmail.Text;

        string status = "Enable";

        if (adm.isuserexist(username) != true)
        {
            if (adm.savedata(username, name, psw, dept, usertype, mobile, email, status))
            {
                lblmsg.Text = "Save Successfuly";
                lblmsg.CssClass = "alert alert-success col-lg-12 col-md-12";
                lblmsg.Visible = true;

                txtUid.Text = "";
                txtName.Text = "";
                txtEmail.Text = "";
                txtMobile.Text = "";
                dlistDept.SelectedIndex = 0;
                dlistUtype.SelectedIndex = 0;
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
            lblmsg.Text = "User Name is Already Exist";
            lblmsg.CssClass = "alert alert-danger col-lg-12 col-md-12";
            lblmsg.Visible = true;
        }
    }
}