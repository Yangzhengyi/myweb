<% @ Page language="c#" Inherits="PageAdmin.slide"%>
var Image_<%=CurrentId%>=new Array();
var Pics="<%=Pics%>";
var Links="<%=Links%>";
var Titles="<%=Server.HtmlEncode(Titles)%>";
var Alts="<%=Server.HtmlEncode(Alts)%>";
var Apic<%=CurrentId%>=Pics.split('|');
var ALink<%=CurrentId%>=Links.split('|');
var ATitle<%=CurrentId%>=Titles.split('|');
var AAlts<%=CurrentId%>=Alts.split('|');
var Show_Text=<%=Show_Text%>;
var Total_Item=Apic<%=CurrentId%>.length;
for(i=0;i<Total_Item;i++)
  {
   Image_<%=CurrentId%>.src = Apic<%=CurrentId%>[i]; 
  }

<asp:PlaceHolder id="Pswf1" runat="server" Visible="false">
function LoadSlideBox_<%=CurrentId%>()
{
var text_mtop = 0;
var text_lm = 0;
var textmargin = text_mtop+"|"+text_lm;
var textcolor = "0x000000|0xff0000";
var text_align= 'center'; 
var text_size = 12;
var Border_Alpha;
if(<%=Border_Width%>=="0")
 {
  Border_Alpha=0;
 }
else
 {
  Border_Alpha=100;
 }
var borderStyle="<%=Border_Width%>|<%=Border_Color%>|"+Border_Alpha;

var Interval_Time=7;
var focus_width=<%=Width%>;
var focus_height=<%=Height%>;
var text_height=20;
if(Show_Text==0)
 {
   text_height=0;
 }
var swf_height = focus_height+text_height+text_mtop; 
var text_align="center";
Links=escape(Links);
document.write('<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" width="'+ focus_width +'" height="'+ swf_height +'">');
document.write('<param name="allowScriptAccess" value="sameDomain"><param name="movie" value="/e/images/swf/focus.swf"> <param name="quality" value="high"><param name="bgcolor" value="#ffffff">');
document.write('<param name="menu" value="false"><param name=wmode value="transparent">');
document.write('<param name="FlashVars" value="pics='+Pics+'&links='+Links+'&texts='+Titles+'&borderwidth='+focus_width+'&borderheight='+focus_height+'&textheight='+text_height+'&textmargin='+textmargin+'&textcolor='+textcolor+'&borderstyle='+borderStyle+'&text_align='+text_align+'&interval_time='+Interval_Time+'">');
document.write('<embed src="/e/images/swf/focus.swf"  wmode="transparent"  FlashVars="pics='+Pics+'&links='+Links+'&texts='+Titles+'&borderwidth='+focus_width+'&borderheight='+focus_height+'&textheight='+text_height+'&textmargin='+textmargin+'&textcolor='+textcolor+'&borderstyle='+borderStyle+'&text_align='+text_align+'&interval_time='+Interval_Time+'" menu="false" bgcolor="#ffffff" quality="high" width="'+ focus_width +'" height="'+ swf_height +'" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />');
document.write('</object>');
}
</asp:PlaceHolder>

<asp:PlaceHolder id="Pswf2" runat="server" Visible="false">
function LoadSlideBox_<%=CurrentId%>()
{
var bcastr_config="&bcastr_config=0xffffff|2|0x000000|60|0xffffff|0xff6600|0x000033|7|1|1|<%=Target%>";
//文字颜色|文字位置|文字背景颜色|文字背景透明度|按键文字颜色|按键默认颜色|按键当前颜色|自动播放时间(秒)|图片过渡效果|是否显示按钮|打开目标窗口
var swf_width=<%=Width%>;
var swf_height=<%=Height%>;
Links=escape(Links);
document.write('<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" width="'+ swf_width +'" height="'+ swf_height +'">');
document.write('<param name="movie" value="/e/images/swf/bcastr3.swf"><param name="quality" value="high">');
document.write('<param name="menu" value="false"><param name=wmode value="opaque">');
document.write('<param name="FlashVars" value="bcastr_file='+Pics+'&bcastr_link='+Links+'&bcastr_title='+Titles+'&bcastr_config='+bcastr_config+'">');
document.write('<embed src="/e/images/swf/bcastr3.swf" wmode="opaque" FlashVars="bcastr_file='+Pics+'&bcastr_link='+Links+'&bcastr_title='+Titles+'&bcastr_config='+bcastr_config+'& menu="false" quality="high" width="'+ swf_width +'" height="'+ swf_height +'" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />'); 
document.write('</object>'); 
}
</asp:PlaceHolder>


<asp:PlaceHolder id="Pjs" runat="server" Visible="false">
 var speed_<%=CurrentId%>=7000;
 var slide_currentitem_<%=CurrentId%>=0; 
 var Title="",Link="";
 var slide_Time_<%=CurrentId%>;
