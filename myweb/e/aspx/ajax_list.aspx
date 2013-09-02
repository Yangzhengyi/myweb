<% @ Page language="c#"%>
<% @ Import NameSpace="System.Data"%>
<% @ Import NameSpace="System.Data.OleDb"%>
<% @ Import NameSpace="PageAdmin"%>
<script language="c#" runat="server">
 int PageSize,Model_id,ShowNum,Page;
 string TheTable,ListSort,sql;
 protected void Page_Load(Object src,EventArgs e)
  {
    TheTable="";
    if(IsNum(Request.QueryString["modelid"]))
     {
       Model_id=int.Parse(Request.QueryString["modelid"]);
     }
    else
     {
      Model_id=0;
      Response.Write("alert('无效的ajax模型id')");
      Response.End();
     }
    if(IsNum(Request.QueryString["pagesize"]))
     {
       PageSize=int.Parse(Request.QueryString["pagesize"]);
     }
    if(IsNum(Request.QueryString["shownum"]))
     {
       ShowNum=int.Parse(Request.QueryString["shownum"]);
     }
   ListSort=Request.QueryString["listsort"];
   Conn Myconn=new Conn();
   string constr=Myconn.Constr();//获取连接字符串
   OleDbConnection conn=new OleDbConnection(constr);
   conn.Open();
   sql="select thetable from pa_model where thetype='ajax' and hasfile=1 and id="+Model_id;
   OleDbCommand comm=new OleDbCommand(sql,conn);
   OleDbDataReader dr=comm.ExecuteReader();
   if(dr.Read()) 
    {
      TheTable=dr["thetable"].ToString();
    }
   dr.Close();
   conn.Close();
   if(TheTable=="")
    {
      Response.Write("alert('modelid无效或者模型文件不存在!')");
      Response.End();
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
</script>
document.write('<div id="ajax_<%=Model_id%>" style="background-image:url(/e/images/public/loading.gif);background-repeat:no-repeat;background-position:center center">&nbsp;</div>');
var ajax_<%=Model_id%>=document.getElementById("ajax_<%=Model_id%>");
var ajax<%=Model_id%>_condition="";
function rajax_<%=Model_id%>(Page,condition) //读取ajax列表
 {
   if(condition!=null)
    {
     ajax<%=Model_id%>_condition=condition;
    }
   else
    {
     condition=ajax<%=Model_id%>_condition;
    }

  if(ajax_<%=Model_id%>!=null)
   {
     ajax_<%=Model_id%>.style.backgroundImage="url('/e/images/public/loading.gif')";
     var R=Math.random();
     var x=new PAAjax();
     x.setarg("post",true);
     x.send("/e/zdymodel/<%=TheTable%>/ajax/<%=Model_id%>.aspx","thetable=<%=TheTable%>&modelid=<%=Model_id%>&pagesize=<%=PageSize%>&shownum=<%=ShowNum%>&listsort="+encodeURI("<%=ListSort%>")+"&page="+Page+"&r="+R+"&condition="+encodeURI(condition),function(v){wajax_<%=Model_id%>(v)});
    //window.open("/e/zdymodel/<%=TheTable%>/ajax/<%=Model_id%>.aspx?thetable=<%=TheTable%>&modelid=<%=Model_id%>&pagesize=<%=PageSize%>&shownum=<%=ShowNum%>&listsort="+escape("<%=ListSort%>")+"&page="+Page+"&r="+R+"&condition="+UrlEncode(condition));
  }
}

function wajax_<%=Model_id%>(V) //写入ajax内容
 {
   ajax_<%=Model_id%>.style.backgroundImage="none";
   ajax_<%=Model_id%>.innerHTML=V;
 }