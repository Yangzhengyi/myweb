﻿<% @ Control  Language="C#" Inherits="PageAdmin.paform"%>
<% @ Import NameSpace="System.Data"%>
<% @ Import NameSpace="System.Data.OleDb"%>
<%Start();%>
<tr><td align=right class='tdhead'>标题<span style='color:#ff0000'>*</span></td><td><input type=text name='title' id='title' value="<%if(post=="add"){Response.Write("");}else{Response.Write(r("title"));}%>" style='width:400px'   maxlength='100' ></td></tr>
<tr><td align=right class='tdhead'>标题样式</td><td><input type=text name='pa_style' id='pa_style' value="<%if(post=="add"){Response.Write("");}else{Response.Write(r("pa_style"));}%>"  maxlength='100' ></td></tr>
<tr><td align=right class='tdhead'>标题图片</td><td><input ondblclick="if(this.value!='')window.open(this.value)" type=text name='titlepic' id='titlepic'  value="<%if(post=="add"){Response.Write("");}else{Response.Write(r("titlepic"));}%>"  ><a href="javascript:delete_file('article','titlepic',<%=InforId%>)" id="delete_titlepic" style="padding-left:2px;display:<%=r("titlepic")==""?"none":""%>" title='删除图片'><img src=/e/images/public/del.gif border=0></a><a id='upload_titlepic' href="javascript:open_upload('<%=SiteId%>','','image','article','titlepic','titlepic')" style="display:<%=r("titlepic")==""?"":"none"%>"><img src='/e/images/public/attachimg.gif' border=0  hspace=2 alt='上传图片' align=absbottom></a></td></tr><tr><td align="right">作者 </td><td>
<input type="text" name="pa_autor" id="pa_autor" value="<%=r("pa_autor")%>" maxlength=20>
<select onchange="if(this.options[this.selectedIndex].value!='')document.getElementById('pa_autor').value=this.options[this.selectedIndex].value">
<option value="">选择作者</option>
<option value="PageAdmin">PageAdmin</option>
<option value="佚名">佚名</option>
<option value="管理员">管理员</option>
<option value="不详">不详</option>
</select>
</td></tr>
<tr><td align="right">标题样式 </td><td>
<input type="text" name="pa_source" id="pa_source" value="<%=r("pa_source")%>" maxlength=20>
<select onchange="if(this.options[this.selectedIndex].value!='')document.getElementById('pa_source').value=this.options[this.selectedIndex].value">
<option value="">选择来源</option>
<option value="本站原创">本站原创</option>
<option value="办公室">办公室</option>
<option value="公司">公司</option>
<option value="集团">集团</option>
</select>
</td></tr>
<tr><td align=right class='tdhead'>视频</td><td><input ondblclick="if(this.value!='')window.open(this.value)" type=text name='pa_video' id='pa_video'  value="<%if(post=="add"){Response.Write("");}else{Response.Write(r("pa_video"));}%>" size="50" ><a href="javascript:delete_file('article','pa_video',<%=InforId%>)" id="delete_pa_video" style="padding-left:2px;display:<%=r("pa_video")==""?"none":""%>" title='删除文件'><img src=/e/images/public/del.gif border=0></a><a id='upload_pa_video' href="javascript:open_upload('<%=SiteId%>','','file','article','pa_video','pa_video')" style="display:<%=r("pa_video")==""?"":"none"%>"><img src='/e/images/public/attachment.gif' border=0  hspace=2 alt='上传文件' align=absbottom></a></td></tr><tr><td align=right class='tdhead'>附件</td><td><input ondblclick="if(this.value!='')window.open(this.value)" type=text name='pa_fj' id='pa_fj'  value="<%if(post=="add"){Response.Write("");}else{Response.Write(r("pa_fj"));}%>" size="50" ><a href="javascript:delete_file('article','pa_fj',<%=InforId%>)" id="delete_pa_fj" style="padding-left:2px;display:<%=r("pa_fj")==""?"none":""%>" title='删除文件'><img src=/e/images/public/del.gif border=0></a><a id='upload_pa_fj' href="javascript:open_upload('<%=SiteId%>','','file','article','pa_fj','pa_fj')" style="display:<%=r("pa_fj")==""?"":"none"%>"><img src='/e/images/public/attachment.gif' border=0  hspace=2 alt='上传文件' align=absbottom></a></td></tr><tr><td align=right class='tdhead'>图片组<br><input type='button' value='增加图片' class='f_bt' onclick="open_files('<%=SiteId%>','0','article','pa_pics','images','<%=InforId%>')"><br><input type='button' id='Edit_pa_pics' value='刷新图片' class='f_bt' onclick="Iframe_Submit('iframe_pa_pics')" style='display:none'></td><td><div id='pa_pics_box' style='width:98%;border:1px solid #cccccc;background-color:#ffffff;padding:5px 5px 5px 5px'><input type=hidden value='0' name='pa_pics' id='pa_pics'><iframe  id='iframe_pa_pics' name='iframe_pa_pics' allowtransparency='true' src='/e/aspx/file_list.aspx?id=<%=InforId%>&table=article&field=pa_pics&fieldtype=images&sid=<%=SiteId%>&from=member' frameborder=0 scroling=auto height=150px width=100% marginwidth=0 marginheight=0 align=center></iframe></div></td></tr><tr><td align=right class='tdhead'>发布日期</td><td><input type=text name='thedate' id='thedate' value="<%if(post=="add"){Response.Write(""==""?DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"):"");}else{Response.Write(DateTime.Parse(r("thedate")).ToString("yyyy-MM-dd HH:mm:ss"));}%>"  maxlength='100' ><a href="javascript:open_calendar('thedate',1)"><img src=/e/images/icon/date.gif border=0 hspace=2 align=absbottom></a></td></tr>
<tr><td align=right class='tdhead'>简介</td><td><textarea name='pa_introduct' id='pa_introduct' cols="80" rows="6" ><%if(post=="add"){Response.Write("");}else{Response.Write(r("pa_introduct"));}%></textarea></td></tr>
<tr><td align=right class='tdhead'>内容</td><td><textarea name='content' id='content'  ><%if(post=="add"){Response.Write("");}else{Response.Write(r("content"));}%></textarea><script type='text/javascript' src='/e/incs/fckeditor/fckeditor.js'></script><script  type='text/javascript'>var FCKeditor = new FCKeditor('content');FCKeditor.BasePath = '/e/incs/fckeditor/';FCKeditor.Height = 350;FCKeditor.Config['LinkUpload'] = true;FCKeditor.Config['ImageUpload'] =true;FCKeditor.Config['FlashUpload'] =true;FCKeditor.Config['LinkBrowser'] = false;FCKeditor.Config['ImageBrowser'] =false;FCKeditor.Config['FlashBrowser'] =false;FCKeditor.ToolbarSet ='Basic';FCKeditor.ReplaceTextarea();</script></td></tr>
<tr><td colspan=2 align=center><input type='hidden' name='mustname' value='标题,'><input type='hidden' name='mustfield' value='title,'><input type='hidden' name='musttype' value='text,'></td></tr>
<script  type='text/javascript'>
function article_zdycheck(){
return true;
}
</script>
<%End();%>






