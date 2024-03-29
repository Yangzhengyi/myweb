﻿<% @ Page language="c#"%> 
<% @ Import NameSpace="System.Data"%>
<% @ Import NameSpace="System.Data.OleDb"%>
<% @ Import NameSpace="PageAdmin"%>
<script language="c#" runat="server">
 OleDbConnection conn;
 string Site_Id,UserName,M_type,sql,Error_Infor,act;
 protected void Page_Load(Object src,EventArgs e)
  {
    Site_Id=Request.QueryString["s"];
    if(IsNum(Site_Id))
     {
      act=Request.QueryString["act"];
      if(Request.Form["post"]=="yes")
         {
           Check_Post();
           Conn theconn=new Conn();
           string constr=theconn.Constr();//获取连接字符串
           conn=new OleDbConnection(constr);
           conn.Open();
            Login_Check();
           conn.Close();
         }
     }
   else
     {
       Response.Write("s参数错误");
       Response.End();
     }
  }

private void Login_Check()
 {
     Md5 Jm=new Md5();
     if(Request.Form["YZM"]==null)
      {
       Error_Infor="对不起，验证码出错！";
       return;
      }
     else
      {
       string YZM=Request.Cookies["YZM"].Value;
       if(Jm.Get_Md5(Request.Form["yzm"])!=YZM)
       {
        Error_Infor="对不起，验证码输入出错！";
        return;
       }
      }
   UserName=Request.Form["username"];
   if(!IsStr(UserName))
    {
      Error_Infor="对不起，用户名输入错误！";
      return;
    }
   Change_MType(UserName);
   string Password=Jm.Get_Md5(Request.Form["password"]);
   sql="select checked,m_type from pa_member where username='"+UserName+"' and userpassword='"+Password+"'";
   OleDbCommand Comm=new OleDbCommand(sql,conn);
   OleDbDataReader dr=Comm.ExecuteReader();
   if(dr.Read())
    {
       if(dr["checked"].ToString()=="-1")
         {
          Error_Infor="对不起，您的用户名还未通过审核！";
          return;
         }
       if(dr["checked"].ToString()=="0")
         {
           Response.Write("<script type='text/javascript'>top.location.href='/e/member/index.aspx?type=login&s="+Site_Id+"';</"+"script>");
           Response.End();
           return;
         }
      M_type=dr["m_type"].ToString();
      Build_Cookie();
      string cs=Request.QueryString["var"];
      if(cs==null){cs="";}
      string[] Acs=cs.Split(',');
      switch(act)
        {
          case "AddFavourites":
          if(Acs.Length==3)
           {
             Response.Write("<script type='text/javascript'>parent.AddFavourites("+Acs[0]+",'"+Acs[1]+"',"+Acs[2]+");parent.ClosePop();</"+"script>");
           }
          else
           {
            Response.Write("<script type='text/javascript'>alert('传递参数错误!');parent.ClosePop();</"+"script>");
           }
          break;

          case "download":
             Response.Write("<script type='text/javascript'>alert('登录成功!');parent.ClosePop();</"+"script>");
          break;

          default:
           Response.Write("<script type='text/javascript'>alert('登录成功!');parent.ClosePop();</"+"script>");
          break;
        }
      Response.End();
    }
   else
    {
     Error_Infor="对不起，用户名或密码输入错误！";
    }
  dr.Close();
 }

private void Change_MType(string username) //改变会员类别
 {
     string Dbtype=ConfigurationManager.AppSettings["DbType"].ToString(); 
     if(Dbtype=="0")
     {
       sql="update pa_member set m_type=changetype,changetype=0 where username='"+username+"' and changetype>0  and datediff('d',changetype_date,Now())>0";
     }
    else
     {
       sql="update pa_member set m_type=changetype,changetype=0 where username='"+username+"' and changetype>0  and datediff(day,changetype_date,getdate())>0";
     }
     OleDbCommand Comm=new  OleDbCommand(sql,conn);
     Comm.ExecuteNonQuery();
 }

private void  Build_Cookie()
 {
     HttpCookie SCookie=new HttpCookie("site");
     SCookie.Value=Site_Id;
     Response.AppendCookie(SCookie); 

     DateTime LoginDate=DateTime.Now;
     Md5 Jm=new Md5();
     HttpCookie MCookie=new HttpCookie("Member");
     MCookie.Values.Add("UserName",UserName);
     MCookie.Values.Add("Valicate",Jm.Get_Md5(LoginDate.ToString("yyyyMMddHHmmss")));
     MCookie.Values.Add("Type_Id",M_type);
     Response.AppendCookie(MCookie); 

     HttpCookie YZMCookie=new HttpCookie("yzm");
     YZMCookie.Expires=DateTime.Now.AddDays(-1);
     Response.AppendCookie(YZMCookie);
     Update_Member(UserName,LoginDate); 
 }

private void Update_Member(string UserName,DateTime LoginDate)
 {
   string Lst_Ip=GetClientIP();
   sql="update pa_member set lastdate='"+LoginDate+"',lst_ip='"+Lst_Ip+"',logins=logins+1 where username='"+UserName+"'";
   OleDbCommand Comm=new  OleDbCommand(sql,conn);
   Comm.ExecuteNonQuery();
 }

