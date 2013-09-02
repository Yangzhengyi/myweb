<% @ Control language="c#" Inherits="PageAdmin.comment"%>
<div class="comments_box">
<ul><form method="post" name="c_f">
<li class="title"><%=HttpContext.GetGlobalResourceObject("pageadmin","comments_sign").ToString()%></li>
<li><textarea  id="c_content"  name="c_content" class="textarea"></textarea></li>
<li>
<%if(Comment_Anonymous=="1"){%>
<span id="span_anonymous" style="display:none"><%=HttpContext.GetGlobalResourceObject("pageadmin","comments_name").ToString()%><input type="textbox" name="c_username" id="c_username"  maxlength="20" size="12" class="tb">
<%=HttpContext.GetGlobalResourceObject("pageadmin","comments_yzm").ToString()%><input type='textbox' name='c_yzm'  id="c_yzm" size="5" maxlength='4' class="tb">&nbsp;<img src='/e/aspx/yzm.aspx' onclick="Code_Change('yzmcode')" align=absmiddle border=0 id="yzmcode" style='cursor:pointer;width:50px;height:18px'></span>
<%}%>
<span id="span_member" style="display:none"><%=HttpContext.GetGlobalResourceObject("pageadmin","username").ToString()%><input type="textbox" name="username" maxlength="40" size="12" class="tb">&nbsp;<%=HttpContext.GetGlobalResourceObject("pageadmin","password").ToString()%><input type="password" name="password" maxlength="40" size="12" class="tb"></span>
<input type="hidden" name="c_siteid" value="<%=Site_Id%>"><input type="hidden" name="c_detailid" value="<%=Detail_Id%>"><input type="hidden" name="c_table" value="<%=Thetable%>"><input type="hidden" name="c_checked" value="<%=Comment_Checked%>">
<%if(Comment_Anonymous=="1"){%>
<input type="checkbox" name="anonymous" value="1" checked onclick="c_type(this.checked)"><%=HttpContext.GetGlobalResourceObject("pageadmin","comments_anonymous").ToString()%>&nbsp;<%}%><input type="button" id="c_submit" name="c_submit" class="button" onclick="return check_comments()" value="<%=HttpContext.GetGlobalResourceObject("pageadmin","comments_submit").ToString()%>"/>
</li>
</form>
</ul>
</div>
<div><ul><a name="comments" style="display:none"></a>
<li class="comments_list" id="comments_list"></li>
<li class="comments_page" id="comments_page"></li>
</ul></div>
<script type="text/javascript">
<%if(Comment_Anonymous=="1"){%>
document.forms["c_f"].anonymous.checked=true;
document.getElementById("span_anonymous").style.display="";
<%}else{%>
document.getElementById("span_member").style.display="";
<%}%>
function c_type(checked)
 {
  if(checked)
   {
    document.getElementById("span_anonymous").style.display="";
    document.getElementById("span_member").style.display="none";
   }
  else
   {
    document.getElementById("span_anonymous").style.display="none";
    document.getElementById("span_member").style.display="";
   }
 }
Load_Comments("<%=Thetable%>","<%=Detail_Id%>",1,false);
</script>