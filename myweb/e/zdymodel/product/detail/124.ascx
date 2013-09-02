<% @ Control language="c#" Inherits="PageAdmin.detail_zdymodel"%>
<% @ Import NameSpace="System.Data"%>
<% @ Import NameSpace="System.Data.OleDb"%>
<div class="current_location" id="current_location"><ul><li class="current_location_1"><%=Current_Location%></li><li class="current_location_2"><%=Sublanmu_Name%></li></ul></div>
<div class="sublanmu_box" id="sublanmu_box_<%=Sublanmu_Id%>">
<div class="sublanmu_content" id="sublanmu_content">
<%conn.Open();%><script type="text/javascript" src="/e/js/zoom.js"></script>
<link href="/e/css/zoom.css" type="text/css" rel="stylesheet"/>
<script type="text/javascript" src="/e/js/product.js"></script>
<% 
int i,Id,P_SortId;
string Price;
DataTable dt,dt1;
dt=Get_Data(); 
DataRow dr,dr1; 
if(dt.Rows.Count>0)
 {
  dr=dt.Rows[0]; 
  Id=int.Parse(dr["id"].ToString());
  P_SortId=int.Parse(dr["sort_id"].ToString());
  Price=dr["price"].ToString();
%>
<div class="product_pic_infor">
<ul>
<li class="left">
<div class="view" id="view" style="position:relative">
<%
dt1=Get_File("product","pa_images",Id);
for(i=0;i<dt1.Rows.Count;i++)
 {
  dr1=dt1.Rows[i];
%><img class="zoom" src="<%=dr1["thumbnail"]%>" big="<%=dr1["url"]%>" border="0" id="picture" name="picture" style="display:<%=i==0?"":"none"%>">
<%}%></div>
<div class="clear"></div>
<!--缩略图区域--->
<%if(int.Parse(dr["pa_images"].ToString())>1){%>
<div class="leftbar" onmouseover="roll('left')" onmouseout="stoproll()"></div>
<div class="thumbnails" id="thumbnails"><ul>
<%
dt1=Get_File("product","pa_images",Id);
for(i=0;i<dt1.Rows.Count;i++)
 {
  dr1=dt1.Rows[i];
%>
<li><img <%=i==0?"class='current'":""%> src="<%=dr1["thumbnail"]%>" onclick="LoadImg(<%=i%>)" id="thumbnail" name="thumbnail"></li>
<%}%></ul></div>
<div class="rightbar" onmouseover="roll('right')" onmouseout="stoproll()"></div>
<%}%>
<!--缩略图区域--->
</li>
<li class="right">
<span class="title"><%=dr["title"]%></span>
Model：<%=dr["pa_xinghao"]%><br>
<%if(Price!="" && Price!="0"){%>Price：<%=dr["price"]%> &nbsp;<br><%}%>
<%=ubb(dr["pa_introduction"].ToString())%>
</li>
<li class="clear"></li>
</ul>
</div>

<br>

<div class="prodinfotab">
<div class="tabheader"><dl class="tab_t" id="tab_t">
<dd class="current">Introduction</dd><dd>Specifications</dd><dd>Relevant</dd>
</dl></div>
<div class="tabcontent"><dl class="tab_c" id="tab_c">
<dd style="display:block"><%=dr["content"]%></dd>
<dd><%=dr["pa_canshu"]%></dd>
<dd>
<script src="/e/aspx/ajax_list.aspx?modelid=93&pagesize=12&shownum=0&listsort=thedate desc" type="text/javascript"></script>
<script type="text/javascript">
rajax_93(1,"sort_id=<%=P_SortId%> and id<><%=Id%>");
</script>
</dd>
</dl></div>
</div>
<script type="text/javascript">
tabs("tab_t","tab_c","dd","dd","current","onclick")
window.onload=function(){zoom({width:300,height:200});}
</script>
<%
}
%><%conn.Close();%>
<script type="text/javascript">Get_Info("<%=Thetable%>","<%=Detail_Id%>")</script>
<asp:PlaceHolder id="P_Comment" runat="server"/></div></div>