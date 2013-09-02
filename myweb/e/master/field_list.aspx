﻿<% @ Page Language="C#" Inherits="PageAdmin.field_list"%>
<% @ Register TagPrefix="aspcn" TagName="uc_head" src="head.ascx" %>
<aspcn:uc_head runat="server" Type="field_list" /> 
<body topmargin=0 bottommargin=0 leftmargin=0  rightmargin=0>
<center>
<table  border=0 cellpadding=0 cellspacing=0 width=95% >
 <tr><td height=10></td></tr>
 <tr><td class=table_style1><b>字段管理</b></td></tr>
 <tr><td height=10></td></tr>
</table>
<table border=0 cellpadding=10 cellspacing=0 width=95% >
 <tr>
<td valign=top align="left">

<form runat="server" >
<div id="tabdiv">
<ul>
<li id="tab" name="tab" style="font-weight:bold">字段管理</li>
<li id="tab" name="tab" onclick="location.href='field_add.aspx?&table=<%=Request.QueryString["table"]%>&tablename=<%=Server.UrlEncode(Request.QueryString["tablename"])%>&act=add'">增加字段</li>
</ul>
</div>

<table border=0 cellpadding=5 cellspacing=0 width=100% align=center  class=table_style2>
<tr>
  <td valign=top>

<table border=0 cellpadding=0 cellspacing=2 width=95% align=center>
<tr>
  <td height=25><b>当前表</b>：<%=Request.QueryString["tablename"]%></td>
 </tr>
