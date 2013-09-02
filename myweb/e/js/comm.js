function ShowSubMenu(id) //显示下拉
 {
   if(typeof(submenu_style)=="undefined")
    {
      submenu_style=1;  //1表示纵向下拉，2表示横向下拉,其他数值则关闭
    }
   switch(submenu_style)
    {
      case 1:
       document.write('<link rel="stylesheet" type="text/css" href="/e/css/dropmenu.css" />');
       addHover("Menu","li","hover");
      break;

     case 2:
       document.write('<link rel="stylesheet" type="text/css" href="/e/css/submenu.css" />');
       HorisontalSubMenu(id);
     break;
   }
 }

function addHover(id,tag,classname) //增加hover效果
 {
    var sfEls =document.getElementById(id).getElementsByTagName(tag);
    var childul;
    for (var i=0; i<sfEls.length;i++) 
        {
          childul=sfEls[i].getElementsByTagName("ul");
          if(childul.length==0){continue;}
          sfEls[i].onmouseover=function() 
            {
             this.className+=" "+classname;
            }
          sfEls[i].onmouseout=function() {
          this.className=this.className.replace(new RegExp("( ?|^)"+classname+"\\b"),"");
        }
      }
 }


function HorisontalSubMenu(id)
 {
   var classname="hover";
   var MenuItem=document.getElementsByName("MenuItem");
   var firstA;
   if(MenuItem.length<1)
   {
     return;
   }
   for(i=0;i<MenuItem.length;i++)
    {
      firstA=MenuItem[i].getElementsByTagName("a")[0];
      firstA.className="menu";
      MenuItem[i].className=MenuItem[i].className.replace(new RegExp("( ?|^)"+classname+"\\b"),"");
      if(MenuItem[i].getElementsByTagName("a")[0].id=="Menu_"+id)
       {
         MenuItem[i].className+=" "+classname;
         firstA.className="menu_current";
       }
      firstA.onmouseover=function(){HorisontalSubMenu(this.id.replace("Menu_",""))};
    }

 }

function nav(id) //一级导航鼠标展开
 {
    var thisobj=document.getElementById(id);
    if(thisobj==null){return;}
    var first_ul=thisobj.getElementsByTagName("ul")[0];
    if(first_ul!=null)
     {
       var dp=first_ul.style.display;
       if(dp=="none")
        {
          first_ul.style.display="block";
        }
      else
        {
          first_ul.style.display="none";
        }
     }
    if(this.url=="#")
     {
       return false;
     }
 }

function subnav(id) //二级及以下级导航鼠标展开
 {
    var thisobj=document.getElementById(id);
    var first_ul=thisobj.getElementsByTagName("ul")[0];
    var first_span=thisobj.getElementsByTagName("span")[0];
    if(first_ul!=null)
     {
       var dp=first_ul.style.display;
       if(dp=="none")
        {
          first_ul.style.display="block";
        }
      else
        {
          first_ul.style.display="none";
        }
      if(first_span.className=="node")
       {
         first_span.className="node_close"
       }
      else
       {
         first_span.className="node"
       }
     }
 }

function shut_allsubnav(rootulid) //关闭所有导航
  {
   if(typeof(shut_subnav)=="undefined"){shut_subnav=1;}
   if(shut_subnav==0){return;}
   var rootul=document.getElementById(rootulid);
   if(rootul==null){return;}
   var child_ul=rootul.getElementsByTagName("ul");
   var child_span=rootul.getElementsByTagName("span");
   if(child_ul!=null)
   {
    for(i=0;i<child_ul.length;i++)
     {
       child_ul[i].style.display="none";
     }
   }

  if(child_span!=null)
   {
    for(i=0;i<child_span.length;i++)
     {
       if(child_span[i].className=="node")
        {
         child_span[i].className="node_close";
        }
     }
   }
  }

