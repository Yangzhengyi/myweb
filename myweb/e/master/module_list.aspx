﻿<% @ Page Language="C#" Inherits="PageAdmin.module_list"%>
<% @ Register TagPrefix="aspcn" TagName="uc_head" src="head.ascx" %>
<aspcn:uc_head runat="server" Type="lanmu_list" />
<body topmargin=0 bottommargin=0 leftmargin=0  rightmargin=0>
<center>
<table  border=0 cellpadding=0 cellspacing=0 width=95% >
 <tr><td height=10></td></tr>
 <tr><td class=table_style1><b><%=Type%>模块管理</b></td></tr>
 <tr><td height=10></td></tr>
</table>
<table border=0 cellpadding=10 cellspacing=0 width=95% >
 <tr>
<td valign=top align="left">

<form runat="server" >
<table border=0 cellpadding=5 cellspacing=0 width=100% align=center  class=table_style2>
<tr>
  <td valign=top>

<table border=0 cellpadding=0 cellspacing=2 width=98% align=center>
<tr>
  <td  colspan=2 height=25><b>当前位置：</b><a href=lanmu_list.aspx>栏目管理(<%=Request.QueryString["lanmuname"]%>)</a> <%=Sublanmu_Site%> &gt; 模块管理</td>
 </tr>
</table>

 <table border=0 cellpadding=0 cellspacing=0 width=98% align=center>
      <tr>
        <td>  
             <table border=0 cellpadding=0 cellspacing=0 width=100% class=tablestyle>
                 <tr>
                      <td align=center width=35% class=white height=20>模块名称</td>
                      <td align=center width=20% class=white>模块类型</td>
                      <td align=center width=10% class=white>序号</td>
                      <td align=center width=10% class=white>显示</td>
                      <td align=center width=25% class=white>管理</td>
                    </tr>
                 <asp:Repeater id="Modulelist" runat="server" OnItemDataBound="Data_Bound"> 
                    <ItemTemplate>
                      <tr  title='ID：module_<%#DataBinder.Eval(Container.DataItem,"id")%>'>
                      <td align=left  class=tdstyle height=20><input type="checkbox" id="CK" Name="CK" Value="<%#DataBinder.Eval(Container.DataItem,"id")%>"><asp:TextBox id="tb_name" runat="server"  size="25" maxlength="100" Text='<%#DataBinder.Eval(Container.DataItem,"name")%>'/></td>
                      <td align=center class=tdstyle>
                     <asp:DropDownList id="DL_Type" runat="server" >
                       <asp:listItem value="zdy">自定义内容</asp:ListItem>
                     </asp:DropDownList>
                      </td>
    
                      <td align=center class=tdstyle><asp:TextBox id="tb_xuhao" runat="server" size="3" maxlength="5" Text='<%#DataBinder.Eval(Container.DataItem,"xuhao")%>'/></td>
                      <td align=center class=tdstyle>
                     <asp:DropDownList id="DL_Show" runat="server" >
                     <asp:listItem value="1">显示</asp:ListItem>
                     <asp:listItem value="0" style="color:#ff0000">隐藏</asp:ListItem>
                     </asp:DropDownList>
                     </td>
                      <td align=left class=tdstyle>
                         <asp:Label id="Id"  runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"id")%>' Visible="false" />
                         <asp:Label id="Lb_type"  runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"thetable")%>' Visible="false" />
                         <asp:Label id="Lb_show"  runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"show")%>' Visible="false" />
                         <a href="javascript:module_set('<%#DataBinder.Eval(Container.DataItem,"id")%>','<%#DataBinder.Eval(Container.DataItem,"thetable")%>')">内容设置</a>
                         <a href="javascript:del('<%#DataBinder.Eval(Container.DataItem,"id")%>','<%#DataBinder.Eval(Container.DataItem,"name")%>')">删除</a>
                      </td>
                    </tr>               
                    </ItemTemplate>
            </asp:Repeater>
    <tr style="display:<%=ModuleCounts==0?"none":""%>">
      <td colspan="8" align="left" class="tdstyle">
