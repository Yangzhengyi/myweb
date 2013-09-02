<% @ Page language="c#"%> 
<% @ Import NameSpace="System.Data"%>
<% @ Import NameSpace="System.Data.OleDb"%>
<% @ Import NameSpace="PageAdmin"%>
<script language="c#" runat="server">
 string Table,UserName,From,C_SortId,sql;
 OleDbConnection conn;
 protected void Page_Load(Object src,EventArgs e)
  {
    string rv="";
    Table=Request.QueryString["table"];
    UserName=Request.QueryString["username"];
    From=Request.QueryString["from"];
    C_SortId=Request.QueryString["sortid"];
    if(IsStr(Table) && IsStr(UserName) && IsNum(C_SortId))
     {
       Conn theconn=new Conn();
       conn=new OleDbConnection(theconn.Constr());
       conn.Open();
       OleDbCommand comm;
       OleDbDataReader dr;
       sql="select id from pa_sort where final_sort=1 and id="+C_SortId;
       comm=new OleDbCommand(sql,conn);
       dr=comm.ExecuteReader();
       if(dr.Read()) 
       {
         rv=C_SortId;
       }
       dr.Close();

      if(rv!=C_SortId) //不是最终类别则继续
       {
         if(From=="master")
          {
           sql="select id,sort_name from pa_sort where thetable='"+Table+"' and parent_id="+C_SortId+" order by xuhao,id";
          }
         else
          {
           string m_type=Get_MType();
           sql="select id,sort_name from pa_sort where thetable='"+Table+"' and parent_id="+C_SortId+" and tg_open=1 and (allow_memtype like '%,"+m_type+",%' or allow_memtype='') order by xuhao,id";
          }
         comm=new OleDbCommand(sql,conn);
         dr=comm.ExecuteReader();
         while(dr.Read()) 
         {
           rv+=dr["id"].ToString()+","+dr["sort_name"].ToString()+",,";
         }
         dr.Close();
       } //
     conn.Close();
    }

   Response.Write(rv);
   Response.End();
  }

private string Get_MType()
 {
   string rv="0";
   sql="select m_type from pa_member where username='"+UserName+"'";
   OleDbCommand comm=new OleDbCommand(sql,conn);
   OleDbDataReader dr=comm.ExecuteReader();
   if(dr.Read()) 
    {
     rv=dr["m_type"].ToString();
    }
   dr.Close();
   return rv;
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
  if(str=="" || str==null)
   {
    return false;
   }
  string str1="0123456789";
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
</script>