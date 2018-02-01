using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Admin_pages_AddNewCompany_EquipmentType : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        bindgrid();
        if(!IsPostBack)
        { 
            btnUpdateCompany.Visible = false;
            btnCancleCompany.Visible = false;
            btnUpdateEquip.Visible = false;
            btnCancleEquip.Visible = false;
        }
        
    }

    protected void bindgrid()
    {
        dbconnection dbc = new dbconnection();
        admin adm = new admin();

        gvCompany.DataSource = adm.GetCompanyData();
        gvCompany.DataBind();

        gvEquipment.DataSource = adm.GetEquipmentTypeData();
        gvEquipment.DataBind();
    }


    protected void btnCompanyAdd_Click(object sender, EventArgs e)
    {
        admin adm = new admin();
        string comp = txtComp.Text;

        if (adm.IsCompanyExist(comp) != true)
        {
            if (adm.InsertCompany(comp))
            {
                lblmsg.Text = "Add Successfuly";
                lblmsg.CssClass = "alert alert-success col-lg-12 col-md-12";
                lblmsg.Visible = true;

                txtComp.Text = "";
                bindgrid();
                
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
            lblmsg.Text = "Company Name is Already Exist";
            lblmsg.CssClass = "alert alert-danger col-lg-12 col-md-12";
            lblmsg.Visible = true;
        }
    }
    protected void btnEquipmentAdd_Click(object sender, EventArgs e)
    {
        admin adm = new admin();
        string equip = txtEquip.Text;

        if (adm.IsEquipmentTypeExist(equip) != true)
        {
            if (adm.InsertCompany(equip))
            {
                lblmsg.Text = "Add Successfuly";
                lblmsg.CssClass = "alert alert-success col-lg-12 col-md-12";
                lblmsg.Visible = true;

                txtEquip.Text = "";
                bindgrid();
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
            lblmsg.Text = "Equipment-Type is Already Exist";
            lblmsg.CssClass = "alert alert-danger col-lg-12 col-md-12";
            lblmsg.Visible = true;
        }
    }

    protected void gvCompany_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "delete")
        {
            dbconnection dbc = new dbconnection();
            admin adm = new admin();

            int id = Int32.Parse(e.CommandArgument.ToString());

            if (adm.DeleteCompany(id))
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
            btnCompanyAdd.Visible = false;
            btnUpdateCompany.Visible = true;
            btnCancleCompany.Visible = true;

            int id = Convert.ToInt16(e.CommandArgument);
            SqlConnection con = new SqlConnection();
            con.ConnectionString = @"Data Source=(LocalDB)\v11.0;AttachDbFilename=C:\Users\Ness\Desktop\OASMS\App_Data\OASMSdatabase.mdf;Integrated Security=True";
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "select * from Company where company_id=@uid";
            cmd.Parameters.AddWithValue("@uid", id);

            SqlDataReader rd = cmd.ExecuteReader();
            while (rd.Read())
            {
                txtComp.Text = rd["company"].ToString();
            }
            HiddenField1.Value = id.ToString();
        }
    }
    protected void gvEquipment_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "delete")
        {
            dbconnection dbc = new dbconnection();
            admin adm = new admin();

            int id = Int32.Parse(e.CommandArgument.ToString());

            if (adm.DeleteEquipmentType(id))
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
            btnEquipmentAdd.Visible = false;
            btnUpdateEquip.Visible = true;
            btnCancleEquip.Visible = true;

            int id = Convert.ToInt16(e.CommandArgument);
            SqlConnection con = new SqlConnection();
            con.ConnectionString = @"Data Source=(LocalDB)\v11.0;AttachDbFilename=C:\Users\Ness\Desktop\OASMS\App_Data\OASMSdatabase.mdf;Integrated Security=True";
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "select * from Equipments where equipment_id=@uid";
            cmd.Parameters.AddWithValue("@uid", id);

            SqlDataReader rd = cmd.ExecuteReader();

            while (rd.Read())
            {

                txtEquip.Text = rd["equipment"].ToString();

            }
            HiddenField2.Value = id.ToString();
        }
    }

    protected void btnUpdateCompany_Click(object sender, EventArgs e)
    {
        admin adm = new admin();
        int ID = Convert.ToInt32(HiddenField1.Value);
        
        btnCompanyAdd.Visible = true;
        btnUpdateCompany.Visible = false;
        btnCancleCompany.Visible = false;
        
        string comp = txtComp.Text;
        

        if (adm.UpdateCompany(ID, comp))
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
        txtComp.Text = "";
    }
    protected void btnCancleCompany_Click(object sender, EventArgs e)
    {
        btnUpdateCompany.Visible = false;
        btnCancleCompany.Visible = false;
        btnCompanyAdd.Visible = true;
        
    }

    protected void btnUpdateEquip_Click(object sender, EventArgs e)
    {
        admin adm = new admin();
        int ID = Convert.ToInt32(HiddenField2.Value);
        btnEquipmentAdd.Visible = true;
        btnUpdateEquip.Visible = false;
        btnCancleEquip.Visible = false;

        string equip = txtEquip.Text;


        if (adm.UpdateEquipmentType(ID, equip))
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
        txtEquip.Text = "";
    } 
    protected void btnCancleEquip_Click(object sender, EventArgs e)
    {
        btnUpdateEquip.Visible = false;
        btnCancleEquip.Visible = false;
        btnEquipmentAdd.Visible = true;
    }


    protected void gvCompany_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

    }
    protected void gvCompany_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }
    protected void gvEquipment_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

    }
    protected void gvEquipment_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }
    
}