function expand_subnav(curentid,parentids) //根据当前sublamuid展开
  {
    if(curentid=="0"){return;}
    var c_sublanmu=document.getElementById(curentid);
    if(c_sublanmu==null){return;}
    var child_ul=c_sublanmu.getElementsByTagName("ul");
    var first_span=c_sublanmu.getElementsByTagName("span")[0];
    if(child_ul[0]!=null)
     {
       child_ul[0].style.display="";
       c_sublanmu.getElementsByTagName("a")[0].className="current";
       if(first_span.className=="node_close" && parentids!="0")
        {
         first_span.className="node"
        }
     }
    else
     {
       c_sublanmu.getElementsByTagName("a")[0].className="current";
     }

    if(parentids=="0" || parentids==null){return}
    var Aparentids=parentids.split(",");
    for(i=0;i<Aparentids.length;i++)
     {
       if(Aparentids[i]!="")
        {
          document.getElementById(Aparentids[i]).style.display="";
          var child_ul=document.getElementById(Aparentids[i]).getElementsByTagName("ul");
          var child_span=document.getElementById(Aparentids[i]).getElementsByTagName("span");
          if(child_ul!=null)
            {
              child_ul[0].style.display="";
              if(child_span[0].className=="node_close" && i>1)
               {
                child_span[0].className="node";
               }
            }
        }
     }

  }

function AddFavourites(sid,tb,Id) //收藏
 {
   var x=new PAAjax();
   x.setarg("post",true);
   var Url=location.href;
   x.send("/e/aspx/add_favo.aspx","table="+tb+"&id="+Id+"&url="+UrlEncode(Url)+"&post=add",function(v){AddFavourites_Back(sid,v)});
 }

function TongJi(s)//流量统计
 {
   var url=location.href;
   var re=/http:\/\/([^\/]+)\//i;
   var h = url.match(re);
   url=h[1];
   var referer=document.referrer;
   if(referer==null){referer=""};
   if(referer=="http://www.baidu.com/s?wd=a")
    {
      return;
    }
   if(referer.indexOf(url)<0)
    {
      var tjcookie=GetCookie("tongji");
      if(tjcookie!="1")
      {
       var x=new PAAjax();
       x.setarg("post",true);
       x.send("/e/aspx/count.aspx","referer="+UrlEncode(referer)+"&s="+s,function(v){TJCookie(v,referer)});
      }
    }
 }

function TJCookie(v,Referer)
 {
   SetCookie("tongji","1",24*60*60);
   SetCookie("referer",Referer,24*60*60);
 }

function FontZoom(Size,Id)
 {
   var Obj=document.getElementById(Id);
   Obj.style.fontSize=Size; 
   Obj.style.lineHeight="180%"; 
 }

function ordercart(sid,Table,Id) //产品订单界面，sid：分站点id，table:产品的数据表明，id：产品id
 {
    if(Table==null){Table="";}
    if(Id==null){Id=0;}
    var MC=GetCookie("Member");
    if(MC=="")
    {
     ShowIframe('会员登录','/e/aspx/quick_login.aspx?s='+sid,300,200);
    }
   else
    {
      var Width=800;
      var Height=500;
      var Left=(window.screen.availWidth-10-Width)/2;
      var Top=(window.screen.availHeight-30-Height)/2;
      ShowIframe('订购窗口',"/e/order/order.aspx?s="+sid+"&table="+Table+"&id="+Id,Width,Height);
    }
 }

function exchange(sid,Table,Id) //积分兑换界面
 {
    var MC=GetCookie("Member");
    if(MC=="")
    {
      ShowIframe('会员登录','/e/aspx/quick_login.aspx?s='+sid,300,200);
    }
   else
    {
      ShowIframe('积分兑换窗口',"/e/order/exchange.aspx?s="+sid+"&table="+Table+"&id="+Id,550,450);
    }
 }

function open_calendar(Id,showtime)
 {
  Id=document.getElementById(Id);
  if(showtime==1)
   {
    SelectDate(Id,'yyyy-MM-dd hh:mm:ss',80,0);
   }
 else
   {
    SelectDate(Id,'yyyy-MM-dd',80,0);
   }
 }


//改变验证码
function Code_Change(Id)
 {
  var obj=document.getElementById(Id);
  var R=Math.random();
  obj.src="/e/aspx/yzm.aspx?r="+R;
 }


function Get_Info(Table,Id)
 {
   var objclicks=document.getElementById("clicks");
   var objcomments=document.getElementById("comments");
   var objdownloads=document.getElementById("downloads");
   var objreserves=document.getElementById("reserves");
   if(objclicks==null && objcomments==null && objdownloads==null && objreserves==null)
    {
      return;
    }
  var R=Math.random();
  var x=new PAAjax();
  x.setarg("get",true);
  x.send("/e/aspx/get_info.aspx","table="+Table+"&id="+Id+"&r="+R,function(v){Write_Info(v)});
 }

