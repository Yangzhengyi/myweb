﻿<% @ Control  Language="C#" Inherits="PageAdmin.paform"%>
<% @ Import NameSpace="System.Data"%>
<% @ Import NameSpace="System.Data.OleDb"%>
<%Start();%>
<tr><td align=right class='tdhead'>职位名称<span style='color:#ff0000'>*</span></td><td><input type=text name='title' id='title' value="<%if(post=="add"){Response.Write("");}else{Response.Write(r("title"));}%>"  maxlength='100' ></td></tr>
<tr><td align=right class='tdhead'>薪资待遇<span style='color:#ff0000'>*</span></td><td><select name='pa_xz' id='pa_xz'   ><option value='面议' <%if(post=="add"){Response.Write(""=="面议"?"selected":"");}else{Response.Write(r("pa_xz")=="面议"?"selected":"");}%>>面议</option><option value='1000元以下' <%if(post=="add"){Response.Write(""=="1000元以下"?"selected":"");}else{Response.Write(r("pa_xz")=="1000元以下"?"selected":"");}%>>1000元以下</option><option value='1000-2000元' <%if(post=="add"){Response.Write(""=="1000-2000元"?"selected":"");}else{Response.Write(r("pa_xz")=="1000-2000元"?"selected":"");}%>>1000-2000元</option><option value='2000-3000元' <%if(post=="add"){Response.Write(""=="2000-3000元"?"selected":"");}else{Response.Write(r("pa_xz")=="2000-3000元"?"selected":"");}%>>2000-3000元</option><option value='3000-5000元' <%if(post=="add"){Response.Write(""=="3000-5000元"?"selected":"");}else{Response.Write(r("pa_xz")=="3000-5000元"?"selected":"");}%>>3000-5000元</option><option value='5000-8000元' <%if(post=="add"){Response.Write(""=="5000-8000元"?"selected":"");}else{Response.Write(r("pa_xz")=="5000-8000元"?"selected":"");}%>>5000-8000元</option><option value='8000-12000元' <%if(post=="add"){Response.Write(""=="8000-12000元"?"selected":"");}else{Response.Write(r("pa_xz")=="8000-12000元"?"selected":"");}%>>8000-12000元</option><option value='12000-20000元' <%if(post=="add"){Response.Write(""=="12000-20000元"?"selected":"");}else{Response.Write(r("pa_xz")=="12000-20000元"?"selected":"");}%>>12000-20000元</option><option value='20000-25000元' <%if(post=="add"){Response.Write(""=="20000-25000元"?"selected":"");}else{Response.Write(r("pa_xz")=="20000-25000元"?"selected":"");}%>>20000-25000元</option><option value='25000元以上' <%if(post=="add"){Response.Write(""=="25000元以上"?"selected":"");}else{Response.Write(r("pa_xz")=="25000元以上"?"selected":"");}%>>25000元以上</option></select></td></tr><tr><td align=right class='tdhead'>学历要求<span style='color:#ff0000'>*</span></td><td><select name='pa_xueli' id='pa_xueli'   ><option value='不限' <%if(post=="add"){Response.Write(""=="不限"?"selected":"");}else{Response.Write(r("pa_xueli")=="不限"?"selected":"");}%>>不限</option><option value='高中' <%if(post=="add"){Response.Write(""=="高中"?"selected":"");}else{Response.Write(r("pa_xueli")=="高中"?"selected":"");}%>>高中</option><option value='技校' <%if(post=="add"){Response.Write(""=="技校"?"selected":"");}else{Response.Write(r("pa_xueli")=="技校"?"selected":"");}%>>技校</option><option value='中专' <%if(post=="add"){Response.Write(""=="中专"?"selected":"");}else{Response.Write(r("pa_xueli")=="中专"?"selected":"");}%>>中专</option><option value='大专' <%if(post=="add"){Response.Write(""=="大专"?"selected":"");}else{Response.Write(r("pa_xueli")=="大专"?"selected":"");}%>>大专</option><option value='本科' <%if(post=="add"){Response.Write(""=="本科"?"selected":"");}else{Response.Write(r("pa_xueli")=="本科"?"selected":"");}%>>本科</option><option value='硕士' <%if(post=="add"){Response.Write(""=="硕士"?"selected":"");}else{Response.Write(r("pa_xueli")=="硕士"?"selected":"");}%>>硕士</option><option value='博士' <%if(post=="add"){Response.Write(""=="博士"?"selected":"");}else{Response.Write(r("pa_xueli")=="博士"?"selected":"");}%>>博士</option></select></td></tr><tr><td align=right class='tdhead'>工作年限<span style='color:#ff0000'>*</span></td><td><select name='pa_nianxian' id='pa_nianxian'   ><option value='不限' <%if(post=="add"){Response.Write(""=="不限"?"selected":"");}else{Response.Write(r("pa_nianxian")=="不限"?"selected":"");}%>>不限</option><option value='1年以下' <%if(post=="add"){Response.Write(""=="1年以下"?"selected":"");}else{Response.Write(r("pa_nianxian")=="1年以下"?"selected":"");}%>>1年以下</option><option value='1-2年' <%if(post=="add"){Response.Write(""=="1-2年"?"selected":"");}else{Response.Write(r("pa_nianxian")=="1-2年"?"selected":"");}%>>1-2年</option><option value='3-5年' <%if(post=="add"){Response.Write(""=="3-5年"?"selected":"");}else{Response.Write(r("pa_nianxian")=="3-5年"?"selected":"");}%>>3-5年</option><option value='6-7年' <%if(post=="add"){Response.Write(""=="6-7年"?"selected":"");}else{Response.Write(r("pa_nianxian")=="6-7年"?"selected":"");}%>>6-7年</option><option value='8-10年' <%if(post=="add"){Response.Write(""=="8-10年"?"selected":"");}else{Response.Write(r("pa_nianxian")=="8-10年"?"selected":"");}%>>8-10年</option><option value='10年以上' <%if(post=="add"){Response.Write(""=="10年以上"?"selected":"");}else{Response.Write(r("pa_nianxian")=="10年以上"?"selected":"");}%>>10年以上</option></select></td></tr><tr><td align=right class='tdhead'>招聘人数<span style='color:#ff0000'>*</span></td><td><input type=text name='pa_num' id='pa_num' value="<%if(post=="add"){Response.Write("");}else{Response.Write(r("pa_num"));}%>" onkeyup="if(isNaN(value))execCommand('undo')"  onblur="$('pa_num').value=Trim($('pa_num').value)" maxlength='100' ></td></tr>
<tr><td align=right class='tdhead'>工作地点<span style='color:#ff0000'>*</span></td><td><input type=text name='pa_place' id='pa_place' value="<%if(post=="add"){Response.Write("");}else{Response.Write(r("pa_place"));}%>"  maxlength='100' ></td></tr>
<tr><td align=right class='tdhead'>职位描述<span style='color:#ff0000'>*</span></td><td><textarea name='content' id='content' cols="80"  rows="15" ><%if(post=="add"){Response.Write("");}else{Response.Write(r("content"));}%></textarea></td></tr>
<tr><td align=right class='tdhead'>发布日期<span style='color:#ff0000'>*</span></td><td><input type=text name='thedate' id='thedate' value="<%if(post=="add"){Response.Write(""==""?DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"):"");}else{Response.Write(DateTime.Parse(r("thedate")).ToString("yyyy-MM-dd HH:mm:ss"));}%>"  maxlength='100' ><a href="javascript:open_calendar('thedate',1)"><img src=/e/images/icon/date.gif border=0 hspace=2 align=absbottom></a></td></tr>
<tr><td colspan=2 align=center><input type='hidden' name='mustname' value='职位名称,薪资待遇,学历要求,工作年限,招聘人数,工作地点,职位描述,发布日期,'><input type='hidden' name='mustfield' value='title,pa_xz,pa_xueli,pa_nianxian,pa_num,pa_place,content,thedate,'><input type='hidden' name='musttype' value='text,select,select,select,text,text,textarea,text,'></td></tr>
<script  type='text/javascript'>
function job_zdycheck(){
return true;
}
</script>
<%End();%>





