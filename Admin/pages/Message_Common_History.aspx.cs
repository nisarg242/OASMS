using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_pages_Message_Common_History : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        bindDataList();
    }

    protected void bindDataList()
    {
        admin adm = new admin();
        string sender = Session["uname"].ToString();

        DataList1.DataSource = adm.CommonMessageHistory(sender);
        DataList1.DataBind();
        //GridView1.DataSource = adm.CommonMessageHistory(sender);
        //GridView1.DataBind();
    }
}