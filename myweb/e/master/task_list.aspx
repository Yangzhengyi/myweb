<% @ Page Language="C#" Inherits="PageAdmin.task_list"%>
<% @ Register TagPrefix="aspcn" TagName="uc_head" src="head.ascx" %>
<aspcn:uc_head runat="server"  Type="basic_task" /> 
<body topmargin=0 bottommargin=0 leftmargin=0  rightmargin=0>
<center>
<table  border=0 cellpadding=0 cellspacing=0 width=95% >
 <tr><td height=10></td></tr>
 <tr><td class=table_style1><b>计划任务管理</b></td></tr>
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
    <td height=25><b>当前位置</b>：计划任务管理</td>
    <td align="right">[<a href=task_add.aspx>增加新任务</a>] &nbsp; [<a href="javascript:view_log()">查看运行日志</a>]</td>
 </tr>
</table>
    <table border=0 cellpadding=0 cellspacing=2 width=96% align=center>
      <tr>
        <td  colspan=2 height=25>
                 <table border=0 cellpadding=0 cellspacing=1 width=100% class=tablestyle >
                <tr>
                  <td align=center width=30% class=white height=25px>任务名称</td>
                  <td align=center width=10% class=white>是否启用</td>
                  <td align=center width=30% class=white>运行周期</td>
                  <td align=center width=15% class=white>上次运行时间</td>
                  <td align=center width=15% class=white>操作</td>
                </tr>
              </table>

          <asp:DataList id="List" runat="server" border=0 RepeatLayout="Table" width=100% cellspacing=0 cellpadding=0 OnItemDataBound="Data_Bound" OnDeleteCommand="Data_Delete" >            
             <ItemTemplate>
                <table border=0 cellpadding=0 cellspacing=0 width=100% class=tablestyle >
                <tr>
                  <td width=30%  class=tdstyle>[<%#DataBinder.Eval(Container.DataItem,"isloop").ToString()=="1"?"循环任务":"一次性任务"%>]<asp:Label id="lb_name" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"name")%>' /><%#Get_State(DataBinder.Eval(Container.DataItem,"enddate").ToString())%></td>
                  <td align=center width=10%  class=tdstyle><%#DataBinder.Eval(Container.DataItem,"isopen").ToString()=="1"?"启用中":"关闭"%></td> 
                  <td align=center width=30%  class=tdstyle><%#Get_Cycle(DataBinder.Eval(Container.DataItem,"do_cycle").ToString(),DataBinder.Eval(Container.DataItem,"do_day").ToString(),DataBinder.Eval(Container.DataItem,"do_week").ToString(),DataBinder.Eval(Container.DataItem,"do_hour").ToString())%></td>
                  <td align=center width=15%  class=tdstyle><%#Get_DoDate(DataBinder.Eval(Container.DataItem,"prevdate").ToString(),DataBinder.Eval(Container.DataItem,"thedate").ToString())%></td>
                  <td align=center width=15% class=tdstyle>
                   <asp:Label id="lb_id" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"id")%>' visible="false"/>
                   <a href="/e/task/<%#DataBinder.Eval(Container.DataItem,"fileurl")%>?<%#DataBinder.Eval(Container.DataItem,"parameter")%>" target="dotask">运行文件</a>
                   <a href="task_add.aspx?id=<%#DataBinder.Eval(Container.DataItem,"id")%>&name=<%#Server.UrlEncode(DataBinder.Eval(Container.DataItem,"name").ToString())%>">修改</a>
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
<span style="display:block;padding-top:3px;"><font color=red>提醒：</font>调试运行文件前请备份好数据，避免误操作导致数据丢失。</span>
</form>
</td>
</tr>
</table>
</center>
<script type="text/javascript">

function view_log(Table,Id)
  {
   var Width=800;
   var Height=600;
   var Top=(window.screen.availHeight-30-Width)/2;
   var Left=(window.screen.availWidth-10-Height)/2
   var Val=window.open("task_log.aspx?istask=1","log","width="+Width+",height="+Height+",top="+Top+",left="+Left+",toolbar=no,menubar=no,scrollbars=yes,resizable=yes,location=no,status=no");
 } 
</script>
</body>
</html>  
