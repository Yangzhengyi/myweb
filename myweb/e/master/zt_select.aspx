<% @ Page Language="C#"  Inherits="PageAdmin.zt_select"%>
<% @ Register TagPrefix="aspcn" TagName="uc_head" src="head.ascx" %>
<aspcn:uc_head runat="server"/> 
<body topmargin=0 bottommargin=0 leftmargin=0  rightmargin=0>
<center>
<table  border=0 cellpadding=0 cellspacing=0 width=98% >
 <tr><td height=10></td></tr>
 <tr><td class=table_style1><b>专题列表</b></td></tr>
 <tr><td height=10 ></td></tr>
</table>
<table border=0 cellpadding=10 cellspacing=0 width=98% >
 <tr>
<td valign=top align="left">

<form runat="server">
<table border=0 cellpadding=5 cellspacing=0 width=100% align=center  class=table_style2>
<tr>
  <td valign=top align="left">

<table border=0 cellpadding=0 cellspacing=2 width=98% align=center>
<tr>
  <td height=25><b>当前表</b>:专题列表</td>
 </tr>
</table>

<table border=0 cellpadding=0 cellspacing=0 width=98%  style="table-layout:fixed;" align=center>
<tr>
<td align="left" width="130px">
每页<asp:TextBox id="Tb_pagesize" size="3" maxlength="10"  Runat="server"/>条记录
</td>
<td align="right">
<select name="siteid" id="siteid" style="display:<%=TheMaster=="admin"?"":"none"%>"  onchange="Go()"><%=Site_List%></select>
<select  name="sortid" id="sortid" onchange="Go()"><option value="">所有类别</option><%=Sort_List%><option value="0" style="color:#ff0000">未分类专题</option></select>
标题搜索：<input text="text" id="s_keyword" size="10">
<input type="button" value="确定" class="button" onclick="Go()">
 </td>
 </tr>
</table>
<table border=0 cellpadding=0 cellspacing=2 width=98% align=center>
      <tr>
        <td  align="left">
            <table border=0 cellpadding=0 cellspacing=1 width=100% class=tablestyle >
                <tr>
                  <td align=center width=75% class=white>专题标题</td>
                  <td align=center width=15% class=white height=20>提交时间</td>
                  <td align=center width=10% class=white height=20>发布人</td>
                </tr>
              </table>
           <table border=0 cellpadding=0 cellspacing=0 width=100% class=tablestyle style="table-layout:fixed;">
          <asp:Repeater id="P1" runat="server" OnItemDataBound="Data_Bound">         
             <ItemTemplate>
                 <tr>
                  <td align=left width=75% class="tdstyle"><input type="checkbox" id="CK" Name="CK" Value="<%#DataBinder.Eval(Container.DataItem,"id")%>"><input type="hidden" id="Title_<%#DataBinder.Eval(Container.DataItem,"id")%>" value="<%#Server.HtmlEncode(DataBinder.Eval(Container.DataItem,"title").ToString())%>"><%#GetSortName(DataBinder.Eval(Container.DataItem,"sort_id").ToString())%><a href='<%#ZtUrl(DataBinder.Eval(Container.DataItem,"site_id").ToString(),DataBinder.Eval(Container.DataItem,"zt_dir").ToString(),DataBinder.Eval(Container.DataItem,"zt_file").ToString(),DataBinder.Eval(Container.DataItem,"id").ToString())%>' target="_blank"><%#Server.HtmlEncode(DataBinder.Eval(Container.DataItem,"title").ToString())%></a></td>
                  <td align=center width=15% class="tdstyle" title="<%#DataBinder.Eval(Container.DataItem,"thedate")%>"><%#DataBinder.Eval(Container.DataItem,"thedate","{0:yyyy-MM-dd}")%></td>
                  <td align=center width=10% class=tdstyle><a href='member_info.aspx?username=<%#DataBinder.Eval(Container.DataItem,"username")%>'><%#DataBinder.Eval(Container.DataItem,"username")%></a></td>
                </tr>
             </ItemTemplate>
          </asp:Repeater>
