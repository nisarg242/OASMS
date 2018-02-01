using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Employee_Equip_Response : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Employee emp = new Employee();
        string reciever = Session["uname"].ToString();

        DataList1.DataSource = emp.RequestResponse(reciever);
        DataList1.DataBind();
    }
}