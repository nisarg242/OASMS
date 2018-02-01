using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_pages_addNewEquipment : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
           
            admin adm = new admin();
            ddlEquipmentType.Items.Clear();
            ddlEquipmentType.DataSource = adm.GetDeptData("select * from Equipments");
            ddlEquipmentType.DataTextField = "equipment";
            ddlEquipmentType.DataValueField = "equipment_id";
            ddlEquipmentType.DataBind();
            ddlEquipmentType.Items.Insert(0, "--Select--");

            ddlCompanyName.Items.Clear();
            ddlCompanyName.DataSource = adm.GetDeptData("select * from Company");
            ddlCompanyName.DataTextField = "company";
            ddlCompanyName.DataValueField = "company_id";
            ddlCompanyName.DataBind();
            ddlCompanyName.Items.Insert(0, "--Select--");


            DateTime dt = DateTime.Now;
            txtArrival.Text = dt.ToString("MM-dd-yyyy");
        }
    }
    protected void btnsave_Click(object sender, EventArgs e)
    {
        admin adm = new admin();

        string eqptype = ddlEquipmentType.SelectedValue;
        string comnm = ddlCompanyName.SelectedValue;
        string modno = txtModel.Text;
        string mfgdate = txtMfg.Text;
        DateTime arrivaldate = DateTime.Parse(txtArrival.Text);
        string dtail = txtDetail.Text;
        string status = "Unalloted";

        if (adm.isEquipmentExist(modno)!= true)
        {
            if (adm.SaveEquipData(eqptype, comnm, modno, mfgdate, arrivaldate, dtail, status))
            {
                lblmsg.Text = "Data Save Successfully";
                lblmsg.CssClass = "alert alert-success col-lg-12 col-md-12";
                lblmsg.Visible = true;

                txtDetail.Text = "";
                txtModel.Text = "";
                ddlCompanyName.SelectedIndex = 0;
                ddlEquipmentType.SelectedIndex = 0;

            }
            else
            {
                lblmsg.Text = "Can't Save, Try again";
                lblmsg.CssClass = "alert alert-danger col-lg-12 col-md-12";
                lblmsg.Visible = true;
            }
        }
        else
        {
            lblmsg.Text = "Equipment Model No. is Already Exist";
            lblmsg.CssClass = "alert alert-danger col-lg-12 col-md-12";
            lblmsg.Visible = true;
        }
    }
}