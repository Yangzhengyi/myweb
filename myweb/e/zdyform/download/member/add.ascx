﻿<% @ Control  Language="C#" Inherits="PageAdmin.paform"%>
<% @ Import NameSpace="System.Data"%>
<% @ Import NameSpace="System.Data.OleDb"%>
<%Start();%>
<tr><td align=right class='tdhead'>文件名称<span style='color:#ff0000'>*</span></td><td><input type=text name='title' id='title' value="<%if(post=="add"){Response.Write("");}else{Response.Write(r("title"));}%>" size="40" maxlength='100' ></td></tr>
<tr><td align=right class='tdhead'>附件缩略图</td><td><input ondblclick="if(this.value!='')window.open(this.value)" type=text name='titlepic' id='titlepic'  value="<%if(post=="add"){Response.Write("");}else{Response.Write(r("titlepic"));}%>" size="50" ><a href="javascript:delete_file('download','titlepic',<%=InforId%>)" id="delete_titlepic" style="padding-left:2px;display:<%=r("titlepic")==""?"none":""%>" title='删除图片'><img src=/e/images/public/del.gif border=0></a><a id='upload_titlepic' href="javascript:open_upload('<%=SiteId%>','','image','download','titlepic','titlepic')" style="display:<%=r("titlepic")==""?"":"none"%>"><img src='/e/images/public/attachimg.gif' border=0  hspace=2 alt='上传图片' align=absbottom></a></td></tr><tr><td align=right class='tdhead'>作者/发布人<span style='color:#ff0000'>*</span></td><td><input type=text name='pa_author' id='pa_author' value="<%if(post=="add"){Response.Write("");}else{Response.Write(r("pa_author"));}%>"  maxlength='100' ></td></tr>
<tr><td align=right class='tdhead'>文件大小<span style='color:#ff0000'>*</span></td><td><input type=text name='pa_size' id='pa_size' value="<%if(post=="add"){Response.Write("");}else{Response.Write(r("pa_size"));}%>"  maxlength='100' > 单位m</td></tr>
<tr><td align=right class='tdhead'>运行环境<span style='color:#ff0000'>*</span></td><td> <input type=checkbox  value='Win9x' name='pa_yxhj' id='pa_yxhj'>Win9x <input type=checkbox  value='NT' name='pa_yxhj' id='pa_yxhj'>NT <input type=checkbox  value='Win2000' name='pa_yxhj' id='pa_yxhj'>Win2000 <input type=checkbox  value='WinXP' name='pa_yxhj' id='pa_yxhj'>WinXP <input type=checkbox  value='Win2003' name='pa_yxhj' id='pa_yxhj'>Win2003 <input type=checkbox  value='Win7' name='pa_yxhj' id='pa_yxhj'>Win7 <input type=checkbox  value='unix' name='pa_yxhj' id='pa_yxhj'>unix<%if(post=="add"){%><script type="text/javascript">zdyform_checkbox('Win9x,NT,Win2000,WinXP,Win2003,Win7','pa_yxhj')</script><%}else{%><script type="text/javascript">zdyform_checkbox('<%=r("pa_yxhj")%>','pa_yxhj')</script><%}%></td></tr><tr><td align=right class='tdhead'>文件格式<span style='color:#ff0000'>*</span></td><td><select name='pa_geshi' id='pa_geshi'   ><option value='rar' <%if(post=="add"){Response.Write(""=="rar"?"selected":"");}else{Response.Write(r("pa_geshi")=="rar"?"selected":"");}%>>rar压缩包</option><option value='zip' <%if(post=="add"){Response.Write(""=="zip"?"selected":"");}else{Response.Write(r("pa_geshi")=="zip"?"selected":"");}%>>zip压缩包</option><option value='doc' <%if(post=="add"){Response.Write(""=="doc"?"selected":"");}else{Response.Write(r("pa_geshi")=="doc"?"selected":"");}%>>word文档</option><option value='xls' <%if(post=="add"){Response.Write(""=="xls"?"selected":"");}else{Response.Write(r("pa_geshi")=="xls"?"selected":"");}%>>excel文档</option><option value='pdf' <%if(post=="add"){Response.Write(""=="pdf"?"selected":"");}else{Response.Write(r("pa_geshi")=="pdf"?"selected":"");}%>>pdf文档</option><option value='ppt' <%if(post=="add"){Response.Write(""=="ppt"?"selected":"");}else{Response.Write(r("pa_geshi")=="ppt"?"selected":"");}%>>ppt文档</option><option value='file' <%if(post=="add"){Response.Write(""=="file"?"selected":"");}else{Response.Write(r("pa_geshi")=="file"?"selected":"");}%>>其他格式</option></select></td></tr><tr><td align=right class='tdhead'>解压密码</td><td><input type=text name='pa_jspass' id='pa_jspass' value="<%if(post=="add"){Response.Write("");}else{Response.Write(r("pa_jspass"));}%>"  maxlength='100' ></td></tr>
<tr><td align=right class='tdhead'>授权方式<span style='color:#ff0000'>*</span></td><td><select name='pa_sqfs' id='pa_sqfs'   ><option value='免费版' <%if(post=="add"){Response.Write("免费版"=="免费版"?"selected":"");}else{Response.Write(r("pa_sqfs")=="免费版"?"selected":"");}%>>免费版</option><option value='共享版' <%if(post=="add"){Response.Write("免费版"=="共享版"?"selected":"");}else{Response.Write(r("pa_sqfs")=="共享版"?"selected":"");}%>>共享版</option><option value='适用版' <%if(post=="add"){Response.Write("免费版"=="适用版"?"selected":"");}else{Response.Write(r("pa_sqfs")=="适用版"?"selected":"");}%>>适用版</option></select></td></tr><tr><td align=right class='tdhead'>附件组<span style='color:#ff0000'>*</span><br><input type='button' value='增加文件' class='f_bt' onclick="open_files('<%=SiteId%>','0','download','pa_fj','files','<%=InforId%>')"><br><input type='button' id='Edit_pa_fj' value='刷新文件' class='f_bt' onclick="Iframe_Submit('iframe_pa_fj')" style='display:none'></td><td><div id='pa_fj_box' style='width:98%;border:1px solid #cccccc;background-color:#ffffff;padding:5px 5px 5px 5px'><input type=hidden value='0' name='pa_fj' id='pa_fj'><iframe  id='iframe_pa_fj' name='iframe_pa_fj' allowtransparency='true' src='/e/aspx/file_list.aspx?id=<%=InforId%>&table=download&field=pa_fj&fieldtype=files&sid=<%=SiteId%>&from=member' frameborder=0 scroling=auto height=150px width=100% marginwidth=0 marginheight=0 align=center></iframe></div></td></tr><tr><td align=right class='tdhead'>附件介绍<span style='color:#ff0000'>*</span></td><td><textarea name='content' id='content'200  ><%if(post=="add"){Response.Write("");}else{Response.Write(r("content"));}%></textarea><script type='text/javascript' src='/e/incs/fckeditor/fckeditor.js'></script><script  type='text/javascript'>var FCKeditor = new FCKeditor('content');FCKeditor.BasePath = '/e/incs/fckeditor/';FCKeditor.Height = 200;FCKeditor.Config['LinkUpload'] = true;FCKeditor.Config['ImageUpload'] =true;FCKeditor.Config['FlashUpload'] =true;FCKeditor.Config['LinkBrowser'] = false;FCKeditor.Config['ImageBrowser'] =false;FCKeditor.Config['FlashBrowser'] =false;FCKeditor.ToolbarSet ='Simple';FCKeditor.ReplaceTextarea();</script></td></tr>
<tr><td align=right class='tdhead'>发布日期<span style='color:#ff0000'>*</span></td><td><input type=text name='thedate' id='thedate' value="<%if(post=="add"){Response.Write(""==""?DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"):"");}else{Response.Write(DateTime.Parse(r("thedate")).ToString("yyyy-MM-dd HH:mm:ss"));}%>"  maxlength='100' ><a href="javascript:open_calendar('thedate',1)"><img src=/e/images/icon/date.gif border=0 hspace=2 align=absbottom></a></td></tr>
<tr><td colspan=2 align=center><input type='hidden' name='mustname' value='文件名称,作者/发布人,文件大小,运行环境,文件格式,授权方式,附件组,附件介绍,发布日期,'><input type='hidden' name='mustfield' value='title,pa_author,pa_size,pa_yxhj,pa_geshi,pa_sqfs,pa_fj,content,thedate,'><input type='hidden' name='musttype' value='text,text,text,checkbox,select,select,files,editor,text,'></td></tr>
<script  type='text/javascript'>
function download_zdycheck(){
return true;
}
</script>
<%End();%>