function LoadSlideBox_<%=CurrentId%>()
{
SlideHtml='<a href="#" id="slide_link_<%=CurrentId%>" target="<%=Target%>"><img class="slide_image" style="display:block;filter:revealTrans(duration=1,transition=20);display:none;border:<%=Border_Width%>px solid <%=Border_Color%>;width:<%=Width%>px;height:<%=Height%>px"  name="slide_pic_<%=CurrentId%>" id="slide_pic_<%=CurrentId%>"></a>';
SlideHtml+='<ul  class="slide_item" style="display:<%=Show_Slide_Num%>">';
for(i=0;i<Total_Item;i++)
  {
    SlideHtml+='<li id="slide_num_<%=CurrentId%>_'+i+'" onclick="Change_Num_<%=CurrentId%>('+i+')">'+(i+1)+'</li>';
  }
SlideHtml+='</ul>';
document.write("<div id='slide_box_<%=CurrentId%>' class='slide_box' style='width:<%=Width%>px;height:<%=Height%>px'>"+SlideHtml+"</div><div style='width:<%=Width%>px;text-align:center;display:none' id='slide_title_<%=CurrentId%>'></div>");
document.images["slide_pic_<%=CurrentId%>"].src=Apic<%=CurrentId%>[0];
document.images["slide_pic_<%=CurrentId%>"].alt=AAlts<%=CurrentId%>[0];
document.images["slide_pic_<%=CurrentId%>"].style.display="inline";


Title="<a href='"+ALink<%=CurrentId%>[0]+"' class='slide_title' target='<%=Target%>'>"+ATitle<%=CurrentId%>[0]+"</a>";
document.getElementById("slide_link_<%=CurrentId%>").href=ALink<%=CurrentId%>[0];
if(Show_Text=="1")
 {
  document.getElementById("slide_title_<%=CurrentId%>").style.display="";
  document.getElementById("slide_title_<%=CurrentId%>").innerHTML=Title;
 }


document.getElementById("slide_num_<%=CurrentId%>_0").className="current";
slide_Time_<%=CurrentId%>=setInterval(nextAd_<%=CurrentId%>,speed_<%=CurrentId%>);
document.getElementById("slide_box_<%=CurrentId%>").onmouseover=function() {clearInterval(slide_Time_<%=CurrentId%>)}
document.getElementById("slide_box_<%=CurrentId%>").onmouseout=function() {slide_Time_<%=CurrentId%>=setInterval(nextAd_<%=CurrentId%>,speed_<%=CurrentId%>)}

}

function setTransition_<%=CurrentId%>()
{
  if (document.all)
   {
     document.images["slide_pic_<%=CurrentId%>"].filters.revealTrans.Transition=23;
     document.images["slide_pic_<%=CurrentId%>"].filters.revealTrans.apply();
   }
}


function playTransition_<%=CurrentId%>()
{
  if(document.all)
  document.images["slide_pic_<%=CurrentId%>"].filters.revealTrans.play()
}


function Control_Num_<%=CurrentId%>(Currentnum)
 {
  for(i=0;i<Apic<%=CurrentId%>.length;i++)
  {
   document.getElementById("slide_num_<%=CurrentId%>_"+i).className="";
  }
  document.getElementById("slide_num_<%=CurrentId%>_"+Currentnum).className="current";
 }

function Change_Num_<%=CurrentId%>(Currentnum)
 {
  for(i=0;i<Total_Item;i++)
  {
   document.getElementById("slide_num_<%=CurrentId%>_"+i).className="";
  }
  document.getElementById("slide_num_<%=CurrentId%>_"+Currentnum).className="current";
  slide_currentitem_<%=CurrentId%>=Currentnum;
  ShowFocus_<%=CurrentId%>(Currentnum);
 }

function nextAd_<%=CurrentId%>()
{
  if(Apic<%=CurrentId%>.length<=1)
   {
     clearInterval(slide_Time_<%=CurrentId%>);
     return;
   }

  if(slide_currentitem_<%=CurrentId%><Apic<%=CurrentId%>.length-1)
    {
      slide_currentitem_<%=CurrentId%>++;
    }
  else 
   {
     slide_currentitem_<%=CurrentId%>=0;
   }
 ShowFocus_<%=CurrentId%>(slide_currentitem_<%=CurrentId%>);
}


function ShowFocus_<%=CurrentId%>(slide_currentitem_<%=CurrentId%>)
 {
  if(ATitle<%=CurrentId%>.length>slide_currentitem_<%=CurrentId%>)
   {
     if(ALink<%=CurrentId%>.length>slide_currentitem_<%=CurrentId%>)
      {
       Title="<a href='"+ALink<%=CurrentId%>[slide_currentitem_<%=CurrentId%>]+"' class='slide_title' target='<%=Target%>'>"+ATitle<%=CurrentId%>[slide_currentitem_<%=CurrentId%>]+"</a>";
      }
     else
      {
       Title=ATitle<%=CurrentId%>[slide_currentitem_<%=CurrentId%>]; 
      }
   }
  else
   {
       Title=""; 
   }

  if(ALink<%=CurrentId%>.length>slide_currentitem_<%=CurrentId%>)
   {
      Link=ALink<%=CurrentId%>[slide_currentitem_<%=CurrentId%>];
   }
  else
   {
      Link="#";
   }

  document.getElementById("slide_link_<%=CurrentId%>").href=Link;
  document.getElementById("slide_title_<%=CurrentId%>").innerHTML=Title;

  setTransition_<%=CurrentId%>();
  document.images["slide_pic_<%=CurrentId%>"].src=Apic<%=CurrentId%>[slide_currentitem_<%=CurrentId%>];
  document.images["slide_pic_<%=CurrentId%>"].alt=AAlts<%=CurrentId%>[slide_currentitem_<%=CurrentId%>];
  document.getElementById("slide_title_<%=CurrentId%>").innerHTML=Title;
  playTransition_<%=CurrentId%>();
  Control_Num_<%=CurrentId%>(slide_currentitem_<%=CurrentId%>);
 }
</asp:PlaceHolder>
LoadSlideBox_<%=CurrentId%>();