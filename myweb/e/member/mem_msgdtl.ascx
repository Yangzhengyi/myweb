<% @  Control Language="c#" Inherits="PageAdmin.mem_msgdtl"%>
<div class="current_location">
<ul>
<li class="current_location_1">当前位置：<a href="/member/index.aspx?language=<%=Request.QueryString["language"]%>">会员中心</a> &gt; 收件箱</li>
<li class="current_location_2">收件箱</li>
</ul>
</div>
<div class="sublanmu_box">
<div class="sublanmu_content">
<div class="tabdiv"><ul>
 <li class="c"><a href='<%=Get_Url("mem_msg")%>'>收件箱</a></li>
 <li><a href='<%=Get_Url("mem_msgout")%>'>发件箱</a></li>
 <li><a href='<%=Get_Url("mem_msgsend")%>'>发信息</a></li>
 <li><a href='<%=Get_Url("mem_friends")%>'>我的好友</a></li>
 <li><a href='<%=Get_Url("mem_friendssort")%>'>好友分类</a></li>
 <li><a href='<%=Get_Url("mem_blacklist")%>'>黑名单</a></li>
</ul></div>
<form runat="server">
<table border=0 cellpadding="5" cellspacing=0  align=center class="member_table_1">
  <tr>
     <td><b>发件人：</b><a href='<%=Get_FriendUrl("mem_friendsdtl",Sender)%>'><%=Sender%></a><%=TrueName==""?"":""%>
    </td>
  </tr>
  <tr>
     <td><b>发件时间：</b><%=TheDate%>
    </td>
  </tr>
  <tr>
     <td><b>标题：</b><%=Title%></td>
  </tr>
   <tr>
       <td><p style="width:100%;overflow-x:auto;"><%=Content%><br></p></td>
     </tr> 
   <tr>
       <td height=30px>
      <input type="button" value=" 返回 "  onclick="location.href='<%=Get_Url("mem_msg")%>'" class="bt">&nbsp;
      <input type="button" value=" 回复 "  onclick="location.href='<%=Get_ReplyUrl("mem_msgsend")%>'" class="bt">&nbsp;
      <asp:Button runat="server"  Text=" 删除 "  id="Delete" OnClick="Data_Delete" cssclass="bt" />
     </td>
     </tr> 
 </table>
</form>
</div>
</div>
