using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data;
using System.Data.OleDb;
using System.Configuration;

namespace PageAdmin
 {
  public class space:Page
  {
   
   protected Repeater P_Menu;
   protected PlaceHolder P1,P2,P_UC;
   protected int SiteId;
   protected string Wz_Name,Wz_Bottom,LoginName,Login_Member_Type,msg_icon_show,UserName,Member_Type,TrueName,Space_Clicks,Head_Image,Space_Banner,Space_Title,Space_Introduction,Introduction;
   OleDbConnection conn;
   string sql;
   protected void Page_Load(Object sender,EventArgs e)
    {
      if(IsNum(Request.QueryString["s"]) && IsStr(Request.QueryString["username"]))
       {
         Conn Myconn=new Conn();
         string constr=Myconn.Constr();//获取连接字符串
         conn=new OleDbConnection(constr);
         UserName=Request.QueryString["username"];
         SiteId=int.Parse(Request.QueryString["s"]);
         conn.Open();
           Get_WebSet();
           Table_Bind();
           Load_Control();
           Get_Member();
           Get_MemberSet();
           Get_Login();
         conn.Close();
       }
     else
       {
         Response.Write("<script type='text/javascript'>alert('参数错误!')</script>");
         Response.End();
       }

    }


private void Table_Bind()
  {
   sql="select id,thetable,table_name from pa_table where site_ids like '%,"+SiteId.ToString()+",%' and [inspace]=1 order by xuhao,id";
   DataSet ds=new DataSet();
   OleDbDataAdapter myadapter=new OleDbDataAdapter(sql,conn);
   myadapter.Fill(ds,"tb");
   if(ds.Tables["tb"].Rows.Count>0)
   {
     //for(int i=0;i<ds.Tables["tb"].Rows.Count;i++)
      //{
        //if(!Has_Data(ds.Tables["tb"].Rows[i]["thetable"].ToString()))
         //{
          // ds.Tables["tb"].Rows[i].Delete();
         //}
      //}
     //ds.AcceptChanges();
     P_Menu.DataSource =ds.Tables["tb"].DefaultView;
     P_Menu.DataBind();
   }

  }



private bool Has_Data(string thetable)
 {
   bool Rv=false;
   sql="select id from "+thetable+" where checked=1 and username='"+UserName+"'";
   OleDbCommand  myComm=new OleDbCommand(sql,conn);
   OleDbDataReader dr=myComm.ExecuteReader();
   if(dr.Read())
    {
      Rv=true;
    }
   dr.Close();
   return Rv;
 }

private void Load_Control()
 {
    UserControl UC;
   if(Request.QueryString["type"]=="exit")
     {
       Clear_Cookie();
     }
   else
     {
       if(Request.QueryString["type"]=="fbk")
       {
        UC=(UserControl)Page.LoadControl("~/e/space/spc_fbk.ascx");
       }
      else if(IsNum(Request.QueryString["tid"]))
      {
       UC=(UserControl)Page.LoadControl("~/e/space/spc_list.ascx");
      }
      else
      {
      UC=(UserControl)Page.LoadControl("~/e/space/spc_newlist.ascx");
      }
      P_UC.Controls.Add(UC);
    }
 }

private void Get_Member()
 {
   sql="select [truename],[m_group],[space_clicks],[head_image],[space_title],[space_banner],[space_introduction],[introduction],[m_type] from pa_member where username='"+UserName+"'";
   OleDbCommand comm=new OleDbCommand(sql,conn);
   OleDbDataReader dr=comm.ExecuteReader();
   if(dr.Read())
    {
      Space_Title=dr["space_title"].ToString();
      if(Space_Title=="")
       {
         Space_Title=UserName+"的空间";
       }
      Space_Introduction=ubb(dr["space_introduction"].ToString());
      Introduction=ubb(dr["introduction"].ToString());
      TrueName=dr["truename"].ToString();
      Space_Clicks=dr["space_clicks"].ToString();
      Head_Image=dr["head_image"].ToString();
      if(Head_Image=="")
        {
          Head_Image="/e/member/images/defaultface.gif";
        }
     Space_Banner=dr["space_banner"].ToString();
     if(Space_Banner=="")
       {
        Space_Banner="/e/member/images/spacebanner.gif";
       }
     Member_Type=Get_TypeName(int.Parse(dr["m_type"].ToString()));
    }
   else
    {
       Response.Write("<script type='text/javascript'>alert('用户名不存在!');</script>");
       Response.End();
    }
  dr.Close();
 }

private void Get_MemberSet()
 {
   string Space_Open="";
   sql="select top 1 space_open from pa_member_set";
   OleDbCommand comm=new OleDbCommand(sql,conn);
   OleDbDataReader dr=comm.ExecuteReader();
   if(dr.Read())
    {
     Space_Open=dr["space_open"].ToString();
    }
  dr.Close();
  if(Space_Open=="0")
   {
    Response.Write("<script src='/e/js/space.js' type='text/javascript'></script><script type='text/javascript'>Space_Close();</script>");
    Response.End();
   }
}

private void Get_Login()
 {
  if(Request.Cookies["Member"]!=null)
    {
     if(Request.Cookies["Member"].Values["UserName"]!=null && Request.Cookies["Member"].Values["Type_Id"]!=null)
       {
          Member_Valicate MCheck=new Member_Valicate();
          MCheck.Member_Check(true,SiteId.ToString());
          P2.Visible=true;
          LoginName=Request.Cookies["Member"].Values["UserName"];
          Login_Member_Type=Get_TypeName(int.Parse(Request.Cookies["Member"].Values["Type_Id"]));
          Get_NewMsg(LoginName);
       }
     else
      {
        Response.Write("<script>location.href='"+Get_Url("exit")+"'</script>");
        Response.End();
      }
    }
  else
    {
      P1.Visible=true;
    }

 }

private string Get_TypeName(int TypeId)
 {
    string Rv="";
     sql="select top 1 m_type,m_set from pa_member_type where id="+TypeId;
     OleDbCommand comm=new OleDbCommand(sql,conn);
     OleDbDataReader dr= comm.ExecuteReader();
     if(dr.Read())
      {
        Rv=dr["m_type"].ToString();
      }  
     else
      {
        Response.Write("<script>location.href='"+Get_Url("exit")+"'</script>");
        Response.End();
      }
  dr.Close();
  return Rv;
 }

private void Get_NewMsg(string User)
 {
     sql="select id from pa_msg_inbox where receiver='"+User+"' and readed=0";
     OleDbCommand comm=new OleDbCommand(sql,conn);
     OleDbDataReader dr= comm.ExecuteReader();
     if(dr.Read())
      {
        msg_icon_show="";
      }  
     else
      {
        msg_icon_show="none";
      }
  dr.Close();
 }

private void Get_WebSet()
 {
   sql="select wzbottom,wzname from pa_webset where site_id="+SiteId;
   OleDbCommand comm=new OleDbCommand(sql,conn);
   OleDbDataReader dr= comm.ExecuteReader(); 
   if(dr.Read())
    {
      Wz_Name=dr["wzname"].ToString();
      Wz_Bottom=dr["wzbottom"].ToString();
    }
   else
    {
      Response.Write("<script type='text/javascript'>alert('无效的siteid!');</script>");
      Response.End();
    }
  dr.Close();
 }

private void Clear_Cookie()
 {
   HttpCookie MCookie=new HttpCookie("Member");
   HttpCookie OrderCookie=new HttpCookie("order");
   MCookie.Expires=DateTime.Now.AddDays(-1);
   OrderCookie.Expires=DateTime.Now.AddDays(-1);
   Response.AppendCookie(MCookie);
   Response.AppendCookie(OrderCookie);
   Response.Write("<script type='text/javascript'>location.href='?s="+SiteId.ToString()+"&username="+UserName+"'</script>");
   Response.End();
 }

protected string Get_Url(string Type)
  {
    return "/e/member/index.aspx?s="+SiteId+"&type="+Type;
  }

private string ubb(string str)
   {
    if(str=="" ||   str==null)
    {
     return "";
    }
    str=str.Replace("\r\n","<br>");
    str=str.Replace(" ","&nbsp;");
    return str;
   }


private bool IsStr(string str)
 {
  if(str=="" || str==null)
   {
    return false;
   }
  string str1="abcdefghijklmnopqrstuvwxyz0123456789_";
  string str2=str.ToLower();;
  for(int i=0;i<str2.Length;i++)
   {
    if(str1.IndexOf(str2[i])==-1)
     {
       return false;
     }
   }
  return true;
 }

private bool IsNum(string str)
 {
  string str1="1234567890";
  if(str=="" ||   str==null)
   {
    return false;
   }

  for(int i=0;i<str.Length;i++)
   {
    if(str1.IndexOf(str[i])==-1)
     {
       return false;
     }
   }
  return true;
 }

 }
 }
