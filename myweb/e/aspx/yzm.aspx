<% @ Page language="c#"  %>
<% @ Import NameSpace="System.IO" %>
<% @ Import NameSpace="System.Drawing" %>
<% @ Import NameSpace="System.Drawing.Imaging" %>
<% @ Import NameSpace="System.Drawing.Text" %>
<% @ Import NameSpace="PageAdmin" %>
<script Language="c#" runat="server">
public void Page_Load()
 {
   buildcode(11,50,18);
 }
string  GetCode(int num)
  {
	Random rd=new Random();
	string vchar="1,2,3,4,5,6,7,8,9,0";
	char[] ch={','};
	string[] vcharArry=vchar.Split(ch);
	string codestr="";
	for(int i=0;i<4;i++)
	{
	codestr+=vcharArry[rd.Next(10)].ToString()+" ";
	}
        HttpCookie YZMCookie=new HttpCookie("YZM");
        Md5 jm=new Md5();
	YZMCookie.Value=jm.Get_Md5(codestr.Replace(" ",""));
        Response.AppendCookie(YZMCookie);
	return codestr;	     
  }

void buildcode(int intFontSize,int intWidth,int intHeight)
  {
			Random random = new Random(); 
			string strFontName="Arial";
			Color bgcolor=Color.Yellow;  //背景色
			SolidBrush bgbrush=new  SolidBrush(bgcolor); //建立一个背景笔刷；
			Color forecolor=Color.Black;   //前景色
			SolidBrush forebrush=new SolidBrush(forecolor); //建立一个前景笔刷；
			Font foreFont=new Font(strFontName,intFontSize,FontStyle.Bold); //定义字体
			Bitmap newBitmap=new Bitmap(intWidth,intHeight,PixelFormat.Format32bppArgb);//建立一个画布
			Graphics g=Graphics.FromImage(newBitmap);//封装Bitmap类
			Rectangle newRect=new Rectangle(0,0,intWidth,intHeight);//建立一个矩形区域
			//g.FillRectangle(bgbrush,newRect); //涂上颜色
			g.Clear(Color.White); //清空背景颜色,和FillRectangle一样效果
    	
			Pen bgpen=new Pen(Color.Black,1);
			for (int i = 0; i < 5; i++) 
			{
				int x1 = random.Next(newBitmap.Width); 
				int x2 = random.Next(newBitmap.Width); 
				int y1 = random.Next(newBitmap.Height); 
				int y2 = random.Next(newBitmap.Height); 
				g.DrawLine(bgpen,x1,x2,y1,y2 );   //画边框噪音线
			} 
			for (int i = 0; i < 20; i++) 
			{ 
				int x = random.Next(newBitmap.Width); 
				int y = random.Next(newBitmap.Height); 
				newBitmap.SetPixel(x, y, Color.Black);  //画图片的前景噪音点 
           
			} 
     
			g.DrawString(GetCode(4),foreFont,forebrush,1,1); //把字体写上去,最后两个是横纵坐标
			Pen forpen=new Pen(Color.Black,1);//建一个钢笔对象
			g.DrawRectangle(forpen,0,0,newBitmap.Width-1,newBitmap.Height-1);//绘制边框
			MemoryStream mstream=new MemoryStream();   
			newBitmap.Save(mstream,ImageFormat.Gif);//存入内存中
			g.Dispose();//释放System.Drawing.Graphics
			newBitmap.Dispose();//释放System.Drawing.Bitmap;

			//发送
			System.Web.HttpContext.Current.Response.ClearContent(); 
			System.Web.HttpContext.Current.Response.ContentType="image/GIF";
			System.Web.HttpContext.Current.Response.BinaryWrite(mstream.ToArray());
			System.Web.HttpContext.Current.Response.End();
  }
</script>
