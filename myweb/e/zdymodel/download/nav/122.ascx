<% @ Control  language="c#" Inherits="PageAdmin.nav_zdymodel" %>
<% @ Import NameSpace="System.Data"%>
<% @ Import NameSpace="System.Data.OleDb"%>
<%if(Zdy_Tag==0){%><div id="nav_<%=Nav_Id%>" class="nav_box nav_box_<%=Query_Table%>" style="<%=Nav_box_style%>">
<%if(Nav_Header=="" && Title_Show=="1"){%>
<div class="nav_title" style="<%=Nav_titlebox_style%>"><span class="nav_sign" style="<%=Nav_title_style%>"><%=Nav_title%></span><span class="nav_more" style="<%=Nav_more_style%>"><%=More_Url%></span></div>
<%}else{Response.Write(Nav_Header);}%>
<div id="nav_content_<%=Nav_Id%>" class="nav_content" style="<%=Nav_content_style%>">
<%}%><%conn.Open();%><div class="download">
<ul>
<% 
DataTable dt;
DataRow dr;
dt=Get_Data();
for(int i=0;i<dt.Rows.Count;i++)
 {
dr=dt.Rows[i];
%>
<li><span class="title">
<a href="<%=Detail_Url(dr)%>" target="<%=Target%>" title="<%=Server.HtmlEncode(dr["title"].ToString())%>"><%=SubStr(dr["title"].ToString(),Title_Num,true)%></a></span>
<span class="date"><%=((DateTime)dr["thedate"]).ToString("M-d")%></span>
<span class="clear"></span>
</li>
<%
 }
%>
</ul>
</div>
<%conn.Close();%>
<%if(Zdy_Tag==0){%></div>
</div><%}%>