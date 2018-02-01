using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_pages_Request_Respons : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        admin adm = new admin();
        
        DataList1.DataSource = adm.RequestResponseList();
        DataList1.DataBind();
    }
}