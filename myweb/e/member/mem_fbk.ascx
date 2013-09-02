<% @  Control Language="c#" Inherits="PageAdmin.mem_fbk"%>
<div class="current_location">
<ul>
<li class="current_location_1">当前位置：<a href="index.aspx?s=<%=Request.QueryString["s"]%>">会员中心</a> &gt; 有问必答</li>
<li class="current_location_2">有问必答</li>
</ul>
</div>
<div class="sublanmu_box">
<div class="sublanmu_content">
<div class="tabdiv"><ul>
 <li><a href='<%=Get_Url("mem_fbklst")%>'>我的留言</a></li>
 <li class="c"><a href='<%=Get_Url("mem_fbk")%>'>发布留言</a></li>
</ul></div>
<form method="post">
<table border=0 cellpadding="3px" cellspacing=0  align=center class="member_table">
 <tr>
      <td height=20 align=right width="90px">类型<span style="color:#ff0000"> </span></td>
      <td height=20 ><select name="fb_type" id="fb_type" >
	<option value="咨询">  咨询  </option>
	<option value="问题">  问题  </option>
	<option value="建议">  建议  </option>
	<option value="投诉">  投诉  </option>
	<option value="其他">  其他  </option></select>
     </td>
    </tr>

  <tr>
      <td height=20 align=right>主题<span style="color:#ff0000"> *</span></td>
      <td height=20><input type="text" id="fb_title" name="fb_title" maxlength="50" size="40" class="tb"></td>
    </tr>
  </tr>

  <tr>
      <td height=20 align=right >联系人<span style="color:#ff0000"> *</span></td>
      <td height=20><input type="text" id="fb_truename" name="fb_truename" value="<%=Name%>" maxlength="30" size="20" class="tb"></td>
    </tr>
  </tr>

   <tr>
      <td height=20 align=right>联系电话<span style="color:#ff0000"> </span></td>
      <td height=20><input type="text" id="fb_tel" name="fb_tel" maxlength="30" size="20" class="tb" ></td>
  </tr>

     <tr>
      <td height=20 align=right >E-mail<span style="color:#ff0000"> *</span></td>
      <td height=20><input type="text" id="fb_email"  name="fb_email" value="<%=Email%>" maxlength="30" size="20" class="tb"></td>
    </tr>

   <tr>
      <td height=20 align=right >反馈内容<span style="color:#ff0000"> *</span></td>
      <td height=20><textarea id="fb_content" name="fb_content" Cols="55" rows="7" class="tb"></textarea> 
<script type="text/javascript" src="/e/incs/fckeditor/fckeditor.js"></script>
<script  type="text/javascript"> 
var FCKeditor = new FCKeditor("fb_content"); 
FCKeditor.BasePath = "/e/incs/fckeditor/"; 
FCKeditor.Height = 200; 
FCKeditor.Config['LinkBrowser'] = false;
FCKeditor.Config['ImageBrowser'] =false;
FCKeditor.Config['FlashBrowser'] = false;
FCKeditor.Config['LinkUpload'] =false;
FCKeditor.Config['ImageUpload'] =true;
FCKeditor.Config['FlashUpload'] =false;
FCKeditor.ToolbarSet ="Small"; 
FCKeditor.ReplaceTextarea(); 
</script>
    </td>
    </tr>

     <tr>
      <td height=30 align=center colspan=2>
      <input type="hidden" value="yes"  name="post">&nbsp;
      <input type="submit" value="提 交"  onclick="return Check_Feedback()" class="bt">&nbsp;
      <input type="button" value="返 回"   class="bt" onclick="location.href='<%=Get_Url("mem_fbklst")%>'"></li>
     </td>
    </tr>
   </table>
</form>

</div>
</div>