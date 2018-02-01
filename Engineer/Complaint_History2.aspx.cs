using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Engineer_Complaint_History2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        bindDataList();
    }

    protected void bindDataList()
    {
        Employee adm = new Employee();
        string sender = Session["uname"].ToString();

        DataList1.DataSource = adm.ComplaintHistory(sender);
        DataList1.DataBind();
    }
}