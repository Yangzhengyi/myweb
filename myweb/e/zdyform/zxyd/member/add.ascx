<% @ Control  Language="C#" Inherits="PageAdmin.paform"%>
<% @ Import NameSpace="System.Data"%>
<% @ Import NameSpace="System.Data.OleDb"%>
<%Start();%>
<tr><td align=right class='tdhead'>预定路线<span style='color:#ff0000'>*</span></td><td><select name='pa_ydlx' id='pa_ydlx'   ><option value='1' <%if(post=="add"){Response.Write("国内物流"=="1"?"selected":"");}else{Response.Write(r("pa_ydlx")=="1"?"selected":"");}%>>国内物流</option><option value='2' <%if(post=="add"){Response.Write("国内物流"=="2"?"selected":"");}else{Response.Write(r("pa_ydlx")=="2"?"selected":"");}%>>国际物流</option></select></td></tr><tr><td align=right class='tdhead'>公司名称<span style='color:#ff0000'>*</span></td><td><input type=text name='pa_gsmc' id='pa_gsmc' value="<%if(post=="add"){Response.Write("");}else{Response.Write(r("pa_gsmc"));}%>"  maxlength='100' ></td></tr>
<tr><td align=right class='tdhead'>您的姓名<span style='color:#ff0000'>*</span></td><td><input type=text name='pa_xm' id='pa_xm' value="<%if(post=="add"){Response.Write("");}else{Response.Write(r("pa_xm"));}%>"  maxlength='100' ></td></tr>
<tr><td align=right class='tdhead'>联系电话<span style='color:#ff0000'>*</span></td><td><input type=text name='pa_tel' id='pa_tel' value="<%if(post=="add"){Response.Write("");}else{Response.Write(r("pa_tel"));}%>"  maxlength='100' ></td></tr>
<tr><td align=right class='tdhead'>电子邮件</td><td><input type=text name='pa_mail' id='pa_mail' value="<%if(post=="add"){Response.Write("");}else{Response.Write(r("pa_mail"));}%>"  maxlength='100' ></td></tr>
<tr><td align=right class='tdhead'>联系地址</td><td><input type=text name='pa_lxdz' id='pa_lxdz' value="<%if(post=="add"){Response.Write("");}else{Response.Write(r("pa_lxdz"));}%>"  maxlength='100' ></td></tr>
<tr><td align=right class='tdhead'>您的要求</td><td><textarea name='pa_yq' id='pa_yq'  ><%if(post=="add"){Response.Write("");}else{Response.Write(r("pa_yq"));}%></textarea></td></tr>
<tr><td colspan=2 align=center><input type='hidden' name='mustname' value='预定路线,公司名称,您的姓名,联系电话,'><input type='hidden' name='mustfield' value='pa_ydlx,pa_gsmc,pa_xm,pa_tel,'><input type='hidden' name='musttype' value='select,text,text,text,'></td></tr>
<script  type='text/javascript'>
function zxyd_zdycheck(){
return true;
}
</script>
<%End();%>






