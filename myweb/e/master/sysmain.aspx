<% @ Page Language="C#" inherits="PageAdmin.sysmain"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>pageadmin网站管理系统</title>
<link rel="stylesheet" href="master.css" type="text/css">
<script src="master.js" type="text/javascript"></script>
<style>
td{color:#10334F}
.tx{font-weight:bold;color:#ff0000;font-size:13px}
</style>
</head>
<body topmargin=0 bottommargin=0 leftmargin=0  rightmargin=0>
<br>
<table width="95%" border="0" align="center" cellpadding="2" cellspacing="0"  class="tablestyle">
        <tr> 
          <td style="color:#ffffff"><b>业务信息<b></td>
        </tr>
      </table>
<table border=0 width="95%" cellpadding="2" cellspacing="0" align="center" class="tablestyle" style="margin-bottom:15px">
             <tr onclick="show_business()">
              <td width="25%" class="tdstyle">待处理订单：<a href="order_list.aspx?type=nopay"><%=Orders=="0"?"0":"<span class='tx'>"+Orders+"</span>"%></a></td>
              <td width="25%"  class="tdstyle">待处理兑换：<a href="exchange_list.aspx?type=nosend"><%=Exchanges=="0"?"0":"<span class='tx'>"+Exchanges+"</span>"%></a></td>
              <td width="25%"  class="tdstyle">待审会员：<a href="member_list.aspx?type=no_c_m"><%=Members=="0"?"0":"<span class='tx'>"+Members+"</span>"%></a></td>
              <td height="25px" width="25%" class="tdstyle">未读短信：<%=Msgs=="0"?"0":"<span class='tx'>"+Msgs+"</span>"%> [<a href="/e/member/index.aspx?s=<%=SiteId%>&from=master" target="_blank">进入会员中心</a>]</td>
             </tr>
</table>
<asp:Repeater id="P_table" runat="server">
 <ItemTemplate>
<table border=0 width="95%" cellpadding="2" cellspacing="0"  align="center" class="tablestyle" style="margin-bottom:15px">
        <tr> 
          <td colspan="4" style="color:#ffffff"><b><%#DataBinder.Eval(Container.DataItem,"table_name")%><b></td>
        </tr>
        <tr onclick="ShowItem(<%#i++%>)">
              <td height="25px" width="20%" class="tdstyle">待审信息：<a href="<%#DataBinder.Eval(Container.DataItem,"thetype").ToString()=="feedback"?"data_fbklist":"data_list"%>.aspx?table=<%#DataBinder.Eval(Container.DataItem,"thetable")%>&name=<%#Server.UrlEncode(DataBinder.Eval(Container.DataItem,"table_name").ToString())%>&type=unchecked"><%#Get_Data(DataBinder.Eval(Container.DataItem,"thetable").ToString(),DataBinder.Eval(Container.DataItem,"thetype").ToString(),"nochecked")%></a></td>
              <td height="25px" width="20%" class="tdstyle" style="display:<%#DataBinder.Eval(Container.DataItem,"thetype").ToString()=="feedback"?"":"none"%>">待复信息：<a href="data_fbklist.aspx?table=<%#DataBinder.Eval(Container.DataItem,"thetable")%>&name=<%#Server.UrlEncode(DataBinder.Eval(Container.DataItem,"table_name").ToString())%>&type=noreply"><%#Get_Data(DataBinder.Eval(Container.DataItem,"thetable").ToString(),DataBinder.Eval(Container.DataItem,"thetype").ToString(),"noreply")%></a></td>
              <td height="25px" width="20%" class="tdstyle" style="display:<%#DataBinder.Eval(Container.DataItem,"thetype").ToString()=="feedback"?"none":""%>">待复信息：0</td>
              <td width="20%" class="tdstyle">待审评论：<a href="comments_list.aspx?table=<%#DataBinder.Eval(Container.DataItem,"thetable")%>&name=<%#Server.UrlEncode(DataBinder.Eval(Container.DataItem,"table_name").ToString())%>&type=unchecked"><%#Get_Comments(DataBinder.Eval(Container.DataItem,"thetable").ToString(),0)%></a></td>
              <td width="20%" class="tdstyle">信息总数：<a href="<%#DataBinder.Eval(Container.DataItem,"thetype").ToString()=="feedback"?"data_fbklist":"data_list"%>.aspx?table=<%#DataBinder.Eval(Container.DataItem,"thetable")%>&name=<%#Server.UrlEncode(DataBinder.Eval(Container.DataItem,"table_name").ToString())%>"><%#Get_Data(DataBinder.Eval(Container.DataItem,"thetable").ToString(),DataBinder.Eval(Container.DataItem,"thetype").ToString(),"all")%></a></td>
              <td width="20%" class="tdstyle">评论总数：<a href="comments_list.aspx?table=<%#DataBinder.Eval(Container.DataItem,"thetable")%>&name=<%#Server.UrlEncode(DataBinder.Eval(Container.DataItem,"table_name").ToString())%>"><%#Get_Comments(DataBinder.Eval(Container.DataItem,"thetable").ToString(),1)%></a></td>
      </tr>
</table>
</ItemTemplate></asp:Repeater>
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" id="pa_notice" style="display:none;">
<tr><td><fieldset style="border:1px solid #4388A9;">
<legend> 官方公告 </legend>
<div id="notice"></div>
</fieldset><br></td>
</tr>
</table>
<table width="95%" border="0" align="center" cellpadding="2" cellspacing="1" class="tablestyle">
        <tr> 
          <td height="10px"  style="color:#ffffff"><b>服务器信息<b></td>
        </tr>
      </table>
<table border=0 width="95%" cellpadding="2" cellspacing="0"  align="center" class="tablestyle">
             <tr>
               <td height="25px" width="100px"  class="tdstyle">当前域名：</td><td width="200px" class="tdstyle">http://<%=Request.ServerVariables["SERVER_NAME"]%>:<%=Request.ServerVariables["SERVER_PORT"]%></td>
               <td height="25px" width="100px"  class="tdstyle">服务器目录：</td><td class="tdstyle"><%=Server.MapPath("/")%></td>
             </tr>

             <tr>
               <td height="25px" width="100px"  class="tdstyle">操作系统：</td><td class="tdstyle"><%=Request.ServerVariables["SERVER_SOFTWARE"]%></td>
               <td height="25px" width="100px"  class="tdstyle">.NET版本</td><td class="tdstyle"><%=Environment.Version%></td>
              </tr>

             <tr>
               <td height="25px" width="100px"  class="tdstyle">服务器IP：</td><td class="tdstyle"><%=Request.ServerVariables["LOCAL_ADDR"]%></td>
   
               <td height="25px" width="100px"  class="tdstyle">用户浏览器：</td><td class="tdstyle"><%=Request.Browser.Browser%><%=Request.Browser.Version%></td>
             </tr>
           </table>
<br>
<table width="95%" border="0" align="center" cellpadding="2" cellspacing="1" class="tablestyle">
        <tr> 
          <td height="10px"  style="color:#ffffff"><b>PageAdmin相关信息<b></td>
        </tr>
</table>
<table border=0 width="95%" cellpadding="2" cellspacing="0"  align="center" class="tablestyle">
             <tr>
               <td height="25px" width=100px class="tdstyle">版本信息：</td><td class="tdstyle">PageAdmin v3.0(最后更新时间：2012-10-8)</td>
             </tr>
             <tr>
               <td height="25px" class="tdstyle">官方网站：</td><td class="tdstyle"><a href=http://www.pageadmin.net target="pageadmin">http://www.pageadmin.net</a></td>
             </tr>
             <tr>
               <td height="25px" class="tdstyle">交流论坛：</td><td class="tdstyle"><a href=http://bbs.pageadmin.net target="pageadminbbs">http://bbs.pageadmin.net</a></td>
             </tr>
             <tr>
               <td height="25px" class="tdstyle">域名主机：</td><td class="tdstyle"><a href=http://www.18inter.com target="18inter">http://www.18inter.com</a></td>
             </tr>
             <tr>
               <td height="25px" class="tdstyle">制作单位：</td><td class="tdstyle">中山市南头镇华拓网络技术服务中心</td>
             </tr>
           <tr>
               <td height="25px" class="tdstyle">联系电话：</td><td class="tdstyle">0760-22517082  22517083  22517084 </td>
             </tr>
          <tr>
               <td height="25px" class="tdstyle">联系地址：</td><td class="tdstyle">广东省中山市南头镇金湾广场B座16号</td>
             </tr>
           </table>
<br>
</center>
<script type="text/javascript">
var Obj=parent.frames["left"].document.getElementsByName("left");
function show_business()
 {
   parent.frames["left"].hideall();
   Obj[2].style.display="";
 }
function ShowItem(num)
 {
   parent.frames["left"].hideall();
   parent.frames["left"].showitem(num,"");
 }
</script><!--pageadmin升级公告提示js-->
<script src="http://www.pageadmin.net/client/notice.js" type="text/javascript"></script>
</body>
</html>