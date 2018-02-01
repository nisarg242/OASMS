using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Employee_Inbox_Emp : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        bindDataList();
    }

    protected void bindDataList()
    {
        Employee adm = new Employee();
        string reciever = Session["uname"].ToString();

        DataList1.DataSource = adm.InboxMessagesEmp(reciever);
        DataList1.DataBind();
        //GridView1.DataSource = adm.InboxMessagesEmp(reciever);
        //GridView1.DataBind();
    }
}