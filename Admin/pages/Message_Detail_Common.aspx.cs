using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Admin_pages_Message_Detail_Common : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int id = 0;
        if (Request.QueryString["id"] != null)
        {
            id = Convert.ToInt32(Request.QueryString["id"]);
        }

        SqlConnection con = new SqlConnection();
        con.ConnectionString = @"Data Source=(LocalDB)\v11.0;AttachDbFilename=C:\Users\Ness\Desktop\OASMS\App_Data\OASMSdatabase.mdf;Integrated Security=True";
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "select * from MessageCommon where message_id=@mid";
        cmd.Parameters.AddWithValue("@mid", id);
        SqlDataReader rd = cmd.ExecuteReader();

        while (rd.Read())
        {
            txtsub.Text = rd["subject"].ToString();
            txtMsg.Text = rd["message"].ToString();
            lblDate.Text = rd["date"].ToString().Substring(0, 10);
            lblTime.Text = rd["time"].ToString().Substring(0, 8);
            txtUID.Text = rd["s_uname"].ToString();
        }
    }
}