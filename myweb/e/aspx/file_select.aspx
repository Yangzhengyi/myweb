<% @ Page language="c#" Inherits="PageAdmin.file_select"%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>服务器文件</title>
<script src="/e/js/comm.js" type="text/javascript"></script>
<style type="text/css">
body,div,td{word-wrap:break-word;font:12px/1.6em Tahoma,Helvetica,Arial,sans-serif;color:#333333;font-family:inherit;background-color:menu}
fieldset{margin:0 0 0 0}
#list{border:0px solid menu;background-color:#cccccc}
#list td{background-color:menu;}
a:link{color:#333333;text-decoration:none}
a:visited{color:#333333;text-decoration:none}
a:hover{color:#333333;text-decoration:underline}
</style>
</head>
<body>
文件路径：<input type="textbox" id="url" name="url" size="30" ondblclick="ViewUrl()" title="双击可浏览文件"></td>
<input type="button" value=" 确定 " style="height:22px" onclick="GetUrl()">
<input type="hidden" name="filesize" id="filesize" value="0">

<div><a href="javascript:TFloder('')">根目录(/e/upload/s<%=Request.QueryString["sid"]%>/<%=Request.QueryString["table"]%>)</a><%=Request.QueryString["filepath"]%> &nbsp;&nbsp;
<%
if(Request.QueryString["filepath"]!="" && Request.QueryString["filepath"]!="/")
 {
   string Dir="/";
   string[] Adir=Request.QueryString["filepath"].Split('/');
    for(int i=0;i<Adir.Length-1;i++)
    {
      if(Adir[i]!="")
       {
         Dir+="/"+Adir[i];
       }
    }

  Response.Write("<a href=\"javascript:TFloder('"+Dir+"')\">返回上级目录</a>");

 }
%>
</div>
<fieldset style="overflow:hidden;">
<legend>服务器端文件</legend>
<div  style="height:450px;overflow:auto;valign=top">
<table cellspacing="1" cellpadding="5" width="100%" border="0"  id="list" align=center valign=top>
<tr>
<td width="50%" align=center>文件名</td>
<td width="17%" align=center>大小</td>
<td width="18%" align=center>创建时间</td>
<td width="15%" align=center>管理</td>
</tr>
<%=HtmlList%>
</table>
</div>
</fieldset>
注：请不要选择被其他信息或字段已经调用的文件，否则将导致文件被删除或冗余文件产生。<br>
通过ftp上传的文件务必放在/e/upload/s<%=Request.QueryString["sid"]%>/<%=Request.QueryString["table"]%>/zdy/目录中调用。

<script type="text/javascript">

 var opener_obj=opener.document.getElementById("<%=Request.QueryString["objid"]%>");
 var opener_filesize=opener.document.getElementById("filesize");
 var url_obj=document.getElementById("url");
 var Type="<%=Request.QueryString["type"]%>";
 var Table="<%=Request.QueryString["table"]%>";
 var Field="<%=Request.QueryString["field"]%>";
 var Now_Dir="<%=Request.QueryString["filepath"]%>";

function ViewUrl()
 {
   var url=document.getElementById("url").value;
   if(url!="" && url.indexOf(".")>0)
    {
      window.open(url,"view");
    }
 }

function GetUrl()
 {
   var url=url_obj.value;
   if(url!="" && url.indexOf(".")>0)
    {
      opener_obj.value=url;
      if(opener_filesize!=null)
       {
        opener_filesize.value=document.getElementById("filesize").value;
       }
    }
  window.close();
 }

function AddFloder(dir)
 {
  Now_Dir=ReplaceAll((Now_Dir+"/"+dir),"//","/");
  location.href="?sid=<%=Request.QueryString["sid"]%>&filepath="+Now_Dir+"&type="+Type+"&table="+Table+"&field="+Field+"&objid=<%=Request.QueryString["objid"]%>&from=<%=Request.QueryString["from"]%>";
 }

function TFloder(dir)
 {
  dir=ReplaceAll(dir,"//","/");
  location.href="?sid=<%=Request.QueryString["sid"]%>&filepath="+dir+"&type="+Type+"&table="+Table+"&field="+Field+"&objid=<%=Request.QueryString["objid"]%>&from=<%=Request.QueryString["from"]%>";
 }

function OpenFile(FileName,FileSize)
 {
  FileName=ReplaceAll(("/e/upload/s<%=Request.QueryString["sid"]%>/<%=Request.QueryString["table"]%>"+Now_Dir+"/"+FileName),"//","/");
  document.getElementById("url").value=FileName;
  document.getElementById("filesize").value=FileSize;
  //window.open(FileName,"view");
 }

function DelFolder(dir)
 {
  if(confirm("确定删除吗!"))
   {
    location.href="?sid=<%=Request.QueryString["sid"]%>&filepath="+Now_Dir+"&type="+Type+"&table="+Table+"&field="+Field+"&objid=<%=Request.QueryString["objid"]%>&act=deldir&d="+dir+"&from=<%=Request.QueryString["from"]%>";
   }
 }

function DelFile(file)
 {
  if(confirm("确定删除吗!"))
   {
    location.href="?sid=<%=Request.QueryString["sid"]%>&filepath="+Now_Dir+"&type="+Type+"&table="+Table+"&field="+Field+"&objid=<%=Request.QueryString["objid"]%>&act=delfile&d="+file+"&from=<%=Request.QueryString["from"]%>";
   }
 }
</script>
</body>
</html>










