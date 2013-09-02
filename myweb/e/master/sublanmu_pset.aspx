<% @ Page Language="C#" Inherits="PageAdmin.sublanmu_pset"%>
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
<li id="tab" name="tab"  onclick="showtab(0)" style="font-weight:bold">内容属性</li>
<li id="tab" name="tab"  onclick="showtab(1)">其他属性</li>
</ul>
</div>
<table border=0 cellpadding=0 cellspacing=0 width=100% align=center  class=table_style2>
<tr>
  <td valign=top>
<br>
<div name="tabcontent" id="tabcontent">

<table border=0 cellpadding=2 cellspacing=0 width=98% align=center>
 <tr>
  <td  height=30 width="100px"><input type="checkbox" name="showtype_set" value="1">信息筛选</td>
  <td><select name="D_ShowType" id="D_ShowType" onchange="change_showtype()">
	<option selected="selected" value="">所有信息</option>
	<option value="istop=1">&quot;置顶&quot;信息</option>
	<option value="isgood=1">&quot;推荐&quot;信息</option>
	<option value="isnew=1">&quot;最新&quot;信息</option>
	<option value="ishot=1">&quot;热门&quot;信息</option>

</select><select name="D_NotShowType" id="D_NotShowType" onchange="change_notshowtype()">
	<option selected="selected" value="">无排除信息</option>
	<option value="istop=0">排除&quot;置顶&quot;信息</option>
	<option value="isgood=0">排除&quot;推荐&quot;信息</option>
	<option value="isnew=0">排除&quot;最新&quot;信息</option>
	<option value="ishot=0">排除&quot;热门&quot;信息</option>
	<option value="reply_state=1">排除&quot;未回复&quot;信息</option>
	<option value="titlepic&lt;>''">排除&quot;标题图片&quot;为空信息</option>

</select> 条件：<input name="zdy_condition" type="text" maxlength="50" id="zdy_condition" size="25" />
</td>
 </tr>


  <tr>
  <td  height=30><input type="checkbox" name="showsort_set" value="1">信息排序</td>
  <td>
<select name="D_SortStr" id="D_SortStr">
	<option selected="selected" value="">默认排序</option>
	<option value="order by thedate desc,id desc">按发布日期↓</option>
	<option value="order by thedate asc,id asc">按发布日期↑</option>
	<option value="order by id desc">按ID↓</option>
	<option value="order by id">按ID↑</option>
	<option value="order by clicks desc,id desc">按点击量↓</option>
	<option value="order by downloads desc,id desc">按下载量↓</option>
	<option value="order by comments desc,id desc">按评论量↓</option>
</select>
</td>
 </tr>

  <tr>
  <td height=30><input type="checkbox" name="target_set" value="1">目标窗口</td>
  <td><select name="D_Target" id="D_Target"><option value="_self">本窗口</option><option value="_blank">新窗口</asp:ListItem></option></td>
 </tr>

  <tr>
  <td  height=30><input type="checkbox" name="show_num_set" value="1">每页显示数</td>
  <td><asp:TextBox id="Show_Num" runat="server" Text="20" Maxlength="5" size=5/> 条记录</td>
 </tr>

  <tr>
  <td  height=30><input type="checkbox" name="title_num_set" value="1">标题显示数</td>
  <td><asp:TextBox id="Title_Num" runat="server" Value="100" Maxlength="3" size=5/> 个字符</td>
 </tr>

  <tr>
  <td  height=30><input type="checkbox" name="titlepic_set" value="1">标题图片</td>
  <td>宽：<asp:TextBox id="TitlePic_Width" runat="server"  Maxlength="5" size=5 text="100"/>px 高：<asp:TextBox id="TitlePic_Height" runat="server" Maxlength="5" size=5 text="100"/>px 注：其中一个设置0表示自动缩放</td>
 </tr>
</table>
</div>

<div name="tabcontent" id="tabcontent" style="display:none">
<table border=0 cellpadding=2 cellspacing=0 width=95% align=center>
<tr style="display:<%=Is_Static=="1"?"":"none"%>">
  <td align="left" width=120px><input type="checkbox" name="list_html_set" value="1">子栏目页生成设置</td>
  <td align="left">
<asp:RadioButton id="List_Html_1" GroupName="listhtml" runat="server" checked/>动态页面
<asp:RadioButton id="List_Html_2" GroupName="listhtml" runat="server"/>伪静态
<asp:RadioButton id="List_Html_3" GroupName="listhtml" runat="server"/>静态(列表页只生成前<asp:TextBox id="List_Html_Num" size="5" runat="server" maxlength="10" Text="10" />页)

</td>
 </tr>

<tr style="display:<%=Is_Static=="1"?"":"none"%>">
  <td align="left"><input type="checkbox" name="detail_html_set" value="1">内容页生成设置</td>
 <td align="left">
<asp:RadioButton id="Detail_Html_1" GroupName="detailhtml" runat="server" checked/>动态页面
<asp:RadioButton id="Detail_Html_2" GroupName="detailhtml" runat="server"/>伪静态
<asp:RadioButton id="Detail_Html_3" GroupName="detailhtml" runat="server"/>静态页面
</td>
</tr>

