using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Engineer_Message_Outbox : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        bindDataList();
    }

    protected void bindDataList()
    {
        Employee adm = new Employee();
        string sender = Session["uname"].ToString();

        DataList1.DataSource = adm.OutboxMessage(sender);
        DataList1.DataBind();
        //GridView1.DataSource = adm.OutboxMessage(sender);
        //GridView1.DataBind();
    }
}