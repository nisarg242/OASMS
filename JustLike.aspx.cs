using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class JustLike : System.Web.UI.Page
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

    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        TextBox2.Text = Calendar1.SelectedDate.ToShortDateString();
    }
    protected void TextBox2_TextChanged(object sender, EventArgs e)
    {
        Calendar1.Visible = true;
    }
}