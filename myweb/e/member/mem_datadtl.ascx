﻿<% @ Control Language="c#" Inherits="PageAdmin.mem_datadtl"%>
<div class="current_location">
<ul>
<li class="current_location_1">当前位置：<a href="index.aspx?language=<%=Request.QueryString["s"]%>">会员中心</a> &gt; <%=TableName%><%=IsMultiSite=="0"?"":"("+SiteName+")"%></li>
<li class="current_location_2"><%=TableName%></li>
</ul>
</div>
<div class="sublanmu_box">
<div class="sublanmu_content">
<script src="/e/js/zdyform.js" type="text/javascript"></script>
<form name='<%=The_Table%>' method='post'  Enctype='multipart/form-data' target="<%=The_Table%>">
<iframe name="<%=The_Table%>" id="<%=The_Table%>" src="" frameborder=0 scroling=no height=1px width=1px marginwidth=0 marginheight=0 style="display:none"></iframe>
<table border=1 cellpadding=5 cellspacing=0 align=center class="member_table">
<%if(!string.IsNullOrEmpty(Sort_List)){%>
<tr>
<td align=right class="tdhead">所属类别<span style='color:#ff0000'>*</span></td>
<td>
<select name="s_sort" id="s_sort" onchange="c_sort(1,'<%=The_Table%>','<%=UserName%>')">
<option  value="0">---请选择所属类别---</option>
<%=Sort_List%>
</select><input type="hidden" name="sort" id="sort" value="<%=Sort_Id%>">
<script type="text/javascript">
var Sort_Type="onlyone";
Write_Select('<%=The_Table%>','<%=UserName%>');
</script>
</td>
</tr>
<%}%>
<asp:PlaceHolder id="P_Form" Runat="server"/>
</table>
<div align=center style="padding:10px 0 10px 0"> 
<input type='hidden' name="post" value="<%=PostType%>"> 
<input type='hidden' name="istop" value="<%=IsTop%>"> 
<input type='hidden' name="iscg" value="<%=IsCg%>">  
<input type='hidden' name="static_dir" value="<%=Static_Dir%>">  
<input type='hidden' name="static_file" value="<%=Static_File%>">  
<input type='hidden' name="workid" value="<%=Work_Id%>"> 
<input type='hidden' name="checked" value="<%=Checked%>">
<input type='hidden' name="zdy_title" value="<%=Zdy_Title%>">
<input type='hidden' name="zdy_keywords" value="<%=Zdy_Keywords%>">
<input type='hidden' name="zdy_description" value="<%=Zdy_Description%>">
<span style="display:<%=IsCg=="0"?"none":""%>"><input type='checkbox' value="1"  name="cg" <%=IsCg=="1"?"checked":""%>>保存为草稿&nbsp;</span>
<%if(Work_Id!="0" && Current_Work_Node=="0"){%>
<input type="checkbox" name="rechecked" value="1" checked>重新送审
<%}%>
<input type='button'  class='bt' value='提交' onclick="return Check_ZdyForm('<%=The_Table%>','<%=PostType%>')">&nbsp;
<input type='button' value='返回' class='bt' onclick="location.href='<%=Get_Url("mem_datalst",Request.QueryString["tid"])%>'"></td>
</div>
</form>
</div>
<script language="javascript">
var Current_Id="<%=Request.QueryString["id"]%>";
<%if(Sort_Id!="0"){%>
Load_Sort("<%=P_Sorts%>,<%=Sort_Id%>","<%=The_Table%>","<%=UserName%>");
<%}%>
</script>
</div>