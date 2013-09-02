<% @ Control language="c#" Inherits="PageAdmin.search_zdymodel"%>
<% @ Import NameSpace="System.Data"%>
<% @ Import NameSpace="System.Data.OleDb"%>
<asp:PlaceHolder id="P_Head" runat="server"><div class="lanmu_box" id="sublanmu_box">
<div class="current_location" id="current_location"><ul><li class="current_location_1"><%=Current_Location%> &gt; <%=Model_Name%></li><li class="current_location_2"><%=Model_Name%></li></ul></div>
<div class="sublanmu_box">
<div class="sublanmu_content"></asp:PlaceHolder>
<%conn.Open();%><ul class="article">
<% 
string Line;
DataTable dt=Get_Data();
DataRow dr;
if(dt.Rows.Count>0)
{
for(int i=0;i<dt.Rows.Count;i++)
 {
dr=dt.Rows[i];
if(((i+1)%5)==0)
 {
  Line="<li class='line'></line>";
 }
else
 {
  Line="";
 }
%>
<li class="search"><span class="title">
<a href="<%=Detail_Url(dr)%>" target="_blank" title="<%=Server.HtmlEncode(dr["title"].ToString())%>" style="<%=dr["pa_style"]%>"><%=SubStr(dr["title"].ToString(),100,true)%></a></span>
<span class="date"><%=((DateTime)dr["thedate"]).ToString("yyyy-MM-dd")%></span>
</li><%=Line%>
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