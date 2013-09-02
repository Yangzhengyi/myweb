<% @ Page language="c#"%> 
<% @ Import NameSpace="System.Data"%>
<% @ Import NameSpace="System.Data.OleDb"%>
<% @ Import NameSpace="PageAdmin"%>
<script language="c#" runat="server">
 string UserName;
 OleDbConnection conn;
 protected void Page_Load(Object src,EventArgs e)
  {
    Check_Post();
    UserName=Request.Form["username"];
    if(IsStr(UserName))
     {
       Conn theconn=new Conn();
       conn=new OleDbConnection(theconn.Constr());
       conn.Open();
         string sql="update pa_member set space_clicks=space_clicks+1 where username='"+UserName+"'";
         OleDbCommand comm=new OleDbCommand(sql,conn);
         comm.ExecuteNonQuery();
       conn.Close();
    }
   Response.End();
  }


private void Check_Post()
 {
    string PostUrl=Request.ServerVariables["HTTP_REFERER"];
    string LocalUrl=Request.ServerVariables["SERVER_NAME"];
    if(PostUrl!=null)
      {
         if(PostUrl.Replace("http://","").Split('/')[0].Split(':')[0]!=LocalUrl)
          {
            Response.Write("invalid_submit");
            Response.End();
          }
      }
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