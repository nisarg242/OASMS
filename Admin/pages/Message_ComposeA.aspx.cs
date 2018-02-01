using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Admin_pages_Message_ComposeA : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        bindgrid();
    }

    protected void bindgrid()
    {
        Employee emp = new Employee();
        string username = Session["name"].ToString();

        gvUsers.DataSource = emp.SendMessageUser(username);
        gvUsers.DataBind();
    }


    protected void gvUsers_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Select")
        {
            int id = Convert.ToInt16(e.CommandArgument);
            Panel1.Visible = true;
            SqlConnection con = new SqlConnection();
            con.ConnectionString = @"Data Source=(LocalDB)\v11.0;AttachDbFilename=C:\Users\Ness\Desktop\OASMS\App_Data\OASMSdatabase.mdf;Integrated Security=True";
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "select * from UserDetail where user_id=@uid";
            cmd.Parameters.AddWithValue("@uid", id);
            SqlDataReader rd = cmd.ExecuteReader();
            while (rd.Read())
            {
                txtName.Text = rd["name"].ToString();
                txtUID.Text = rd["user_name"].ToString();
            }
            HiddenField1.Value = id.ToString();
            lblmsg.Visible = false;
        }
    }

    protected void lnkSend_Click(object sender, EventArgs e)
    {
        Employee emp = new Employee();
        string sub = txtsub.Text;
        string message = txtMsg.Text;
        string s_username = Session["uname"].ToString();
        string r_username = txtUID.Text;
        string name = txtName.Text;

        if (emp.InsertMessage(sub, message, s_username, r_username, name))
        {
            lblmsg.Text = "Send succesfully.";
            lblmsg.CssClass = "alert alert-success col-lg-12 col-md-12";
            lblmsg.Visible = true;
            txtName.Text = "";
            txtUID.Text = "";
            txtsub.Text = "";
            txtMsg.Text = "";
            Panel1.Visible = false;
        }
        else
        {
            lblmsg.Text = "Try again";
        }
    }
}