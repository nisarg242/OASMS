using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Admin_pages_ManageUsers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        bindgrid();
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

    protected void bindgrid()
    {
        admin adm = new admin();

        gvUsers.DataSource = adm.GetUesrData();
        gvUsers.DataBind();
    }
    protected void gvUsers_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "delete")
        {
            dbconnection dbc = new dbconnection();
            admin adm = new admin();

            int id = Int32.Parse(e.CommandArgument.ToString());

            if (adm.DeleteUserData(id))
            {
                lblmsg.Text = "Delete Successfuly";
                lblmsg.CssClass = "alert alert-success col-lg-12 col-md-12";
                lblmsg.Visible = true;
            }
            else
            {
                lblmsg.Text = "Try again";
                lblmsg.CssClass = "alert alert-danger col-lg-12 col-md-12";
                lblmsg.Visible = true;
            }
            bindgrid();
        }

        if (e.CommandName == "update")
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
                
                txtuname.Text = rd["user_name"].ToString();
                txtName.Text = rd["name"].ToString();
                dlistDept.SelectedValue = rd["department"].ToString();
                dlistUtype.Text = rd["user_type"].ToString();
                txtMobile.Text = rd["mobile"].ToString();
                txtEmail.Text = rd["email"].ToString();
                dlistStatus.Text = rd["status"].ToString();
            }
            HiddenField1.Value = id.ToString();
        }
    }
    protected void gvUsers_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }
    protected void gvUsers_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvUsers.PageIndex = e.NewPageIndex;
        bindgrid();
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        int ID = 0;
        Panel1.Visible = false;
        ID = Convert.ToInt32(HiddenField1.Value);
        admin adm = new admin();

        string usernm  = txtuname.Text;
        string name = txtName.Text;
        int dprtmet = Convert.ToInt32(dlistDept.SelectedValue);
        string utype = dlistUtype.Text;
        string mbl = txtMobile.Text;
        string eml = txtEmail.Text;
        string sts = dlistStatus.Text;

        if (adm.UpdateUserdata(ID, usernm, name, dprtmet, utype, mbl, eml, sts))
        {
            lblmsg.Text = "Update Successfuly";
            lblmsg.CssClass = "alert alert-success col-lg-12 col-md-12";
            lblmsg.Visible = true;
        }
        else
        {
            lblmsg.Text = "Try again";
            lblmsg.CssClass = "alert alert-danger col-lg-12 col-md-12";
            lblmsg.Visible = true;
        }
        bindgrid();
    }
    protected void gvUsers_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

    }
}