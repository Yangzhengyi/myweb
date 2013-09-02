<% @ Page Language="C#" Inherits="PageAdmin.get_form"%>
<% @ Register TagPrefix="aspcn" TagName="uc_fckeditor" src="/e/incs/fckeditor/fckeditor.ascx" %>
<% @ Register TagPrefix="aspcn" TagName="uc_head" src="head.ascx" %>
<aspcn:uc_head runat="server" Type="zdytable_list"/> 
<body topmargin=0 bottommargin=0 leftmargin=0  rightmargin=0>
<center>
<table  border=0 cellpadding=0 cellspacing=0 width=95% >
 <tr><td height=10></td></tr>
 <tr><td class=table_style1><b>获取表单</b></td></tr>
 <tr><td height=10></td></tr>
</table>
<table border=0 cellpadding=10 cellspacing=0 width=95% >
 <tr>
<td valign=top align="left">
<form runat="server" >
<table border=0 cellpadding=5 cellspacing=0 width=100% align=center  class=table_style2>
<tr>
  <td valign=top>
<table border=0 cellpadding=0 cellspacing=5 width=95% align=center>
<tr>
  <td  colspan=2 height=25 align="left"><b>表单名称</b>：<%=Request.QueryString["tablename"]%></td>
 </tr>
</table>
<table border=0 cellpadding=0 cellspacing=5 width=95% align=center>
<tr><td width="100px">投稿HTMl代码</td>
  <td><asp:TextBox id="Content" TextMode="MultiLine"  runat="server" />
      <aspcn:uc_fckeditor  Tb_Id="Content" Fck_Height="400" Fck_Style="Default" runat="server"/>
  </td>
   </tr>
  <tr><td colspan=2 height=10px></td></tr>

 <tr>
  <td>搜索HTML代码</td>
  <td><asp:TextBox id="Search" TextMode="MultiLine"  runat="server" />
      <aspcn:uc_fckeditor  Tb_Id="Search" Fck_Height="300" Fck_Style="Default" runat="server"/>
<br>搜索HTML代码用法：却换到源代码模式，找到name=modelid的value，改为对应的搜索模型ID。
  </td>
   </tr>
</table>
 <div align="center"><input type="button" class=button  value="返回"  onclick="location.href='table_list.aspx'"></div>
</td>
</tr>
</table>
<br>
注：却换到源代码模式可获取表单代码，在不修改表单项目基础上可自行完善。
<br>
</td>
</tr>
</table>
</form>
</center>
</body>
</html>  



