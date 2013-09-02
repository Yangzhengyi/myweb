<% @ Control language="c#" Inherits="PageAdmin.detail_zdymodel"%>
<% @ Import NameSpace="System.Data"%>
<% @ Import NameSpace="System.Data.OleDb"%>
<div class="current_location" id="current_location"><ul><li class="current_location_1"><%=Current_Location%></li><li class="current_location_2"><%=Sublanmu_Name%></li></ul></div>
<div class="sublanmu_box" id="sublanmu_box_<%=Sublanmu_Id%>">
<div class="sublanmu_content" id="sublanmu_content">
<%conn.Open();%><% 
string video,fj;
DataTable dt=Get_Data(); 
DataRow dr; 
for(int i=0;i<dt.Rows.Count;i++)
 {
  dr=dt.Rows[i]; 
  video=dr["pa_video"].ToString();
  fj=dr["pa_fj"].ToString();
%>
<div class="articleinfor" id="articleinfor">
<ul>
<li class="title"><h1><%=Server.HtmlEncode(dr["title"].ToString())%>
</h1></li>
<li class="info">
发布日期：<%=((DateTime)dr["thedate"]).ToString("yyyy-MM-dd")%>&nbsp;&nbsp;
<%=dr["pa_autor"].ToString()==""?"":"&nbsp;作者："+dr["pa_autor"].ToString()%>
浏览量：<span id="clicks"></span>&nbsp;&nbsp;<%=dr["pa_source"].ToString()==""?"":"&nbsp;来源："+dr["pa_source"].ToString()%>&nbsp;&nbsp;字号：[&nbsp;<a href="javascript:FontZoom('16px','Content')">大</a> <a href="javascript:FontZoom('14px','Content')">中</a>  <a href="javascript:FontZoom('12px','Content')">小</a>]
</li>
</ul>
<div class="content" id="Content">
<%if(video!=""){%>
<div align=center style="padding:5px 0 5px 0">
<script type="text/javascript" src="/e/js/video.js"></script>
<script>player("<%=video%>",500,400)</script></div>
<%}%>
<%=dr["content"].ToString()%>
<%if(fj!=""){
string[] Afj=fj.Split('/');
string fj_name=Afj[Afj.Length-1];
string fj_exe=(fj_name.Split('.'))[1];
string style="padding:5px 0 0 17px;background:url(/e/images/icon/"+fj_exe+".gif) no-repeat left center;";
%>
<div style="<%=style%>"><a href="<%=fj%>"><%=fj_name%></a></div>
<%}%>
</div>
</div>
<script src="/e/js/internal_page.js" type="text/javascript"></script>

<%}
Prev_and_Next();
%>

<ul class="sublanmu_pn">
<li><%=Previous_Title==""?"":"上一篇："+Previous_Title%></li>
<li><%=Next_Title==""?"":"下一篇："+Next_Title%></li>
</ul><%conn.Close();%>
<script type="text/javascript">Get_Info("<%=Thetable%>","<%=Detail_Id%>")</script>
<asp:PlaceHolder id="P_Comment" runat="server"/></div></div>