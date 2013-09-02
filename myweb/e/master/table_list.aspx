<% @ Page Language="C#" Inherits="PageAdmin.table_list"%>
<% @ Register TagPrefix="aspcn" TagName="uc_head" src="head.ascx" %>
<aspcn:uc_head runat="server"  Type="zdytable_list" /> 
<body topmargin=0 bottommargin=0 leftmargin=0  rightmargin=0>
<center>
<table  border=0 cellpadding=0 cellspacing=0 width=95% >
 <tr><td height=10></td></tr>
 <tr><td class=table_style1><b>数据表管理</b></td></tr>
 <tr><td height=10></td></tr>
</table>
<table border=0 cellpadding=10 cellspacing=0 width=95% >
 <tr>
<td valign=top align="left">

<form runat="server" >
<div id="tabdiv">
<ul>
<li id="tab" name="tab" style="font-weight:bold">数据表管理</li>
<li id="tab" name="tab" onclick="location.href='table_add.aspx?xuhao=<%=ListCounts+1%>'">增加新表</li>
</ul>
</div>
<table border=0 cellpadding=5 cellspacing=0 width=100% align=center  class=table_style2>
<tr>
  <td valign=top>

<table border=0 cellpadding=0 cellspacing=2 width=95% align=center>
<tr>
    <td height=25><b>当前位置</b>：表明细</td>
 </tr>
</table>

    <table border=0 cellpadding=0 cellspacing=2 width=95% align=center>
      <tr>
        <td  colspan=2 height=25>
          <asp:DataList id="DL_1" runat="server" border=0 RepeatLayout="Table" width=100% cellspacing=0 cellpadding=0
          OnItemDataBound="Data_Bound"  OnDeleteCommand="Data_Delete" >
             <HeaderTemplate>
                 <table border=0 cellpadding=0 cellspacing=1 width=100% class=tablestyle >
                <tr>
                  <td align=center width=5% class=white height=25px>序号</td>
                  <td align=center width=20% class=white height=25px>表标识</td>
                  <td align=center width=15% class=white height=25px>表名</td>
                  <td align=center width=15% class=white height=25px>表用途</td>
                  <td align=center width=30% class=white>管理</td>
                  <td align=center width=15% class=white>操作</td>
                </tr>
              </table>
             </HeaderTemplate>            
             <ItemTemplate>
                <table border=0 cellpadding=0 cellspacing=0 width=100% class=tablestyle >
                <tr>
                  <td align=center width=5%  class=tdstyle><%#DataBinder.Eval(Container.DataItem,"xuhao")%></td>
                  <td align=center width=20%  class=tdstyle><%#DataBinder.Eval(Container.DataItem,"table_name")%></td>
                  
                  <td align=center width=15%  class=tdstyle><asp:Label id="Lb_Table" Text='<%#DataBinder.Eval(Container.DataItem,"thetable")%>' runat="server"/></td>
                  <td align=center width=15%  class=tdstyle><%#GetType(DataBinder.Eval(Container.DataItem,"thetype").ToString())%></td>

                  <td align=center width=30%  class=tdstyle>
                    <a href="model_list.aspx?type=sublanmu&table=<%#DataBinder.Eval(Container.DataItem,"thetable")%>&tablename=<%#Server.UrlEncode(DataBinder.Eval(Container.DataItem,"table_name").ToString())%>">功能模型</a>
                    <a href="field_list.aspx?table=<%#DataBinder.Eval(Container.DataItem,"thetable")%>&tablename=<%#Server.UrlEncode(DataBinder.Eval(Container.DataItem,"table_name").ToString())%>">管理字段</a>
                    <a href="get_form.aspx?table=<%#DataBinder.Eval(Container.DataItem,"thetable")%>&tablename=<%#Server.UrlEncode(DataBinder.Eval(Container.DataItem,"table_name").ToString())%>">获取表单</a>
                    <asp:Button id="Update" runat="server" Text="更新文件"  cssclass="bt" CommandName='<%#DataBinder.Eval(Container.DataItem,"thetable")%>' oncommand="Update_File"/>
                   </td>
                  <td align=center width=15% class=tdstyle>
                   <a href="table_add.aspx?act=copy&id=<%#DataBinder.Eval(Container.DataItem,"id")%>&xuhao=<%=ListCounts+1%>">复制</a>
                   <a href="table_add.aspx?act=edit&id=<%#DataBinder.Eval(Container.DataItem,"id")%>">修改</a>
                   <asp:LinkButton id="Delete" runat="server" Text="删除" CommandName="Delete" />
                  </td>
                </tr>
              </table>
             </ItemTemplate>
         </asp:DataList>
       </td>
    </tr>
   </table>
  </td>
  <tr>
 </table>
<br>
说明：点“更新文件”按钮将批量生成所有模型文件和表单文件。
<asp:Label id="LblErr" runat="server" />
</form>
</td>
</tr>
</table>
</center>
</body>
</html>  







