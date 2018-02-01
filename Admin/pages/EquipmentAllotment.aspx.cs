using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Admin_pages_EquipmentAllotment : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            admin adm = new admin();
            ddlDepartment.DataSource = adm.GetDeptData("select * from Department");
            ddlDepartment.DataTextField = "dep_name";
            ddlDepartment.DataValueField = "dep_id";
            ddlDepartment.DataBind();
            ddlDepartment.Items.Insert(0, "--Select--");

            ddlEquipment.DataSource = adm.GetDeptData("select distinct equip_type from EquipmentDetail");
            ddlEquipment.DataTextField = "equip_type";
            ddlEquipment.DataValueField = "equip_type";
            ddlEquipment.DataBind();
            ddlEquipment.Items.Insert(0, "--Select--");

            DateTime dt = DateTime.Now;
            txtDate.Text = dt.ToString("dd-MMM-yyyy");
        }
    }
    protected void ddlDepartment_SelectedIndexChanged(object sender, EventArgs e)
    {
        int ID = Convert.ToInt32(ddlDepartment.SelectedValue);
        if (IsPostBack)
        {
            admin adm = new admin();

            ddlUserName.DataSource = adm.GetDeptData("select user_name, user_id from UserDetail where department =" + ID);
            ddlUserName.DataTextField = "user_name";
            ddlUserName.DataValueField = "user_id";
            ddlUserName.DataBind();
            ddlUserName.Items.Insert(0, "--Select--");
        }
    }

    protected void bindgrid()
    {

        dbconnection dbc = new dbconnection();
        admin adm = new admin();

        gvAllotment.DataSource = adm.GetAllotData(ddlEquipment.SelectedValue);
        gvAllotment.DataBind();

    }
    protected void ddlEquipment_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindgrid();
    }
    protected void gvAllotment_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "select")
        {
            int id = Int32.Parse(e.CommandArgument.ToString());

            SqlConnection con = new SqlConnection();
            SqlCommand cmd = new SqlCommand();
            con.ConnectionString = @"Data Source=(LocalDB)\v11.0;AttachDbFilename=C:\Users\Ness\Desktop\OASMS\App_Data\OASMSdatabase.mdf;Integrated Security=True";
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "select * from equipmentDetail where equip_id=@id";
            cmd.Parameters.AddWithValue("@id", id);
            SqlDataReader rd;
            rd = cmd.ExecuteReader();

            while (rd.Read())
            {
                txtEquipId.Text = rd["equip_id"].ToString();
            }
        }
    }
    protected void btnAllote_Click(object sender, EventArgs e)
    {
        admin adm = new admin();

        int userid = Int32.Parse(ddlUserName.SelectedValue);
        string equiptype = ddlEquipment.SelectedValue;
        int equipId = Int32.Parse(txtEquipId.Text);
        DateTime allotdate = DateTime.Parse(txtDate.Text);
        string allot = "Alloted";
        string dsc = txtDescription.Text;


        if (adm.AllotEquipData(userid, equiptype, equipId, allotdate, allot, dsc))
        {
            admin admn = new admin();

            int id = Int32.Parse(txtEquipId.Text);
            string status = txtDescription.Text;

            if (admn.UpdateAllotStatus(id, status))
            {
                lblmsg.Text = "Data save Successfully";
                lblmsg.ForeColor = System.Drawing.Color.Green;
            }

        }
        else
        {
            lblmsg.Text = "Data Not Save";
            lblmsg.ForeColor = System.Drawing.Color.Red;
        }
    }
}