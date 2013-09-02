﻿<% @ Page Language="C#" Inherits="PageAdmin.member_center_set"%>
<% @ Register TagPrefix="aspcn" TagName="uc_head" src="head.ascx" %>
<aspcn:uc_head runat="server"  Type="member_type" />
<body topmargin=0 bottommargin=0 leftmargin=0  rightmargin=0>
<center>
<table  border=0 cellpadding=0 cellspacing=0 width=95% >
 <tr><td align="left" height=10></td></tr>
 <tr><td align="left" class=table_style1><b>会员中心功能设置</b></td></tr>
 <tr><td align="left" height=10></td></tr>
</table>
<table border=0 cellpadding=0 cellspacing=0 width=95% >
 <tr>
<td align="left" valign=top>
<iframe name="post_iframe" src="" frameborder=0 scroling=no height=1px width=1px marginwidth=0 marginheight=0 style="display:none"></iframe>
<form method="post" target="post_iframe">
<table border=0 cellpadding=0 cellspacing=2 width=100% align=center>
 <tr>
  <td align="left" colspan="2"><b><%=Request.QueryString["m_type"]%></b></td>
 </tr>
</table>
<table border=0 cellpadding=5 cellspacing=2 width=100% align=center  class=table_style2>
 <tr>
  <td align="left" height=25 width="150px">作用站点</td>
  <td align="left" height=25><select id="site_id" name="site_id"><%=Site_Options%></select>
  </td>
 </tr>

 <tr>
  <td align="left" height=25 width="150px">站内信息</td>
  <td align="left" height=25>
   <input type="radio"  name="message" value="1"  checked>开启 <input type="radio"  name="message" value="0" checked>关闭
  </td>
 </tr>

 <tr>
  <td align="left" height=25 width="150px">签发信息</td>
  <td align="left" height=25>
   <input type="radio"  name="issue" value="1"  checked>开启 <input type="radio"  name="issue" value="0" checked>关闭<br>
  </td>
 </tr>

 <tr>
  <td align="left" height=25 width="150px">信息签收</td>
  <td align="left" height=25>
   <input type="radio"  name="sign" value="1"  checked>开启 <input type="radio"  name="sign" value="0" checked>关闭<br>
  </td>
 </tr>

 <tr>
  <td align="left" height=25 width="150px">信息回复</td>
  <td align="left" height=25>
   <input type="radio"  name="letter" value="1"  checked>开启 <input type="radio"  name="letter" value="0" checked>关闭<br>
  </td>
 </tr>

 <tr>
  <td align="left" height=25 width="150px">我的订单</td>
  <td align="left" height=25>
   <input type="radio"  name="order" value="1"  checked>开启 <input type="radio"  name="order" value="0" checked>关闭<br>
  </td>
 </tr>

 <tr>
  <td align="left" height=25 width="150px">我的兑换</td>
  <td align="left" height=25>
   <input type="radio"  name="exchange" value="1"  checked>开启 <input type="radio"  name="exchange" value="0" checked>关闭<br>
  </td>
 </tr>

 <tr>
  <td align="left" height=25>我的财务</td>
  <td align="left" height=25><input type="radio" name="fnc" value="1" checked>开启 <input type="radio" name="fnc" value="0" checked>关闭</td>
 </tr>

 <tr>
  <td align="left" height=25>我的积分</td>
  <td align="left" height=25><input type="radio" name="point" value="1" checked>开启 <input type="radio" name="point" value="0" checked>关闭
 </td>
 </tr>

 <tr>
  <td align="left" height=25>会员留言</td>
  <td align="left" height=25><input type="radio" name="feedback" value="1">开启 <input type="radio"  name="feedback" value="0" checked>关闭</td>
 </tr>

 <tr>
  <td align="left" height=25>我的收藏</td>
  <td align="left" height=25><input type="radio" name="favorites" value="1">开启 <input type="radio"  name="favorites" value="0" checked>关闭</td>
 </tr>