</table>

    <table border=0 cellpadding=0 cellspacing=2 width=95% align=center>
      <tr>
        <td  colspan=2 height=25>
          <asp:DataList id="DL_1" runat="server" border=0 RepeatLayout="Table" width=100% cellspacing=0 cellpadding=0
          OnItemDataBound="PageAdmin_Data_Bound"    OnDeleteCommand="PageAdmin_Data_Delete" >
             <HeaderTemplate>
                 <table border=0 cellpadding=0 cellspacing=1 width=100% class=tablestyle >
                <tr>
                  <td align=center width=15% class=white height=25px>字段名</td>
                  <td align=center width=10% class=white height=25px>字段</td>
                  <td align=center width=15% class=white height=25px>字段类型</td>
                  <td align=center width=5% class=white height=25px>必填项</td>
                  <td align=center width=5% class=white height=25px>后台项</td>
                  <td align=center width=5% class=white height=25px>会员项</td>
                  <td align=center width=5% class=white height=25px>可增加</td>
                  <td align=center width=5% class=white height=25px>可修改</td>
                  <%if(TheTable!="pa_member")
                   {
                  %>
                  <td align=center width=5% class=white height=25px>投稿项</td>
                  <td align=center width=5% class=white height=25px>采集项</td>
                  <td align=center width=5% class=white height=25px>排序项</td>
                  <td align=center width=5% class=white height=25px>搜索</td>
                  <%}%>
                  <td align=center width=5% class=white height=25px>序号</td>
                  <td align=center class=white>管理</td>
                </tr>
              </table>
             </HeaderTemplate>            
             <ItemTemplate>
                <table border=0 cellpadding=0 cellspacing=0 width=100% class=tablestyle >
                <tr>
                  <td align=center width=15%  class=tdstyle><asp:TextBox id="Tb_Title" Text='<%#DataBinder.Eval(Container.DataItem,"field_name")%>' runat="server" size=15 maxlength=20/></td>
                  
                  <td align=center width=10%  class=tdstyle><asp:Label id="Lb_Field" Text='<%#DataBinder.Eval(Container.DataItem,"field")%>' runat="server"/></td>
                  <td align=center width=15%  class=tdstyle><%#Get_Field_type(DataBinder.Eval(Container.DataItem,"field_type").ToString())%>(<%#DataBinder.Eval(Container.DataItem,"value_type")%>)</td>
                  
                  <td align=center width=5%  class=tdstyle><asp:CheckBox id="Dl_mustitem" runat="server"/></td>
                  <td align=center width=5%  class=tdstyle><asp:CheckBox id="Dl_masteritem" runat="server"/></td>
                  <td align=center width=5%  class=tdstyle><asp:CheckBox id="Dl_memberitem" runat="server"/></td>
                  <td align=center width=5%  class=tdstyle title="只对会员有效"><asp:CheckBox id="Dl_additem" runat="server"/></td>   
                  <td align=center width=5%  class=tdstyle title="只对会员有效"><asp:CheckBox id="Dl_edititem" runat="server"/></td>  
                  <%if(TheTable!="pa_member")
                   {
                  %>
                  <td align=center width=5%  class=tdstyle><asp:CheckBox id="Dl_tgitem" runat="server" /></td>     
                  <td align=center width=5%  class=tdstyle><asp:CheckBox id="Dl_collectionitem" runat="server" /></td> 
                  <td align=center width=5%  class=tdstyle><asp:CheckBox id="Dl_sortitem" runat="server"/></td>
                  <td align=center width=5%  class=tdstyle><%#Get_SearchType(DataBinder.Eval(Container.DataItem,"searchitem").ToString())%></td> 
                 <%}%>

                  <td align=center width=5% class=tdstyle><asp:TextBox id="Tb_Xuaho" Text='<%#DataBinder.Eval(Container.DataItem,"xuhao")%>' runat="server" size=1 maxlength=3 /></td>
                  <td align=center class=tdstyle>

                   <asp:Label id="Lb_mustitem" Text='<%#DataBinder.Eval(Container.DataItem,"mustitem")%>' runat="server" visible="false"/>
                   <asp:Label id="Lb_tgitem" Text='<%#DataBinder.Eval(Container.DataItem,"tgitem")%>' runat="server" visible="false"/>
                   <asp:Label id="Lb_memberitem" Text='<%#DataBinder.Eval(Container.DataItem,"memberitem")%>' runat="server" visible="false"/>
                   <asp:Label id="Lb_masteritem" Text='<%#DataBinder.Eval(Container.DataItem,"masteritem")%>' runat="server" visible="false"/>

                   <asp:Label id="Lb_additem" Text='<%#DataBinder.Eval(Container.DataItem,"additem")%>' runat="server" visible="false"/>
                   <asp:Label id="Lb_edititem" Text='<%#DataBinder.Eval(Container.DataItem,"edititem")%>' runat="server" visible="false"/>

                   <asp:Label id="Lb_collectionitem" Text='<%#DataBinder.Eval(Container.DataItem,"collectionitem")%>' runat="server" visible="false"/>
                   <asp:Label id="Lb_sortitem" Text='<%#DataBinder.Eval(Container.DataItem,"sortitem")%>' runat="server" visible="false"/>
                   <asp:Label id="Lb_type" Text='<%#DataBinder.Eval(Container.DataItem,"field_type")%>' runat="server" visible="false"/>
                   <asp:Label id="Lb_sysfield" Text='<%#DataBinder.Eval(Container.DataItem,"sys_field")%>' runat="server" visible="false"/>
                   <asp:Label id="Lb_id" Text='<%#DataBinder.Eval(Container.DataItem,"id")%>' runat="server" visible="false"/>
                   <a href="field_add.aspx?id=<%#DataBinder.Eval(Container.DataItem,"id")%>&table=<%=Request.QueryString["table"]%>&tablename=<%=Server.UrlEncode(Request.QueryString["tablename"])%>&act=edit">编辑</a>
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
  <div align="center">
<asp:Button Text="更新" onclick="Data_Update" runat="server" cssclass=button/>
                  <%if(TheTable!="pa_member")
                   {
                  %>
<input type="button" class=button  value="返回"  onclick="location.href='table_list.aspx'">
                  <%}%>
</div>
  </td>
  <tr>
 </table>
</form>
<br>
注：修改或增加字段必须点"更新"才能更新表单文件。
</td>
</tr>
</table>

</center>
</body>
</html>  



