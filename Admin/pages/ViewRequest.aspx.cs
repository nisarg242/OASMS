using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Admin_pages_ViewRequest : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        admin adm = new admin();

        gvViewRequest.DataSource = adm.EquipmentRequest();
        gvViewRequest.DataBind();
    }
    protected void gvViewRequest_RowCommand(object sender, GridViewCommandEventArgs e)
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
            cmd.CommandText = "select * from EquipmentRequest where ERequest_id=@rid";
            cmd.Parameters.AddWithValue("@rid", id);
            SqlDataReader rd = cmd.ExecuteReader();
            while (rd.Read())
            {
                txtName.Text = rd["s_name"].ToString();
                txtUID.Text = rd["s_uname"].ToString();
                txtsub.Text = rd["equipment"].ToString();
            }
            lblmsg.Visible = false;
        }
    }
    protected void lnkSend_Click(object sender, EventArgs e)
    {
        admin adm = new admin();
        string eqp = txtsub.Text;
        string desc = txtMsg.Text;
        string r_username = txtUID.Text;
        string s_username = Session["uname"].ToString();
        string name = txtName.Text;

        if (adm.ReqResponse(eqp, desc, r_username, name, s_username))
        {
            lblmsg.Text = "Send succesfully.";
            lblmsg.CssClass = "alert alert-success col-lg-12 col-md-12";
            lblmsg.Visible = true;
            Panel1.Visible = false;
        }
        else
        {
            lblmsg.Text = "Try again";
        }
    }
}