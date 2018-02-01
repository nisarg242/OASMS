using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_pages_ViewAllotment : System.Web.UI.Page
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

        gvAllotment.DataSource = adm.GetAllotmentData();
        gvAllotment.DataBind();
    }
    protected void gvAllotment_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvAllotment.PageIndex = e.NewPageIndex;
        bindgrid();
    }
}