function Open_Editor(Table,Field,Id,ObjId,Title)
 {
  ShowIframe(Title,"fckeditor.aspx?table="+Table+"&field="+Field+"&id="+Id+"&objid="+ObjId,800,400,'auto');
 }

function open_departmentuser(formtype,openerid,tj,title)
 {
  ShowIframe(title,"department_user.aspx?type="+formtype+"&id="+openerid+"&condition="+encodeURI(tj),280,360,'auto');
 }

function Sign_Editor(Path)
 {
   var Width=800;
   var Height=600;
   var Left=(window.screen.availWidth-10-Width)/2;
   var Top=(window.screen.availHeight-30-Height)/2;
   window.open(Path,"signedit","width="+Width+",height="+Height+",top="+Top+",left="+Left+",toolbar=no,menubar=no,scrollbars=yes,resizable=yes,location=no,status=yes");
 }

function Js_Code(Id,Style,Type)
 {
  var Width=750;
  var Height=500;
  if(Type!="vote")
   {
    var Width=700;
    var Height=240;
   }
  ShowIframe("获取调用代码","js_view.aspx?id="+Id+"&style="+Style+"&type="+Type,Width,Height,'auto');
 }

function Sort_Set(Id,Table)
 {
   ShowIframe("类别设置","sort_set.aspx?id="+Id+"&table="+Table,680,400,'auto');
   return false;
 }

function Lanmu_PSet()
 {
   ShowIframe("栏目属性设置",'lanmu_pset.aspx',680,400,'auto');
 }
function Sublanmu_PSet(lanmuname)
 {
   ShowIframe("属性设置",'sublanmu_pset.aspx?lanmuname='+encodeURI(lanmuname),680,350,'auto');
 }

function Issue_Data(Table,Id,Wid,xuhao) //后台签发信息
 {
    var Width=700;
    var Height=500;
    var Left=(window.screen.availWidth-10-Width)/2;
    var Top=(window.screen.availHeight-30-Height)/2;
    var Val=window.open("/e/member/issue.aspx?table="+Table+"&id="+Id+"&workid="+Wid+"&ismaster=1&xuhao="+xuhao,"issue","width="+Width+",height="+Height+",top="+Top+",left="+Left+",toolbar=no,menubar=no,scrollbars=yes,resizable=yes,location=no,status=yes");
 }

function Sign_Data(Table,Id) //后台签收信息
  {
   var Width=800;
   var Height=600;
   var Left=(window.screen.availWidth-10-Width)/2;
   var Top=(window.screen.availHeight-30-Height)/2;
   var Val=window.open("/e/member/sign.aspx?table="+Table+"&id="+Id+"&ismaster=1","sign","width="+Width+",height="+Height+",top="+Top+",left="+Left+",toolbar=no,menubar=no,scrollbars=yes,resizable=yes,location=no,status=no");
 } 

function open_calendar(Id,showtime)
 {
  Id=document.getElementById(Id);
  if(showtime==1)
   {
    SelectDate(Id,'yyyy-MM-dd hh:mm:ss');
   }
 else
   {
    SelectDate(Id,'yyyy-MM-dd');
   }
 }

function open_ztlist()
 {
  var Width=750;
  var Height=500;
  var Left=(window.screen.availWidth-10-Width)/2
  var Top=(window.screen.availHeight-30-Height)/2;
  var Val=window.open("zt_select.aspx","zt_select","width="+Width+",height="+Height+",top="+Top+",left="+Left+",toolbar=no,menubar=no,scrollbars=yes,resizable=yes,location=no,status=yes");
 }


function open_upload(sid,path,type,table,field,Id) //上传界面
 {
  var Width=550;
  var Height=155;
  if(type=="file"){Height=145;}
  ShowIframe("文件上传","/e/aspx/upload_panel.aspx?sid="+sid+"&filepath="+path+"&type="+type+"&table="+table+"&field="+field+"&objid="+Id+"&from=master",Width,Height,'auto');
}