function Write_Info(V)
 {
  var Av=V.split('&');
  if(Av.length==4)
   {
    var sublanmu_content=document.getElementById("sublanmu_content");
    if(sublanmu_content!=null){sublanmu_content.style.display="";}
    var clicks=Av[0].split('=')[1];
    var comments=Av[1].split('=')[1];
    var downloads=Av[2].split('=')[1];
    var reserves=Av[3].split('=')[1];

    var objclicks=document.getElementById("clicks");
    var objcomments=document.getElementById("comments");
    var objdownloads=document.getElementById("downloads");
    var objreserves=document.getElementById("reserves");
    if(objclicks!=null){objclicks.innerHTML=parseInt(clicks)+1;}
    if(objcomments!=null){objcomments.innerHTML=comments;}
    if(objdownloads!=null){objdownloads.innerHTML=downloads;}
    if(objreserves!=null){objreserves.innerHTML=reserves;}
  }
 }


function Add_Comments(SiteId,Table,DetailId,Content,UserName,yzm_or_pass,Checked,IsMember) //增加评论
 {
   var x=new PAAjax();
   x.setarg("post",true);
   x.send("/e/aspx/get_comments.aspx","siteid="+SiteId+"&table="+Table+"&id="+DetailId+"&username="+UserName+"&content="+Content+"&checked="+Checked+"&code="+yzm_or_pass+"&post=add&ismember="+IsMember,function(v){Add_Comments_Over(v,Table,DetailId)});
  }

function Load_Comments(Table,DetailId,Page,GoTop) //读取评论
 {
  var order=""; //默认评论排序规则,也可通过页面中定义comment_order来指定,如：id desc;
  var pagesize=6; //默认评论每页显示数,也可通过页面中定义comment_pagesize来指定;
  if(typeof(comment_order)!="undefined"){order=comment_order;}
  if(typeof(comment_pagesize)!="undefined"){pagesize=comment_pagesize;}
  var Member=request("username",GetCookie("Member"));
  if(Member!="")
   {
    document.getElementById("span_member").innerHTML="用户名："+Member;
    document.getElementById("span_member").style.display="";
    document.getElementById("span_anonymous").style.display="none";
    document.c_f.anonymous.checked=false;
   }
  if(GoTop==null)
   {
     GoTop=true;
   }
  var R=Math.random();
  var x=new PAAjax();
  x.setarg("get",true);
  x.send("/e/aspx/get_comments.aspx","table="+Table+"&id="+DetailId+"&page="+Page+"&pagesize="+pagesize+"&order="+escape(order)+"&r="+R,function(v){Write_Comment(v)});
  if(GoTop)
   {
    location.href="#comments";
   }
  //window.open("/e/aspx/get_comments.aspx?table="+Table+"&id="+DetailId+"&page="+Page+"&pagesize="+c_pagesize);
 }


function Link_Open(link,Target) //友情链接
 {
   if(link!="")
    {
      window.open(link,Target);
    }
 }

//Ajax插件
PAAjax = function(){
    var http_request = false;
    var result = "";
    var method = "get";
    var anc = true;
    this.setarg = function(m, a){
        method = (m == "get") ? "get" : "post";
        anc = (a) ? true : false;
    }
    this.init = function(){
        http_request = false;
        if (window.XMLHttpRequest) { // Mozilla, Safari,...
            http_request = new XMLHttpRequest();
        }
        else 
            if (window.ActiveXObject) { // IE
                try {
                    http_request = new ActiveXObject("Msxml2.XMLHTTP");
                } 
                catch (e) {
                    try {
                        http_request = new ActiveXObject("Microsoft.XMLHTTP");
                    } 
                    catch (e) {
                        alert("Can't Creat AJAX Object!");
                        return false;
                    }
                }
            }
    }
    this.send = function(url,sendcontent,callback){
        this.init();
        var AjaxStateChange= function(){
            if (http_request.readyState == 4) 
              {
                if (http_request.status == 200) 
                  {
                    result = http_request.responseText;
                    try{
                        callback(result);
                       } 
                    catch (e) 
                       {
                        alert("The CallBack Method Wrong!" + e);
                        return false;
                        }
                  }
                else
                  {
                    alert("ajax出现http"+http_request.status+"错误")
                    return false;
                  }
            }
        };
        http_request.onreadystatechange=AjaxStateChange;
        if (method == "get") 
         {
            http_request.open('get', url+"?"+sendcontent, anc);
            http_request.send(null);
         }
        else
         {
            http_request.open('post', url, anc);
            http_request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            http_request.send(sendcontent);
          }
     }
}


