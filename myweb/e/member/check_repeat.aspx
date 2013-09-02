<% @ Page language="c#"%>
<% @ Import NameSpace="System.Data"%>
<% @ Import NameSpace="System.Data.OleDb"%>
<% @ Import NameSpace="System.IO"%>
<% @ Import NameSpace="PageAdmin"%>
<script Language="C#" Runat="server">
override protected void OnInit(EventArgs e)
{
  Check_Post();
  string Field=Request.Form["field"];
  string Field_Value=Request.Form["value"];
  string UserName=Request.Form["username"];
  if(!IsStr(UserName))
  {
    UserName="";
  }
  string Repeat="0";
  if(IsStr(Field))
    {
     Conn theconn=new Conn();
     OleDbConnection conn=new OleDbConnection(theconn.Constr());
     conn.Open();
     string sql;
     if(UserName=="")
      {
        sql="select id from pa_member where "+Field+"='"+Sql_Format(Field_Value)+"'";
      }
     else
      {
        sql="select id from pa_member where "+Field+"='"+Sql_Format(Field_Value)+"' and username<>'"+Sql_Format(UserName)+"'";
      }

     OleDbCommand comm=new OleDbCommand(sql,conn);
     OleDbDataReader dr=comm.ExecuteReader();
     if(dr.Read())
      {
        Repeat="1";
      }
     dr.Close();
     conn.Close();
    }
  Response.Write(Repeat);
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

private bool IsNum(string str)
  {
   string str1="0123456789";
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


private void Check_Post()
 {
    string PostUrl=Request.ServerVariables["HTTP_REFERER"];
    string LocalUrl=Request.ServerVariables["SERVER_NAME"];
    if(PostUrl!=null)
      {
         if(PostUrl.Replace("http://","").Split('/')[0].Split(':')[0]!=LocalUrl)
          {
           Response.Write("invalid submit");
           Response.End();
          }
      }
 }
</script>