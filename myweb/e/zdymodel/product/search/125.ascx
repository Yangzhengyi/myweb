﻿<% @ Control language="c#" Inherits="PageAdmin.search_zdymodel"%>
<% @ Import NameSpace="System.Data"%>
<% @ Import NameSpace="System.Data.OleDb"%>
<asp:PlaceHolder id="P_Head" runat="server"><div class="lanmu_box" id="sublanmu_box">
<div class="current_location" id="current_location"><ul><li class="current_location_1"><%=Current_Location%> &gt; <%=Model_Name%></li><li class="current_location_2"><%=Model_Name%></li></ul></div>
<div class="sublanmu_box">
<div class="sublanmu_content"></asp:PlaceHolder>
<%conn.Open();%><script language="C#" Runat="server">
private string SqlFormat(string str)
   {
    if(str=="" || str==null)
     {
       return "";
      }
    str=str.Replace("_","[_]");
    str=str.Replace("%","[%]");
    str=str.Replace("'","''");
    str=str.Replace("\"","\"");
    if(str.Length>20)
    {
      str=str.Substring(0,20); //截取前20个字符
     }
    return Server.HtmlEncode(str);
   }
</script>

<script type="text/javascript">
function  c_keyword()
 {
  if($("title").value=="")
  {
    alert("请输入关键词！");
    $("title").focus();
    return false;
  }
 }
</script>
<form action="/e/search/" target="zdy_search" method="get" name="S_article">
产品搜索：<input type="text" size="15/" maxlength="50"  id="title" name="title" value="<%=Request.QueryString["title"]%>"/>  <input type="hidden" value="125" name="modelid" /><input type="hidden" value="1" name="siteid" /><input type="submit" value=" 搜索 " class="button" onclick="return c_keyword()" />
</form>

<ul class="product_pic">
<%
string kw=SqlFormat(Request.QueryString["title"]);//一定要SqlFormat格式化，否则容易被sql注入
Sql_Condition="and (title like '%"+kw+"%' or content like '%"+kw+"%')";//构造搜索条件
DataTable dt=Get_Data();
DataRow dr;
if(dt.Rows.Count>0)
{
%>
<li style="clear:both;float:none;height:30px;display:block;text-align:left;padding:0 0 0 0">查询到<%=RecordCount%>条产品记录。</li>
<%
for(int i=0;i<dt.Rows.Count;i++)
 {
dr=dt.Rows[i];
%>
<li style="width:150px;height:150px;">
<a href="<%=Detail_Url(dr)%>" target="_blank" ><img src="<%=dr["titlepic"]%>" border="0" style="width:150px;height:120px"></a>
<span class="title"><a href="<%=Detail_Url(dr)%>" target="_blank" title="<%=Server.HtmlEncode(dr["title"].ToString())%>"><%=SubStr(dr["title"].ToString(),50,true)%></a></span>
</li>
<%
 }
}
else
{
  Response.Write("无匹配的记录,请更换关键字重新搜索！");
 }
%>
</ul>

<%conn.Close();%>
<%if(PageCount>1)
{
string PageHtml="<div id=\"sublanmu_page\" class=\"sublanmu_page\">";
string[] PageSign=HttpContext.GetGlobalResourceObject("pageadmin","sublanmu_page").ToString().Split(',');
if(CurrentPage>1)
{
 PageHtml+="<a href=\""+GoPage(1)+"\">"+PageSign[0]+"</a>"; //首页
 PageHtml+=" <a href=\""+GoPage(CurrentPage-1)+"\">"+PageSign[1]+"</a>"; //上一页
}

 int p=8; //表示开始时显示的页码总数
 int M=4; //超过p页后左右两边显示页码数
 int LastPage=1;
 if(CurrentPage<p)
  {
    LastPage=p;
    if(LastPage>PageCount)
     {
       LastPage=PageCount;
     }
    for(int i=1;i<=LastPage;i++)
    {
     if(CurrentPage==i)
      {
        PageHtml+=" <span class=\"c\">"+i.ToString()+"</span>";
      }
    else
      {
       PageHtml+=" <a href=\""+GoPage(i)+"\">"+i.ToString()+"</a>";
      }
    }
  }
 else
  {
    //PageHtml+=" <a href=\""+GoPage(CurrentPage-1)+"\">1...</a>";
    LastPage=CurrentPage+M;
    if(LastPage>PageCount)
     {
       LastPage=PageCount;
     }
    for(int i=(CurrentPage-M);i<=LastPage;i++)
    {
     if(CurrentPage==i)
      {
        PageHtml+=" <span class=\"c\">"+i.ToString()+"</span>";
      }
    else
      {
       PageHtml+=" <a href=\""+GoPage(i)+"\">"+i.ToString()+"</a>";
      }
    }

  }

if(CurrentPage<PageCount)
{
  if(LastPage<PageCount)
   {
     PageHtml+=" <a href=\""+GoPage(LastPage+1)+"\">...</a>";
   }
  PageHtml+=" <a href=\""+GoPage(CurrentPage+1)+"\">"+PageSign[2]+"</a>";  //下一页
  PageHtml+=" <a href=\""+GoPage(PageCount)+"\">"+PageSign[3]+"</a>";     //尾页
}
PageHtml+=" <span>"+String.Format(HttpContext.GetGlobalResourceObject("pageadmin","sublanmu_page_info").ToString(),CurrentPage,PageCount,RecordCount)+"</span>"; //记录页次
PageHtml+="</div>";
Response.Write(PageHtml);
}%>
<asp:PlaceHolder id="P_Footer" runat="server"></div></div></div></asp:PlaceHolder>