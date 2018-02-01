using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

/// <summary>
/// Summary description for Employee
/// </summary>
public class Employee
{
    public Employee()
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

    public bool login(string usernm, string password, out int uid, out string name, out string pswd, out string utype)
    {
        bool flag = true;
        name = null;
        pswd = null;
        uid = 0;
        utype = null;
        db = new dbconnection();
        cmd = new SqlCommand();
        cmd.Connection = db.getconnect();
        cmd.CommandText = "select user_id, name, password, user_type from UserDetail where user_name=@unm and password =@pswd";
        cmd.Parameters.AddWithValue("@unm", usernm);
        cmd.Parameters.AddWithValue("@pswd", password);
        rd = cmd.ExecuteReader();
        
        while (rd.Read())
        {
            uid = Convert.ToInt32(rd["user_id"]);
            utype = rd["user_type"].ToString();
            name = rd["name"].ToString();
            pswd = rd["password"].ToString();
        }
        try
        {
            if (uid > 0)
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

    public DataSet SendMessageUser(string UserName)
    {
        db = new dbconnection();
        cmd = new SqlCommand();
        cmd.Connection = db.getconnect();
        cmd.CommandText = "select * from UserDetail where name!= @unm";
        cmd.Parameters.AddWithValue("@unm", UserName);
        ad = new SqlDataAdapter(cmd);
        ds = new DataSet();
        ad.Fill(ds);
        return ds;
    }

    public DataSet InboxMessages(int messageID)
    {
        db = new dbconnection();
        cmd = new SqlCommand();
        cmd.Connection = db.getconnect();
        cmd.CommandText = "select * from Message where message_id= @mid";
        cmd.Parameters.AddWithValue("@mid", messageID);
        ad = new SqlDataAdapter(cmd);
        ds = new DataSet();
        ad.Fill(ds);
        return ds;
    }

    public DataSet InboxMessagesEmp(string reciever)
    {
        db = new dbconnection();
        cmd = new SqlCommand();
        cmd.Connection = db.getconnect();
        cmd.CommandText = "select * from Message where r_uname=@unm order by message_id desc";
        cmd.Parameters.AddWithValue("@unm", reciever);
        ad = new SqlDataAdapter(cmd);
        ds = new DataSet();
        ad.Fill(ds);
        return ds;
    }

    public DataSet OutboxMessage(string sender)
    {
        db = new dbconnection();
        cmd = new SqlCommand();
        cmd.Connection = db.getconnect();
        cmd.CommandText = "select * from Message where s_uname=@unm order by message_id desc";
        cmd.Parameters.AddWithValue("@unm", sender);
        ad = new SqlDataAdapter(cmd);
        ds = new DataSet();
        ad.Fill(ds);
        return ds;
    }

    public bool InsertRequest(string equipment, string description, string s_username, string s_name)
    {
        bool flag = true;
        db = new dbconnection();
        cmd = new SqlCommand();
        cmd.Connection = db.getconnect();
        cmd.CommandText = "Insert into EquipmentRequest (equipment, description, date, time, s_uname, s_name) values (@eqip, @desc, @dt, @tm, @sunm, @snm)";
        cmd.Parameters.AddWithValue("@eqip", equipment);
        cmd.Parameters.AddWithValue("@desc", description);
        cmd.Parameters.AddWithValue("@dt", DateTime.Now.ToString().Substring(0, 10));
        cmd.Parameters.AddWithValue("@tm", DateTime.Now);
        cmd.Parameters.AddWithValue("@sunm", s_username);
        cmd.Parameters.AddWithValue("@snm",s_name);

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

    public DataSet RequestResponse(string reciev)
    {
        db = new dbconnection();
        cmd = new SqlCommand();
        cmd.Connection = db.getconnect();
        cmd.CommandText = "select * from Req_Response where r_uname=@unm order by req_response_id desc";
        cmd.Parameters.AddWithValue("@unm", reciev);
        ad = new SqlDataAdapter(cmd);
        ds = new DataSet();
        ad.Fill(ds);
        return ds;
    }

    public DataSet RequestHistory(string sender)
    {
        db = new dbconnection();
        cmd = new SqlCommand();
        cmd.Connection = db.getconnect();
        cmd.CommandText = "select * from EquipmentRequest where s_uname=@unm";
        cmd.Parameters.AddWithValue("@unm", sender);
        ad = new SqlDataAdapter(cmd);
        ds = new DataSet();
        ad.Fill(ds);
        return ds;
    }

    public bool InsertComplaint(string subject, string description, string s_username, string s_name)
    {
        bool flag = true;
        db = new dbconnection();
        cmd = new SqlCommand();
        cmd.Connection = db.getconnect();
        cmd.CommandText = "Insert into Complaint (subject, complaint, date, time, s_uname, s_name) values (@sub, @comp, @dt, @tm, @sunm, @nm)";
        cmd.Parameters.AddWithValue("@sub", subject);
        cmd.Parameters.AddWithValue("@comp", description);
        cmd.Parameters.AddWithValue("@dt", DateTime.Now.ToString().Substring(0, 10));
        cmd.Parameters.AddWithValue("@tm", DateTime.Now);
        cmd.Parameters.AddWithValue("@sunm", s_username);
        cmd.Parameters.AddWithValue("@nm", s_name);

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

    public DataSet ComplaintHistory(string sender)
    {
        db = new dbconnection();
        cmd = new SqlCommand();
        cmd.Connection = db.getconnect();
        cmd.CommandText = "select * from Complaint where s_uname=@unm order by complaint_id desc";
        cmd.Parameters.AddWithValue("@unm", sender);
        ad = new SqlDataAdapter(cmd);
        ds = new DataSet();
        ad.Fill(ds);
        return ds;
    }

    public bool InsertFeedback(string subject, string feedback, string s_username)
    {
        bool flag = true;
        db = new dbconnection();
        cmd = new SqlCommand();
        cmd.Connection = db.getconnect();
        cmd.CommandText = "Insert into Feedback (subject, feedback, date, time, s_uname) values (@sub, @fdbk, @dt, @tm, @sunm)";
        cmd.Parameters.AddWithValue("@sub", subject);
        cmd.Parameters.AddWithValue("@fdbk", feedback);
        cmd.Parameters.AddWithValue("@dt", DateTime.Now.ToString().Substring(0, 10));
        cmd.Parameters.AddWithValue("@tm", DateTime.Now);
        cmd.Parameters.AddWithValue("@sunm", s_username);

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

    public DataSet FeedbackHistory(string sender)
    {
        db = new dbconnection();
        cmd = new SqlCommand();
        cmd.Connection = db.getconnect();
        cmd.CommandText = "select * from Feedback where s_uname=@unm order by feedback_id desc";
        cmd.Parameters.AddWithValue("@unm", sender);
        ad = new SqlDataAdapter(cmd);
        ds = new DataSet();
        ad.Fill(ds);
        return ds;
    }

    public bool ChangePassword(int id, string npswd)
    {
        bool flag = true;
        db = new dbconnection();
        cmd = new SqlCommand();
        cmd.Connection = db.getconnect();
        cmd.CommandText = "update Userdetail set password=@pswd where user_id=@uid";
        cmd.Parameters.AddWithValue("@pswd", npswd);
        cmd.Parameters.AddWithValue("@uid", id);

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