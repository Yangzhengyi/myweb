<% @ Page language="c#"%> 
<% @ Import NameSpace="System.Data"%>
<% @ Import NameSpace="System.Data.OleDb"%>
<% @ Import NameSpace="PageAdmin"%>
<script language="c#" runat="server">
 string Table,Tags,Type,Ids,NotId,Loadtype,Rv,jg,loadtype,sql;
 protected void Page_Load(Object src,EventArgs e)
  {
    Loadtype="";
    Rv="";
    jg="";
    Table=Request.QueryString["table"];
    Tags=Request.QueryString["tags"];
    Type=Request.QueryString["type"];
    Ids=Request.QueryString["ids"];
    NotId=Request.QueryString["notid"];
    loadtype=Request.QueryString["loadtype"];
    switch(loadtype)
     {
       case "find_list":
          find_related();
       break;

       case "related_list":
          load_list();
       break;

       case "zt_list":
          load_list();
       break;

       case "qs_list":
          load_signlist();
       break;
     }
 }
 
private void find_related() //通过tag查找相关信息
 {
    OleDbCommand comm;
    OleDbDataReader dr;

    if(IsStr(Table) && IsNum(Type) && Tags!="")//通过tag查找
     {
       if(IsNum(NotId))
        {
          NotId="and id<>"+NotId;
        }
       else
        {
         NotId="";
        }
       Tags=Sql_Format(Tags);
       string[] ATags=Tags.Split(',');
       Conn theconn=new Conn();
       OleDbConnection conn=new OleDbConnection(theconn.Constr());
       conn.Open();
       for(int i=0;i<ATags.Length;i++)
       {
         switch(Type)
          {
           case "1":
            sql="select id,title from "+Table+" where tags like '%"+ATags[i]+"%' "+NotId+" order by id desc";
           break;

           default:
            sql="select id,title from "+Table+" where title like '%"+ATags[i]+"%' "+NotId+" order by id desc";
           break;
          }
         comm=new OleDbCommand(sql,conn);
         dr=comm.ExecuteReader();
         while(dr.Read()) 
         {
          if(Rv!="")
           {
             jg="\"";
           }
           Rv+=jg+dr["id"].ToString()+","+Server.HtmlEncode(dr["title"].ToString());
         }
        dr.Close();
      }
     conn.Close();
    }

   

   Response.Write(Rv);
   Response.End();
 }

private void load_list() //通过ids查找专题和相关列表，两个功能共用
 {
    OleDbCommand comm;
    OleDbDataReader dr;
    if(Ids!=null && IsStr(Table))
     {
       if(Ids=="")
        {
          Response.Write(Rv);
          Response.End();
        }
       else
        {
          string[] AIds=Ids.Split(',');
          Conn theconn=new Conn();
          OleDbConnection conn=new OleDbConnection(theconn.Constr());
          conn.Open();
          for(int i=0;i<AIds.Length;i++)
          {
           if(IsNum(AIds[i]))
            {
               sql="select id,title from "+Table+" where id="+int.Parse(AIds[i]);
               comm=new OleDbCommand(sql,conn);
               dr=comm.ExecuteReader();
               while(dr.Read()) 
               {
                if(Rv!="")
                {
                 jg="\"";
                }
                Rv+=jg+dr["id"].ToString()+","+Server.HtmlEncode(dr["title"].ToString());
               }
               dr.Close();
            }
          }
         conn.Close();
         Response.Write(Rv);
         Response.End();
        }
     }
 }


private void load_signlist() //load签收用户列表
 {
    OleDbCommand comm;
    OleDbDataReader dr;
    if(Ids!=null && IsStr(Table))
     {
       if(Ids=="")
        {
          Response.Write(Rv);
          Response.End();
        }
       else
        {
          string[] AIds=Ids.Split(',');
          Conn theconn=new Conn();
          OleDbConnection conn=new OleDbConnection(theconn.Constr());
          conn.Open();
          for(int i=0;i<AIds.Length;i++)
          {
           if(IsNum(AIds[i]))
            {
               sql="select id,username,department,truename from pa_member where id="+int.Parse(AIds[i]);
               comm=new OleDbCommand(sql,conn);
               dr=comm.ExecuteReader();
               while(dr.Read()) 
               {
                if(Rv!="")
                {
                 jg="\"";
                }
                Rv+=jg+dr["id"].ToString()+","+Server.HtmlEncode(dr["department"].ToString())+"："+Server.HtmlEncode(dr["username"].ToString())+"<"+Server.HtmlEncode(dr["truename"].ToString())+">";
               }
               dr.Close();
            }
          }
         conn.Close();
         Response.Write(Rv);
         Response.End();
        }
     }
 }

private string Sql_Format(string str)
 {
  if(str=="" || str==null)
   {
    return "";
   }
   str=str.Replace("'","''");
   str=str.Replace("\"","\""); 
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