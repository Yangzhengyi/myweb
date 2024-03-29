﻿<% @  Control Language="c#" Inherits="PageAdmin.mem_fbklst"%>
<div class="current_location">
<ul>
<li class="current_location_1">当前位置：<a href="index.aspx?s=<%=Request.QueryString["s"]%>">会员中心</a> &gt; 我的留言</li>
<li class="current_location_2">我的留言</li>
</ul>
</div>
<div class="sublanmu_box">
<div class="sublanmu_content">
<div class="tabdiv"><ul>
 <li class="c"><a href='<%=Get_Url("mem_fbklst")%>'>我的留言</a></li>
 <li><a href='<%=Get_Url("mem_fbk")%>'>发布留言</a></li>
</ul></div>
<form runat="server"> 
 <table border="0" cellspacing="0" cellpadding="0" align="center" class="member_table">
    <tbody>
    <tr>
      <td align=center  class="memlist_header_item" width="55%">留言主题</td> 
      <td align=center  class="memlist_header_item" width="20%">发布日期</td> 
      <td align=center  class="memlist_header_item" width="10%">状态</td>
      <td align=center  class="memlist_header_item_last" width="15%">操作</td>
    </tr>
<asp:Repeater id="P1" runat="server" OnItemDataBound="P1_Bound">      
 <ItemTemplate>
       <tr>
      <td   class="memlist_item">[<%#DataBinder.Eval(Container.DataItem,"type")%>]<a href="<%#Get_Url("mem_fbkdtl",DataBinder.Eval(Container.DataItem,"id").ToString())%>"><%#DataBinder.Eval(Container.DataItem,"title")%></a></td> 
      <td align=center  class="memlist_item"><%#DataBinder.Eval(Container.DataItem,"thedate","{0:yyyy-MM-dd}")%></td> 
      <td align=center  class="memlist_item"><%#Get_State(DataBinder.Eval(Container.DataItem,"reply_state").ToString())%></td>
      <td align=center  class="memlist_item_last">
       <a href="<%#Get_Url("mem_fbkdtl",DataBinder.Eval(Container.DataItem,"id").ToString())%>">详细</a></a>
       <asp:LinkButton Text="删除" id="Delete" runat="server" CommandName='<%#DataBinder.Eval(Container.DataItem,"id")%>' OnCommand="Data_Delete" />
      </td>
    </tr>
 </ItemTemplate>
</asp:Repeater>
   </tbody>
   </table> 
<br>
<div class="sublanmu_page">
<span>共<asp:Literal id="Lblrecordcount"  Text=0 runat="server" />条记录</span>
<span>页次: <asp:Literal id="Lblcurrentpage"  runat="server" />/<asp:Literal id="LblpageCount"  runat="server" /></span>
         <asp:LinkButton id="First" CssClass="link" CommandName="First"  OnCommand="Page_change"  runat="server" Text="首页"/>
         <asp:LinkButton id="Prev"  CssClass="link"  CommandName="Prev"  OnCommand="Page_change"  runat="server" Text="上一页"/>
         <asp:LinkButton id="Next"  CssClass="link"  CommandName="Next"  OnCommand="Page_change"  runat="server" Text="下一页"/>
         <asp:LinkButton id="Last"  CssClass="link"  CommandName="Last"  OnCommand="Page_change"  runat="server" Text="尾页"/>
转到：<asp:DropDownList id="Dp_page" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Page_select">
          </asp:DropDownList>页
</div>
</form>
</div>
</div>