private void Check_Post()
 {
    string PostUrl=Request.ServerVariables["HTTP_REFERER"];
    string LocalUrl=Request.ServerVariables["SERVER_NAME"];
    if(PostUrl!=null)
      {
         if(PostUrl.Replace("http://","").Split('/')[0].Split(':')[0]!=LocalUrl)
          {
            Response.Write("invalid_submit");
            Response.End();
          }
      }
 }

private string GetClientIP()
  {
   if (HttpContext.Current==null) return "127.0.0.1";
   string clientIp=Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
   if (string.IsNullOrEmpty(clientIp))
   {
     clientIp=Request.ServerVariables["REMOTE_ADDR"];
   }
   if(string.IsNullOrEmpty(clientIp))
   {
     clientIp=Request.UserHostAddress;
   }
   if(clientIp.IndexOf(",")>0)
    {
      clientIp=clientIp.Split(',')[0];
    }
   if(clientIp.IndexOf("'")>=0)
    {
      clientIp="127.0.0.1";
    }
   return clientIp;
  }

private bool IsStr(string str)
 {
  if(str=="" || str==null)
   {
    return false;
   }
  string str1="abcdefghijklmnopqrstuvwxyz0123456789_";
  string str2=str.ToLower();;
  for(int i=0;i<str2.Length;i++)
   {
    if(str1.IndexOf(str2[i])==-1)
     {
       return false;
     }
   }
  return true;
 }
private bool IsNum(string str)
 {
  if(str=="" || str==null)
   {
    return false;
   }
  string str1="0123456789";
  string str2=str.ToLower();;
  for(int i=0;i<str2.Length;i++)
   {
    if(str1.IndexOf(str2[i])==-1)
     {
       return false;
     }
   }
  return true;
 }

</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head><title>会员登录</title>
<style type=text/css>
body {
        word-break:break-all;
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	font-size: 12px;
}
form,ul,li{list-style-type:none;margin:0 0 0 0;padding:0 0 0 0;}
p{padding:0 0 0 0;margin:0 0 0 0;}
td,div{font-size:12px;line-height:20px;}
.loginbox{padding:5px 0 0 0px}
.loginbox table td{padding:3px 0px 5px 0px}
.inputbox{width:140px;border:1px solid #999999;height:18px}
.yzm{width:60px;height:16px;}
.bt{background:#ececec;border:1px solid #999999;width:65px;height:21px;line-height:21px;font-size:12px;color:#333333;margin:2px 0 2px 0}

a.fpass:link{color:#ff0000;text-decoration:none}
a.fpass:visited{color:#ff0000;text-decoration:none}
a.fpass:hover{text-decoration:underline}


#d_error{height:20px;color:#ff0000}
</style>
</head>
<form name="loginform" action="" method="post">
<div align="center" class="loginbox">
<table cellpadding="0" cellspacing="0" border="0">
	<tr>
	  <td align="left" colspan="2"><div id="d_error"><%=Error_Infor%></div></td>
	</tr>
	<tr>
		<td width="50">用户名：</td>
		<td align="left"><input type="text" name="username" id="username" class="inputbox" maxlength="40" value="<%=UserName%>"/></td>
	</tr>
	<tr>
		<td>密　码：</td>
		<td align="left"><input type="password" name="password" id="password" class="inputbox" maxlength="40"/></td>
	</tr>
	<tr>
		<td>验证码：</td>
		<td align="left"><input type="text" name="yzm" id="yzm" class="inputbox yzm" maxlength="4" /> <img src='/e/aspx/yzm.aspx' onclick="Code_Change('yzmcode')"  align=absmiddle border=0 id='yzmcode'  alt='点击更换' style='cursor:pointer;width:50px;height:18px' ></td>
	</tr>

	<tr><td></td>
             <td align="left" valign="top">
             <input type="hidden" value="yes" name="post">
             <input type="button" value="登录" class="bt" onclick="check_post()">&nbsp; &nbsp;<input type="button" value="注册会员" class="bt" onclick="top.location.href='/e/member/index.aspx?s=<%=Site_Id%>&type=reg'">
             <br><a href="/e/member/index.aspx?s=<%=Site_Id%>&type=find_pass"  target="_top" class="fpass">忘记密码？</a>
		</td>
	</tr>
    <tr>
    <td></td><td><span id="sp_err" style="color:#ff0000;"></span></td>
    </tr>
</table>
</div>
</form>
</body>
<script type="text/javascript">
function check_post()
 {
   var errobj=document.getElementById("d_error");
   errobj.innerHTML=""
   var obj=document.loginform.username;
   if(obj.value=="")
    {
      errobj.innerHTML="请填写用户名！"
      obj.focus();
      return;
    }
   obj=document.loginform.password;
   if(obj.value=="")
    {
      errobj.innerHTML="请填写密码！"
      obj.focus();
      return;
    }
   obj=document.loginform.yzm;
   if(obj.value=="")
    {
      errobj.innerHTML="请填写验证码！"
      obj.focus();
      return;
    }
   else if(obj.value.length!=4)
    {
      errobj.innerHTML="验证码输入错误！"
      obj.focus();
      return;
    }
  document.loginform.submit();
 }

function Code_Change()
 {
  var R=Math.floor(Math.random()*10+1);
  Obj=document.getElementById("yzmcode");
  Obj.src="/e/aspx/yzm.aspx?r="+R;
 }
</script>
</html>