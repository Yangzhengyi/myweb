﻿<% @ Page Language="C#"  Inherits="PageAdmin.sign_list"%>
<% @ Register TagPrefix="aspcn" TagName="uc_head" src="head.ascx" %>
<aspcn:uc_head runat="server" Type="bs_sign"/> 
<body topmargin=0 bottommargin=0 leftmargin=0  rightmargin=0>
<center>
<table  border=0 cellpadding=0 cellspacing=0 width=95% >
 <tr><td height=10></td></tr>
 <tr><td class=table_style1><b>信息签收</b></td></tr>
 <tr><td height=10 ></td></tr>
</table>

<table border=0 cellpadding=10 cellspacing=0 width=95% >
<tr>
<td valign=top align="left">

<form runat="server">
<table border=0 cellpadding=5 cellspacing=0 width=100% align=center  class=table_style2>
<tr>
  <td valign=top align="left">
<table border=0 cellpadding=0 cellspacing=2 width=95% align=center>
<tr>
  <td height=25><b>信息签收</b></td>
</tr>
</table>
<table border=0 cellpadding=0 cellspacing=0 width=95%  style="table-layout:fixed;" align=center>
<tr>
<td align="left" width="150px">
每页<asp:TextBox id="Tb_pagesize" size="2" maxlength="10"  Runat="server"/>条&nbsp;
 </td>
<td align="right">
<select id="s_order" onchange="Go()">
<option value="thedate desc,id desc">按发布时间↓</option>
<option value="thedate asc,id asc">按发布时间↑</option>
</select>

按日期
<input name="StartDate" id="StartDate" Maxlength="10" size="8" value="<%=Start_Date_Text%>" ><a href="javascript:open_calendar('StartDate')"><img src=images/calendar_bnt.gif border=0 height=20 hspace=2 align=absbottom></a> 
到 
<input name="EndDate" id="EndDate" Maxlength="10" size="8" value="<%=End_Date_Text%>" ><a href="javascript:open_calendar('EndDate')"><img src=images/calendar_bnt.gif border=0 height=20 hspace=2 align=absbottom></a> 
关键字<input text="text" id="s_keyword" size="10">
<input type="button" value="确定" class="button" onclick="Go()">
 </td>
 </tr>
</table>

<table border=0 cellpadding=0 cellspacing=2 width=95% align=center>
      <tr>
        <td  align="left">
            <table border=0 cellpadding=0 cellspacing=0 width=100% class=tablestyle >
                <tr>
                  <td align=center width=40% class=white>标题</td>
                  <td align=center width=10% class=white>所属表</td>
                  <td align=center width=10% class=white height=20>发布人</td>
                  <td align=center width=15% class=white height=20>提交时间</td>
                  <td align=center width=10% class=white height=20>签收状态</td>
                  <td align=center width=7% class=white height=20>是否签收</td>
                  <td align=center width=8% class=white>操作</td>
                </tr>
          <asp:Repeater id="P1" runat="server" OnItemDataBound="Data_Bound">         
             <ItemTemplate>
                 <tr title="<%#Server.HtmlEncode(DataBinder.Eval(Container.DataItem,"title").ToString())%>">
                  <td align=left class="tdstyle"><%#GetSortName(DataBinder.Eval(Container.DataItem,"sort_id").ToString())%><a href='<%#DetailUrl(DataBinder.Eval(Container.DataItem,"site_id").ToString(),DataBinder.Eval(Container.DataItem,"lanmu_id").ToString(),DataBinder.Eval(Container.DataItem,"subLanmu_id").ToString(),DataBinder.Eval(Container.DataItem,"id").ToString())%>' target="dataview"><%#SubStr(DataBinder.Eval(Container.DataItem,"title").ToString(),50,true)%><a></td>
                  <td align=center class=tdstyle><%#DataBinder.Eval(Container.DataItem,"table_name")%></td>
                  <td align=center class=tdstyle><%#GetUserName(DataBinder.Eval(Container.DataItem,"username").ToString())%></td>
                  <td align=center class="tdstyle" title="<%#DataBinder.Eval(Container.DataItem,"thedate")%>"><%#DataBinder.Eval(Container.DataItem,"thedate","{0:yyyy-MM-dd HH:mm:ss}")%></td>
                  <td align=center class=tdstyle><%#GetState(DataBinder.Eval(Container.DataItem,"sign_enddate").ToString())%></td>
                  <td align=center class=tdstyle><img src="/e/images/public/<%#GetSignState(DataBinder.Eval(Container.DataItem,"thetable").ToString(),DataBinder.Eval(Container.DataItem,"id").ToString())%>.gif"></td>
                  <td align=center class="tdstyle"><a href=# onclick="Sign_Data('<%#DataBinder.Eval(Container.DataItem,"thetable")%>','<%#DataBinder.Eval(Container.DataItem,"id")%>')">签收</a></td>
                </tr>
             </ItemTemplate>
          </asp:Repeater>
</table>
</td></tr></table> 

<table border=0 cellpadding=0 cellspacing=2 width=95% align=center>
      <tr>
        <td  align="left">
共<asp:Label id="Lblrecordcount"  Text=0 runat="server" />条签收信息
&nbsp;当前页次: <asp:Label id="Lblcurrentpage"  runat="server" />/<asp:Label id="LblpageCount"  runat="server" />&nbsp;
<asp:Button  text="上一页"  id="LblPrev"  class=button runat="server"  CommandName="Prev"   OnCommand="Bt_Click" />&nbsp;
<asp:Button  text="下一页"  id="LblNext"  class=button runat="server"  CommandName="Next"   OnCommand="Bt_Click" />&nbsp;
转到:&nbsp;<asp:DropDownList id="DLpage" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Page_Changed"  /> 页&nbsp;
</td></tr></table>

       </td>
    </tr>
   </table>

  </td>
  <tr>
 </table>
</form>
</td>
</tr>
</table>
</center>
<script type="text/javascript">

 var obj_pagesize=document.getElementById("Tb_pagesize");
 var obj_order=document.getElementById("s_order");
 var obj_date1=document.getElementById("StartDate");
 var obj_date2=document.getElementById("EndDate");

 var obj_keyword=document.getElementById("s_keyword");

 var Order="<%=Request.QueryString["order"]%>";
 var StartDate="<%=Request.QueryString["startdate"]%>";
 var EndDate="<%=Request.QueryString["enddate"]%>";
 var Keyword="<%=Request.QueryString["keyword"]%>";

 if(obj_order!=null && Order!=""){obj_order.value=Order;}
 if(obj_date1!=null){obj_date1.value=StartDate;}
 if(obj_date2!=null){obj_date2.value=EndDate;}
 if(obj_keyword!=null){obj_keyword.value=Keyword;}

 function Go()
  { 
   location.href="?order="+obj_order.value+"&keyword="+escape(obj_keyword.value)+"&startdate="+escape(obj_date1.value)+"&enddate="+escape(obj_date2.value)+"&pagesize="+obj_pagesize.value;
  }
</script>
</body>
</html>  