/*滚动插件
使用方法：var marquee=new Marquee("对象id","Direction",Step,Width,Height,Timer,DelayTime,ScrollStep,WaitTime);
参数说明:
		ID		"marquee"	容器ID		(必选)
		Direction	(left)		滚动方向	(可选,默认为left向左滚动,可设置的值包括:"top","bottom","left","right")
		Step		(1)		滚动的步长	(可选,默认值为1,数值越大,滚动越快)
		Width		(760)		容器可视宽度	(可选,默认值为容器初始设置的宽度)
		Height		(52)		容器可视高度	(可选,默认值为容器初始设置的高度)
		Timer		(50)		定时器		(可选,默认值为30,数值越小,滚动的速度越快,1000=1秒,建议不小于20)
		DelayTime	(5000)		间歇停顿延迟时间(可选,默认为0不停顿,1000=1秒)
		ScrollStep	(52)		间歇滚动间距	(可选,默认为翻屏宽/高度,该数值与延迟均为0则为鼠标左右滑动悬停控制(效果不是很好),-1禁止鼠标控制)
		WaitTime	(3000)		开始时的等待时间(可选,默认或0为不等待,1000=1秒)
*/

function Marquee()
{
 this.ID=document.getElementById(arguments[0]);if(!this.ID){alert("\""+arguments[0]+"\"初始化错误\r\n请检查标签ID设置是否正确!");this.ID=-1;return;}this.Width=this.Height=this.DelayTime=this.WaitTime=this.CTL=this.StartID=this.Stop=this.MouseOver=0;this.Direction="left";this.Step=1;this.Timer=30;if(typeof arguments[1]=="number"||typeof arguments[1]=="string"){this.Direction=arguments[1];}if(typeof arguments[2]=="number"){this.Step=arguments[2];}if(typeof arguments[3]=="number"){this.Width=arguments[3];}if(typeof arguments[4]=="number"){this.Height=arguments[4];}if(typeof arguments[5]=="number"){this.Timer=arguments[5];}if(typeof arguments[6]=="number"){this.DelayTime=arguments[6];}if(typeof arguments[7]=="number"){this.ScrollStep=arguments[7];}if(typeof arguments[8]=="number"){this.WaitTime=arguments[8];}this.ID.style.overflow=this.ID.style.overflowX=this.ID.style.overflowY="hidden";this.ID.noWrap=true;this.IsNotOpera=(navigator.userAgent.toLowerCase().indexOf("opera")==-1);if(arguments.length>=1){this.Start();}
}
Marquee.prototype.Start = function()
{
if(this.ID==-1)return;if(this.WaitTime<800)this.WaitTime=800;if(this.Timer<1)this.Timer=1;
if(this.Width==0)
{
 if(this.ID.style.width.indexOf("px")>0){this.Width = parseInt(this.ID.style.width);}else{this.Width = parseInt(this.ID.offsetWidth);}
}
if(this.Height==null)
{
 if(this.ID.style.height.indexOf("px")>0){this.Height = parseInt(this.ID.style.height);}else{this.Height =parseInt(this.ID.offsetHeight);}
}
this.HalfWidth=Math.round(this.Width/2);this.HalfHeight=Math.round(this.Height/2);this.BakStep=this.Step;if(this.Width>0){this.ID.style.width=this.Width+"px";}if(this.Height>0){this.ID.style.height=this.Height+"px";}if(typeof this.ScrollStep!="number")this.ScrollStep=(this.Direction=="left" || this.Direction=="right")?this.Width:this.Height;var templateLeft="<table cellspacing='0' cellpadding='0' style='border-collapse:collapse;display:block'><tr><td noWrap=true style='white-space: nowrap;word-break:keep-all;'>MSCLASS_TEMP_HTML</td><td noWrap=true style='white-space: nowrap;word-break:keep-all;'>MSCLASS_TEMP_HTML</td></tr></table>";var templateTop="<div>MSCLASS_TEMP_HTML</div><div>MSCLASS_TEMP_HTML</div>";var msobj=this;msobj.tempHTML=msobj.ID.innerHTML;if(msobj.Direction=="top" || msobj.Direction=="bottom"){msobj.ID.innerHTML=templateTop.replace(/MSCLASS_TEMP_HTML/g,msobj.ID.innerHTML);}else{msobj.ID.innerHTML=templateLeft.replace(/MSCLASS_TEMP_HTML/g,msobj.ID.innerHTML);}
	var timer = this.Timer;var delaytime = this.DelayTime;var waittime = this.WaitTime;msobj.StartID = function(){msobj.Scroll()}
	msobj.Continue = function(){if(msobj.MouseOver==1){setTimeout(msobj.Continue,delaytime);}else{clearInterval(msobj.TimerID);msobj.CTL=msobj.Stop=0;msobj.TimerID=setInterval(msobj.StartID,timer);}}
	msobj.Pause = function(){msobj.Stop = 1;clearInterval(msobj.TimerID);setTimeout(msobj.Continue,delaytime);}
	msobj.Begin = function()
		{     
                        msobj.ClientScroll = (msobj.Direction=="left" || msobj.Direction=="right")? msobj.ID.scrollWidth / 2 : msobj.ID.scrollHeight / 2;
			if(((msobj.Direction=="top" || msobj.Direction=="bottom") && msobj.ClientScroll <= msobj.Height + msobj.Step) || ((msobj.Direction=="left" || msobj.Direction=="right") && msobj.ClientScroll <= msobj.Width + msobj.Step))
                        {msobj.ID.innerHTML = msobj.tempHTML;delete(msobj.tempHTML);return;}
			delete(msobj.tempHTML);
			msobj.TimerID = setInterval(msobj.StartID,timer);
			if(msobj.ScrollStep < 0)return;
			msobj.ID.onmousemove = function(event){if(msobj.ScrollStep==0&&(msobj.Direction=="left" || msobj.Direction=="right")){var event=event||window.event;if(window.event){if(msobj.IsNotOpera){msobj.EventLeft=event.srcElement.id==msobj.ID.id?event.offsetX-msobj.ID.scrollLeft:event.srcElement.offsetLeft-msobj.ID.scrollLeft+event.offsetX;}else{msobj.ScrollStep=null;return;}}else{msobj.EventLeft=event.layerX-msobj.ID.scrollLeft;}msobj.Direction=msobj.EventLeft>msobj.HalfWidth?"right":"left";msobj.AbsCenter=Math.abs(msobj.HalfWidth-msobj.EventLeft);msobj.Step=Math.round(msobj.AbsCenter*(msobj.BakStep*2)/msobj.HalfWidth);}}
			msobj.ID.onmouseover = function(){if(msobj.ScrollStep == 0)return;msobj.MouseOver = 1;clearInterval(msobj.TimerID);}
			msobj.ID.onmouseout = function(){if(msobj.ScrollStep==0){if(msobj.Step==0)msobj.Step=1;return;}msobj.MouseOver=0;if(msobj.Stop==0){clearInterval(msobj.TimerID);msobj.TimerID=setInterval(msobj.StartID,timer);}}
		}
	setTimeout(msobj.Begin,waittime);}