function open_files(sid,Id,table,field,FieldType,InforId)
 {
  var Width=580;
  var Height;
  var title;
  if(FieldType=="files")
   {
    Height=380;
    title="附件发布";
   }
  else
   {
    Height=280;
    title="图片发布";
   }
   ShowIframe(title,"/e/aspx/upload_files.aspx?sid="+sid+"&id="+Id+"&table="+table+"&field="+field+"&type="+FieldType+"&inforid="+InforId+"&from=master",Width,Height,'auto');
}

function foreColor(id,Addstr){
  if(!Error())	return;
  var arr = showModalDialog("/e/incs/color.html", "foreColor", "dialogWidth:18.5em; dialogHeight:17.5em;status:0;help:no;resizable:no;");
  if (arr != null) 
  document.getElementById(id).value=Addstr+arr;
}

function Iframe_ReFresh(iframeid)
 {
   var obj=window.frames[iframeid];
   obj.location.href=obj.location.href;
 }

function Iframe_Submit(iframeid)
 {
   var obj=window.frames[iframeid].document.forms[0];
   obj.post.value="update";
   obj.submit();
 }

function ShowObj(id)
 {
    var obj=document.getElementById(id);
    if(obj.style.display=="none")
     {
      obj.style.display="";
     }
   else
     {
      obj.style.display="none";
     }
 }

function hideall(Obj)
   {
    var h=0;
    for(h=0;h<Obj.length;h++)
     {
      if(Obj[h]!=null)
      Obj[h].style.display="none";
    }
  }

function startpost()
 {
  document.getElementById("post_area").style.display="none";
  document.getElementById("post_loading").style.display="";
 }

function postover(text,to)
 {
  if(text!=""){alert(text);}
  document.getElementById("post_area").style.display="";
  document.getElementById("post_loading").style.display="none";
  if(to!=null && to!=""){location.href=to;}
  else
   {
    if(typeof(Format_Fck)=="function")
    {
     Format_Fck();
    }
  }
 }

function showtab(num)
 {
    var Obj=document.getElementsByName("tabcontent");
    var Obj1=document.getElementsByName("tab");
    if(document.getElementById("tab")==null){return;}
    if(num>Obj1.length-1){return;}
    hideall(Obj);
    var k=0;
     for(k=0;k<Obj1.length;k++)
      {
       Obj1[k].style.fontWeight="normal";
      }
     if(Obj[num]!=null){Obj[num].style.display="";}
     Obj1[num].style.fontWeight="bold";
     SetCookie("tab",num);
 }


function delete_file(table,field,id)
 {
   if(!confirm("是否确定删除?"))
    {
      return;
    }
   var obj=document.getElementById(field);
   var del_obj=document.getElementById("delete_"+field);
   var upload_obj=document.getElementById("upload_"+field);
   var date=new Date(); 
   var R=Math.random();
   var x=new PAAjax();
   x.setarg("post",true);
   x.send("/e/aspx/delete_file.aspx","table="+table+"&field="+field+"&id="+id+"&path="+obj.value+"&r="+R,function(v){});
   obj.value="";
   del_obj.style.display="none";
   upload_obj.style.display="";
 }


//分类ajax

function Write_Select(table,username)
 {
  var s="";
  for(i=2;i<10;i++)
   {
     s+="<select name=\"s_sort\" id=\"s_sort\" onchange=\"c_sort("+i+",'"+table+"','"+username+"')\" style=\"display:none\"></select> ";
   }
  document.write(s);
 }

function c_sort(level,The_Table,UserName) //ajax获取分类
 {
   var s_objs=document.getElementsByName("s_sort");
   for(i=0;i<s_objs.length;i++)
     {
      if(i<=(level-1)){continue;}
      s_objs[i].options.length=0;
      s_objs[i].style.display="none";
     }
   var obj=s_objs[level-1];
   if(Sort_Type=="all")
     {
      if(obj.value=="")
       document.getElementById("sort").value=s_objs[level-2].value;
      else
       document.getElementById("sort").value=obj.value;
     }
   else
     {
      document.getElementById("sort").value="0";
     }
   if(obj.value!="0" && obj.value!="")
    {
      var R=Math.random();
      var x=new PAAjax();
      x.setarg("get",false);
      x.send("/e/aspx/get_sort.aspx","table="+The_Table+"&sortid="+obj.value+"&username="+UserName+"&from=master&r="+R,function(v){insert_sort(v,level)});
    }
  if(location.href.indexOf("data_add.aspx")>0)
   {
     c_sort_callback(The_Table);//改变触发
   }
 }

