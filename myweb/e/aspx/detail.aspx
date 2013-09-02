﻿<% @ Page language="c#" Inherits="PageAdmin.lanmu"%>
<% @ Import NameSpace="System.Data"%>
<% @ Import NameSpace="System.Data.OleDb"%>
<% @ Import NameSpace="PageAdmin"%>
<script Language="C#" Runat="server">
override protected void OnInit(EventArgs e)
{
  string Table=Request.QueryString["table"];
  string Id=Request.QueryString["id"];
  if(IsStr(Table) && IsNum(Id))
    {
     Conn theconn=new Conn();
     OleDbConnection conn=new OleDbConnection(theconn.Constr());
     conn.Open();
     string sql="select id from pa_table where thetable='"+Table+"'";
     OleDbCommand comm=new OleDbCommand(sql,conn);
     OleDbDataReader dr=comm.ExecuteReader();
     if(!dr.Read()) 
      {
        dr.Close();
        conn.Close();
        Response.Redirect("/");
      }
     dr.Close();
     sql="select site_id,lanmu_id,sublanmu_id from "+Table+" where id="+Id;
     comm=new OleDbCommand(sql,conn);
     dr=comm.ExecuteReader();
     if(dr.Read()) 
      {
        Load_PageAdmin(int.Parse(dr["site_id"].ToString()),int.Parse(dr["lanmu_id"].ToString()),int.Parse(dr["sublanmu_id"].ToString()));
      }
     else
      {
        dr.Close();
        conn.Close();
        Response.Redirect("/");
      }
     conn.Close();
    }
  else
    {
      Response.Redirect("/");
    }
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
</script>