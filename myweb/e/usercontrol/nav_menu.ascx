<% @ Control  language="c#"  Inherits="PageAdmin.nav_menu" %>
<div id="nav_<%=Nav_Id%>" class="nav_box nav_box_sublanmu" style="<%=Nav_box_style%>">
<%if(Title_Show=="1"){%>
<div class="nav_title" style="<%=Nav_titlebox_style%>"><span class="nav_sign" style="<%=Nav_title_style%>"><%=Nav_title%></span><span class="nav_more"></span></div>
<%}if(Nav_Header!=""){Response.Write(Nav_Header);}%>
<div id="nav_menu_<%=Nav_Id%>" class="nav_menu" style="<%=Nav_content_style%>">
<ul id="rootul_<%=Nav_Id%>"><%=SubLanmu_List%></ul>
</div>
</div>
<script type="text/javascript">
shut_allsubnav("rootul_<%=Nav_Id%>");
expand_subnav("<%=Sublanmu_Id%>","<%=ParentSublanmu%>");
</script>