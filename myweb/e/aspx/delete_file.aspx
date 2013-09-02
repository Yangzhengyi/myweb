<% @ Page language="c#"%>
<% @ Import NameSpace="System.Data"%>
<% @ Import NameSpace="System.Data.OleDb"%>
<% @ Import NameSpace="System.IO"%>
<% @ Import NameSpace="PageAdmin"%>
<script Language="C#" Runat="server">
override protected void OnInit(EventArgs e)
{
  Check_Post();
  string Table=Request.Form["table"];
  string Field=Request.Form["field"];
  string Id=Request.Form["id"];
  string D_File=Request.Form["path"];
  if(IsStr(Table) && IsStr(Field) && IsNum(Id))
    {
     Conn theconn=new Conn();
     OleDbConnection conn=new OleDbConnection(theconn.Constr());
     conn.Open();

     Del_File(D_File);

     string sql="update "+Table+" set "+Field+"='' where id="+Id;
     OleDbCommand comm=new OleDbCommand(sql,conn);
     comm.ExecuteNonQuery();

     sql="update pa_file set detail_id=0 where thetable='"+Table+"' and [field]='"+Field+"' and detail_id="+Id;
     comm=new OleDbCommand(sql,conn);
     comm.ExecuteNonQuery();

     conn.Close();

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

private void Del_File(string FilePath)
 {
   if(FilePath!="" && FilePath.IndexOf(":")<0 && FilePath.IndexOf("/e/upload/")>=0)
    {
     if(FilePath.IndexOf("/zdy/")<0)
       {
         FilePath=Server.MapPath(FilePath);
         if(File.Exists(FilePath))
          {
            File.Delete(FilePath);
          }
      }
   }
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