<tr>
<td colspan="3" class=tdstyle>
共<asp:Label id="Lblrecordcount"  Text=0 runat="server" />条记录 
&nbsp;当前页次: <asp:Label id="Lblcurrentpage"  runat="server" />/<asp:Label id="LblpageCount"  runat="server" />&nbsp;
<asp:Button  text="上一页"  id="LblPrev"  class=button runat="server"  CommandName="Prev"   OnCommand="Bt_Click" />&nbsp;
<asp:Button  text="下一页"  id="LblNext"  class=button runat="server"  CommandName="Next"   OnCommand="Bt_Click" />&nbsp;
转到:&nbsp;<asp:DropDownList id="DLpage" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Page_Changed" /> 页&nbsp;

       </td>
    </tr>
   </table>

  </td>
  <tr>
 </table>
  </td>
  <tr>
 </table>
</form>

     </td>
    </tr>
 </table>
<div align="center"><input type="button" class="button" value="确定" onclick="GetCheckItem()"></div>
</center>
<script type="text/javascript">

 var obj_site=document.getElementById("siteid");
 var obj_sort=document.getElementById("sortid");
 var obj_type=document.getElementById("s_type");
 var obj_field=document.getElementById("s_field");
 var obj_order=document.getElementById("s_order");
 var obj_keyword=document.getElementById("s_keyword");
 var obj_pagesize=document.getElementById("Tb_pagesize");

 var Table="pa_zt";
 var name="专题列表";

 var Sitetid="<%=SiteId%>";
 var Sortid="<%=Request.QueryString["sortid"]%>";
 var Type="<%=Request.QueryString["type"]%>";
 var Field="<%=Request.QueryString["field"]%>";
 var Order="<%=Request.QueryString["order"]%>";
 var Keyword="<%=Request.QueryString["keyword"]%>";

 if(obj_site!=null && Sitetid!=""){obj_site.value=Sitetid;}
 if(obj_sort!=null && Sortid!=""){obj_sort.value=Sortid;}
 if(obj_type!=null){obj_type.value=Type;}
 if(obj_field!=null && Field!=""){obj_field.value=Field;}
 if(obj_order!=null && Order!=""){obj_order.value=Order;}
 if(obj_keyword!=null){obj_keyword.value=Keyword;}

 function T1()
  { 
   location.href="?siteid="+obj_site.value+"&pagesize="+obj_pagesize.value;
  }
 function T2()
  { 
   location.href="?siteid="+obj_site.value+"&sortid="+obj_sort.value+"&pagesize="+obj_pagesize.value;
  }

 function Go()
  { 
   location.href="?siteid="+obj_site.value+"&sortid="+obj_sort.value+"&keyword="+escape(obj_keyword.value)+"&pagesize="+obj_pagesize.value;
  }

function Get_CheckBox(Name)
 {
   var Obj=document.getElementsByName(Name);
   var ID="0";
   for(i=0;i<Obj.length;i++)
     {
      if(Obj[i].checked)
       {
         ID+=","+Obj[i].value;
       }
     }
   return ID.replace("0,","");
 }

var op_obj=opener.document.getElementById("zt_list");

function GetCheckItem()
 {
   var Ids=Get_CheckBox("CK");
   var Title;
   if(Ids!="0")
    {
      var AIds=Ids.split(',');
      for(var i=0;i<AIds.length;i++)
       {
         if(!CheckRepeat(AIds[i]))
          {
           Title=document.getElementById("Title_"+AIds[i]).value;
           opener.AddSelect(Title,AIds[i],"zt_list");
         }
       }
   }
   window.close();
 }

function CheckRepeat(id)
 {
   for(i=0;i<op_obj.length;i++)
     {
       if(op_obj[i].value==id)
        {
          return true;
        }
     }
  return false;
 }

</script>
</body>
</html>  