function c_sort_callback(The_Table)
 {

 }

function insert_sort(v,level) //ajax获取分类回调
 {

   var s_objs=document.getElementsByName("s_sort");
   if(IsNum(v))
    {
      document.getElementById("sort").value=v;
    }
   else
    {
      var obj=s_objs[level];
      obj.style.display="";
      var A_v=v.split(',,');
      var item;
      if(Sort_Type=="all")
       {
         item=new Option("---所有子分类---","");
       }
      else
       {
         item=new Option("---请选择---","0");
       }
      obj.options.add(item);
      for(i=0;i<A_v.length;i++)
       {
        if(A_v[i]==""){continue;}
        item=new Option((A_v[i].split(','))[1],(A_v[i].split(','))[0]);
        obj.options.add(item);
       }
   }
 }

function Load_Sort(Sorts,table,username) //初始分类，Sorts为parent_ids加current_sortid
   {
    var s_objs=document.getElementsByName("s_sort");
    if(s_objs.length==0){return;}
    var A_Sorts=Sorts.split(",");
    Sorts="";
   for(i=0;i<A_Sorts.length;i++)
    {
     if(A_Sorts[i]=="" || A_Sorts[i]=="0"){continue;}
     Sorts+=A_Sorts[i]+",";
    }
   A_Sorts=Sorts.split(",");
  for(k=0;k<A_Sorts.length;k++)
   {
     if(A_Sorts[k]!="")
      { 
        s_objs[k].value=A_Sorts[k];
        c_sort(k+1,table,username);
      }
   }
 }

//分类ajax


//自定义表单必填项验证
function Check_ZdyForm(formName)
  { 
   var Obj_Sort=document.forms[formName].sort;
   if(Obj_Sort!=null)
    {
       
      if(Obj_Sort.value=="0" || Obj_Sort.value=="")
       {
        if(Obj_Sort.value=="0")
         {
          alert("请选择分类!");
         }
        else
         {
          alert("分类必须选择最终类别!");
         }
        showtab(0);

        if(Obj_Sort.tagName.toLowerCase()=="select")
         {
          Obj_Sort.focus();
         }
        else
         { 
           var s_objs=document.getElementsByName("s_sort");
           for(i=0;i<s_objs.length;i++)
           {
            if(s_objs[s_objs.length-i-1].style.display=="")
             {
               s_objs[s_objs.length-i-1].focus();
               break;
             }
           }
         }
        return false;
       }
    }
   var J_start="";
   var Js_end="";
   var Names=document.forms[formName].mustname.value;
   var Fields=document.forms[formName].mustfield.value;
   var Fieldtype=document.forms[formName].musttype.value;
   var ANames,AFields,AFieldtype,Obj;
    if(Fields!="")
     {
       ANames=Names.split(',');
       AFields=Fields.split(',');
       AFieldtype=Fieldtype.split(',');
       for(i=0;i<AFields.length-1;i++)
        {
          Obj=document.forms[formName][AFields[i]];
          switch(AFieldtype[i])
           {
             case "select":
                J_start="请选择";
                Js_end="!";
             break;

             case "file":
                J_start="请上传";
                Js_end="!";
             break;

             case "image":
                J_start="请上传";
                Js_end="!";
             break;

             case "text":
                J_start="请填写";
                Js_end="!";
             break;

             case "textarea":
                J_start="请填写";
                Js_end="!";
             break;

             default:
                J_start="";
                Js_end="不能为空!";
             break;
           }

           if(AFieldtype[i]=="radio" || AFieldtype[i]=="checkbox")
             {
                J_start="请选择";
                Js_end="";
                if(!IsChecked(Obj))
                  {
                      alert(J_start+ANames[i]+Js_end);
                      showtab(0);
                      return false;
                  }
             }
           else if(AFieldtype[i]=="images" || AFieldtype[i]=="files")
            {
              if(Obj.value=="0")
               {
                 alert(J_start+ANames[i]+Js_end); 
                 showtab(0);
                 return false;
               }
            }
           else if(AFieldtype[i]=="editor") 
            {
              if(FckLength(AFields[i])==0)
               {
                 alert(J_start+ANames[i]+Js_end); 
                 showtab(0);
                 return false;
               }
            }
           else
             {
                if(Trim(Obj.value)=="" && Obj.style.display!="none")
                {
                 alert(J_start+ANames[i]+Js_end); 
                 showtab(0);
                 Obj.focus();
                 return false;
                }
            }
        }
     }
   if(eval(formName+"_zdycheck()"))
    {
     startpost();
     document.forms[formName].submit();
     return true;
    }
   else
    {
     return false;
    }
  }

