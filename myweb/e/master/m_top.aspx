﻿<% @ Page Language="C#" Inherits="PageAdmin.m_top"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>pageadmin网站管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="Author"  content="PageAdmin CMS" />
<link rel="stylesheet" href="master.css" type="text/css">
<script src="master.js" type="text/javascript"></script>
</head>
<body  topmargin=0>
<form runat="server">
<table width="100%" cellpadding=0 cellspacing=0 border="0" align=center   bgcolor="#0099CC">
  <tbody>
  <tr>
  <td align=left  class=white height="20px" class=white>
  &nbsp;&nbsp;当前站点：<asp:DropDownList id="Dp_Sites"  DataTextField="sitename"  DataValueField="id" runat="server"  AutoPostBack="True" OnSelectedIndexChanged="Change_Site"/>
&nbsp;<a href="javascript:site_set()" class="href1" style="display:<%=TheMaster=="admin"?"":"none"%>">站点管理</a>&nbsp;<a href="#" target="myweb" class="href1" id="viewhref" onmouseover="view()">前台预览</a>
    </td>
  <td align=right class="white">用户：<a href="javascript:eidtinfo()" class="href1"><asp:Label id="AdminName" runat="server" /></a>&nbsp;部门：<asp:Label id="Lb_Department" runat="server"/> &nbsp;<asp:LinkButton  text="注销退出" onclick="lbt_Click" runat="server" CssClass="href1"  />&nbsp;&nbsp;&nbsp;&nbsp;   
  </td>
   </tr> 
<table>
<table width=100% cellpadding=0 cellspacing=0 border="0" align=center  bgcolor="#0099CC">
   <tr>
    <td  valign="bottom" height="30px">
      <div class="top_menu" id="top_menu" style="float:right;padding:0 20px 0 0;">
       <ul>
         <li class="top_menu_item"><a class="top_menu_href" href="javascript:basic_set()">网站设置</a></li>
         <li class="top_menu_item"><a class="top_menu_href" href="javascript:open_lanmu()">栏目管理</a></li>
         <li class="top_menu_item<%=HasIssue=="1"?"_new":""%>"><a class="top_menu_href" href="javascript:open_issue()">签发信息</a></li>
         <li class="top_menu_item<%=HasSign=="1"?"_new":""%>"><a class="top_menu_href" href="javascript:open_sign()">信息签收</a></li>
         <li class="top_menu_item<%=HasLetter=="1"?"_new":""%>"><a class="top_menu_href" href="javascript:open_letter()">信息回复</a></li>
         <li class="top_menu_item<%=HasFbk=="1"?"_new":""%>"><a class="top_menu_href" href="javascript:open_feedback()">会员留言</a></li>
         <li class="top_menu_item"><a class="top_menu_href" href="javascript:tj()">流量统计</a></li>
         <li class="top_menu_item"><a class="top_menu_href" href="http://bbs.pageadmin.net" target="bbs">互助论坛</a></li> 
       </ul>
     </div>
    </td>
    </tr> 
    <tr><td colspan="2" bgcolor="#000000"></td></tr>
   </tbody>
   </table>
</form>
<script language="javascript">
var Right=parent.frames['right'];
if(Right.location.href.indexOf("site_add.aspx")>=0 || Right.location.href.indexOf("site_list.aspx")>=0)
 {
   //Right.location.href=Right.location.href;
 }
else
 {
  Right.location.href="sysmain.aspx"
 }
var LeftMenu=parent.frames['left'];
LeftMenu.location.href=LeftMenu.location.href;

function Show(Id)
    {
     var Obj=document.getElementById(Id);
     Obj.style.display="";
    }

function site_set()
 {
   var Obj=parent.frames["left"].document.getElementsByName("left");
   hideall(Obj);
   parent.frames["right"].location.href="site_list.aspx";
 }


function basic_set()
 {
   var Obj=parent.frames["left"].document.getElementsByName("left");
   parent.frames["left"].hideall();
   Obj[0].style.display="";
   parent.frames["right"].location.href="set_1.aspx";
 }

function open_lanmu()
 {
   var Obj=parent.frames["left"].document.getElementsByName("left");
   parent.frames["left"].hideall();
   Obj[3].style.display="";
   parent.frames["right"].location.href="lanmu_list.aspx";
 }

function open_order()
 {
   var Obj=parent.frames["left"].document.getElementsByName("left");
   parent.frames["left"].hideall();
   Obj[2].style.display="";
   parent.frames["right"].location.href="order_list.aspx";
 }

function open_feedback()
 {
   var Obj=parent.frames["left"].document.getElementsByName("left");
   parent.frames["left"].hideall();
   Obj[2].style.display="";
   parent.frames["right"].location.href="feedback_list.aspx";
 }

function open_issue()
 {
   var Obj=parent.frames["left"].document.getElementsByName("left");
   parent.frames["left"].hideall();
   Obj[2].style.display="";
   parent.frames["right"].location.href="issue_list.aspx";
 }

function open_sign()
 {
   var Obj=parent.frames["left"].document.getElementsByName("left");
   parent.frames["left"].hideall();
   Obj[2].style.display="";
   parent.frames["right"].location.href="sign_list.aspx";
 }

function open_letter()
 {
   var Obj=parent.frames["left"].document.getElementsByName("left");
   parent.frames["left"].hideall();
   Obj[2].style.display="";
   parent.frames["right"].location.href="letter_list.aspx";
 }

function eidtinfo()
 {
   var Obj=parent.frames["left"].document.getElementsByName("left");
   parent.frames["left"].hideall();
   parent.frames["right"].location.href="mdyinfo.aspx";
 }

function tj()
 {
   var Obj=parent.frames["left"].document.getElementsByName("left");
   parent.frames["left"].hideall();
   parent.frames["right"].location.href="tongji.aspx";
 }

function view()
 {
   var obj=document.getElementById("viewhref");
   var href="/<%=SiteDir==""?"":SiteDir+"/"%>index.aspx";
   var rhref=parent.frames["right"].location.href;
   var lanmuid=request("lanmuid",rhref);
   var sublanmuid=request("sublanmuid",rhref);
   if(lanmuid!="")
    {
      href+="?lanmuid="+lanmuid;
    }
   if(sublanmuid!="")
    {
      href+="&sublanmuid="+sublanmuid;
    }
   obj.href=href;
 }
</script>
</body>
</html>  
