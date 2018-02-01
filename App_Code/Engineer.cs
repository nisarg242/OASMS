using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

/// <summary>
/// Summary description for Engineer
/// </summary>
public class Engineer
{
	public Engineer()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    SqlCommand cmd;
    SqlDataAdapter ad;
    SqlDataReader rd;
    DataSet ds;
    dbconnection db;

    public bool InsertMessage(string sub, string message, string s_username, string r_username, string name)
    {
        bool flag = true;
        db = new dbconnection();
        cmd = new SqlCommand();
        cmd.Connection = db.getconnect();
        cmd.CommandText = "Insert into Message (subject, message, date, time, s_uname, r_uname, r_name) values (@sub, @msg, @dt, @tm, @sunm, @runm, @nm)";
        cmd.Parameters.AddWithValue("@sub", sub);
        cmd.Parameters.AddWithValue("@msg", message);
        cmd.Parameters.AddWithValue("@dt", DateTime.Now.ToString().Substring(0, 10));
        cmd.Parameters.AddWithValue("@tm", DateTime.Now);
        cmd.Parameters.AddWithValue("@sunm", s_username);
        cmd.Parameters.AddWithValue("@runm", r_username);
        cmd.Parameters.AddWithValue("@nm", name);

        int x = 0;
        try
        {
            x = cmd.ExecuteNonQuery();
            if (x == 1)
                flag = true;
            else
                flag = false;
        }
        catch
        {
        }
        finally
        {
            db.getconnect().Close();
        }
        return flag;
    }
}