<tr>
  <td align="left" width=130px><input type="checkbox" name="seo_title_set" value="1">seo标题</td>
  <td align="left"><asp:textBox TextMode="singleLine"  id="tb_title" runat="server" size=40 maxlength="150"  />
</td>
 </tr>

<tr>
  <td align="left"><input type="checkbox" name="seo_keywords_set" value="1">seo关键字</td>
 <td align="left" title="关键字之间用半角逗号分开"><asp:textBox TextMode="singleLine"  id="tb_keywords" runat="server" size=40 maxlength="150"  />
</td>
 </tr>

<tr>
  <td align="left"><input type="checkbox" name="seo_description_set" value="1">seo描述</td>
 <td align="left" title="控制在250字以内"><asp:TextBox TextMode="multiLine" Columns="40" rows="4"  id="tb_description"  runat="server" onkeyup="if(this.value.length>250)this.value=this.value.substring(0,250)"/>
</td>
 </tr>

<tr>
<td align=left><input type="checkbox" name="permissions_set" value="1">浏览权限</td>
<td>
  <input type="checkbox" name="Visiter_all" id="Visiter_0" value="0"  onclick="select_all()">所有来访者<br>
        <asp:Repeater id="P_permissions" runat="server">
         <ItemTemplate>
           <input type="checkbox" name="Visiter" id="Visiter_<%#DataBinder.Eval(Container.DataItem,"id")%>" value="<%#DataBinder.Eval(Container.DataItem,"id")%>" ><%#DataBinder.Eval(Container.DataItem,"m_type")%>&nbsp;
         </ItemTemplate>
        </asp:Repeater>
      </td>
</tr>
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
document.forms[0].action="sublanmu_pset.aspx?lanmuname=<%=Server.UrlEncode(Request.QueryString["lanmuname"])%>";
document.getElementById("ids").value=parent.document.getElementById("ids").value;
if(GetCookie("tab")!="")
 {
  showtab(GetCookie("tab"));
 }  
var Visitor="<%=Permissions%>";
var AVisitor=Visitor.split(',');
if(Visitor=="" || Visitor=="0")
 {
   document.getElementById("Visiter_0").checked=true;
   lock_mem_check();
 }
else
 {
   for(i=0;i<AVisitor.length;i++)
    {
      try{
         document.getElementById("Visiter_"+AVisitor[i]).checked=true;
         }
       catch(ex)
         {
         }
    }
 }
function lock_mem_check()
 {
  for(i=0;i<document.forms[0].Visiter.length;i++)
     {
       document.forms[0].Visiter[i].checked=true;
       document.forms[0].Visiter[i].disabled=true;
    }
 }

function unlock_mem_check()
 {
  for(i=0;i<document.forms[0].Visiter.length;i++)
     {
       //document.forms[0].Visiter[i].checked=false;
       document.forms[0].Visiter[i].disabled=false;
    }
 }

function select_all()
 {
   var obj=document.getElementById("Visiter_0");
   if(obj.checked)
    {
      lock_mem_check();
    }
   else
    {
     unlock_mem_check()
    }
 }


<% if(TheTable=="zdy")
     {
%>
 document.getElementsByName("tab")[1].style.display="none";
<%}%>
var Sort_Id="<%=Sort_Id%>";
var Sort_obj=document.getElementById("Sort");
if(Sort_obj!=null && Sort_Id!="")
{
 document.getElementById("Sort").value=Sort_Id;
 var I=document.getElementById("Sort").selectedIndex;
 if(I==-1){document.getElementById("Sort").selectedIndex=0}
}

var obj1=document.getElementById("D_ShowType");
var obj2=document.getElementById("D_NotShowType");
var obj3=document.getElementById("zdy_condition");

function change_showtype()
 {
   var v1=obj1.value;
   var v2=obj2.value;
   if(v2!="")
    {
      if(v1=="")
       {
        obj3.value="and "+v2;
       }
      else
       {
        obj3.value="and "+v1+" and "+v2;
       }
    }
  else
    {
      obj3.value="and "+v1;
    }
  if(v2=="" && v1=="")
   {
    obj3.value="";
   }
 }

function change_notshowtype()
 {
  change_showtype();
 }

function c_f()
  {
   <% if(TheTable!="zdy")
     {
   %>
    var obj=document.getElementById("D_Model")
    if(obj.selectedIndex==0)
     {
       showtab(0);
       alert("请选择子栏目模型!");
       obj.focus();
       return false;
     }

    obj=document.getElementById("D_Model_Detail")
    if(obj.selectedIndex==0)
     {
       showtab(0);
       alert("请选择内容页模型!");
       obj.focus();
       return false;
     }
    obj=document.getElementById("Show_Num")
    if(obj.value=="" || isNaN(obj.value))
     {
       showtab(0);
       alert("每页显示数填写错误!");
       obj.focus();
       return false;
     }
  <%}%>
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