<input type="button" class="button" value="反选" onclick="CheckBox_Inverse('CK')"/>
<input type="button" value="更新" class="button" id="sbt" onclick="set('update')"/>
[<a href="javascript:set('pdelete')">删除</a>]
    </td>
  </tr>
      </table>
       </td>
    </tr>
   </table>

<div align="center" style="padding:10px 0 5px 0">
<input type="hidden" value="" name="ids" id="ids">
<input type="hidden" value="" name="act" id="act">
<input type="hidden" value="" name="delname" id="delname">
<input type="button" value="返回" Class="button" OnClick="Back()">
</div>
  </td>
  <tr>
 </table>
<br>
<table border=0 cellpadding=5 cellspacing=0 width=100% align=center class=table_style2 id="Add">
<tr>
  <td valign=top>
    <table border=0 cellpadding=0 cellspacing=2 width=100% align=center>
    <tr><td  colspan=3 height=25><b>增加<%=Type%>模块</b></td>
    </tr>
      <tr>
        <td  height=25 align="left">
模块名称：<asp:TextBox  id="Add_Name"  maxlength="100" size="25"  runat="server" />
模块类型：<asp:DropDownList id="Add_Type" runat="server">
                     <asp:listItem value="zdy">自定义内容</asp:ListItem>
       </asp:DropDownList> 

序号：<asp:TextBox id="AddXuhao"  text="1" maxlength=5 size=5 runat="server" />

<asp:Label id="LanmuId" runat="server"  visible="false"/>
<asp:Label id="SubLanmuId"  runat="server"  visible="false"/>
<asp:button  CssClass="button"  Text="增加" runat="server" OnClick="Data_Add" />
        </td>
    </tr>
   </table>
</td>
</tr>
</table>
<div style="padding:10px 0 0 0"><asp:Label id="LblErr" runat="server" /></div>
</form>
</td>
</tr>
</table>
</center>
<script type="text/javascript">
function Back()
 {
  <%if(Type=="栏目")
   {
   %>
    location.href="lanmu_list.aspx";
  <%}
   else
   {
  %>
   location.href="sublanmu_list.aspx?lanmuid=<%=Request.QueryString["lanmuid"]%>&lanmuname=<%=Server.UrlEncode(Request.QueryString["lanmuname"])%>&navid=<%=Request.QueryString["navid"]%>&navname=<%=Server.UrlEncode(Request.QueryString["navname"])%>";
  <%}%>
 }

function del(did,dname)
 {
   if(confirm("确定删除吗?"))
   {
     document.getElementById("delname").value=dname;
     document.getElementById("ids").value=did;
     document.getElementById("act").value="del";
     document.forms[0].submit();
   }
 }

function set(act)
 {
   var Ids=Get_CheckBox("CK");
   var A_Ids=Ids.split(",");
   if(Ids=="0")
    {
      alert("请选择要操作的模块!");
      return;
    }
   switch(act)
    {
     case "pdelete":
     if(!confirm("是否确定删除?"))
      {
        return;
      }
     break;
    }
  document.getElementById("act").value=act;
  document.getElementById("ids").value=Ids;
  document.forms[0].submit();
 }
                     
function module_set(Id,thetable)
 {
  var Width=900;
  var Height=500;
  if(thetable!="zdy"){Height=450}
  var Left=(window.screen.availWidth-10-Width)/2
  var Top=(window.screen.availHeight-30-Height)/2;
  url="module_set.aspx?lanmuid=<%=Request.QueryString["lanmuid"]%>&id="+Id+"&table="+thetable;
  window.open(url,"navset","width="+Width+",height="+Height+",top="+Top+",left="+Left+",toolbar=no,menubar=no,scrollbars=yes,resizable=yes,location=no,status=yes");
  //ShowIframe(name,url,Width,Height,'auto');
}
</script>
</body>
</html>  



