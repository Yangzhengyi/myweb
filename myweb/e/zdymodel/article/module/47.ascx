﻿<% @ Control language="c#" Inherits="PageAdmin.module_zdymodel"%>
<% @ Import NameSpace="System.Data"%>
<% @ Import NameSpace="System.Data.OleDb"%>
<%if(Zdy_Tag==0){%><%=Module_StartHtml%>
<div id="module_<%=Module_Id%>" class="module_box<%=Layout%> module_box_<%=Query_Table%>" style="width:<%=Module_Width%>;<%=Module_box_style%>">
<div class="module_box_1<%=Layout%>" style="<%=Module_box_1_style%>">
<%if(Title_Show=="1"){%>
<div class="module_title" style="<%=Module_titlebox_style%>"><span class="module_sign" style="<%=Module_title_style%>"><%=Module_Title%></span><span class="module_more" style="<%=Module_more_style%>"><%=More_Url%></span></div>
<%}if(Module_Header!=""){%><%=Module_Header%><%}%>
<div id="module_content_<%=Module_Id%>" class="module_content" style="<%=Module_content_style%>">
<%}%><%conn.Open();%><ul class="tw_article">
<% 
DataTable dt=Get_Data();
DataRow dr;
for(int i=0;i<dt.Rows.Count;i++)
 {
dr=dt.Rows[i];
%>
<li>
<span class="pic"><a href="<%=Detail_Url(dr)%>" target="<%=Target%>"><img src="<%=dr["titlepic"]%>" border="0" style="<%=TitlePic_Size%>"></a></span>
<span class="title"><a href="<%=Detail_Url(dr)%>" target="<%=Target%>" title="<%=Server.HtmlEncode(dr["title"].ToString())%>" style="<%=dr["pa_style"]%>"><%=SubStr(dr["title"].ToString(),Title_Num,true)%></a></span>
<p class="introduct"><%=SubStr(dr["pa_introduct"].ToString(),30,true)%></p>
</li>
<%
 }
%>
</ul>
<%conn.Close();%>
<%if(Zdy_Tag==0){%></div><div class="module_footer"><span class="l"></span><span class="r"></span></div>
</div>
</div><%=Module_EndHtml%><%}%>