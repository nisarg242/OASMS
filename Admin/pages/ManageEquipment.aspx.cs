using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Admin_pages_ManageEquipment : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindgrid();
        }
    }

    protected void bindgrid()
    {
        dbconnection dbc = new dbconnection();
        admin adm = new admin();

        gvEquipment.DataSource = adm.getEquipmentData();
        gvEquipment.DataBind();
    }
    protected void gvEquipment_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "delete")
        {


            dbconnection dbc = new dbconnection();
            admin emp = new admin();

            int id = Int32.Parse(e.CommandArgument.ToString());

            if (emp.DeleteEquipmentData(id))
            {
                //lblmsg.Text = "Delete successfully";
                //lblmsg.ForeColor = System.Drawing.Color.Green;

            }
            else
            {
                //lblmsg.Text = "Do not delete";
                //lblmsg.ForeColor = System.Drawing.Color.Red;
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
            cmd.CommandText = "select * from EquipmentDetail where equip_id=@eid";
            cmd.Parameters.AddWithValue("@eid", id);

            SqlDataReader rd = cmd.ExecuteReader();

            while (rd.Read())
            {
                ddlEquipmentType.SelectedValue = rd["equip_type"].ToString();
                ddlCompanyName.SelectedValue = rd["company_name"].ToString();
                txtModel.Text = rd["model_no"].ToString();
                txtMfg.Text = rd["mfg_date"].ToString().Substring(0, 10);
                txtArrival.Text = rd["arrival_date"].ToString().Substring(0, 10);
                txtDetail.Text = rd["detail"].ToString();
                ddlStatus.Text = rd["status"].ToString();
            }
            HiddenField1.Value = id.ToString();
        }

    }
    protected void gvEquipment_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }

    protected void gvEquipment_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvEquipment.PageIndex = e.NewPageIndex;
        bindgrid();
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        int ID = 0;
        Panel1.Visible = false;
        ID = Convert.ToInt32(HiddenField1.Value);
        dbconnection dbc = new dbconnection();
        admin adm = new admin();


        string etype = ddlEquipmentType.SelectedValue;
        string cname = ddlCompanyName.SelectedValue;
        string model = txtModel.Text;
        DateTime mfg = DateTime.Parse(txtMfg.Text.ToString().Substring(0, 10));
        DateTime arrival = DateTime.Parse(txtArrival.Text.ToString().Substring(0, 10));
        string detail = txtDetail.Text;
        string sts = ddlStatus.Text;

        if (adm.UpdateEquipdata(ID, etype, cname, model, mfg, arrival, detail, sts))
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
    protected void gvEquipment_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

    }
}