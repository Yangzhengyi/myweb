<% @ Control  language="c#" Inherits="PageAdmin.nav_introduct" %>
<div id="nav_<%=Nav_Id%>" class="nav_box nav_box_introduct" style="<%=Nav_box_style%>">
<%if(Title_Show=="1"){%>
<div class="nav_title" style="<%=Nav_titlebox_style%>"><span class="nav_sign" style="<%=Nav_title_style%>"><%=Nav_title%></span><span class="nav_more" style="<%=Nav_more_style%>"><%=More_Url%></span></div>
<%}if(Nav_Header!=""){Response.Write(Nav_Header);}%>
<div id="nav_conent_<%=Nav_Id%>" class="nav_content" style="<%=Nav_content_style%>">
<%=Nav_Content%><asp:PlaceHolder id="P_Zdy" runat="server"/>
</div>
</div>