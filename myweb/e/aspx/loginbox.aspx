<% @ Page  language="c#"  Inherits="PageAdmin.loginbox"%>
function LoadLoginBox_<%=Id%>()
{
var LoginBoxHtml="<form name='loginbox_<%=Id%>' method='post'>";
LoginBoxHtml+="<input type='hidden' name='login' value='yes'>";
LoginBoxHtml+="<input type='hidden' name='To_Url' value='<%=ToUrl%>'>";
LoginBoxHtml+="<input type='hidden' name='Show_Yzm' value='<%=Show_Code%>'>";
<%if (Show_Style=="0"){
if(HasLogin=="0"){
%>
LoginBoxHtml+="<ul>";
LoginBoxHtml+="<li class='loginbox_item'>用户名：<input type='textbox' name='username' class='loginbox_textbox' maxlength='16'></li>";
LoginBoxHtml+="<li class='loginbox_item'>密&nbsp;&nbsp;&nbsp;码：<input type='password' name='password' class='loginbox_textbox' maxlength='16'></li>";
<%if(Show_Code=="1"){%>LoginBoxHtml+="<li class='loginbox_item'>验证码：<input type='textbox' name='vcode' class='loginbox_textbox_yzm' maxlength='4'>&nbsp;<img src='/e/aspx/yzm.aspx' onclick=\"Code_Change('yzcode_<%=Id%>')\"  align=absmiddle border=0 id='yzcode_<%=Id%>'  alt='点击更换' style='cursor:pointer;width:50px;height:18px' ></li>";<%}%>
LoginBoxHtml+="<li class='loginbox_item'>&nbsp;&nbsp;<%if(ShowReg=="1"){%><a href='<%=Get_Url("reg")%>'>注册会员</a><%}%>&nbsp;&nbsp;<input type='submit' value='<%=LoginName%>' class='loginbox_submit' onclick='return LoginBox(<%=Id%>,<%=SiteId%>)'></li>";
LoginBoxHtml+="</ul>";
<%
 }
else
{
%>
LoginBoxHtml+="会员名：<%=UserName%><%if(msg_icon_show=="1"){%><a href='<%=Get_Url("mem_msg")%>'><img src='/e/images/public/message.gif' border=0 width=20px height=17px></a><%}%><br>";
LoginBoxHtml+="类&nbsp;&nbsp;&nbsp;别：<%=UserType%><br>";
LoginBoxHtml+="<a href='<%=Get_Url("index")%>' class='logined_href'>会员中心</a>&nbsp;&nbsp; <%if(order_cart_show=="1"){%><a href=# onclick=\"ordercart('<%=SiteId%>','')\" class='logined_href'>购物车</a>&nbsp;&nbsp; <%}%><a href='<%=Get_Url("exit")%>' class='logined_href'>注销退出</a>";
<%
 }
}
else
 {
 if(HasLogin=="0")
  {
%>
LoginBoxHtml+="<li class='loginbox_item' style='float:left'>用户名：<input type='textbox' name='username' class='loginbox_textbox' maxlength='16'></li>";
LoginBoxHtml+="<li class='loginbox_item' style='float:left'>密 码：<input type='password' name='password' class='loginbox_textbox' maxlength='16'></li>";
<%if(Show_Code=="1"){%>LoginBoxHtml+="<li class='loginbox_item' style='float:left'>验证码：<input type='textbox' name='vcode' class='loginbox_textbox_yzm' maxlength='4'>&nbsp;<img src='/e/aspx/yzm.aspx' onclick=\"Code_Change('yzcode_<%=Id%>')\" align=absmiddle border=0 id='yzcode_<%=Id%>' style='cursor:pointer;width:50px;height:18px' ></li>";<%}%>
LoginBoxHtml+="<li class='loginbox_item' style='float:left'>&nbsp;<input type='submit' value='<%=LoginName%>' class='loginbox_submit' onclick='return LoginBox(<%=Id%>,<%=SiteId%>)'><%if(ShowReg=="1"){%>&nbsp;&nbsp;<a href='<%=Get_Url("reg")%>'>注册会员</a><%}%></li>";
LoginBoxHtml+="<ul style='clear:both'>";
LoginBoxHtml+="</ul>";
<%
 }
else
{
%>
LoginBoxHtml+="会员名：<%=UserName%><%if(msg_icon_show=="1"){%><a href='<%=Get_Url("mem_msg")%>'><img src='/e/images/public/message.gif' border=0 width=20px height=17px></a><%}%>&nbsp;&nbsp;";
LoginBoxHtml+="类别：<%=UserType%>&nbsp;&nbsp;";
LoginBoxHtml+="<a href='<%=Get_Url("index")%>' class='logined_href'>会员中心</a>&nbsp;&nbsp;<%if(order_cart_show=="1"){%><a href=# onclick=\"ordercart('<%=SiteId%>','')\" class='logined_href'>购物车</a>&nbsp;&nbsp;<%}%><a href='<%=Get_Url("exit")%>' class='logined_href'>注销退出</a>";
<%
 }
}
%>
LoginBoxHtml+="</form>";
document.write("<div class='loginbox'>"+LoginBoxHtml+"</div>");
}
LoadLoginBox_<%=Id%>();
