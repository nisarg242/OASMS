using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for admin
/// </summary>
public class admin
{
	public admin()
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


    public bool savedata(string username, string name, string psw, int dept, string usertype, string mobile, string email, string status)
    {
        bool flag = true;
        db = new dbconnection();
        cmd = new SqlCommand();
        cmd.Connection = db.getconnect();
        cmd.CommandText = "insert into UserDetail (user_name, name, password, department, user_type, mobile, email, status) values (@unm, @nm, @pswd, @dept, @utype, @mbl, @eml, @status)";
        cmd.Parameters.AddWithValue("@unm", username);
        cmd.Parameters.AddWithValue("@nm", name);
        cmd.Parameters.AddWithValue("@pswd", psw);
        cmd.Parameters.AddWithValue("@dept", dept);
        cmd.Parameters.AddWithValue("@utype", usertype);
        cmd.Parameters.AddWithValue("@mbl", mobile);
        cmd.Parameters.AddWithValue("@eml", email);
        cmd.Parameters.AddWithValue("@status", status);

        int x = 0;
        try
        {
            x = cmd.ExecuteNonQuery();
            if (x == 1)
            {
                flag = true;
            }
            else
                flag = false;
        }
        catch
        { }
        finally
        {
            db.getconnect().Close();
        }
        return flag;
    }

