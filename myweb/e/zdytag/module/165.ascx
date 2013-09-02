<%@ Control Language="C#"%>
<table border="0" width="100%">
<tr>
 <td valign="top">
<img src=/e/images/diy/home_intro_con.jpg border="0" hspace="5">
 </td>
 <td>
<div style="padding-bottom:5px">
  PageAdmin集成内容发布、文章、产品、图片、招聘、留言、自定义模型、采集等功能于一体的企业级网站管理系统。可视化的管理网站内容和结构：自由的模块布局和组合设计，灵活的内容调用、强大的自定义功能、所见即所得的编辑器等等功能在都体现了网站...
</div>
<% @ Register TagPrefix="ascx" TagName="M_0" src="/e/zdymodel/article/module/43.ascx"%><ascx:M_0 runat="server" SiteId=1 ZdyTag=1 ModuleId="165_0" TagSql="select top 4 id from article where site_id=1 and checked=1 {SORT}  order by {SqlSort}" TagTable="article" TagSortId=546  SqlSort="" ShowNum=4 TitleNum=50 TitlePicWidth=150 TitlePicHeight=150 TheTarget="_self"/>
</td>
</tr>
</table>