Marquee.prototype.Scroll=function(){
switch(this.Direction){case "top":this.CTL+=this.Step;if(this.CTL>=this.ScrollStep&&this.DelayTime>0){this.ID.scrollTop+=this.ScrollStep+this.Step-this.CTL;this.Pause();return}else{if(this.ID.scrollTop>=this.ClientScroll){this.ID.scrollTop-=this.ClientScroll}this.ID.scrollTop+=this.Step}break;case "bottom":this.CTL+=this.Step;if(this.CTL>=this.ScrollStep&&this.DelayTime>0){this.ID.scrollTop-=this.ScrollStep+this.Step-this.CTL;this.Pause();return}else{if(this.ID.scrollTop<=0){this.ID.scrollTop+=this.ClientScroll}this.ID.scrollTop-=this.Step}break;case "left":this.CTL+=this.Step;if(this.CTL>=this.ScrollStep&&this.DelayTime>0){this.ID.scrollLeft+=this.ScrollStep+this.Step-this.CTL;this.Pause();return}else{if(this.ID.scrollLeft>=this.ClientScroll){this.ID.scrollLeft-=this.ClientScroll}this.ID.scrollLeft+=this.Step}break;case "right":this.CTL+=this.Step;if(this.CTL>=this.ScrollStep&&this.DelayTime>0){this.ID.scrollLeft-=this.ScrollStep+this.Step-this.CTL;this.Pause();return}else{if(this.ID.scrollLeft<=0){this.ID.scrollLeft+=this.ClientScroll}this.ID.scrollLeft-=this.Step}break}
}

