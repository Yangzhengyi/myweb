<% @  Control Language="c#" Inherits="PageAdmin.mem_spcset"%>
<div class="current_location">
<ul>
<li class="current_location_1">当前位置：<a href="index.aspx?s=<%=Request.QueryString["s"]%>">会员中心</a> &gt; 空间设置</li>
<li class="current_location_2">空间设置</li>
</ul>
</div>
<div class="sublanmu_box">
<div class="sublanmu_content">
<div class="tabdiv"><ul>
 <li><a href='<%=Get_Url("mem_mdy")%>'>个人资料</a></li>
 <li class="c"><a href='<%=Get_Url("mem_spcset")%>'>空间设置</a></li>
</ul></div>
<asp:PlaceHolder id="P1" runat="server">
<form method="post" name="pa_member" Enctype="multipart/form-data">
<table border="0" cellpadding=5 cellspacing=0  align=center width="98%">
  <tr>
      <td height=20 align=right width="120px">空间地址</td>
      <td><a href="/e/space/?s=<%=Request.QueryString["s"]%>&username=<%=UserName%>" target="myspace">/e/space/?s=<%=Request.QueryString["s"]%>&username=<%=UserName%></a></a></td>
  </tr>

  <tr>
      <td height=20 align=right>空间名称</td>
      <td><input type="text" id="space_title" name="space_title"  size="40" class="tb" value="<%=SpaceTitle%>"></td>
  </tr>

  <tr>
      <td height=20 align=right>个人头像</td>
      <td>
   <input type="file" id="headimage" name="headimage" maxlength="50" size="30" class="tb">图片建议尺寸:150px*150px
   <br><a href="<%=HeadImage%>" target="spc"><img src="<%=HeadImage%>" border="0" height="50px" vspace="5"></a>
   </td>
  </tr>

  <tr>
      <td height=20 align=right>空间banner背景</td>
      <td>
       <input type="file" id="space_banner" name="space_banner" size="30" class="tb"> 图片控制在500kb以内
      <br><a href="<%=SpaceBanner%>" target="spc"><img src="<%=SpaceBanner%>" border="0" height="50px" vspace="5"></a>
    </td>
  </tr>

  <tr>
      <td height=20 align=right>空间简介(250字以内)</td>
      <td><textarea id="space_introduction" name="space_introduction" style="width:450px" rows="5"><%=SpaceIntroduction%></textarea></td>
  </tr>

  <tr>
      <td height=20 align=right>个人简介</td>
      <td>
<textarea id="introduction" name="introduction" style="width:450px" rows="5"><%=Introduction%></textarea>
  </td>
  </tr>

  <tr>
      <td colspan="2" align="center"><input name="post" type="hidden" value="edit"><input id="sub" type="submit" value="提交" class="bt"></td>
  </tr>
</table>
</form>
</asp:PlaceHolder>
<asp:PlaceHolder id="P2" runat="server" visible="false">
<div align=center>
<img src=/e/images/public/suc.gif width="167px" vspace="5px">
<br>空间设置成功!  
<br><br><input type="button" class="bt" value="返回"  onclick="location.href='<%=Get_Url("mem_spcset")%>'">
</div>
</asp:PlaceHolder>

</div>
</div>