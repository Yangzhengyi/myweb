﻿<% @ Page language="c#" Inherits="PageAdmin.Install"%>
<HTML>
<HEAD>
<TITLE>PageAdmin网站系统安装向导</TITLE>
<meta name="keywords"       content="PageAdmin网站系统安装向导"    >
<META  name="description"   content="PageAdmin网站系统安装向导" >
<META content="MSHTML 6.00.2800.1170" name=GENERATOR>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
body,td,div{
        word-break:break-all;
        color:#000000;
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
        font:12px/1.6em Verdana,Helvetica,Arial,sans-serif;
}

a:link{color:#333333;
	text-decoration: underline;
}
a:visited {color:#333333;
	text-decoration: underline;
}
a:hover {color:#333333;
	 text-decoration:none;
}

.button{
border-top-width:1;
border-bottom-width:1;
border-left-width:1;
border-right-width:1;
border-style:solid;
border-color:#98A9CF;
height:22;
background-color: #ffffff;
cursor:hand;
margin:10px 20px 0 0
}
#headtb tr td{color:#fff}
#headtb tr td a{color:#fff}

.tdbg{
	background-color:#666666;
        color:#ffffff;
     }  

.tablestyle{border:1px solid #cccccc}
.tablestyle td{padding:2px 5px 2px 10px}
</style>
</HEAD>

<form runat="server" topmargin=0 leftmargin=0>
<table border="0" cellpadding="0" cellspacing="0" width="100%" align=center bgcolor=#054D8F id="headtb">
  <tr>
   <td height=50><img src="images/logo.gif" style="margin:5px 0 0 10px"></td>
    <td align=right>网站：<a href=http://www.pageadmin.net target="Pageadmin">www.pageadmin.net</a>&nbsp;&nbsp;&nbsp;&nbsp;论坛：<a href=http://bbs.pageadmin.net target="Pageadmin">bbs.pageadmin.net</a>&nbsp;&nbsp;</td>
  </tr>
 <tr>
   <td height=20 colspan=2>
  
  <td>
 </tr>
</table>
<asp:PlaceHolder id="Panel1" runat="server">

<table border=0 cellpadding=0 cellspacing=0 width=100%>
 <tr>
   <td height=20  bgcolor="#98A9CF" align=center>步骤1：许可协议<td>
 </tr>
</table>

<table border=0 cellpadding=0 cellspacing=0 width=100%>
 <tr><td align=center>
<div style="width:800px;height:400px;overflow:scroll;border:1px solid #98A9CF;border-top-width:0px;line-height:25px;text-align:left;padding:5px 10px 10px 5px">
<p align=center><b>PageAdmin网站管理系统最终用户授权协议</b></p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;感谢您使用PageAdmin网站管理系统(以下简称PageAdmin)，PageAdmin是一款基于微软ASP.NET平台开发，集成会员管理、内容发布、自定义模型、工作流等功能于一体的专业级网站管理系统。
<br>&nbsp;&nbsp;&nbsp;&nbsp;中山市南头镇华拓网络技术服务中心为PageAdmin系列产品的开发商，依法独立拥有PageAdmin系列产品的著作权。
<br>&nbsp;&nbsp;&nbsp;&nbsp;无论个人、企业或组织、盈利与否、用途如何（包括以学习和研究为目的），均需仔细阅读本协议，在理解、同意、并遵守本协议的全部条款后，方可开始使用PageAdmin产品。 
<br>&nbsp;&nbsp;&nbsp;&nbsp;本授权协议适用于PageAdmin专业版的所有版本，PageAdmin官方拥有对本授权协议的最终解释权。
</p>

<p>
一、协议许可的权利 
<br>&nbsp;&nbsp;&nbsp;&nbsp;1. 获得商业授权之后，您可以在完全遵守本最终用户授权协议的基础上，将本软件应用于任何用途。
<br>&nbsp;&nbsp;&nbsp;&nbsp;2. 您拥有使用本软件构建的网站全部内容所有权，并独立承担与这些内容的相关法律义务。
</p>

<p>
二、协议规定的约束和限制
<br>&nbsp;&nbsp;&nbsp;&nbsp;1. 未经我司书面许可，不得对本软件或与之关联的商业授权进行出租、出售、抵押或发放授权号。
<br>&nbsp;&nbsp;&nbsp;&nbsp;2. 未经我司书面许可，禁止在PageAdmin产品的整体或任何部分基础上以发展任何派生版本、修改版权或第三方版本用于重新分发。
<br>&nbsp;&nbsp;&nbsp;&nbsp;3. 如果您未能遵守本协议的条款，我司有随时勒令用户终止使用的权利，并保留进一步追究相关法律责任的权力。
</p>

<p>
三、有限担保和免责声明 
<br>&nbsp;&nbsp;&nbsp;&nbsp;1. 本软件及所附带的文件是作为不提供任何明确的或隐含的赔偿或担保的形式提供的。
<br>&nbsp;&nbsp;&nbsp;&nbsp;2. 电子文本形式的授权协议如同双方书面签署的协议一样，具有完全的和等同的法律效力。您一旦开始安装PageAdmin，即被视为完全理解并接受本协议的各项条款，在享有上述条款授予的权力的同时，受到相关条款的约束和限制。
</p>
</div>
</td>
</tr>

<tr>
<td colspan=2 align=center height=40px>
<asp:Button Text="安装pageadmin网站管理系统"  runat="server" onclick="Next_1" CssClass="button"/>&nbsp;&nbsp;
<asp:Button Text="运行SQL" runat="server" CssClass="button" onclick="Show_Sql"/>
</td>
</tr>
</table>
</asp:PlaceHolder>

<asp:PlaceHolder id="Panel2" runat="server">
<table border=0 cellpadding=0 cellspacing=0 width=100%>
 <tr>
   <td height=20  bgcolor="#98A9CF" align=center>步骤2：环境检测<td>
 </tr>
</table>
<table border=0 cellpadding="2" cellspacing="0" align="center" width="600">
    <tr><td height=30px><b>服务器信息</b></td></tr>
 </table>
<table border=0 cellpadding="2" cellspacing="0" align="center" width="600" class="tablestyle">
    <tr bgcolor=#ececec><td width="50%" align=center>参数</td><td align=center width="50%">值</td></tr>
    <tr><td>.NET版本</td><td><%=Environment.Version%></td></tr>
    <tr><td>当前域名</td><td>http://<%=Request.ServerVariables["SERVER_NAME"]%><%=SERVER_PORT%></td></tr>
    <tr><td>服务器目录</td><td><%=Server.MapPath("/")%></td></tr>
    <tr><td>操作系统</td><td><%=Request.ServerVariables["SERVER_SOFTWARE"]%></td></tr>

    <tr><td>服务器IP</td><td><%=Request.ServerVariables["LOCAL_ADDR"]%></td></tr>
    <tr><td>用户浏览器</td><td><%=Request.Browser.Browser%><%=Request.Browser.Version%></td></tr>
 </table>

<table border=0 cellpadding="2" cellspacing="0" align="center" width="600">
    <tr><td height=30px><b>目录权限检测</b></td></tr>
 </table>
<table border=0 cellpadding="2" cellspacing="0" align="center" width="600" class="tablestyle">
    <tr bgcolor=#ececec><td align=center width="25%">目录名</td><td align=center width="25%">读取权限</td><td align=center width="25%">写入权限</td><td align=center width="25%">删除权限</td></tr>
    <tr><td align=center>/根目录</td><td align=center><%=r_p[0]%></td><td align=center><%=w_p[0]%></td><td align=center><%=d_p[0]%></td></tr>
    <tr><td align=center>/e/*</td><td align=center><%=r_p[1]%></td><td align=center><%=w_p[1]%></td><td align=center><%=d_p[1]%></td></tr>
    <tr><td align=center>/e/zdyform/*</td><td align=center><%=r_p[2]%></td><td align=center><%=w_p[2]%></td><td align=center><%=d_p[2]%></td></tr>
    <tr><td align=center>/e/zdymodel/*</td><td align=center><%=r_p[3]%></td><td align=center><%=w_p[3]%></td><td align=center><%=d_p[3]%></td></tr>
    <tr><td align=center>/e/zdytag/*</td><td align=center><%=r_p[4]%></td><td align=center><%=w_p[4]%></td><td align=center><%=d_p[4]%></td></tr>
    <tr><td align=center>/e/upload/*</td><td align=center><%=r_p[5]%></td><td align=center><%=w_p[5]%></td><td align=center><%=d_p[5]%></td></tr>
 </table>

<div align=center>
<input type="button" value="返回上一步"  Class="button"  onclick="location.href='?setup=1'" />&nbsp;&nbsp;
<asp:Button Text="下一步" runat="server" CssClass="button" onclick="Next_2"/>
</div>
</asp:PlaceHolder>

<asp:PlaceHolder id="P_Sql" runat="server" Visible="false">
<table border=0 cellpadding=0 cellspacing=0 width=100%>
 <tr>
   <td height=20  bgcolor="#98A9CF" align=center>运行SQL<td>
 </tr>
</table>
<table border=0 cellpadding=0 cellspacing=0 width=100%>
 <tr>
   <td height=25  align=center style="font-size:13px">说明：复制SQL语句到下面内容框中点击开始运行即可。<td>
 </tr>
<tr>
<td align=center><asp:TextBox Text="" runat="server" id="Tb_sql" TextMode="multiline" Columns="80"  rows="15"/></td>
</tr>

<tr>
<td align=center height=40px>
<asp:Button Text="开始运行" runat="server" onclick="Update_Sql" CssClass="button"/>&nbsp;&nbsp;
<input type="button" value="返回安装界面" Class="button" onclick="location.href='index.aspx'">
</td>
</tr>
</table>

</asp:PlaceHolder>


<asp:PlaceHolder id="Panel3" runat="server" Visible="false">
<table border=0 cellpadding=0 cellspacing=0 width=100%>
 <tr>
   <td height=20 align=center bgcolor="#98A9CF">步骤3：参数配置<td>
 </tr>
</table>
<br>

<table border=0 cellpadding=5 cellspacing=0 align=center>
 <tr><td align=right width=30% valign=top>数据库类型：</td>
  <td align=left valign=top><asp:RadioButton id="Radio_1" GroupName="sqlType" runat="server" AutoPostBack="false" />ACCESS数据库&nbsp;&nbsp;
  <asp:RadioButton id="Radio_2" GroupName="sqlType" runat="server" AutoPostBack="false" />Sql Server数据库<br><span style="color:#666666">注：使用Sql数据库前请先在web.config文件中SqlConnection处设置好sql连接字符串。</span>
  </td>
 </tr>
 <tr><td align=right>后台管理目录：</td>
    <td align=left>/e/<asp:TextBox Text="" runat="server" id="TbMasterDir" size="20" MaxLength="20"/>
<br><span style="color:#666666">默认后台为:http://您的域名/e/master/login.aspx，可以更改为其他名称</span>
</td>
</tr>

<tr><td colspan=2 align=center height=40px>
<input type="button" value="返回上一步"  Class="button"  onclick="location.href='?setup=2'" />&nbsp;&nbsp;
<asp:Button Text="下一步" runat="server" CssClass="button"  onclick="Next_3"/>
</td>
</tr>
</table>
</asp:PlaceHolder>



<asp:PlaceHolder id="Panel4" runat="server" Visible="false">
<table border=0 cellpadding=0 cellspacing=0 width=100%>
 <tr>
   <td height=20 align=center bgcolor="#98A9CF">步骤4：管理密码设置<td>
 </tr>
</table>
<br>
<table border=0 cellpadding="2" cellspacing="0" align="center" width="430">
    <tr><td width=100px align=right>系统管理员：</td><td><asp:TextBox Text="admin" runat="server" Enabled="false" size="20" /></td></tr>

    <tr>
     <td align=right>管理员密码：</td>
     <td><asp:TextBox Id="Login_Pass"   runat="server"  size="20" Maxlength="20"/>
        <asp:RequiredFieldValidator  ControlToValidate="Login_Pass" display="Dynamic"  type="integer"  runat="server">&nbsp;请输入管理员密码&nbsp;&nbsp;&nbsp;&nbsp;</asp:RequiredFieldValidator>
    </td>
    </tr>

    <tr>
     <td align=right>密码确认：</td>
     <td><asp:TextBox Id="Login_Pass1"   runat="server"   size="20" Maxlength="20" />
        <asp:RequiredFieldValidator  ControlToValidate="Login_Pass1" display="Dynamic"  type="integer"  runat="server">&nbsp;请再次输入管理员密码</asp:RequiredFieldValidator>
     </td>
   </tr>

 </table>

<div align=center>
<input type="button" value="返回上一步"  Class="button" onclick="location.href='?setup=3'" />&nbsp;&nbsp;
<asp:Button Text="下一步" runat="server" CssClass="button"  onclick="Next_4"/>
</div>
</asp:PlaceHolder>


<asp:PlaceHolder id="Panel5" runat="server" Visible="false">
<table border=0 cellpadding=0 cellspacing=0 width=100%>
 <tr>
   <td height=20 align=center bgcolor="#98A9CF">步骤5：安装完毕<td>
 </tr>
 <tr>
   <td height=20 align=center><td>
 </tr>
 <tr>
   <td height=20 align=center>
   初始化完毕!<br>
   点击 <a href="<%=masterurl%>">http://<%=Request.ServerVariables["SERVER_NAME"]%><%=SERVER_PORT%><%=masterurl%></a> 进入网站管理后台。
  <td>
 </tr>
</table>
<br>
</asp:PlaceHolder>
<br>
<div align=center><asp:Label id="Lbl_error" runat="server" style="color:#ff0000;font-size:13px"/></div>
<table border=0 cellpadding=0 cellspacing=0 width=100%>
  <tr>
   <td height=20 background="images/bg_1.gif" align="center"></td>
 </tr>
</table>
</form>
</body>
</html>