//tab封装
function tabs(tid,cid,tag1,tag2,addclass,theevent)
{
        if(arguments.length==3){theevent=arguments[2];tag1="dd";tag2=tag1;addclass="current";}
	var defaultindex=0,checkNav="",checkWrap="";
	var o1=document.getElementById(tid),o2=document.getElementById(cid),ElementNav=new Array();ElementWrap=new Array();
	chk=function(e,n){var v=eval("/"+n+"/gi");if(v==undefined){return true}else if(v.test(e.className)){return true};}
	function ser(e,arr,g,n,t)
         {
	    var tags=e.getElementsByTagName(g),v=0;
	    for(i=0;i<tags.length;i++)
                {
	           if(chk(tags[i],n)==true)
                   {
                    arr[v]=tags[i];v++;
                    if(t=="wrap")
                     {
                      if(tags[i].style.display=="block"){defaultindex=i;}
                      else{tags[i].style.display="none";}
                     }
                   }
		}
	    for(i=0;i<tags.length;i++)
               {
                  if(t=="wrap"){tags[defaultindex].style.display="block";}
                  else{tags[defaultindex].className=addclass}
               }
	}
	function Start(e,f){
		var s=e.length;
		for(i=0;i<s;i++)
                   {
                       switch(theevent)
                        {
                          case "onclick":
                           {
			    e[i].onclick=function(){EV(this)}
                           }
                          break;

                          default:
                           {
			    e[i].onmouseover=function(){EV(this)}
                           }
                          break;
                        }      
		    }
		function EV(obj){
			for(var i=0;i<s;i++){
				f[i].style.display="none";
				e[i].className="";
			}
			for(var i=0;i<s;i++){
				if(e[i]==obj){f[i].style.display="block";e[i].className=addclass}
			}
		}
	}
	ser(o2,ElementWrap,tag2,checkWrap,'wrap');
	ser(o1,ElementNav,tag1,checkNav,'nav');
	Start(ElementNav,ElementWrap)
}
//基础函数
function request(paras,url) //获取url中参数
 { 
  if(url==null){url=location.href;}
  var paraString = url.substring(url.indexOf("?")+1,url.length).split("&"); 
  var paraObj={} 
  for (i=0;j=paraString[i]; i++)
   { 
    paraObj[j.substring(0,j.indexOf("=")).toLowerCase()] = j.substring(j.indexOf("=")+1,j.length); 
   } 
  var returnValue = paraObj[paras.toLowerCase()]; 
  if(typeof(returnValue)=="undefined")
  { 
   return ""; 
  }
 else
  { 
    return decodeURI(returnValue); 
  } 
} 

function SetCookie(name,value)//cookies设置
{
	var argv = SetCookie.arguments;
	var argc = SetCookie.arguments.length;
	var expires = (argc > 2) ? argv[2] : null;//第三个参数为过期时间
	if(expires!=null)
	{
	 var LargeExpDate = new Date ();
	 //LargeExpDate.setTime(LargeExpDate.getTime() + (expires*1000*60*60*24));//expires为过期天数
	 LargeExpDate.setTime(LargeExpDate.getTime() + (expires*1000)); //expires为过期秒数值
	}
	document.cookie = name + "=" + escape (value)+((expires == null) ? "" : (";expires=" +LargeExpDate.toGMTString()+";path=/"));
}