function SetCookie(name,value)		  //cookies设置
{
	var argv = SetCookie.arguments;
	var argc = SetCookie.arguments.length;
	var expires = (argc > 2) ? argv[2] : null;
	if(expires!=null)
	{
		var LargeExpDate = new Date ();
		LargeExpDate.setTime(LargeExpDate.getTime() + (expires*1000*3600*24));
	}
	document.cookie = name + "=" + escape (value)+((expires == null) ? "" : (";expires=" +LargeExpDate.toGMTString()+";path=/"));
}

function GetCookie(Name)			//cookies读取
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

//基础函数

function zdyform_checkbox(ckvalue,ckname) //自定表单多选框根据值选中checkbox
 {
  var objck=document.getElementsByName(ckname);
  var Ackvalue=ckvalue.split(',');
  for(i=0;i<Ackvalue.length;i++)
   {
     for(k=0;k<objck.length;k++)
      {
        if(objck[k].value==Ackvalue[i])
         {
          objck[k].checked=true;
         }
      }
   }
 }

function TimeDiff(ST, ET){
	var ST = new Date(ST.replace(/-/g, '/'));			//开始时间转换为时间对象
	var ET = new Date(ET.replace(/-/g, '/'));			//结束时间转换为时间对象
	var DT = (ET - ST) / 1000;					//得到时间差，转换为秒
	var RD = Math.floor(DT / (60 * 60 * 24));			//得到天数
	var RH = Math.floor((DT % (60 * 60 * 24)) / (60 * 60));		//得到小时
	var RM = Math.floor(((DT % (60 * 60 * 24)) % (60 * 60)) / 60); 	//得到分钟
	var RS = (((DT % (60 * 60 * 24)) % (60 * 60)) % 60);		//得到秒
	RD = RD ? (RD + '天') : '';
	RH = RH ? (RH + '小时') : '';
	RM = RM ? (RM + '分钟') : '';
	RS = RS ? (RS + '秒') : '';
	return RD + RH + RM + RS;
}

function CheckBox_Inverse(Name)
 {
   var Obj=document.getElementsByName(Name);
   for(i=0;i<Obj.length;i++)
     {
      if(Obj[i].style.display=="none" || Obj[i].disabled==true)
       {
         continue;
       }
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


function Get_CheckBox(Name) //获取checkbox组值
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

function IsNum(str)
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

function IsStr(str)
 {
   if(str==""){return false;}
   var str1="0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_";
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

function ReplaceAll(str,str1,str2)
 {
  while(str.indexOf(str1)>= 0)
  {
   str=str.replace(str1,str2);
  }
  return str;
}

function Trim(str)
 { 
  return str.replace(/(^\s*)|(\s*$)/g,"");
 }

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

function getOffsetTop(obj) {
var n = obj.offsetTop;
while (obj = obj.offsetParent) n+= obj.offsetTop;
return n;

}

function getOffsetLeft(obj) {
var n = obj.offsetLeft;
while (obj = obj.offsetParent) n+= obj.offsetLeft;
return n;
}

function GetIPAdd(TheValue)
 { 
   if(TheValue!=""){window.open("http://www.ip138.com/ips138.asp?ip="+TheValue,"ip");}
 }