<asp:Repeater id="P_zdyform" runat="server">
<ItemTemplate>
<tr>
  <td align="left" height=25 valign=top><%#DataBinder.Eval(Container.DataItem,"table_name")%></td>
  <td align="left" height=25>
   <input type="radio"  name="db_<%#DataBinder.Eval(Container.DataItem,"thetable")%>" value="1">开启管理(<input type="checkbox"  name="db_<%#DataBinder.Eval(Container.DataItem,"thetable")%>_multisite" id="db_<%#DataBinder.Eval(Container.DataItem,"thetable")%>_multisite" value="1">跨站管理) <input type="radio" name="db_<%#DataBinder.Eval(Container.DataItem,"thetable")%>" value="0" checked>关闭管理<br>
   <div style="padding:5px 5px 5px 10px">
    发布功能：<input type="radio"  name="db_<%#DataBinder.Eval(Container.DataItem,"thetable")%>_add" value="1">开启 <input type="radio"  name="db_<%#DataBinder.Eval(Container.DataItem,"thetable")%>_add" value="0"  checked>关闭<br>
    已审信息：<input type="checkbox"  name="db_<%#DataBinder.Eval(Container.DataItem,"thetable")%>_edit" id="db_<%#DataBinder.Eval(Container.DataItem,"thetable")%>_edit"  value="1">允许修改 <input type="checkbox"  name="db_<%#DataBinder.Eval(Container.DataItem,"thetable")%>_del" id="db_<%#DataBinder.Eval(Container.DataItem,"thetable")%>_del" value="1">允许删除
   </div>
 </td>
 </tr>
 </ItemTemplate>
</asp:Repeater>

 <tr>
 <td colspan="2" align="center" style="padding:20px 0 10px 0">
<span id="post_area">
<input type="submit" id="Bt_Submit" value="提 交" class="button" />
<input type="button" value="返 回" class="button" onclick="location.href='member_type.aspx'" />
</span>
<span id="post_loading" style="display:none"><img src=images/loading.gif vspace="5" align=absmiddle>Loading...</span>
</td>
</tr>
</table>
</form>
</td>
</tr>
</table>
</center>
<script type="text/javascript">
 var M_Center="<%=M_Center%>";
 document.getElementById("site_id").value="<%=SiteId%>";
 if(M_Center!="")
  {
     if(M_Center.indexOf("message=1")>=0)
      {
        document.getElementsByName("message")[0].checked=true;
      }

     if(M_Center.indexOf("&issue=1")>=0)
      {
        document.getElementsByName("issue")[0].checked=true;
      }

     if(M_Center.indexOf("&sign=1")>=0)
      {
        document.getElementsByName("sign")[0].checked=true;
      }

     if(M_Center.indexOf("&letter=1")>=0)
      {
        document.getElementsByName("letter")[0].checked=true;
      }


     if(M_Center.indexOf("&order=1")>=0)
      {
        document.getElementsByName("order")[0].checked=true;
      }

     if(M_Center.indexOf("&exchange=1")>=0)
      {
        document.getElementsByName("exchange")[0].checked=true;
      }

      if(M_Center.indexOf("&fnc=1")>=0)
      {
        document.getElementsByName("fnc")[0].checked=true;
      }

      if(M_Center.indexOf("&point=1")>=0)
      {
        document.getElementsByName("point")[0].checked=true;
      }

      if(M_Center.indexOf("&pointlist=1")>=0)
      {
        document.getElementsByName("pointlist")[0].checked=true;
      }

      if(M_Center.indexOf("&onlinepay=1")>=0)
      {
        document.getElementsByName("onlinepay")[0].checked=true;
      }

      if(M_Center.indexOf("&feedback=1")>=0)
      {
        document.getElementsByName("feedback")[0].checked=true;
      }
      if(M_Center.indexOf("&favorites=1")>=0)
      {
        document.getElementsByName("favorites")[0].checked=true;
      }
<asp:Repeater id="P_zdyform_1" runat="server">
<ItemTemplate>
 if(M_Center.indexOf("&db_<%#DataBinder.Eval(Container.DataItem,"thetable")%>=1")>=0)
   {
     document.getElementsByName("db_<%#DataBinder.Eval(Container.DataItem,"thetable")%>")[0].checked=true;
   }

 if(M_Center.indexOf("&db_<%#DataBinder.Eval(Container.DataItem,"thetable")%>_add=1")>=0)
   {
     document.getElementsByName("db_<%#DataBinder.Eval(Container.DataItem,"thetable")%>_add")[0].checked=true;
   }

 if(M_Center.indexOf("&db_<%#DataBinder.Eval(Container.DataItem,"thetable")%>_edit=1")>=0)
   {
     document.getElementById("db_<%#DataBinder.Eval(Container.DataItem,"thetable")%>_edit").checked=true;
   }

 if(M_Center.indexOf("&db_<%#DataBinder.Eval(Container.DataItem,"thetable")%>_del=1")>=0)
   {
     document.getElementById("db_<%#DataBinder.Eval(Container.DataItem,"thetable")%>_del").checked=true;
   }
 if(M_Center.indexOf("&db_<%#DataBinder.Eval(Container.DataItem,"thetable")%>_multisite=1")>=0)
   {
     document.getElementById("db_<%#DataBinder.Eval(Container.DataItem,"thetable")%>_multisite").checked=true;
   }
 </ItemTemplate>
</asp:Repeater>

  }
document.getElementById("Bt_Submit").onclick=startpost;
</script>

</body>
</html>  