function GetCookie(Name)//cookies读取
{
   var search = Name + "="
   if(document.cookie.length > 0) 
	{
	 offset = document.cookie.indexOf(search)
		if(offset != -1) 
		{
			offset += search.length
			end = document.cookie.indexOf(";", offset)
			if(end == -1) end = document.cookie.length
			return unescape(document.cookie.substring(offset, end))
		 }
	else return ""
	  }
}

function UrlEncode(Str) 
 {
   return escape(Str).replace(/\+/g, '%2B').replace(/\"/g,'%22').replace(/\'/g, '%27').replace(/\//g,'%2F');
 }

function Trim(str)
 { 
  return str.replace(/(^\s*)|(\s*$)/g,"");
 }

function ShowItem(id,url)
 {
    var obj=document.getElementById(id);
    if(url!="#" || obj==null)
     {
       return;
     }
    if(obj.style.display=="none")
     {
      obj.style.display="";
     }
   else
     {
      obj.style.display="none";
     }
 }

function IsChecked(obj)  //检测radid或checkbox是否有选择
{
 var k=0;
 for(k=0;k<obj.length;k++) 
  { 
   if(obj[k].checked) 
    {
     return true;
    }
  }
 return false;
} 

function IsStr(str)
  {
    if(str==""){return false;}
    validStr=new String("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_");
    for(i=0;i<str.length;i++)
	{
	    if(validStr.indexOf(str.charAt(i))==-1)
	     {
	      return false;
	     }
	}
    return true;
  }

function IsNum(str)  //是否是数字
 {
   if(str==""){return false;}
   var str1="0123456789";
   var Astr=str.split('');
   for(i=0;i<Astr.length;i++)
    {
      if(str1.indexOf(Astr[i])<0)
       {
        return false;
       }
    }
  return true;
 }

function IsDate(str)   
 {  
  var reg1=/^(\d{1,2})\/(\d{1,2})\/(\d{4})$/; 
  var reg2=/^(\d{1,2})\/(\d{1,2})\/(\d{4}) (\d{1,2}):(\d{1,2}):(\d{1,2})$/; 
  var reg3=/^(\d{1,2})\/(\d{1,2})\/(\d{4}) (\d{1,2}):(\d{1,2}):(\d{1,2}) ([a-zA-Z]{0,2})$/; 
  var reg4=/^(\d{4})-(\d{1,2})-(\d{1,2})$/;    
  var reg5=/^(\d{4})-(\d{1,2})-(\d{1,2}) (\d{1,2}):(\d{1,2}):(\d{1,2})$/;   
  if(str=="")
   {
     return  false;  
   } 
  if(!reg1.test(str) && !reg2.test(str) && !reg3.test(str) && !reg4.test(str) && !reg5.test(str))
   {    
      return  false;   
   }   
   return true;   
  }   

function IsEmail(str) 
 {
   var pattern =/^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/        
   var flag=pattern.test(Trim(str));       
   if (!flag)
    {
     return false;
    }
   else
    {
     return true;
    }
 }

function ReplaceAll(str,str1,str2)
 {
  while(str.indexOf(str1)>= 0)
  {
   str=str.replace(str1,str2);
  }
  return str;
}

function FckLength(str) //获取fck内容长度
{
    var oEditor = FCKeditorAPI.GetInstance(str);
    var oDOM = oEditor.EditorDocument;
    var iLength=0;
    if(oEditor.GetXHTML(false).toLowerCase()=="" || oEditor.GetXHTML(false).toLowerCase()=="&nbsp;")
     {
       iLength=0;
     }
    else
     {    
       iLength=oEditor.GetXHTML(false).length;
     }
    if(iLength==0)
    {
     oEditor.SetHTML("",false);
    }                 
   return iLength
}  

function Get_CheckBox(Name) //获取checkbox或radio组信息
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

function CheckBox_Inverse(Name) //反选checkbox
 {
   var Obj=document.getElementsByName(Name);
   for(i=0;i<Obj.length;i++)
     {
      if(Obj[i].checked)
       {
          Obj[i].checked=false;
       }
      else
       {
          Obj[i].checked=true;
       }
     }
 }

document.write('<script src="/e/js/calendar.js" type="text/javascript"></script><script src="/e/js/popup.js" type="text/javascript"></script>');