    public bool isuserexist(string un)
    {
        bool flag = true;
        string username = null;
        db = new dbconnection();
        cmd = new SqlCommand();
        cmd.Connection = db.getconnect();
        cmd.CommandText = "select user_name from UserDetail where user_name=@unm";
        cmd.Parameters.AddWithValue("@unm", un);

        if (cmd.ExecuteScalar() != null)
            username = cmd.ExecuteScalar().ToString();

        try
        {
            if (username != null)
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

    public DataSet GetDeptData(string qry)
    {
        db = new dbconnection();
        cmd = new SqlCommand();
        cmd.Connection = db.getconnect();
        cmd.CommandText = qry;
        ad = new SqlDataAdapter(cmd);
        ds = new DataSet();
        ad.Fill(ds);
        return ds;
    }

    public DataSet GetUesrData()
    {
        db = new dbconnection();
        cmd = new SqlCommand();
        cmd.Connection = db.getconnect();
        cmd.CommandText = "select * from UserDetail";
        ad = new SqlDataAdapter(cmd);
        ds = new DataSet();
        ad.Fill(ds);
        return ds;
    }

    public bool DeleteUserData(int id)
    {
        bool flag = true;
        db = new dbconnection();
        cmd = new SqlCommand();
        cmd.Connection = db.getconnect();
        cmd.CommandText = "delete from UserDetail where  user_id=@id";
        cmd.Parameters.AddWithValue("@id", id);

        try
        {
            int x = cmd.ExecuteNonQuery();
            if (x == 1)
            {
                flag = true;
            }
            else
            {
                flag = false;
            }
        }
        catch
        { }
        finally
        {
            db.getconnect().Close();
        }
        return flag;
    }

    public bool UpdateUserdata(int id, string usernm, string name, int dprtmet, string utype, string mbl, string eml, string sts)
    {
        bool flag = true;
        db = new dbconnection();
        cmd = new SqlCommand();
        cmd.Connection = db.getconnect();
        cmd.CommandText = "update Userdetail set user_name=@unm, name=@nm, department=@dep, user_type=@utype, mobile=@mbl, email=@eml, status=@sts where user_id=@uid";

        
        cmd.Parameters.AddWithValue("@unm", usernm);
        cmd.Parameters.AddWithValue("@nm", name);
        cmd.Parameters.AddWithValue("@dep", dprtmet);
        cmd.Parameters.AddWithValue("@utype", utype);
        cmd.Parameters.AddWithValue("@mbl", mbl);
        cmd.Parameters.AddWithValue("@eml", eml);
        cmd.Parameters.AddWithValue("@sts", sts);
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



    public DataSet GetEquipDataInDDL(string qry)
    {
        db = new dbconnection();
        cmd = new SqlCommand();
        cmd.Connection = db.getconnect();
        cmd.CommandText = qry;
        ad = new SqlDataAdapter();
        ds = new DataSet();
        ad.Fill(ds);
        return ds;
    }

    public bool SaveEquipData(string eqptype, string comname, string modno, string mfgdate, DateTime arrivaldate, string dtail, string status)
    {
        bool flag = true;
        db = new dbconnection();
        cmd = new SqlCommand();
        cmd.Connection = db.getconnect();
        cmd.CommandText = "Insert into EquipmentDetail (equip_type, company_name, model_no, mfg_date, arrival_date, detail, status) values ( @eqtype, @comnm, @mdl, @mfg, @arrival, @dtl, @sts)";
        cmd.Parameters.AddWithValue("@eqtype", eqptype);
        cmd.Parameters.AddWithValue("@comnm", comname);
        cmd.Parameters.AddWithValue("@mdl", modno);
        cmd.Parameters.AddWithValue("@mfg", mfgdate);
        cmd.Parameters.AddWithValue("@arrival", arrivaldate);
        cmd.Parameters.AddWithValue("@dtl", dtail);
        cmd.Parameters.AddWithValue("@sts", status);

        try
        {
            int x = cmd.ExecuteNonQuery();
            if (x == 1)
            {
                flag = true;
            }
            else
            {
                flag = false;
            }
        }
        catch
        { }
        finally
        {
            db.getconnect().Close();
        }
        return flag;
    }

    public bool isEquipmentExist(string mn)
    {
        bool flag = true;
        string modelno = null;
        db = new dbconnection();
        cmd = new SqlCommand();
        cmd.Connection = db.getconnect();
        cmd.CommandText = "select model_no from EquipmentDetail where model_no=@mdn";
        cmd.Parameters.AddWithValue("@mdn", mn);

        if (cmd.ExecuteScalar() != null)
            modelno = cmd.ExecuteScalar().ToString();

        try
        {
            if (modelno != null)
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


    public DataSet getEquipmentData()
    {
        db = new dbconnection();
        cmd = new SqlCommand();
        cmd.Connection = db.getconnect();
        cmd.CommandText = "select * from EquipmentDetail";
        ad = new SqlDataAdapter(cmd);
        ds = new DataSet();
        ad.Fill(ds);
        return ds;
    }

    public bool DeleteEquipmentData(int id)
    {
        bool flag = true;
        db = new dbconnection();
        cmd = new SqlCommand();
        cmd.Connection = db.getconnect();
        cmd.CommandText = "delete from EquipmentDetail where equip_id= @id";
        cmd.Parameters.AddWithValue("@id", id);
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

    public bool UpdateEquipdata(int id, string etype, string cname, string mdl, DateTime mfg, DateTime arivl, string dtl, string sts)
    {
        bool flag = true;
        db = new dbconnection();
        cmd = new SqlCommand();
        cmd.Connection = db.getconnect();
        cmd.CommandText = "update EquipmentDetail set equip_type=@type, company_name=@nm, model_no=@model, mfg_date=@mfg, arrival_date=@arvl, detail=@dtl, status=@sts where equip_id =@id";

        cmd.Parameters.AddWithValue("@id", id);
        cmd.Parameters.AddWithValue("@type", etype);
        cmd.Parameters.AddWithValue("@nm", cname);
        cmd.Parameters.AddWithValue("@model", mdl);
        cmd.Parameters.AddWithValue("@mfg", mfg);
        cmd.Parameters.AddWithValue("@arvl", arivl);
        cmd.Parameters.AddWithValue("@dtl", dtl);
        cmd.Parameters.AddWithValue("@sts", sts);

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



    public DataSet GetEquipmentTypeData()
    {
        db = new dbconnection();
        cmd = new SqlCommand();
        cmd.Connection = db.getconnect();
        cmd.CommandText = "select * from Equipments";
        ad = new SqlDataAdapter(cmd);
        ds = new DataSet();
        ad.Fill(ds);
        return ds;
    }

    public DataSet GetCompanyData()
    {
        db = new dbconnection();
        cmd = new SqlCommand();
        cmd.Connection = db.getconnect();
        cmd.CommandText = "select * from Company";
        ad = new SqlDataAdapter(cmd);
        ds = new DataSet();
        ad.Fill(ds);
        return ds;
    }

    public bool IsCompanyExist(string cm)
    {
        bool flag = true;
        string comp  = null;
        db = new dbconnection();
        cmd = new SqlCommand();
        cmd.Connection = db.getconnect();
        cmd.CommandText = "select company from Company where company=@cmp";
        cmd.Parameters.AddWithValue("@cmp", cm);

        if (cmd.ExecuteScalar() != null)
            comp = cmd.ExecuteScalar().ToString();

        try
        {
            if (comp != null)
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

    public bool IsEquipmentTypeExist(string eq)
    {
        bool flag = true;
        string equip = null;
        db = new dbconnection();
        cmd = new SqlCommand();
        cmd.Connection = db.getconnect();
        cmd.CommandText = "select equipment from Equipment where equipment=@eqp";
        cmd.Parameters.AddWithValue("@eqp", eq);

        if (cmd.ExecuteScalar() != null)
            equip = cmd.ExecuteScalar().ToString();

        try
        {
            if (equip != null)
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

    public bool InsertCompany(string comp)
    {
        bool flag = true;
        db = new dbconnection();
        cmd = new SqlCommand();
        cmd.Connection = db.getconnect();
        cmd.CommandText = "Insert into Company (company) values (@comnm)";
        cmd.Parameters.AddWithValue("@comnm", comp);
        
        try
        {
            int x = cmd.ExecuteNonQuery();
            if (x == 1)
            {
                flag = true;
            }
            else
            {
                flag = false;
            }
        }
        catch
        { }
        finally
        {
            db.getconnect().Close();
        }
        return flag;
    }

    public bool IsertEquipmentType(string equip)
    {
        bool flag = true;
        db = new dbconnection();
        cmd = new SqlCommand();
        cmd.Connection = db.getconnect();
        cmd.CommandText = "Insert into Equipment (equipment) values (@eqp)";
        cmd.Parameters.AddWithValue("@eqp", equip);

        try
        {
            int x = cmd.ExecuteNonQuery();
            if (x == 1)
            {
                flag = true;
            }
            else
            {
                flag = false;
            }
        }
        catch
        { }
        finally
        {
            db.getconnect().Close();
        }
        return flag;
    }

    public bool DeleteCompany(int id)
    {
        bool flag = true;
        db = new dbconnection();
        cmd = new SqlCommand();
        cmd.Connection = db.getconnect();
        cmd.CommandText = "delete from Company where company_id= @id";
        cmd.Parameters.AddWithValue("@id", id);
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

    public bool DeleteEquipmentType(int id)
    {
        bool flag = true;
        db = new dbconnection();
        cmd = new SqlCommand();
        cmd.Connection = db.getconnect();
        cmd.CommandText = "delete from Equipments where equipment_id= @id";
        cmd.Parameters.AddWithValue("@id", id);
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

    public bool UpdateCompany(int id, string comp)
    {
        bool flag = true;
        db = new dbconnection();
        cmd = new SqlCommand();
        cmd.Connection = db.getconnect();
        cmd.CommandText = "update Company set company=@com where company_id=@cid";

        cmd.Parameters.AddWithValue("@cid", id);
        cmd.Parameters.AddWithValue("@com", comp);

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

    public bool UpdateEquipmentType(int id, string equip)
    {
        bool flag = true;
        db = new dbconnection();
        cmd = new SqlCommand();
        cmd.Connection = db.getconnect();
        cmd.CommandText = "update Equipments set equipment=@eqp where equipment_id=@eid";

        cmd.Parameters.AddWithValue("@eid", id);
        cmd.Parameters.AddWithValue("@eqp", equip);

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



    public DataSet GetAllotData(string type)
    {

        db = new dbconnection();
        cmd = new SqlCommand();
        cmd.Connection = db.getconnect();
        cmd.CommandText = "Select * from EquipmentDetail where equip_type=@typ AND status = 'Unalloted'";
        cmd.Parameters.AddWithValue("@typ", type);
        ad = new SqlDataAdapter(cmd);
        ds = new DataSet();
        ad.Fill(ds);
        return ds;
    }

    public bool AllotEquipData(int userid, string equiptype, int equipId, DateTime allotdate, string allote, string dsc)
    {
        bool flag = true;
        db = new dbconnection();
        cmd = new SqlCommand();
        cmd.Connection = db.getconnect();
        cmd.CommandText = "Insert into AllotmentDetail (user_id, equip_type, model_no, date, remark, description) values ( @uid, @etype, @mdl, @altdt, @rmk, @dsc)";

        cmd.Parameters.AddWithValue("@uid", userid);
        cmd.Parameters.AddWithValue("@etype", equiptype);
        cmd.Parameters.AddWithValue("@mdl", equipId);
        cmd.Parameters.AddWithValue("@altdt", allotdate);
        cmd.Parameters.AddWithValue("@rmk", allote);
        cmd.Parameters.AddWithValue("@dsc", dsc);

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

    public bool UpdateAllotStatus(int id, string status)
    {
        bool flag = true;
        db = new dbconnection();
        cmd = new SqlCommand();
        cmd.Connection = db.getconnect();
        cmd.CommandText = "update EquipmentDetail set status=@sts where equip_id =@id";

        cmd.Parameters.AddWithValue("@id", id);
        cmd.Parameters.AddWithValue("@sts", status);

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

    public DataSet GetAllotmentData()
    {
        db = new dbconnection();
        cmd = new SqlCommand();
        cmd.Connection = db.getconnect();
        cmd.CommandText = "select * from AllotmentDetail";
        ad = new SqlDataAdapter(cmd);
        ds = new DataSet();
        ad.Fill(ds);
        return ds;
    }

    public DataSet GetChangeUserStatusData()
    {
        db = new dbconnection();
        cmd = new SqlCommand();
        cmd.Connection = db.getconnect();
        cmd.CommandText = "select * from UserDetail";
        ad = new SqlDataAdapter(cmd);
        ds = new DataSet();
        ad.Fill(ds);
        return ds;
    }

    public bool SelectStatus(int id)
    {
        bool flag = true;
        string status = null;
        
        db = new dbconnection();
        cmd = new SqlCommand();
        cmd.Connection = db.getconnect();
        cmd.CommandText = "select status from UserDetail where user_id=@id";
        cmd.Parameters.AddWithValue("@id", id);


        status = cmd.ExecuteScalar().ToString();
        try
        {
            if (status == "Enable")
                cmd.CommandText = "update UserDetail set status='Disable' where user_id=@id ";
            else
                cmd.CommandText = "update UserDetail set status='Enable' where user_id=@id";
            cmd.ExecuteNonQuery();
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

    public DataSet GetAdminData()
    {
        db = new dbconnection();
        cmd = new SqlCommand();
        cmd.Connection = db.getconnect();
        cmd.CommandText = "select * from UserDetail where user_type='Admin'";
        ad = new SqlDataAdapter(cmd);
        ds = new DataSet();
        ad.Fill(ds);
        return ds;
    }

    public DataSet EquipmentRequest()
    {
        db = new dbconnection();
        cmd = new SqlCommand();
        cmd.Connection = db.getconnect();
        cmd.CommandText = "select * from EquipmentRequest";
        ad = new SqlDataAdapter(cmd);
        ds = new DataSet();
        ad.Fill(ds);
        return ds;
    }

    public bool ReqResponse(string equip, string desc, string r_username, string name, string s_username)
    {
        bool flag = true;
        db = new dbconnection();
        cmd = new SqlCommand();
        cmd.Connection = db.getconnect();
        cmd.CommandText = "Insert into Req_Response (equipment, response, date, time, s_uname, r_name, r_uname) values (@eqp, @res, @dt, @tm, @sunm, @nm, @runm)";
        cmd.Parameters.AddWithValue("@eqp", equip);
        cmd.Parameters.AddWithValue("@res", desc);
        cmd.Parameters.AddWithValue("@dt", DateTime.Now.ToString().Substring(0, 10));
        cmd.Parameters.AddWithValue("@tm", DateTime.Now);
        cmd.Parameters.AddWithValue("@sunm", s_username);
        cmd.Parameters.AddWithValue("@nm", name);
        cmd.Parameters.AddWithValue("@runm", r_username);

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

    public DataSet RequestResponseList()
    {
        db = new dbconnection();
        cmd = new SqlCommand();
        cmd.Connection = db.getconnect();
        cmd.CommandText = "select * from Req_Response order by req_response_id desc";
        ad = new SqlDataAdapter(cmd);
        ds = new DataSet();
        ad.Fill(ds);
        return ds;
    }

    public DataSet ComplaintAll()
    {
        db = new dbconnection();
        cmd = new SqlCommand();
        cmd.Connection = db.getconnect();
        cmd.CommandText = "select * from Complaint order by complaint_id desc";
        ad = new SqlDataAdapter(cmd);
        ds = new DataSet();
        ad.Fill(ds);
        return ds;
    }

    public bool InsertCommonMessage(string subject, string message, string s_username)
    {
        bool flag = true;
        db = new dbconnection();
        cmd = new SqlCommand();
        cmd.Connection = db.getconnect();
        cmd.CommandText = "Insert into MessageCommon (subject, message, date, time, s_uname) values (@sub, @msg, @dt, @tm, @sunm)";
        cmd.Parameters.AddWithValue("@sub", subject);
        cmd.Parameters.AddWithValue("@msg", message);
        cmd.Parameters.AddWithValue("@dt", DateTime.Now.ToString().Substring(0, 10));
        cmd.Parameters.AddWithValue("@tm", DateTime.Now.ToString());
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

    public DataSet CommonMessageHistory(string sender)
    {
        db = new dbconnection();
        cmd = new SqlCommand();
        cmd.Connection = db.getconnect();
        cmd.CommandText = "select * from MessageCommon where s_uname=@unm order by message_id desc";
        cmd.Parameters.AddWithValue("@unm", sender);
        ad = new SqlDataAdapter(cmd);
        ds = new DataSet();
        ad.Fill(ds);
        return ds;
    }
}