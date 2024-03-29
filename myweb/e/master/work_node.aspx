﻿<% @ Page Language="C#" Inherits="PageAdmin.work_node"%>
<% @ Register TagPrefix="aspcn" TagName="uc_head" src="head.ascx" %>
<aspcn:uc_head runat="server"  Type="basic_worklist" /> 
<body topmargin=0 bottommargin=0 leftmargin=0  rightmargin=0>
<center>
<table  border=0 cellpadding=0 cellspacing=0 width=95% >
 <tr><td height=10></td></tr>
 <tr><td class=table_style1><b>工作流步骤管理</b></td></tr>
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
    <td height=25><b>当前位置</b>：<%=Request.QueryString["workname"]%> &gt; 步骤管理</td>
    <td align=right>[<a href="javascript:Add_Node()">增加工作流步骤</a>]</td>
 </tr>
</table>

    <table border=0 cellpadding=0 cellspacing=2 width=95% align=center>
      <tr>
        <td  colspan=2 height=25>
          <asp:DataList id="List" runat="server" border=0 RepeatLayout="Table" width=100% cellspacing=0 cellpadding=0 OnItemDataBound="Data_Bound" OnDeleteCommand="Data_Delete" >
             <HeaderTemplate>
                 <table border=0 cellpadding=0 cellspacing=1 width=100% class=tablestyle >
                <tr>
                  <td align=center width=20% class=white height=25px>工作流步骤</td>
                  <td align=center width=15% class=white>步骤描述</td>
                  <td align=center width=15% class=white>处理中状态名</td>
                  <td align=center width=15% class=white>退回状态名</td>
                  <td align=center width=15% class=white>通过的状态名</td>
                  <td align=center width=20% class=white>操作</td>
                </tr>
              </table>
             </HeaderTemplate>            
             <ItemTemplate>
                <table border=0 cellpadding=0 cellspacing=0 width=100% class=tablestyle >
                <tr>
                  <td align=center width=20%  class=tdstyle><asp:Label id="Lb_Name" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"name")%>'/></td>
                  <td align=center width=15%  class=tdstyle><%#DataBinder.Eval(Container.DataItem,"description")%></td> 
                  <td align=center width=15%  class=tdstyle><%#DataBinder.Eval(Container.DataItem,"process_name")%></td> 
                  <td align=center width=15%  class=tdstyle><%#DataBinder.Eval(Container.DataItem,"rework_name")%></td> 
                  <td align=center width=15%  class=tdstyle><%#DataBinder.Eval(Container.DataItem,"pass_name")%></td> 
                  <td align=center width=20% class=tdstyle>
                   <asp:Label id="Lb_Id" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"id")%>' Visible="false" />
                   <a href='javascript:Edit_Node(<%#DataBinder.Eval(Container.DataItem,"id")%>,"<%#DataBinder.Eval(Container.DataItem,"name").ToString()%>",<%=Request.QueryString["workid"]%>,"<%=Request.QueryString["workname"]%>")'>修改</a>
                   <asp:LinkButton id="Delete" runat="server" Text="删除" CommandName="Delete" />
                  </td>
                </tr>
              </table>
             </ItemTemplate>
         </asp:DataList>
       </td>
    </tr>
   </table>
    <br>
    <div align="center"><input type="button" class="button" value="返回" onclick="location.href='work_list.aspx'"></div>
  </td>
  <tr>
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
function Add_Node()
 {
  var Width=680;
  var Height=360;
  ShowIframe("增加工作流步骤","work_node_add.aspx?workid=<%=Server.UrlEncode(Request.QueryString["workid"])%>&workname=<%=Server.UrlEncode(Request.QueryString["workname"])%>",Width,Height,'auto');
 }

function Edit_Node(nodeid,nodename,workid,workname)
 {
  var Width=680;
  var Height=360;
  ShowIframe("编辑流编辑步骤","work_node_add.aspx?nodeid="+nodeid+"&nodename="+encodeURI(nodename)+"&workid="+workid+"&workname="+encodeURI(workname),Width,Height,'auto');
 }
</script>
</body>
</html>  
