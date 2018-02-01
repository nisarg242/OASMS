using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Employee_Equip_Request : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            admin adm = new admin();
            ddlEquipment.DataSource = adm.GetDeptData("select distinct equip_type from EquipmentDetail");
            ddlEquipment.DataTextField = "equip_type";
            ddlEquipment.DataValueField = "equip_type";
            ddlEquipment.DataBind();
            ddlEquipment.Items.Insert(0, "--Select--");
        }
    }

    protected void btnSend_Click(object sender, EventArgs e)
    {
        Employee emp = new Employee();
        string equipment = ddlEquipment.SelectedValue;
        string description = txtDesc.Text;
        string s_username = Session["uname"].ToString();
        string s_name = Session["name"].ToString();

        if (emp.InsertRequest(equipment, description, s_username, s_name))
        {
            lblmsg.Text = "Send succesfully.";
            lblmsg.CssClass = "alert alert-success col-lg-12 col-md-12";
            lblmsg.Visible = true;
            ddlEquipment.SelectedIndex = 0;
            txtDesc.Text = "";
        }
        else
        {
            lblmsg.Text = "Try again";
        }
    }
}