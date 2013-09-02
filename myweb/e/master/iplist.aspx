<% @ Page Language="C#" Inherits="PageAdmin.iplist"%>
<% @ Register TagPrefix="aspcn" TagName="uc_head" src="head.ascx" %>
<aspcn:uc_head runat="server" />
<style Type="text/css">
.button1{
	height:23px;
	width:120px;
        font-weight:normal;
        color:#222222;
        background-color:white;
        border-top: 0 outset #333333;
	border-right: 0 outset #333333;
	border-bottom:0 outset #333333;
	border-left: 0 outset #333333;
        cursor:hand;
       }
</style>
<body topmargin=0 bottommargin=0 leftmargin=0  rightmargin=0>
<center>
<table  border=0 cellpadding=0 cellspacing=0 width=95% >
 <tr><td height=10></td></tr>
 <tr><td class=table_style1 align="left"><b>流量明细</b></td></tr>
 <tr><td height=10></td></tr>
</table>
<table border=0 cellpadding=10 cellspacing=0 width=95% >
 <tr>
<td valign=top>
<form runat="server" id="form1">
<div id="tabdiv">
<ul>
<li id="tab" name="tab" onclick="Go_Tab('')">所有来路</li>
<li id="tab" name="tab" onclick="Go_Tab('baidu.com')">百度</li>
<li id="tab" name="tab" onclick="Go_Tab('google.com')">google</li>
<li id="tab" name="tab" onclick="Go_Tab('soso.com')">搜搜</li>
<li id="tab" name="tab" onclick="Go_Tab('sogou.com')">搜狗</li>
</ul>
</div>
<table border=0 cellpadding=5 cellspacing=0 width=100% align=center  class=table_style2>
<tr>
  <td valign=top>

<table border=0 cellpadding=0 cellspacing=0 width=95% align=center>
<tr>
  <td  colspan=2 height=25 align="left"><b><asp:Label id="TheDate" runat="server"/></b></td>
 </tr>
</table>

 <table border=0 cellpadding=0 cellspacing=1 width=95% align=center class="tablestyle" >
 <tr>
  <td width=12% class="white" height=25 align=center>IP</td>
  <td width=55% class="white" align=center>访问来路</td>
  <td width=8% class="white" align=center>时间</td>
  <td width=7% class="white" align=center>浏览器</td>
  <td width=8% class="white" align=center>系统</td>
  <td width=10% class="white" align=center>操作</td>
 </tr>
 </table>
<asp:DataList id="Dlist1" width="100%" runat="server" RepeatLayout="Table" RepeatColumns="1" Cellspacing=0 Cellpadding="0"   
RepeatDirection="Horizontal" OnItemDataBound="Del_Bind">
<ItemTemplate>
 <table border=0 cellpadding=0 cellspacing=0 width=95% align=center class="tablestyle" style="table-layout:fixed;">
 <tr>
  <td  class="tdstyle" width=12% height=25><input type="button" class="button1"  value='<%#DataBinder.Eval(Container.DataItem,"ip")%>'   onclick="GetIPAdd(this.value)"></td>
  <td  class="tdstyle" width=55% align="left"><span onclick="GO_Url('<%#DataBinder.Eval(Container.DataItem,"urlfrom")%>')" style="cursor:pointer"><%#DataBinder.Eval(Container.DataItem,"urlfrom")%></a></td>
  <td   class="tdstyle" width=8%><%#DataBinder.Eval(Container.DataItem,"thedate","{0:HH:mm}")%></td>
  <td   class="tdstyle" width=7%><%#DataBinder.Eval(Container.DataItem,"browser")%></td>
  <td   class="tdstyle" width=8%><%#DataBinder.Eval(Container.DataItem,"platform")%></td>
  <td   class="tdstyle" width=10% align=center><asp:Button id="Delete" Text="删除" CommandName='<%#DataBinder.Eval(Container.DataItem,"id")%>' onCommand="Data_Delete" Cssclass="button" runat="server"/></td>
 </tr>
 </table>
</ItemTemplate>
</asp:DataList>
<br>
</td>
 </tr>
</table>
<br>
<table border=0 cellpadding=0 cellspacing=1 width=100% align=center>
 <tr>
  <td width=30%  height=25 align=left><input type="text" size="15" id="kw_from" value="<%=Request.QueryString["from"]%>">
<input type="button" value="搜索" class="button" onclick="Go_Tab(document.getElementById('kw_from').value)">
 </td>
  <td width=80%  height=25 align=right>
共<asp:Label id="Lblrecordcount"  Text=0 runat="server" />条记录 
&nbsp;当前页次: <asp:Label id="Lblcurrentpage"  runat="server" />/<asp:Label id="LblpageCount"  runat="server" />&nbsp;
<asp:Button  text="上一页"  id="Prev"  class=button runat="server"  CommandName="Prev"   OnCommand="Bt_Click" />&nbsp;
<asp:Button  text="下一页"  id="Next"  class=button runat="server"  CommandName="Next"   OnCommand="Bt_Click" />&nbsp;
转到:&nbsp;<asp:DropDownList id="DLpage" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Page_Changed"  /> 页&nbsp;
 <input type="button" value="返回" class="button" onclick="location.href='tongji.aspx?year=<%=Request.QueryString["year"]%>&month=<%=Request.QueryString["month"]%>'">
 </td>

 </tr>
 </table>
</form>
</td>
</tr>
</table>

<script language="javascript">

function GO_Url(TheValue)
 {
    if(TheValue.indexOf("http://")==0)
     {
     window.open(TheValue,"urlfrom");
    }
 }

function Go_Tab(kw)
 {
  var Url="iplist.aspx?year=<%=Request.QueryString["year"]%>&month=<%=Request.QueryString["month"]%>&day=<%=Request.QueryString["day"]%>&from="+encodeURI(kw);
  location.href=Url;
 }

var C_Tab="<%=Request.QueryString["from"]%>";
var obj=document.getElementsByName("tab");
switch(C_Tab)
 {
   case "baidu.com":
    obj[1].style.fontWeight="bold";
   break;

   case "google.com":
    obj[2].style.fontWeight="bold";
   break;

   case "sogou.com":
    obj[4].style.fontWeight="bold";
   break;

   case "soso.com":
    obj[3].style.fontWeight="bold";
   break;

  default:
    obj[0].style.fontWeight="bold";
   break;
 }

</script>
</center>
</body>
</html>  



