using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Admin_pages_ChangeUserStatus : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        bindgrid();
        if (!IsPostBack)
        {
            admin adm = new admin();
            ddlDepartment.Items.Clear();
            ddlDepartment.DataSource = adm.GetDeptData("select * from Department");
            ddlDepartment.DataTextField = "dep_name";
            ddlDepartment.DataValueField = "dep_id";
            ddlDepartment.DataBind();
            ddlDepartment.Items.Insert(0, "--All--");
        }
    }

    protected void bindgrid()
    {
        dbconnection dbc = new dbconnection();
        admin adm = new admin();

        gvUsers.DataSource = adm.GetUesrData();
        gvUsers.DataBind();
    }
    protected void ddlDepartment_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection();
        con.ConnectionString = @"Data Source=(LocalDB)\v11.0;AttachDbFilename=C:\Users\Ness\Desktop\OASMS\App_Data\OASMSdatabase.mdf;Integrated Security=True";
        con.Open();
        DataTable dt = new DataTable();

        if (ddlDepartment.Text != "--All--")
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "select * from UserDetail where department =@dep";
            cmd.Parameters.AddWithValue("@dep", ddlDepartment.SelectedValue);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
        }
        else
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "select * from UserDetail";
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
        }
        con.Close();
        gvUsers.DataSource = dt;
        gvUsers.DataBind();
    }
    protected void gvUsers_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "update")
        {
            admin adm = new admin();
            int id = Int32.Parse(e.CommandArgument.ToString());

            adm.SelectStatus(id);

            bindgrid();
        }
    }
    protected void gvUsers_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

    }
}