using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

/// <summary>
/// Summary description for dbconnection
/// </summary>
public class dbconnection
{
    SqlConnection con;

    public SqlConnection getconnect()
    {
        con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=C:\Users\Ness\Desktop\OASMS\App_Data\OASMSdatabase.mdf;Integrated Security=True");
        con.Open();
        return con;
    }

	public dbconnection()
	{
		//
		// TODO: Add constructor logic here
		//
	}
}