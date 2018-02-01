using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_pages_adminHome : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        bindgrid();
    }
    protected void bindgrid()
    {
        admin adm = new admin();

        gvUsers.DataSource = adm.GetUesrData();
        gvUsers.DataBind();
    }

    protected void gvUsers_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvUsers.PageIndex = e.NewPageIndex;
        bindgrid();
    }
}