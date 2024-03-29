﻿<% @ Page Language="C#" Inherits="PageAdmin.work_list"%>
<% @ Register TagPrefix="aspcn" TagName="uc_head" src="head.ascx" %>
<aspcn:uc_head runat="server"  Type="basic_worklist" /> 
<body topmargin=0 bottommargin=0 leftmargin=0  rightmargin=0>
<center>
<table  border=0 cellpadding=0 cellspacing=0 width=95% >
 <tr><td height=10></td></tr>
 <tr><td class=table_style1><b>工作流管理</b></td></tr>
 <tr><td height=10></td></tr>
</table>
<table border=0 cellpadding=10 cellspacing=0 width=95% >
 <tr>
<td valign=top align="left">

<form runat="server" >
<table border=0 cellpadding=5 cellspacing=0 width=100% align=center  class=table_style2>
<tr>
  <td valign=top>

<table border=0 cellpadding=0 cellspacing=2 width=95% align=center>
<tr>
    <td height=25><b>当前位置</b>：工作流管理</td>
 </tr>
</table>

    <table border=0 cellpadding=0 cellspacing=2 width=95% align=center>
      <tr>
        <td  colspan=2 height=25>
          <asp:DataList id="List" runat="server" border=0 RepeatLayout="Table" width=100% cellspacing=0 cellpadding=0 OnItemDataBound="Data_Bound" OnDeleteCommand="Data_Delete" >
             <HeaderTemplate>
                 <table border=0 cellpadding=0 cellspacing=1 width=100% class=tablestyle >
                <tr>
                  <td align=center width=20% class=white height=25px>工作流名称</td>
                  <td align=center width=45% class=white>说明</td>
                  <td align=center width=10% class=white>序号</td>
                  <td align=center width=25% class=white>操作</td>
                </tr>
              </table>
             </HeaderTemplate>            
             <ItemTemplate>
                <table border=0 cellpadding=0 cellspacing=0 width=100% class=tablestyle >
                <tr>
                  <td align=center width=20%  class=tdstyle><asp:TextBox id="Tb_name" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"name")%>' maxlength="50" size="20"/></td>
                  <td align=center width=45%  class=tdstyle><asp:TextBox id="Tb_description" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"description")%>' maxlength="50" size="50"/></td> 
                  <td align=center width=10%  class=tdstyle><asp:TextBox id="Tb_xuhao" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"xuhao")%>'  maxlength="2" size="3"/></td>
                  <td align=center width=25% class=tdstyle>
                   <asp:Label id="Lb_Id" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"id")%>' Visible="false" />
                   <a href="work_node.aspx?workid=<%#DataBinder.Eval(Container.DataItem,"id")%>&workname=<%#Server.UrlEncode(DataBinder.Eval(Container.DataItem,"name").ToString())%>">管理步骤</a>
                   <asp:LinkButton id="Delete" runat="server" Text="删除" CommandName="Delete" />
                  </td>
                </tr>
              </table>
             </ItemTemplate>
         </asp:DataList>
       </td>
    </tr>
   </table>
   <br><div align="center"><asp:Button Text="更新" Runat="server" Onclick="Data_Update" CssClass="button" /></div>
  </td>
  <tr>
 </table>
<br>
<br>
<table border=0 cellpadding=0 cellspacing=0 width=100% align=center class=table_style2>
<tr>
  <td valign=top>
    <table border=0 cellpadding=0 cellspacing=2 width=95% align=center>
    <tr><td height=25><b>增加工作流</b></td></tr>
      <tr>
        <td align="left">
名称：<asp:TextBox  id="Add_Name"  maxlength="50" size="15"  runat="server" />
描述：<asp:TextBox  id="Add_Description"  maxlength="50" size="50"  runat="server" />
序号：<asp:TextBox id="AddXuhao"  text="0" maxlength=5 size=2 runat="server" />
<asp:button  CssClass="button"  Text="增加" runat="server" OnClick="Data_Add" />
        </td>
    </tr>
   </table>
</td>
</tr>
</table>
<br>
<asp:Label id="LblErr" runat="server" ForeColor="#ff0000" />
</form>
</td>
</tr>
</table>
</center>
<script type="text/javascript">
function confirm_delete()
 {
   if(confirm('确定删除吗?'))
    {
      return true;
    }
   else
    {
      return false;
    }
 }
</script>
</body>
</html>  
