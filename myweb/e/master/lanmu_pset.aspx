<% @ Page Language="C#" Inherits="PageAdmin.lanmu_pset"%>
<% @ Register TagPrefix="aspcn" TagName="uc_head" src="head.ascx" %>
<aspcn:uc_head runat="server" /> 
<body topmargin=0 bottommargin=0 leftmargin=0  rightmargin=0>
<center>
<table border=0 cellpadding=10 cellspacing=0 width=98% >
 <tr>
<td valign=top  align="left">
<iframe name="pframe" id="pframe" src="" frameborder=0 scroling=no height=1px width=1px marginwidth=0 marginheight=0 style="display:none"></iframe>
<form runat="server" target="pframe">
<div id="div1">
<div id="tabdiv">
<ul>
<li id="tab" name="tab"  onclick="showtab(0)" style="font-weight:bold">常用设置</li>
<li id="tab" name="tab"  onclick="showtab(1)">其他设置</li>
</ul>
</div>
<table border=0 cellpadding=0 cellspacing=0 width=100% align=center  class=table_style2>
<tr>
  <td valign=top>
<br>
<div name="tabcontent" id="tabcontent">
<table border=0 cellpadding=2 cellspacing=0 width=98% align=center>
 <tr>
  <td  height=30 width="100px"><input type="checkbox" name="ck_css" value="1">风格样式</td>
  <td><asp:DropDownList id="D_csspath" runat="server"><asp:ListItem value="">默认风格</asp:ListItem></asp:DropDownList></td>
 </tr>

<tr style="display:<%=Is_Static=="0"?"none":""%>">
  <td width=100px><input type="checkbox" name="ck_html" value="1">封面页静态<br></td>
  <td>
    <asp:DropDownList id="D_Html" runat="server">
    <asp:ListItem value="1">静态文件</asp:ListItem>
    <asp:ListItem value="0">动态文件</asp:ListItem>
    </asp:DropDownList>
  </td>
 </tr>
<tr>
  <td><input type="checkbox" name="ck_zdyurl" value="1">自定义链接</td>
  <td align="left"><asp:textBox TextMode="singleLine" id="tb_url" runat="server" size=50 maxlength="150"  />
</td>
</tr>

<tr>
  <td><input type="checkbox" name="ck_seotitle" value="1">seo标题</td>
  <td align="left"><asp:textBox TextMode="singleLine" id="tb_title" runat="server" size=50 maxlength="150"  />
</td>
 </tr>

<tr>
  <td><input type="checkbox" name="ck_seokeywords" value="1">seo关键字</td>
 <td align="left" title="关键字之间用半角逗号分开"><asp:textBox TextMode="singleLine" id="tb_keywords" runat="server" size=50 maxlength="150"  />
</td>
 </tr>

<tr>
  <td><input type="checkbox" name="ck_seodescription" value="1">seo描述</td>
 <td align="left" title="控制在250字以内"><asp:TextBox TextMode="multiLine" Columns="50" rows="4"  id="tb_description"  runat="server" onkeyup="if(this.value.length>250)this.value=this.value.substring(0,250)"/>
</td>
 </tr>

<tr>
  <td><input type="checkbox" name="ck_zdyhead" value="1">头信息自定义</td>
  <td><asp:TextBox  id="Headzdy" TextMode="MultiLine" runat="server" columns="50" rows="4" />
  </td>
</tr>
</table>
</div>
<div name="tabcontent" id="tabcontent" style="display:none">
<table border=0 cellpadding=2 cellspacing=0 width=98% align=center>
<tr>
  <td width=120px><input type="checkbox" name="ck_topzdy" value="1">顶部信息自定义</td>
  <td><asp:TextBox  id="Wztopzdy"  TextMode="MultiLine"  runat="server" columns="50" rows="4" />
  </td>
 </tr>
<tr>

<tr>
  <td><input type="checkbox" name="ck_lanmuzdy" value="1">栏目自定义</td>
  <td><asp:TextBox id="Lanmuzdy" TextMode="MultiLine"  runat="server" columns="50" rows="4" />
  </td>
 </tr>


<tr>
  <td><input type="checkbox" name="ck_dropmenuzdy" value="1">下拉菜单自定义</td>
  <td><asp:TextBox  id="Dropmenuzdy" TextMode="MultiLine"  runat="server" columns="50" rows="4" />
  </td>
 </tr>


<tr>
  <td width=100px><input type="checkbox" name="ck_banner" value="1">横幅自定义</td>
  <td><asp:TextBox  id="Banner"  TextMode="MultiLine"  runat="server" columns="50" rows="4" />
  </td>
 </tr>

<tr>
  <td><input type="checkbox" name="ck_smallbanner" value="1">小幅banner自定义</td>
  <td><asp:TextBox  id="SmallBanner"  TextMode="MultiLine"  runat="server" columns="50" rows="4" />
  </td>
 </tr>

<tr>
  <td><input type="checkbox" name="ck_bottomzdy" value="1">底部信息自定义</td>
  <td><asp:TextBox  id="Wzbottomzdy"  TextMode="MultiLine"  runat="server" columns="50" rows="4" />
  </td>
 </tr>
<tr>
</table>
</div>
<br>
<div align=center>
<input type="hidden" value="" name="ids" id="ids">
<asp:Button Cssclass=button text="提交" id="Submit" runat="server" onclick="Data_Update" />
<input type="button" value="关闭" class="button" onclick="parent.ClosePop();">
</div>
<br>
</td>
</tr>
</table>
</form>
</div>

<div id="div2" align="center" style="display:none">
<br><br><br><br><img src="images/suc.png" vspace="5"><br><br>
<a href="#" onclick="restore(1);return false;">点击这里返回提交页面</a></div>
</div>

</td>
</tr>
</table>
</center>
</body>
<script type="text/javascript">
document.getElementById("ids").value=parent.document.getElementById("ids").value;
if(GetCookie("tab")!="")
 {
  showtab(GetCookie("tab"));
 }  

function restore(backtype)
 {
   var d1=document.getElementById("div1");
   var d2=document.getElementById("div2");
   if(backtype==1)
    {
      d1.style.display="block";
      d2.style.display="none";
    }
   else
    {
      d2.style.display="block";
      d1.style.display="none";
    }
 }
</script>
</html>  



