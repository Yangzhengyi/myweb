<% @ Page language="c#" Inherits="PageAdmin.adv"%> 
var Url=location.href; 
<%if(Ad1==1){%>
var Adv_range="<%=Adv_range%>";
function newwindow_<%=Id%>()
 {
  window.open("/e/aspx/adv_new.aspx?id=<%=Id%>","newwindow<%=Id%>","<%=Adv_canshu%>");
 }

if(Url.indexOf("/e/")<0) 
  {
    if(Adv_range=="2")
     {
       newwindow_<%=Id%>();
     }
    else
     {
       if(IsPageHome=="1")
        {
          newwindow_<%=Id%>();
        }
     }
 }
<%}%>

<%if(Ad2==1){%>
var Adv_Range="<%=Adv_range%>";
var speed=120;
var light=0;
 
var stop=0;
var num=0;
 
var brOK=false;
var mie=false;
var aver=parseInt(navigator.appVersion.substring(0,1));
var aname=navigator.appName;
 
var vmin=2;
var vmax=5;
var vr=2;
var timer1;
 
var allyes_<%=Id%>;
 
var ns = (document.layers) ? 1 : 0;
var ie = (document.all) ? 1 : 0;
var bFade=false;
 
function checkbrOK(){
 if(aname.indexOf("Internet Explorer")!=-1){
  if(aver>=4) brOK=navigator.javaEnabled();
  mie=true;
 }
 if(aname.indexOf("Netscape")!=-1){
  if(aver>=4) brOK=navigator.javaEnabled();
 }
}

function Chip(chipname,width,height){
 this.named=chipname;
 this.vx=vmin+vmax*Math.random();
 this.vy=vmin+vmax*Math.random();
 this.w=width;
 this.h=height;
 this.xx=10;
 this.yy=10;
 this.timer1=null;
}
 
function movechip(chipname){
if (stop!=1){
if(brOK){
 eval("chip="+chipname);
 if(!mie){
  pageX=window.pageXOffset;
  pageW=window.innerWidth;
  pageY=window.pageYOffset;
  pageH=window.innerHeight;
 }
 else{
  pageX=window.document.body.scrollLeft;
  pageW=window.document.body.offsetWidth;
  pageY=window.document.body.scrollTop;
  pageH=window.document.body.offsetHeight;
 } 
 chip.xx=chip.xx+chip.vx;
 chip.yy=chip.yy+chip.vy;
 chip.vx+=vr*(Math.random()-0.5);
 chip.vy+=vr*(Math.random()-0.5);
 if(chip.vx>(vmax+vmin))  chip.vx=(vmax+vmin)*2-chip.vx;
 if(chip.vx<(-vmax-vmin)) chip.vx=(-vmax-vmin)*2-chip.vx;
 if(chip.vy>(vmax+vmin))  chip.vy=(vmax+vmin)*2-chip.vy;
 if(chip.vy<(-vmax-vmin)) chip.vy=(-vmax-vmin)*2-chip.vy;
 if(chip.xx<=pageX){
  chip.xx=pageX;
  chip.vx=vmin+vmax*Math.random();
 }
 if(chip.xx>=pageX+pageW-chip.w){
  chip.xx=pageX+pageW-chip.w;
  chip.vx=-vmin-vmax*Math.random();
 }
 if(chip.yy<=pageY){
  chip.yy=pageY;
  chip.vy=vmin+vmax*Math.random();
 }
 if(chip.yy>=pageY+pageH-chip.h){
  chip.yy=pageY+pageH-chip.h;
  chip.vy=-vmin-vmax*Math.random();
 }
 if(!mie){
  eval("document."+chip.named+".top ="+chip.yy);
  eval("document."+chip.named+".left="+chip.xx);
 } 
 else{
  eval("document.all."+chip.named+".style.pixelLeft="+chip.xx);
  eval("document.all."+chip.named+".style.pixelTop ="+chip.yy); 
 }
 chip.timer1=setTimeout("movechip('"+chip.named+"')",speed);
}
}
else {chip.timer1=setTimeout("movechip('"+chip.named+"')",speed);}
if (ie){
 if (light==1){
  var nOpacity=oImg.filters.alpha.opacity;
  if (nOpacity>=100) bFade=true;
  if (nOpacity<=0) bFade=false;
  if (bFade) oImg.filters.alpha.opacity--;
  if (!bFade) oImg.filters.alpha.opacity++;
 }
}
 
}
 
function stopme(chipname){
 if(brOK){
  eval("chip="+chipname);
  if(chip.timer1!=null){
   clearTimeout(chip.timer1)
  }
 }
}
 
function FloatAdv_<%=Id%>(){
document.getElementById("allyes_<%=Id%>").style.display="";
if (num==0){
 checkbrOK(); 
 allyes_<%=Id%>=new Chip("allyes_<%=Id%>",100,80);
 if(brOK) {
  movechip("allyes_<%=Id%>");
 }

}

 num++;

}

if (ie){
	document.write("<div ID='allyes_<%=Id%>' onMouseOver='stop=1;' onMouseOut='stop=0;' STYLE='display:none;position:absolute;left: 100px; top: 100px;z-index:10'>");
	document.write("<%=Adv_content%>");
        document.write("</div>");
}
else if (ns){
document.write("<layer name='allyes_<%=Id%>' visibility=\"show\" onMouseOver='stop=1;' onMouseOut='stop=0;'  style='display:none;z-index:10'>");
document.write("<%=Adv_content%>");
document.write("</layer>");
}

if(Url.indexOf("/e/")<0)
{
   if(Adv_Range=="1")
     {
       FloatAdv_<%=Id%>();
     }
    else
     {
       if(IsPageHome=="1")
        {
         FloatAdv_<%=Id%>();
        }
     }
}
<%}%>

<%if(Ad3==1){%>
var Adv_range="<%=Adv_range%>";
lastScrollY=0;
function DlAdv_<%=Id%>(){ 
var diffY;
if (document.documentElement && document.documentElement.scrollTop)
    diffY = document.documentElement.scrollTop;
else if (document.body)
    diffY = document.body.scrollTop
else
    {/*Netscape stuff*/}
    
percent=.1*(diffY-lastScrollY); 
if(percent>0)percent=Math.ceil(percent); 
else percent=Math.floor(percent); 
document.getElementById("LeftAdv_<%=Id%>").style.top=parseInt(document.getElementById("LeftAdv_<%=Id%>").style.top)+percent+"px";
document.getElementById("RightAdv_<%=Id%>").style.top=parseInt(document.getElementById("LeftAdv_<%=Id%>").style.top)+percent+"px";
lastScrollY=lastScrollY+percent; 
//alert(lastScrollY);
}
var LeftAdv="<div id=\"LeftAdv_<%=Id%>\" style='left:5px;position:absolute;TOP:120px;'><%=Left_content%></div>"
var RightAdv="<div id=\"RightAdv_<%=Id%>\" style='right:5px;position:absolute;TOP:120px;'><%=Right_content%></div>"
if(Url.indexOf("/e/")<0)
  {
    if(Adv_range=="2")
     {
       document.write(LeftAdv); 
       document.write(RightAdv); 
      window.setInterval("DlAdv_<%=Id%>()",10);
     }
    else
     {
       if(IsPageHome=="1")
        {
         document.write(LeftAdv); 
         document.write(RightAdv); 
         window.setInterval("DlAdv_<%=Id%>()",10);
        }
     }
 }
<%}%>

<%
if(Ad4==1)
{
 Response.Write(Adv_content);
}
%>