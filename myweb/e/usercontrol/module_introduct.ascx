﻿<% @ Control language="c#" Inherits="PageAdmin.module_introduct" %>
<%=Module_StartHtml%>
<div id="module_<%=Module_Id%>" class="module_box<%=Layout%> module_box_introduct" style="width:<%=Module_Width%>;<%=Module_box_style%>">
<div class="module_box_1<%=Layout%>" style="<%=Module_box_1_style%>">
<%if(Title_Show=="1"){%>
<div class="module_title" style="<%=Module_titlebox_style%>"><span class="module_sign" style="<%=Module_title_style%>"><%=Module_Title%></span><span class="module_more" style="<%=Module_more_style%>"><%=More_Url%></span></div>
<%}if(Module_Header!=""){%><%=Module_Header%><%}%>
<div id="module_content_<%=Module_Id%>" class="module_content" style="<%=Module_content_style%>">
<%=Module_Content%><asp:PlaceHolder id="P_Zdy" runat="server"/>
</div><div class="module_footer"><span class="l"></span><span class="r"></span></div>
</div>
</div><%=Module_EndHtml%>

